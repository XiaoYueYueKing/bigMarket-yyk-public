package cn.bugstack.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @BelongsProject: big-market
 * @BelongsPackage: cn.bugstack.config
 * @Author: yueyueking
 * @CreateTime: 2024-11-30  19:27
 * @Description: zookeeper配置文件
 * @Version: 1.0
 */

@Data
@ConfigurationProperties(prefix = "zookeeper.sdk.config", ignoreInvalidFields = true)
public class ZookeeperClientConfigProperties {
    private String connectString;
    private int baseSleepTimeMs;
    private int maxRetries;
    private int sessionTimeoutMs;
    private int connectionTimeoutMs;
}
