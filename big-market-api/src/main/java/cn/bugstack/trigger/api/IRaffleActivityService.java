package cn.bugstack.trigger.api;

import cn.bugstack.trigger.api.dto.ActivityDrawRequestDTO;
import cn.bugstack.trigger.api.dto.ActivityDrawResponseDTO;
import cn.bugstack.types.model.Response;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.trigger.api
 * @Author: yueyueking
 * @CreateTime: 2024-11-16  15:00
 * @Description: 抽奖服务接口
 * @Version: 1.0
 */

public interface IRaffleActivityService {
    /**
     * 活动装配，数据预热缓存
     * @param activityId 活动ID
     * @return 装配结果
     */
    Response<Boolean> armory(Long activityId);
    /**
     * 活动抽奖接口
     * @param request 请求对象
     * @return 返回结果
     */
    Response<ActivityDrawResponseDTO> draw(ActivityDrawRequestDTO request);
}
