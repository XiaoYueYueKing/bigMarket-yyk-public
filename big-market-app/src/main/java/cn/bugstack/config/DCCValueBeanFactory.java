package cn.bugstack.config;

import cn.bugstack.types.annotations.DCCValue;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.cache.CuratorCache;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Configuration;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * 基于 Zookeeper 的配置中心实现原理
 */
@Slf4j
@Configuration
public class DCCValueBeanFactory implements BeanPostProcessor {
    private static final String BASE_CONFIG_PATH = "/big-market-dcc";
    private static final String BASE_CONFIG_PATH_CONFIG = BASE_CONFIG_PATH + "/config";
    private final CuratorFramework client;
    private final Map<String, Object> dccObjGroup = new HashMap<>();

//DCCValueBeanFactory 的构造函数获取 Zookeeper 连接对象，并判断所需要监听的节点是否存在「不存在则创建」。
// 之后是对节点的监听，当有值变化时会对对应的属性复制。
    public DCCValueBeanFactory(CuratorFramework client) throws Exception {
        this.client = client;

        //节点判断
        if (null == client.checkExists().forPath(BASE_CONFIG_PATH_CONFIG)) {
            client.create().creatingParentsIfNeeded().forPath(BASE_CONFIG_PATH_CONFIG);
            log.info("DCC 节点监听 base node {} not absent create new done!", BASE_CONFIG_PATH_CONFIG);
        }

        CuratorCache curatorCache = CuratorCache.build(client, BASE_CONFIG_PATH_CONFIG);
        curatorCache.start();
        curatorCache.listenable().addListener((type, oldData, data) -> {
            switch (type) {
                case NODE_CHANGED:
                    String dccValuePath = data.getPath();
                    Object objBean = dccObjGroup.get(dccValuePath);
                    if (null == objBean) return;
                    try {
                        // 1. getDeclaredField 方法用于获取指定类中声明的所有字段，包括私有字段、受保护字段和公共字段。
                        // 2. getField 方法用于获取指定类中的公共字段，即只能获取到公共访问修饰符（public）的字段。
                        Field field = objBean.getClass().getDeclaredField(dccValuePath.substring(dccValuePath.lastIndexOf("/") + 1));
                        field.setAccessible(true);
                        field.set(objBean, new String(data.getData()));
                        field.setAccessible(false);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                    break;
                default:
                    break;
            }
        });
    }

//    postProcessAfterInitialization 的用途是获取扫描的 Bean 对象类，
//    对这些类的属性判断是否存在添加了自定义注解的属性，存在则进行管理。
//    这里面有一些小的逻辑，当一个值已经存在于配置中心，则在启动的时候把配置中心中的值赋值给应用中类的属性。
//    另外如果是首次启动，则会把自定义注解中默认配置的值，赋值给属性。如 @DCCValue("degradeSwitch:open") 赋值 open 给属性。
    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        Class<?> beanClass = bean.getClass();
        Field[] fields = beanClass.getDeclaredFields();
        for (Field field : fields) {
            if (!field.isAnnotationPresent(DCCValue.class)) {
                continue;
            }

            DCCValue dccValue = field.getAnnotation(DCCValue.class);

            String value = dccValue.value();
            if (StringUtils.isBlank(value)) {
                throw new RuntimeException(field.getName() + " @DCCValue is not config value config case 「isSwitch/isSwitch:1」");
            }

            String[] splits = value.split(":");
            String key = splits[0];
            String defaultValue = splits.length == 2 ? splits[1] : null;

            try {
                // 判断当前节点是否存在，不存在则创建出 Zookeeper 节点
                String keyPath = BASE_CONFIG_PATH_CONFIG.concat("/").concat(key);
                if (null == client.checkExists().forPath(keyPath)) {
                    client.create().creatingParentsIfNeeded().forPath(keyPath);
                    if (StringUtils.isNotBlank(defaultValue)) {
                        field.setAccessible(true);
                        field.set(bean, defaultValue);
                        field.setAccessible(false);
                    }
                    log.info("DCC 节点监听 创建节点 {}", keyPath);
                } else {
                    String configValue = new String(client.getData().forPath(keyPath));
                    if (StringUtils.isNotBlank(configValue)) {
                        field.setAccessible(true);
                        field.set(bean, configValue);
                        field.setAccessible(false);
                        log.info("DCC 节点监听 设置配置 {} {} {}", keyPath, field.getName(), configValue);
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            dccObjGroup.put(BASE_CONFIG_PATH_CONFIG.concat("/").concat(key), bean);
        }
        return bean;
    }

}
