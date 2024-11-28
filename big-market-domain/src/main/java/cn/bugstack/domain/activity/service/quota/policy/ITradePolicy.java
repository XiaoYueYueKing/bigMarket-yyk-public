package cn.bugstack.domain.activity.service.quota.policy;

import cn.bugstack.domain.activity.model.aggregate.CreateQuotaOrderAggregate;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.quota.policy
 * @Author: yueyueking
 * @CreateTime: 2024-11-28  17:11
 * @Description: 交易策略接口，包括；返利兑换（不用支付），积分订单（需要支付）
 * @Version: 1.0
 */

public interface ITradePolicy {
    void trade(CreateQuotaOrderAggregate createQuotaOrderAggregate);

}
