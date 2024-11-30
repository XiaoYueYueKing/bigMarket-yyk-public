package cn.bugstack.types.annotations;

import java.lang.annotation.*;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.types.annotations
 * @Author: yueyueking
 * @CreateTime: 2024-11-30  19:43
 * @Description: 注解，动态配置中心
 * 自定义注解的目的是用于对需要变更字段属性的标记作用，所有使用了注解的字段，都会被动态配置管理。
 * @Version: 1.0
 */

@Retention(RetentionPolicy.RUNTIME) //生命周期是 RUNTIME，即在程序运行时仍然可用
@Target({ElementType.FIELD}) //只能应用于 字段（ElementType.FIELD）
@Documented //会被包含在自动生成的文档中
public @interface DCCValue {
    String value() default "";
}
