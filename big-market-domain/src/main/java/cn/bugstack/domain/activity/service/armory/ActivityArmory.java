package cn.bugstack.domain.activity.service.armory;

import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.armory
 * @Author: yueyueking
 * @CreateTime: 2024-11-10  20:32
 * @Description: TODO
 * @Version: 1.0
 */
@Slf4j
@Service
public class ActivityArmory implements IActivityArmory, IActivityDispatch {
    @Resource
    private IActivityRepository activityRepository;

    @Override
    public boolean assembleActivitySku(Long sku) {
        // 预热活动sku库存
        ActivitySkuEntity activitySkuEntity = activityRepository.queryActivitySku(sku);
        //从数据库加载库存（个数），然后把库存加载到Redis使用
        cacheActivitySkuStockCount(sku, activitySkuEntity.getStockCount());

        // 预热活动【查询时预热到缓存】
        activityRepository.queryRaffleActivityByActivityId(activitySkuEntity.getActivityId());
        // 预热活动次数【查询时预热到缓存】
        activityRepository.queryRaffleActivityCountByActivityCountId(activitySkuEntity.getActivityCountId());
        return true;
    }

    private void cacheActivitySkuStockCount(Long sku, Integer stockCount){
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        activityRepository.cacheActivitySkuStockCount(cacheKey, stockCount);
    }

    @Override
    public boolean subtractionActivitySkuStock(Long sku, Date endDateTime) {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        return activityRepository.subtractionActivitySkuStock(sku, cacheKey, endDateTime);
    }
}
