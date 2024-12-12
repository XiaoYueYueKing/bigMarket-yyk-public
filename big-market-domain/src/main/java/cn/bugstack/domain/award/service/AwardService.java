package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.TaskStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.domain.award.service.distribute.IDistributeAward;
import cn.bugstack.types.event.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.award.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-15  16:43
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Service
public class AwardService implements IAwardService{
    private final IAwardRepository awardRepository;
    private final SendAwardMessageEvent sendAwardMessageEvent;

    //使用构造函数的方法是因为要使用注入Map类型的方法，以实现IDistributeAward接口的所有实现类【？】
    private final Map<String, IDistributeAward> distributeAwardMap;

    public AwardService(IAwardRepository awardRepository, SendAwardMessageEvent sendAwardMessageEvent, Map<String, IDistributeAward> distributeAwardMap) {
        this.awardRepository = awardRepository;
        this.sendAwardMessageEvent = sendAwardMessageEvent;
        this.distributeAwardMap = distributeAwardMap;
    }
    @Override
    public void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity) {
        // 构建消息对象
        //yyk:sendAwardMessageEvent是构建整个sendAwardMessageEvent对象
        //而SendAwardMessageEvent.SendAwardMessage只是构造里面的一个小的消息对象SendAwardMessage，
        //然后设置好了再参与sendAwardMessageEvent是构建整个sendAwardMessageEvent对象的构造
        SendAwardMessageEvent.SendAwardMessage sendAwardMessage = new SendAwardMessageEvent.SendAwardMessage();
        sendAwardMessage.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessage.setOrderId(userAwardRecordEntity.getOrderId());
        sendAwardMessage.setAwardId(userAwardRecordEntity.getAwardId());
        sendAwardMessage.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        sendAwardMessage.setAwardConfig(userAwardRecordEntity.getAwardConfig());

        BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> sendAwardMessageEventMessage = sendAwardMessageEvent.buildEventMessage(sendAwardMessage);

        // 构建任务对象
        TaskEntity taskEntity = new TaskEntity();
        taskEntity.setUserId(userAwardRecordEntity.getUserId());
        taskEntity.setTopic(sendAwardMessageEvent.topic());
        taskEntity.setMessageId(sendAwardMessageEventMessage.getId());
        taskEntity.setMessage(sendAwardMessageEventMessage);
        taskEntity.setState(TaskStateVO.create);

        // 构建聚合对象
        UserAwardRecordAggregate userAwardRecordAggregate = UserAwardRecordAggregate.builder()
                .taskEntity(taskEntity)
                .userAwardRecordEntity(userAwardRecordEntity)
                .build();

        // 存储聚合对象 - 一个事务下，用户的中奖记录
        awardRepository.saveUserAwardRecord(userAwardRecordAggregate);

        log.info("中奖记录保存完成 userId:{} orderId:{}", userAwardRecordEntity.getUserId(), userAwardRecordEntity.getOrderId());
    }

    @Override
    public void distributeAward(DistributeAwardEntity distributeAwardEntity) {
        // 奖品Key
        //Keys是Bean对象的名字【？】
        String awardKey = awardRepository.queryAwardKey(distributeAwardEntity.getAwardId());
        if (awardKey == null){
            log.error("分发奖品，奖品ID不存在。awardKey:{}", awardKey);
            return;
        }

        //奖品服务
        //通过查到的Bean的名字【？】拿到【对应的奖品分发的服务实现】，完成奖品的发放
        IDistributeAward distributeAward = distributeAwardMap.get(awardKey);

        if(distributeAward == null){
            log.error("分发奖品，对应的服务不存在。awardKey:{}", awardKey);
            throw new RuntimeException("分发奖品，奖品" + awardKey + "对应的服务不存在");
        }

        //发放奖品
        distributeAward.giveOutPrizes(distributeAwardEntity);
    }
}
