package cn.bugstack.domain.activity.service.rule.impl;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.service.rule.AbstractActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.rule.impl
 * @Author: yueyueking
 * @CreateTime: 2024-11-09  13:37
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Component("activity_sku_stock_action")
public class ActivitySkuStockChain extends AbstractActionChain {
    @Override
    public boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        log.info("活动责任链-商品库存处理【校验&扣减】开始。");
        return true;
    }
}
