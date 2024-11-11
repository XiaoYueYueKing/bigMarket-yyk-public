package cn.bugstack.domain.activity.service.quota.rule;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.rule
 * @Author: yueyueking
 * @CreateTime: 2024-11-09  13:29
 * @Description: TODO
 * @Version: 1.0
 */

public interface IActionChainArmory {
    IActionChain next();
    IActionChain appendNext(IActionChain next);
}
