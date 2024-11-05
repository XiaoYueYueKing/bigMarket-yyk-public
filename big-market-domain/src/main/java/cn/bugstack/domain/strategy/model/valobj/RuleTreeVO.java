package cn.bugstack.domain.strategy.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * @author Fuzhengwei bugstack.cn @小傅哥
 * @description 规则树对象【注意；不具有唯一ID，不需要改变数据库结果的对象，可以被定义为值对象】
 * 决策树的树根信息，标记出最开始从哪个节点执行treeRootRuleNode
 * @create 2024-01-27 10:45
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeVO {

    /** 规则树ID */
    private Integer treeId;
    /** 规则树名称 */
    private String treeName;
    /** 规则树描述 */
    private String treeDesc;
    /** 规则根节点 */
    private String treeRootRuleNode;

    /** 规则节点 */
    private Map<String, RuleTreeNodeVO> treeNodeMap;

}
