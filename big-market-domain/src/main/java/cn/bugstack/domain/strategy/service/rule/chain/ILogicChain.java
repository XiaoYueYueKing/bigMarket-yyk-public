package cn.bugstack.domain.strategy.service.rule.chain;

import cn.bugstack.domain.strategy.service.rule.chain.factory.DefaultChainFactory;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.strategy.service.rule.chain
 * @Author: yueyueking
 * @CreateTime: 2024-11-05  15:27
 * @Description: TODO
 * @Version: 1.0
 */
public interface ILogicChain extends ILogicChainArmory{
    /**
     * 责任链接口
     *
     * @param userId     用户ID
     * @param strategyId 策略ID
     * @return 奖品ID
     */
    DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId);
}
