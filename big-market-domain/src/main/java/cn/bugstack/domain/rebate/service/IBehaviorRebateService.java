package cn.bugstack.domain.rebate.service;

import cn.bugstack.domain.rebate.model.entity.BehaviorEntity;

import java.util.List;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.rebase.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-17  18:16
 * @Description: 行为返利服务接口
 * @Version: 1.0
 */
public interface IBehaviorRebateService {
    /**
     * 创建行为动作的入账订单
     *
     * @param behaviorEntity 行为实体对象
     * @return 订单ID
     */
    List<String> createOrder(BehaviorEntity behaviorEntity);
}
