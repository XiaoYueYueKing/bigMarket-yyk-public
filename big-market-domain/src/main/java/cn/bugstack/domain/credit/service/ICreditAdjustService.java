package cn.bugstack.domain.credit.service;

import cn.bugstack.domain.credit.model.entity.TradeEntity;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.credit.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-25  21:42
 * @Description: 积分调额接口【正逆向，增减积分】
 * @Version: 1.0
 */

public interface ICreditAdjustService {
    /**
     * 创建增加积分额度订单
     * @param tradeEntity 交易实体对象
     * @return 单号
     */
    String createOrder(TradeEntity tradeEntity);
}
