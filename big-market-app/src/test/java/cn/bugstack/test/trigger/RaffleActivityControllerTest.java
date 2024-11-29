package cn.bugstack.test.trigger;

import cn.bugstack.trigger.api.IRaffleActivityService;
import cn.bugstack.trigger.api.dto.*;
import cn.bugstack.types.model.Response;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.test.trigger
 * @Author: yueyueking
 * @CreateTime: 2024-11-17  17:18
 * @Description: 抽奖活动服务测试
 * @Version: 1.0
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleActivityControllerTest {
    @Resource
    private IRaffleActivityService raffleActivityService;

    @Test
    public void test_armory() {
        Response<Boolean> response = raffleActivityService.armory(100301L);
        log.info("测试结果：{}", JSON.toJSONString(response));
    }

    @Test
    public void test_draw() {
        ActivityDrawRequestDTO request = new ActivityDrawRequestDTO();
        request.setActivityId(100301L);
        request.setUserId("xiaofuge");
        Response<ActivityDrawResponseDTO> response = raffleActivityService.draw(request);

        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }

    @Test
    public void test_calendarSignRebate(){
        Response<Boolean> response = raffleActivityService.calendarSignRebate("yueyueking");
        log.info("测试结果：{}", JSON.toJSONString(response));
    }

    @Test
    public void test_blacklist_draw() throws InterruptedException{
        ActivityDrawRequestDTO request = new ActivityDrawRequestDTO();
        request.setActivityId(100301L);
        request.setUserId("user001");
        Response<ActivityDrawResponseDTO> response = raffleActivityService.draw(request);

        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));

        // 让程序挺住方便测试，也可以去掉
        new CountDownLatch(1).await();
    }

    @Test
    public void test_isCalendarSignRebate() throws InterruptedException {
        Response<Boolean> response = raffleActivityService.isCalendarSignRebate("xiaofuge");
        log.info("测试结果：{}", JSON.toJSONString(response));

        // 让程序挺住方便测试，也可以去掉
        new CountDownLatch(1).await();
    }

    @Test
    public void test_queryUserActivityAccount() {
        UserActivityAccountRequestDTO request = new UserActivityAccountRequestDTO();
        request.setActivityId(100301L);
        request.setUserId("xiaofuge");

        // 查询数据
        Response<UserActivityAccountResponseDTO> response = raffleActivityService.queryUserActivityAccount(request);

        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }
    //商品查询
    @Test
    public void test_querySkuProductListByActivityId() {
        Long request = 100301L;
        Response<List<SkuProductResponseDTO>> response = raffleActivityService.querySkuProductListByActivityId(request);
        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }
    //账户查询
    @Test
    public void test_queryUserCreditAccount() {
        String request = "xiaofuge";
        Response<BigDecimal> response = raffleActivityService.queryUserCreditAccount(request);
        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }
    //商品兑换
    @Test
    public void test_creditPayExchangeSku() throws InterruptedException {
        SkuProductShopCartRequestDTO request = new SkuProductShopCartRequestDTO();
        request.setUserId("xiaofuge");
        request.setSku(9011L);
        Response<Boolean> response = raffleActivityService.creditPayExchangeSku(request);
        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));

        new CountDownLatch(1).await();
    }
}
