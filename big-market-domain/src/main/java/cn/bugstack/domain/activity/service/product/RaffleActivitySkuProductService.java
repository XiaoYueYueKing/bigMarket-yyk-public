package cn.bugstack.domain.activity.service.product;

import cn.bugstack.domain.activity.model.entity.SkuProductEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.IRaffleActivitySkuProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.domain.activity.service.product
 * @Author: yueyueking
 * @CreateTime: 2024-11-29  20:42
 * @Description: sku商品服务
 * @Version: 1.0
 */
@Service
public class RaffleActivitySkuProductService implements IRaffleActivitySkuProductService {
    @Resource
    private IActivityRepository repository;

    @Override
    public List<SkuProductEntity> querySkuProductEntityListByActivityId(Long activityId) {
        return repository.querySkuProductEntityListByActivityId(activityId);
    }
}
