package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.ActivityAccountEntity;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description 抽奖活动SKU库存服务
 * @create 2024-03-30 09:55
 */
public interface IRaffleActivitySkuStockService {

    /**
     * 获取活动sku库存消耗队列
     *
     * @return 奖品库存Key信息
     * @throws InterruptedException 异常
     */
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 清空队列
     */
    void clearQueueValue();

    /**
     * 延迟队列 + 任务趋势更新活动sku库存
     *
     * @param sku 活动商品
     */
    void updateActivitySkuStock(Long sku);

    /**
     * 缓存库存以消耗完毕，清空数据库库存
     *
     * @param sku 活动商品
     */
    void clearActivitySkuStock(Long sku);
    /**
     * 查询活动账户 - 日，参与次数
     *
     * @param activityId 活动ID
     * @param userId     用户ID
     * @return 参与次数
     */
    Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId);

    /**
     * 查询活动账户额度「总、月、日」
     *
     * @param activityId 活动ID
     * @param userId     用户ID
     * @return 账户实体
     */
    ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId);

}
