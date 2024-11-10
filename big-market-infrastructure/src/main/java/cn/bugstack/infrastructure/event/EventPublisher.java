package cn.bugstack.infrastructure.event;

import cn.bugstack.types.event.BaseEvent;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.infrastructure.event
 * @Author: yueyueking
 * @CreateTime: 2024-11-10  21:35
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Component
public class EventPublisher {
    @Autowired
    private RabbitTemplate rabbitTemplate;
    public void publish(String topic, BaseEvent.EventMessage<?> eventMessage){
        try {
            String messageJson = JSON.toJSONString(eventMessage);
            rabbitTemplate.convertAndSend(topic, messageJson);
            log.info("发送MQ消息 topic:{} message:{}", topic, messageJson);
        }
        catch (Exception e){
            log.error("发送MQ消息失败 topic:{} message:{}", topic, JSON.toJSONString(eventMessage), e);
            throw e;
        }

    }
}
