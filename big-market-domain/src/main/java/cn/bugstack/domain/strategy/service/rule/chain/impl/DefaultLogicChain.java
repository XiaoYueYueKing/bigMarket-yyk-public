package cn.bugstack.domain.strategy.service.rule.chain.impl;



import cn.bugstack.domain.strategy.service.armory.IStrategyDispatch;
import cn.bugstack.domain.strategy.service.rule.chain.AbstractLogicChain;
import cn.bugstack.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description 默认的责任链「作为最后一个链」
 * @create 2024-01-20 10:06
 */
@Slf4j
//@Component("default")
@Component("rule_default") //TODO:找到问题所在了，因为标识的Bean名字写错了，应该是rule_default，而不是default，所以容器内找不到这个Bean，就没法做判断
public class DefaultLogicChain extends AbstractLogicChain {

    @Resource
    protected IStrategyDispatch strategyDispatch;

    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {
        Integer awardId = strategyDispatch.getRandomAwardId(strategyId);
        log.info("抽奖责任链-默认处理 userId: {} strategyId: {} ruleModel: {} awardId: {}", userId, strategyId, ruleModel(), awardId);
        return DefaultChainFactory.StrategyAwardVO.builder()
                .awardId(awardId)
                .logicModel(ruleModel())
                .build();
    }

    @Override
    protected String ruleModel() {
        System.out.println("123");
//        return DefaultChainFactory.LogicModel.RULE_DEFAULT.getCode();
        return "rule_default";
    }

}
