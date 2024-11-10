package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-10  13:57
 * @Description: TODO
 * @Version: 1.0
 */
public class RaffleActivitySupport {
    protected DefaultActivityChainFactory defaultActivityChainFactory;
    protected IActivityRepository activityRepository;

    //构造函数方法注入
    public RaffleActivitySupport(IActivityRepository activityRepository,DefaultActivityChainFactory defaultActivityChainFactory){
        this.activityRepository = activityRepository;
        this.defaultActivityChainFactory = defaultActivityChainFactory;
    }

    public ActivitySkuEntity queryActivitySku(Long sku) {
        return activityRepository.queryActivitySku(sku);
    }
    public ActivityEntity queryRaffleActivityByActivityId(Long activityId) {
        return activityRepository.queryRaffleActivityByActivityId(activityId);
    }

    public ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId) {
        return activityRepository.queryRaffleActivityCountByActivityCountId(activityCountId);
    }
}
