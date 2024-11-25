package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.award.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-15  16:36
 * @Description: TODO
 * @Version: 1.0
 */

public interface IAwardService {
    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);
    /**
     * 配送发货奖品
     */
    void distributeAward(DistributeAwardEntity distributeAwardEntity);
}
