package cn.bugstack.domain.activity.service.quota.rule;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.rule
 * @Author: yueyueking
 * @CreateTime: 2024-11-09  13:33
 * @Description: TODO
 * @Version: 1.0
 */
public abstract class AbstractActionChain implements IActionChain {

    private IActionChain next;
    @Override
    public IActionChain next() {
        return next;
    }

    @Override
    public IActionChain appendNext(IActionChain next) {
        this.next = next;
        return next;
    }
}
