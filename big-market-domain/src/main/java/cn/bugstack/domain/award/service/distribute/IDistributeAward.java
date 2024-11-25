package cn.bugstack.domain.award.service.distribute;

import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.award.service
 * @Author: yueyueking
 * @CreateTime: 2024-11-24  14:44
 * @Description: TODO
 * @Version: 1.0
 */
public interface IDistributeAward {
    void giveOutPrizes(DistributeAwardEntity distributeAwardEntity);
}
