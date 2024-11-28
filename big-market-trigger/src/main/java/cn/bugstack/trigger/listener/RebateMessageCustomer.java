package cn.bugstack.trigger.listener;

import cn.bugstack.domain.activity.model.entity.SkuRechargeEntity;
import cn.bugstack.domain.activity.service.IRaffleActivityAccountQuotaService;
import cn.bugstack.domain.activity.service.IRaffleActivitySkuStockService;
import cn.bugstack.domain.credit.model.entity.TradeEntity;
import cn.bugstack.domain.credit.model.valobj.TradeNameVO;
import cn.bugstack.domain.credit.model.valobj.TradeTypeVO;
import cn.bugstack.domain.credit.service.CreditAdjustService;
import cn.bugstack.domain.credit.service.ICreditAdjustService;
import cn.bugstack.domain.rebate.event.SendRebateMessageEvent;
import cn.bugstack.domain.rebate.model.valobj.RebateTypeVO;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.event.BaseEvent;
import cn.bugstack.types.exception.AppException;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.ParameterResolutionDelegate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.trigger.listener
 * @Author: yueyueking
 * @CreateTime: 2024-11-18  18:34
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Component
public class RebateMessageCustomer {
    @Value("${spring.rabbitmq.topic.send_rebate}")
    private String topic;
    @Resource
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;
    @Resource
    private ICreditAdjustService creditAdjustService;
    @RabbitListener(queuesToDeclare = @Queue(value = "${spring.rabbitmq.topic.send_rebate}"))
    public void listener(String message){
        try {
            log.info("监听用户行为返利消息 topic: {} message: {}", topic, message);
            // 1. 转换消息
            //yyk：把message的JSON字符串转化为Java对象
            BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> eventMessage = JSON.parseObject(message, new TypeReference<BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage>>() {
            }.getType());
            SendRebateMessageEvent.RebateMessage rebateMessage = eventMessage.getData();
//            if (!RebateTypeVO.SKU.getCode().equals(rebateMessage.getRebateType())){
//                log.info("监听用户行为返利消息 - 非sku奖励暂时不处理 topic: {} message: {}", topic, message);
//                return;
//            }
            //2.入账奖励
            switch (rebateMessage.getRebateType()){
                case "sku":
                    SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
                    skuRechargeEntity.setUserId(rebateMessage.getUserId());
                    skuRechargeEntity.setSku(Long.valueOf(rebateMessage.getRebateConfig()));
                    skuRechargeEntity.setOutBusinessNo(rebateMessage.getBizId());
                    raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
                    break;
                case "integral":
                    TradeEntity tradeEntity = new TradeEntity();
                    tradeEntity.setUserId(rebateMessage.getUserId());
                    //行为返利行为
                    tradeEntity.setTradeName(TradeNameVO.REBATE);
                    //加积分
                    tradeEntity.setTradeType(TradeTypeVO.FORWARD);
                    tradeEntity.setAmount(new BigDecimal(rebateMessage.getRebateConfig()));
                    tradeEntity.setOutBusinessNo(rebateMessage.getBizId());
                    creditAdjustService.createOrder(tradeEntity);
            }
        }catch (AppException e){
            if(ResponseCode.INDEX_DUP.getCode().equals(e.getCode())){
                log.warn("监听用户行为返利消息，消费重复 topic: {} message: {}", topic, message, e);
                return;
            }
        }catch (Exception e)
        {
            log.error("监听用户行为返利消息，消费失败 topic: {} message: {}", topic, message, e);
            throw e;
        }
    }
}
