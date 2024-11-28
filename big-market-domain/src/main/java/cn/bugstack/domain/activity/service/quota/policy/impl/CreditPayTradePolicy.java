package cn.bugstack.domain.activity.service.quota.policy.impl;

import cn.bugstack.domain.activity.model.aggregate.CreateQuotaOrderAggregate;
import cn.bugstack.domain.activity.model.valobj.OrderStateVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.quota.policy.ITradePolicy;
import org.springframework.stereotype.Service;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.quota.policy.impl
 * @Author: yueyueking
 * @CreateTime: 2024-11-28  17:12
 * @Description: 积分兑换，支付类订单
 * @Version: 1.0
 */
@Service("credit_pay_trade")
public class CreditPayTradePolicy implements ITradePolicy {

    public final IActivityRepository activityRepository;
    public CreditPayTradePolicy(IActivityRepository activityRepository){
        this.activityRepository = activityRepository;
    }
    @Override
    public void trade(CreateQuotaOrderAggregate createQuotaOrderAggregate) {
        createQuotaOrderAggregate.setOrderState(OrderStateVO.wait_pay);
        activityRepository.doSaveCreditPayOrder(createQuotaOrderAggregate);
    }
}
