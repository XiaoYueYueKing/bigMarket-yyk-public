# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_02
# 生成时间: 2024-06-09 02:47:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_02` default character set utf8mb4;
use `big_market_02`;

# 转储表 raffle_activity_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account`;

CREATE TABLE `raffle_activity_account` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `total_count_surplus` int(8) NOT NULL COMMENT '总次数-剩余',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`, `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
	(2,'xiaofuge',100301,4,3,4,3,4,3,'2024-03-23 12:40:56','2024-03-23 13:16:40'),
	(3,'xiaofuge1',100301,10,9,10,9,10,9,'2024-05-03 16:01:44','2024-05-04 12:51:32'),
	(4,'xiaofuge2',100301,20,5,20,5,20,5,'2024-05-04 12:52:58','2024-05-04 13:57:32'),
	(5,'user001',100301,100,91,100,91,100,91,'2024-05-24 22:30:54','2024-05-30 07:22:10'),
	(6,'user002',100301,200,200,200,200,200,200,'2024-05-24 22:30:54','2024-05-27 22:42:17');

/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_day
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_day`;

CREATE TABLE `raffle_activity_account_day` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `day` varchar(10) NOT NULL COMMENT '日期（yyyy-mm-dd）',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id_day` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-日次数';

LOCK TABLES `raffle_activity_account_day` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_day` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_day` (`id`, `user_id`, `activity_id`, `day`, `day_count`, `day_count_surplus`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1',100301,'2024-05-04',10,9,'2024-05-04 12:51:32','2024-05-04 12:51:32'),
	(2,'xiaofuge2',100301,'2024-05-04',20,5,'2024-05-04 12:53:01','2024-05-04 13:57:32'),
	(3,'user001',100301,'2024-05-24',100,96,'2024-05-24 22:31:47','2024-05-24 22:34:37'),
	(4,'user001',100301,'2024-05-27',100,97,'2024-05-27 22:39:24','2024-05-27 22:42:17'),
	(5,'user001',100301,'2024-05-30',100,98,'2024-05-30 07:20:49','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `raffle_activity_account_day` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_month
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_month`;

CREATE TABLE `raffle_activity_account_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `month` varchar(7) NOT NULL COMMENT '月（yyyy-mm）',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-月次数';

LOCK TABLES `raffle_activity_account_month` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_month` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_month` (`id`, `user_id`, `activity_id`, `month`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1',100301,'2024-05',10,9,'2024-05-04 12:51:32','2024-05-04 12:51:32'),
	(2,'xiaofuge2',100301,'2024-05',20,5,'2024-05-04 12:53:01','2024-05-04 13:57:32'),
	(3,'user001',100301,'2024-05',100,91,'2024-05-24 22:31:47','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `raffle_activity_account_month` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint(12) NOT NULL COMMENT '商品sku',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_000` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_000` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_000` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1',9011,100301,'测试活动',100006,'831917125310','2024-05-03 08:01:44',10,10,10,NULL,'completed','xiaofuge1_sku_20240503','2024-05-03 16:01:44','2024-05-03 16:01:44'),
	(2,'user001',9011,100301,'测试活动',100006,'923549663927','2024-05-24 14:30:55',100,100,100,NULL,'completed','user001_sku_20240524','2024-05-24 22:30:54','2024-05-24 22:30:54');

/*!40000 ALTER TABLE `raffle_activity_order_000` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint(12) NOT NULL COMMENT '商品sku',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_001` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
	(3,'xiaofuge',9011,100301,'测试活动',100006,'383240888158','2024-03-23 04:38:23',1,1,1,NULL,'completed','700091009111','2024-03-23 12:38:23','2024-03-23 12:38:23'),
	(4,'user002',9011,100301,'测试活动',100006,'165083654323','2024-05-24 14:30:55',100,100,100,NULL,'completed','user002_sku_20240524','2024-05-24 22:30:54','2024-05-24 22:30:54'),
	(261,'user002',9011,100301,'测试活动',100006,'762873325216','2024-05-27 14:42:18',100,100,100,NULL,'completed','user002_sku_20240527','2024-05-27 22:42:17','2024-05-27 22:42:17');

/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint(12) NOT NULL COMMENT '商品sku',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint(12) NOT NULL COMMENT '商品sku',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_003` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_003` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_003` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
	(2,'xiaofuge2',9011,100301,'测试活动',100006,'942458887115','2024-05-04 05:07:53',10,10,10,NULL,'completed','xiaofuge2_sku_20240504','2024-05-04 13:07:53','2024-05-04 13:07:53');

/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `topic` varchar(32) NOT NULL COMMENT '消息主题',
  `message_id` varchar(11) DEFAULT NULL COMMENT '消息编号',
  `message` varchar(512) NOT NULL COMMENT '消息主体',
  `state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_message_id` (`message_id`),
  KEY `idx_state` (`state`),
  KEY `idx_create_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务表，发送MQ';

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `user_id`, `topic`, `message_id`, `message`, `state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1','send_rebate','54825531405','{\"data\":{\"bizId\":\"xiaofuge1_sku_20240503\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge1\"},\"id\":\"54825531405\",\"timestamp\":1714723302543}','completed','2024-05-03 16:01:43','2024-05-03 16:01:43'),
	(2,'xiaofuge1','send_rebate','43189560552','{\"data\":{\"bizId\":\"xiaofuge1_integral_20240503\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge1\"},\"id\":\"43189560552\",\"timestamp\":1714723302551}','completed','2024-05-03 16:01:43','2024-05-03 16:01:43'),
	(3,'xiaofuge1','send_award','68594836687','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge1\"},\"id\":\"68594836687\",\"timestamp\":1714798292665}','completed','2024-05-04 12:51:32','2024-05-04 12:51:32'),
	(4,'xiaofuge2','send_rebate','99573670989','{\"data\":{\"bizId\":\"xiaofuge2_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge2\"},\"id\":\"99573670989\",\"timestamp\":1714798377892}','completed','2024-05-04 12:52:57','2024-05-04 12:52:57'),
	(5,'xiaofuge2','send_rebate','86991437226','{\"data\":{\"bizId\":\"xiaofuge2_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge2\"},\"id\":\"86991437226\",\"timestamp\":1714798377895}','completed','2024-05-04 12:52:57','2024-05-04 12:52:57'),
	(6,'xiaofuge2','send_award','81688408328','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge2\"},\"id\":\"81688408328\",\"timestamp\":1714798382103}','completed','2024-05-04 12:53:02','2024-05-04 12:53:02'),
	(7,'xiaofuge2','send_award','42907626790','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge2\"},\"id\":\"42907626790\",\"timestamp\":1714798722679}','completed','2024-05-04 12:58:42','2024-05-04 12:58:42'),
	(8,'xiaofuge2','send_award','85155176747','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge2\"},\"id\":\"85155176747\",\"timestamp\":1714798808373}','completed','2024-05-04 13:00:08','2024-05-04 13:00:08'),
	(9,'xiaofuge2','send_award','76843118145','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge2\"},\"id\":\"76843118145\",\"timestamp\":1714799138341}','completed','2024-05-04 13:05:38','2024-05-04 13:05:38'),
	(10,'xiaofuge2','send_award','60195171213','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge2\"},\"id\":\"60195171213\",\"timestamp\":1714799145979}','completed','2024-05-04 13:05:45','2024-05-04 13:05:45'),
	(11,'xiaofuge2','send_award','94121994871','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge2\"},\"id\":\"94121994871\",\"timestamp\":1714799152785}','completed','2024-05-04 13:05:52','2024-05-04 13:05:52'),
	(12,'xiaofuge2','send_award','84058820142','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge2\"},\"id\":\"84058820142\",\"timestamp\":1714799159912}','completed','2024-05-04 13:05:59','2024-05-04 13:05:59'),
	(13,'xiaofuge2','send_award','43171330176','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge2\"},\"id\":\"43171330176\",\"timestamp\":1714799166780}','completed','2024-05-04 13:06:06','2024-05-04 13:06:06'),
	(14,'xiaofuge2','send_award','84240245488','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge2\"},\"id\":\"84240245488\",\"timestamp\":1714799177736}','completed','2024-05-04 13:06:17','2024-05-04 13:06:17'),
	(15,'xiaofuge2','send_award','95184575016','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge2\"},\"id\":\"95184575016\",\"timestamp\":1714799184841}','completed','2024-05-04 13:06:24','2024-05-04 13:06:24'),
	(16,'xiaofuge2','send_rebate','18731063175','{\"data\":{\"bizId\":\"xiaofuge2_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge2\"},\"id\":\"18731063175\",\"timestamp\":1714799273317}','completed','2024-05-04 13:07:53','2024-05-04 13:07:53'),
	(17,'xiaofuge2','send_rebate','55910936496','{\"data\":{\"bizId\":\"xiaofuge2_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge2\"},\"id\":\"55910936496\",\"timestamp\":1714799273318}','completed','2024-05-04 13:07:53','2024-05-04 13:07:53'),
	(18,'xiaofuge2','send_award','62395221004','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge2\"},\"id\":\"62395221004\",\"timestamp\":1714799286429}','completed','2024-05-04 13:08:06','2024-05-04 13:08:06'),
	(19,'xiaofuge2','send_award','82372459539','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge2\"},\"id\":\"82372459539\",\"timestamp\":1714802223761}','completed','2024-05-04 13:57:03','2024-05-04 13:57:03'),
	(20,'xiaofuge2','send_award','56572252891','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge2\"},\"id\":\"56572252891\",\"timestamp\":1714802231616}','completed','2024-05-04 13:57:11','2024-05-04 13:57:11'),
	(21,'xiaofuge2','send_award','40606839519','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge2\"},\"id\":\"40606839519\",\"timestamp\":1714802240195}','completed','2024-05-04 13:57:20','2024-05-04 13:57:20'),
	(22,'xiaofuge2','send_award','99508680162','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge2\"},\"id\":\"99508680162\",\"timestamp\":1714802252287}','completed','2024-05-04 13:57:32','2024-05-04 13:57:32'),
	(23,'user001','send_rebate','73773124323','{\"data\":{\"bizId\":\"user001_sku_20240524\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"user001\"},\"id\":\"73773124323\",\"timestamp\":1716560709722}','completed','2024-05-24 22:25:09','2024-05-24 22:25:10'),
	(24,'user001','send_rebate','02391103632','{\"data\":{\"bizId\":\"user001_integral_20240524\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user001\"},\"id\":\"02391103632\",\"timestamp\":1716560709725}','completed','2024-05-24 22:25:09','2024-05-24 22:25:10'),
	(25,'user002','send_rebate','49594929112','{\"data\":{\"bizId\":\"user002_sku_20240524\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"user002\"},\"id\":\"49594929112\",\"timestamp\":1716560951288}','completed','2024-05-24 22:29:11','2024-05-24 22:29:11'),
	(26,'user002','send_rebate','57121773264','{\"data\":{\"bizId\":\"user002_integral_20240524\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user002\"},\"id\":\"57121773264\",\"timestamp\":1716560951292}','completed','2024-05-24 22:29:11','2024-05-24 22:29:11'),
	(27,'user001','send_award','97971125221','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"391668886086\",\"userId\":\"user001\"},\"id\":\"97971125221\",\"timestamp\":1716561114657}','completed','2024-05-24 22:31:55','2024-05-24 22:31:55'),
	(28,'user001','send_award','89552334625','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"179191128326\",\"userId\":\"user001\"},\"id\":\"89552334625\",\"timestamp\":1716561182606}','completed','2024-05-24 22:33:02','2024-05-24 22:33:02'),
	(29,'user001','send_award','12743392424','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"320625987421\",\"userId\":\"user001\"},\"id\":\"12743392424\",\"timestamp\":1716561244275}','completed','2024-05-24 22:34:04','2024-05-24 22:34:04'),
	(30,'user001','send_award','50175032521','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"290879207548\",\"userId\":\"user001\"},\"id\":\"50175032521\",\"timestamp\":1716561277990}','completed','2024-05-24 22:34:38','2024-05-24 22:34:38'),
	(31,'user002','send_rebate','33869647355','{\"data\":{\"bizId\":\"user002_sku_20240527\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"user002\"},\"id\":\"33869647355\",\"timestamp\":1716820626795}','completed','2024-05-27 22:37:07','2024-05-27 22:37:07'),
	(32,'user002','send_rebate','66382556237','{\"data\":{\"bizId\":\"user002_integral_20240527\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user002\"},\"id\":\"66382556237\",\"timestamp\":1716820626797}','completed','2024-05-27 22:37:07','2024-05-27 22:37:07'),
	(33,'user001','send_award','61143330592','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"539811500095\",\"userId\":\"user001\"},\"id\":\"61143330592\",\"timestamp\":1716820764302}','completed','2024-05-27 22:39:24','2024-05-27 22:39:24'),
	(34,'user001','send_award','93461178922','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"405619392079\",\"userId\":\"user001\"},\"id\":\"93461178922\",\"timestamp\":1716820886701}','completed','2024-05-27 22:41:26','2024-05-27 22:41:26'),
	(35,'user001','send_award','00073222856','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"130698860415\",\"userId\":\"user001\"},\"id\":\"00073222856\",\"timestamp\":1716820937997}','completed','2024-05-27 22:42:18','2024-05-27 22:42:18'),
	(36,'user001','send_award','79139422874','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"777907205658\",\"userId\":\"user001\"},\"id\":\"79139422874\",\"timestamp\":1717024849194}','completed','2024-05-30 07:20:49','2024-05-30 07:20:49'),
	(37,'user001','send_award','19870027158','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"037106411824\",\"userId\":\"user001\"},\"id\":\"19870027158\",\"timestamp\":1717024930458}','completed','2024-05-30 07:22:10','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_000`;

CREATE TABLE `user_award_record_000` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int(11) NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_000` WRITE;
/*!40000 ALTER TABLE `user_award_record_000` DISABLE KEYS */;

INSERT INTO `user_award_record_000` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1',100301,100006,'386938913572',104,'小米台灯','2024-05-04 04:51:33','create','2024-05-04 12:51:32','2024-05-04 12:51:32'),
	(2,'user001',100301,100006,'391668886086',101,'随机积分','2024-05-24 14:31:47','create','2024-05-24 22:31:55','2024-05-24 22:31:55'),
	(3,'user001',100301,100006,'179191128326',101,'随机积分','2024-05-24 14:33:03','create','2024-05-24 22:33:02','2024-05-24 22:33:02'),
	(4,'user001',100301,100006,'320625987421',101,'随机积分','2024-05-24 14:34:02','completed','2024-05-24 22:34:04','2024-05-24 22:34:19'),
	(5,'user001',100301,100006,'290879207548',101,'随机积分','2024-05-24 14:34:38','completed','2024-05-24 22:34:38','2024-05-24 22:34:38'),
	(6,'user001',100301,100006,'539811500095',101,'随机积分','2024-05-27 14:39:24','completed','2024-05-27 22:39:24','2024-05-27 22:41:26'),
	(7,'user001',100301,100006,'405619392079',101,'随机积分','2024-05-27 14:41:27','completed','2024-05-27 22:41:26','2024-05-27 22:41:26'),
	(8,'user001',100301,100006,'130698860415',101,'随机积分','2024-05-27 14:42:18','completed','2024-05-27 22:42:18','2024-05-27 22:42:18'),
	(9,'user001',100301,100006,'777907205658',101,'随机积分','2024-05-29 23:20:49','completed','2024-05-30 07:20:49','2024-05-30 07:20:49'),
	(10,'user001',100301,100006,'037106411824',101,'随机积分','2024-05-29 23:22:10','completed','2024-05-30 07:22:10','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `user_award_record_000` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_001`;

CREATE TABLE `user_award_record_001` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int(11) NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_002`;

CREATE TABLE `user_award_record_002` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int(11) NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_003`;

CREATE TABLE `user_award_record_003` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int(11) NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_003` WRITE;
/*!40000 ALTER TABLE `user_award_record_003` DISABLE KEYS */;

INSERT INTO `user_award_record_003` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge2',100301,100006,'809920093949',102,'OpenAI会员卡','2024-05-04 04:53:02','create','2024-05-04 12:53:02','2024-05-04 12:53:02'),
	(2,'xiaofuge2',100301,100006,'613575974630',104,'小米台灯','2024-05-04 04:58:43','create','2024-05-04 12:58:42','2024-05-04 12:58:42'),
	(3,'xiaofuge2',100301,100006,'632802870481',102,'OpenAI会员卡','2024-05-04 05:00:08','create','2024-05-04 13:00:08','2024-05-04 13:00:08'),
	(4,'xiaofuge2',100301,100006,'972433161890',101,'随机积分','2024-05-04 05:05:38','create','2024-05-04 13:05:38','2024-05-04 13:05:38'),
	(5,'xiaofuge2',100301,100006,'877507315775',101,'随机积分','2024-05-04 05:05:46','create','2024-05-04 13:05:45','2024-05-04 13:05:45'),
	(6,'xiaofuge2',100301,100006,'517301751417',106,'轻奢办公椅','2024-05-04 05:05:53','create','2024-05-04 13:05:52','2024-05-04 13:05:52'),
	(7,'xiaofuge2',100301,100006,'261932434171',108,'暴走玩偶','2024-05-04 05:06:00','create','2024-05-04 13:05:59','2024-05-04 13:05:59'),
	(8,'xiaofuge2',100301,100006,'700573379547',107,'小霸王游戏机','2024-05-04 05:06:07','create','2024-05-04 13:06:06','2024-05-04 13:06:06'),
	(9,'xiaofuge2',100301,100006,'105697168349',108,'暴走玩偶','2024-05-04 05:06:18','create','2024-05-04 13:06:17','2024-05-04 13:06:17'),
	(10,'xiaofuge2',100301,100006,'959233180689',103,'支付优惠券','2024-05-04 05:06:25','create','2024-05-04 13:06:24','2024-05-04 13:06:24'),
	(11,'xiaofuge2',100301,100006,'958431976534',103,'支付优惠券','2024-05-04 05:08:06','create','2024-05-04 13:08:06','2024-05-04 13:08:06'),
	(12,'xiaofuge2',100301,100006,'014341440837',103,'支付优惠券','2024-05-04 05:57:04','create','2024-05-04 13:57:03','2024-05-04 13:57:03'),
	(13,'xiaofuge2',100301,100006,'104619821752',103,'支付优惠券','2024-05-04 05:57:12','create','2024-05-04 13:57:11','2024-05-04 13:57:11'),
	(14,'xiaofuge2',100301,100006,'932807566378',103,'支付优惠券','2024-05-04 05:57:20','create','2024-05-04 13:57:20','2024-05-04 13:57:20'),
	(15,'xiaofuge2',100301,100006,'623497872684',102,'OpenAI会员卡','2024-05-04 05:57:32','create','2024-05-04 13:57:32','2024-05-04 13:57:32');

/*!40000 ALTER TABLE `user_award_record_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;

CREATE TABLE `user_behavior_rebate_order_000` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_000` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_000` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_000` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
	(5,'xiaofuge1','883971522401','sign','签到返利-sku额度','sku','9011','20240503','xiaofuge1_sku_20240503','2024-05-03 16:01:42','2024-05-03 16:01:42'),
	(6,'xiaofuge1','995944930386','sign','签到返利-积分','integral','10','20240503','xiaofuge1_integral_20240503','2024-05-03 16:01:43','2024-05-03 16:01:43'),
	(7,'user001','153309768984','sign','签到返利-sku额度','sku','9011','20240524','user001_sku_20240524','2024-05-24 22:25:09','2024-05-24 22:25:09'),
	(8,'user001','922397055482','sign','签到返利-积分','integral','10','20240524','user001_integral_20240524','2024-05-24 22:25:09','2024-05-24 22:25:09');

/*!40000 ALTER TABLE `user_behavior_rebate_order_000` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;

CREATE TABLE `user_behavior_rebate_order_001` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_001` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_001` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_001` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
	(1,'user002','791847185524','sign','签到返利-sku额度','sku','9011','20240524','user002_sku_20240524','2024-05-24 22:29:11','2024-05-24 22:29:11'),
	(2,'user002','119018837248','sign','签到返利-积分','integral','10','20240524','user002_integral_20240524','2024-05-24 22:29:11','2024-05-24 22:29:11'),
	(3,'user002','031618502370','sign','签到返利-sku额度','sku','9011','20240527','user002_sku_20240527','2024-05-27 22:37:06','2024-05-27 22:37:06'),
	(4,'user002','591157608900','sign','签到返利-积分','integral','10','20240527','user002_integral_20240527','2024-05-27 22:37:07','2024-05-27 22:37:07');

/*!40000 ALTER TABLE `user_behavior_rebate_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;

CREATE TABLE `user_behavior_rebate_order_002` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';



# 转储表 user_behavior_rebate_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;

CREATE TABLE `user_behavior_rebate_order_003` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_003` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_003` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_003` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
	(7,'xiaofuge2','298513989210','sign','签到返利-sku额度','sku','9011','20240504','xiaofuge2_sku_20240504','2024-05-04 13:07:53','2024-05-04 13:07:53'),
	(8,'xiaofuge2','352651244433','sign','签到返利-积分','integral','10','20240504','xiaofuge2_integral_20240504','2024-05-04 13:07:53','2024-05-04 13:07:53');

/*!40000 ALTER TABLE `user_behavior_rebate_order_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_credit_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_account`;

CREATE TABLE `user_credit_account` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `total_amount` decimal(10,2) NOT NULL COMMENT '总积分，显示总账户值，记得一个人获得的总积分',
  `available_amount` decimal(10,2) NOT NULL COMMENT '可用积分，每次扣减的值',
  `account_status` varchar(8) NOT NULL COMMENT '账户状态【open - 可用，close - 冻结】',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分账户';

LOCK TABLES `user_credit_account` WRITE;
/*!40000 ALTER TABLE `user_credit_account` DISABLE KEYS */;

INSERT INTO `user_credit_account` (`id`, `user_id`, `total_amount`, `available_amount`, `account_status`, `create_time`, `update_time`)
VALUES
	(2,'user001',3.65,3.65,'open','2024-05-24 22:34:19','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `user_credit_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_credit_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_000`;

CREATE TABLE `user_credit_order_000` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
  `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_credit_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_001`;

CREATE TABLE `user_credit_order_001` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
  `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_credit_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_002`;

CREATE TABLE `user_credit_order_002` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
  `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_credit_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_003`;

CREATE TABLE `user_credit_order_003` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
  `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
  `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_raffle_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_000`;

CREATE TABLE `user_raffle_order_000` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_000` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_000` DISABLE KEYS */;

INSERT INTO `user_raffle_order_000` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge1',100301,'测试活动',100006,'386938913572','2024-05-04 04:51:32','used','2024-05-04 12:51:32','2024-05-04 12:51:32'),
	(2,'user001',100301,'测试活动',100006,'391668886086','2024-05-24 14:31:46','used','2024-05-24 22:31:47','2024-05-24 22:31:55'),
	(3,'user001',100301,'测试活动',100006,'179191128326','2024-05-24 14:33:02','used','2024-05-24 22:33:02','2024-05-24 22:33:02'),
	(4,'user001',100301,'测试活动',100006,'320625987421','2024-05-24 14:34:01','used','2024-05-24 22:34:01','2024-05-24 22:34:04'),
	(5,'user001',100301,'测试活动',100006,'290879207548','2024-05-24 14:34:37','used','2024-05-24 22:34:37','2024-05-24 22:34:38'),
	(6,'user001',100301,'测试活动',100006,'539811500095','2024-05-27 14:39:24','used','2024-05-27 22:39:24','2024-05-27 22:39:24'),
	(7,'user001',100301,'测试活动',100006,'405619392079','2024-05-27 14:41:26','used','2024-05-27 22:41:26','2024-05-27 22:41:26'),
	(8,'user001',100301,'测试活动',100006,'130698860415','2024-05-27 14:42:18','used','2024-05-27 22:42:17','2024-05-27 22:42:18'),
	(9,'user001',100301,'测试活动',100006,'777907205658','2024-05-29 23:20:49','used','2024-05-30 07:20:49','2024-05-30 07:20:49'),
	(10,'user001',100301,'测试活动',100006,'037106411824','2024-05-29 23:22:10','used','2024-05-30 07:22:10','2024-05-30 07:22:10');

/*!40000 ALTER TABLE `user_raffle_order_000` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_001`;

CREATE TABLE `user_raffle_order_001` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_002`;

CREATE TABLE `user_raffle_order_002` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_003`;

CREATE TABLE `user_raffle_order_003` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_003` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_003` DISABLE KEYS */;

INSERT INTO `user_raffle_order_003` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge2',100301,'测试活动',100006,'809920093949','2024-05-04 04:53:02','used','2024-05-04 12:53:02','2024-05-04 12:53:02'),
	(2,'xiaofuge2',100301,'测试活动',100006,'613575974630','2024-05-04 04:58:43','used','2024-05-04 12:58:42','2024-05-04 12:58:42'),
	(3,'xiaofuge2',100301,'测试活动',100006,'632802870481','2024-05-04 05:00:08','used','2024-05-04 13:00:08','2024-05-04 13:00:08'),
	(4,'xiaofuge2',100301,'测试活动',100006,'972433161890','2024-05-04 05:04:33','used','2024-05-04 13:04:32','2024-05-04 13:05:38'),
	(5,'xiaofuge2',100301,'测试活动',100006,'877507315775','2024-05-04 05:05:46','used','2024-05-04 13:05:45','2024-05-04 13:05:45'),
	(6,'xiaofuge2',100301,'测试活动',100006,'517301751417','2024-05-04 05:05:53','used','2024-05-04 13:05:52','2024-05-04 13:05:52'),
	(7,'xiaofuge2',100301,'测试活动',100006,'261932434171','2024-05-04 05:06:00','used','2024-05-04 13:05:59','2024-05-04 13:05:59'),
	(8,'xiaofuge2',100301,'测试活动',100006,'700573379547','2024-05-04 05:06:07','used','2024-05-04 13:06:06','2024-05-04 13:06:06'),
	(9,'xiaofuge2',100301,'测试活动',100006,'105697168349','2024-05-04 05:06:18','used','2024-05-04 13:06:17','2024-05-04 13:06:17'),
	(10,'xiaofuge2',100301,'测试活动',100006,'959233180689','2024-05-04 05:06:25','used','2024-05-04 13:06:24','2024-05-04 13:06:24'),
	(11,'xiaofuge2',100301,'测试活动',100006,'958431976534','2024-05-04 05:08:06','used','2024-05-04 13:08:06','2024-05-04 13:08:06'),
	(12,'xiaofuge2',100301,'测试活动',100006,'014341440837','2024-05-04 05:57:04','used','2024-05-04 13:57:03','2024-05-04 13:57:03'),
	(13,'xiaofuge2',100301,'测试活动',100006,'104619821752','2024-05-04 05:57:12','used','2024-05-04 13:57:11','2024-05-04 13:57:11'),
	(14,'xiaofuge2',100301,'测试活动',100006,'932807566378','2024-05-04 05:57:20','used','2024-05-04 13:57:20','2024-05-04 13:57:20'),
	(15,'xiaofuge2',100301,'测试活动',100006,'623497872684','2024-05-04 05:57:32','used','2024-05-04 13:57:32','2024-05-04 13:57:32');

/*!40000 ALTER TABLE `user_raffle_order_003` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
