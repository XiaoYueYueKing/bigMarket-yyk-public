package cn.bugstack.domain.activity.service.armory;

import java.util.Date;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.armory
 * @Author: yueyueking
 * @CreateTime: 2024-11-10  20:33
 * @Description: TODO
 * @Version: 1.0
 */

public interface IActivityDispatch {
    /**
     * 根据策略ID和奖品ID，扣减奖品缓存库存
     *
     * @param sku 互动SKU
     * @param endDateTime 活动结束时间，根据结束时间设置加锁的key为结束时间
     * @return 扣减结果
     */
    boolean subtractionActivitySkuStock(Long sku, Date endDateTime);

}
