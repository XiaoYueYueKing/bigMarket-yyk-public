# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-06-09 02:47:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;

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
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`, `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
	(3,'xiaofuge',100301,660,561,660,599,660,599,'2024-03-23 16:38:57','2024-06-09 10:45:11'),
	(4,'12345',100301,10,10,10,10,10,10,'2024-05-01 15:28:50','2024-05-01 15:28:50'),
	(5,'liergou',100301,20,6,20,6,20,6,'2024-05-04 15:30:21','2024-05-04 15:34:10'),
	(6,'liergou2',100301,100,86,100,86,100,86,'2024-05-04 15:35:52','2024-05-04 15:37:37'),
	(7,'user003',100301,100,98,100,98,100,98,'2024-05-25 10:52:19','2024-05-25 10:54:30');

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
	(2,'xiaofuge',100301,'2024-04-05',45,44,'2024-04-05 17:10:31','2024-04-05 17:10:31'),
	(3,'xiaofuge',100301,'2024-04-08',45,44,'2024-04-08 22:52:47','2024-04-08 22:52:47'),
	(4,'xiaofuge',100301,'2024-04-13',45,23,'2024-04-13 11:44:10','2024-04-20 10:51:09'),
	(7,'xiaofuge',100301,'2024-04-20',45,13,'2024-04-20 16:50:38','2024-04-20 16:50:38'),
	(11,'xiaofuge',100301,'2024-05-01',60,40,'2024-05-01 14:51:45','2024-05-01 17:45:10'),
	(12,'xiaofuge',100301,'2024-05-03',90,86,'2024-05-03 09:00:28','2024-05-03 13:28:42'),
	(13,'xiaofuge',100301,'2024-05-04',160,131,'2024-05-04 09:32:02','2024-05-04 15:29:56'),
	(14,'liergou',100301,'2024-05-04',20,6,'2024-05-04 15:30:36','2024-05-04 15:34:10'),
	(15,'liergou2',100301,'2024-05-04',100,86,'2024-05-04 15:35:56','2024-05-04 15:37:37'),
	(16,'user003',100301,'2024-05-25',100,98,'2024-05-25 10:53:19','2024-05-25 10:54:30'),
	(17,'xiaofuge',100301,'2024-05-30',160,154,'2024-05-30 07:24:01','2024-05-30 08:02:18');

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
	(7,'xiaofuge',100301,'2024-05',140,79,'2024-05-01 14:51:45','2024-05-30 08:02:18'),
	(8,'liergou',100301,'2024-05',20,6,'2024-05-04 15:30:36','2024-05-04 15:34:10'),
	(9,'liergou2',100301,'2024-05',100,86,'2024-05-04 15:35:56','2024-05-04 15:37:37'),
	(10,'user003',100301,'2024-05',100,98,'2024-05-25 10:53:19','2024-05-25 10:54:30');

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
	(71,'xiaofuge',9011,100301,'测试活动',100006,'761345538871','2024-04-21 10:40:25',1,1,1,NULL,'completed','073735003829','2024-04-21 18:40:25','2024-04-21 18:40:25'),
	(72,'xiaofuge',9011,100301,'测试活动',100006,'837744050164','2024-04-21 10:40:25',1,1,1,NULL,'completed','613036507854','2024-04-21 18:40:25','2024-04-21 18:40:25'),
	(73,'xiaofuge',9011,100301,'测试活动',100006,'766742523760','2024-04-21 10:40:25',1,1,1,NULL,'completed','649099837249','2024-04-21 18:40:25','2024-04-21 18:40:25'),
	(74,'xiaofuge',9011,100301,'测试活动',100006,'856474163547','2024-04-21 10:40:25',1,1,1,NULL,'completed','652903372986','2024-04-21 18:40:25','2024-04-21 18:40:25'),
	(75,'xiaofuge',9011,100301,'测试活动',100006,'668775949799','2024-04-21 10:40:25',1,1,1,NULL,'completed','097066347980','2024-04-21 18:40:25','2024-04-21 18:40:25'),
	(76,'xiaofuge',9011,100301,'测试活动',100006,'164452591012','2024-05-01 06:44:26',10,10,10,NULL,'completed','xiaofuge_sku_2024042903','2024-05-01 14:44:26','2024-05-01 14:44:26'),
	(77,'xiaofuge',9011,100301,'测试活动',100006,'492597085813','2024-05-01 06:51:45',10,10,10,NULL,'completed','xiaofuge_sku_2024042904','2024-05-01 14:51:45','2024-05-01 14:51:45'),
	(78,'xiaofuge',9011,100301,'测试活动',100006,'031706643902','2024-05-01 06:54:36',10,10,10,NULL,'completed','xiaofuge_sku_2024042905','2024-05-01 14:54:36','2024-05-01 14:54:36'),
	(79,'xiaofuge',9011,100301,'测试活动',100006,'460855930969','2024-05-01 07:00:12',10,10,10,NULL,'completed','xiaofuge_sku_2024042906','2024-05-01 15:00:12','2024-05-01 15:00:12'),
	(1096,'xiaofuge',9011,100301,'测试活动',100006,'364757830401','2024-05-01 09:14:43',10,10,10,NULL,'completed','xiaofuge_sku_20240501','2024-05-01 17:14:43','2024-05-01 17:14:43'),
	(1097,'xiaofuge',9011,100301,'测试活动',100006,'157026402583','2024-05-01 09:39:40',10,10,10,NULL,'completed','xiaofuge_sku_20240420','2024-05-01 17:39:40','2024-05-01 17:39:40'),
	(1098,'xiaofuge',9011,100301,'测试活动',100006,'481116019750','2024-05-01 09:41:53',10,10,10,NULL,'completed','xiaofuge_sku_20240401','2024-05-01 17:41:53','2024-05-01 17:41:53'),
	(1099,'xiaofuge',9011,100301,'测试活动',100006,'639151059221','2024-05-01 09:45:10',10,10,10,NULL,'completed','xiaofuge_sku_20240402','2024-05-01 17:45:10','2024-05-01 17:45:10'),
	(4234,'xiaofuge',9011,100301,'测试活动',100006,'129360973197','2024-05-03 05:28:43',10,10,10,NULL,'completed','xiaofuge_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
	(4247,'liergou',9011,100301,'测试活动',100006,'151494600661','2024-05-04 07:32:26',10,10,10,NULL,'completed','liergou_sku_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
	(4248,'xiaofuge',9011,100301,'测试活动',100006,'398083697802','2024-06-08 10:38:59',100,100,100,1.68,'wait_pay','70009240608001','2024-06-08 18:38:59','2024-06-08 18:38:59'),
	(4249,'xiaofuge',9011,100301,'测试活动',100006,'356030049461','2024-06-08 10:54:33',100,100,100,1.68,'wait_pay','70009240608002','2024-06-08 18:54:32','2024-06-08 18:54:32'),
	(4250,'xiaofuge',9011,100301,'测试活动',100006,'605318523315','2024-06-08 10:55:50',100,100,100,1.68,'completed','70009240608003','2024-06-08 18:55:49','2024-06-08 20:29:30'),
	(4251,'xiaofuge',9011,100301,'测试活动',100006,'127654026777','2024-06-08 10:56:28',100,100,100,0.00,'completed','70009240608004','2024-06-08 18:56:27','2024-06-08 18:56:27'),
	(4252,'xiaofuge',9011,100301,'测试活动',100006,'932526349433','2024-06-08 12:33:09',100,100,100,1.68,'completed','70009240608007','2024-06-08 20:33:09','2024-06-08 20:34:13'),
	(4253,'xiaofuge',9011,100301,'测试活动',100006,'073017788455','2024-06-09 01:07:48',100,100,100,1.68,'completed','70009240609001','2024-06-09 09:07:47','2024-06-09 09:11:24'),
	(4254,'xiaofuge',9011,100301,'测试活动',100006,'590031092982','2024-06-09 02:33:49',100,100,100,NULL,'wait_pay','70009240610001','2024-06-09 10:33:48','2024-06-09 10:33:48'),
	(4255,'xiaofuge',9011,100301,'测试活动',100006,'732573213062','2024-06-09 02:43:18',100,100,100,1.68,'completed','70009240610002','2024-06-09 10:43:18','2024-06-09 10:45:11');

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

LOCK TABLES `raffle_activity_order_002` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_002` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_002` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
	(1,'liergou2',9011,100301,'测试活动',100006,'987026967898','2024-05-04 07:35:53',100,100,100,NULL,'completed','liergou2_sku_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
	(2,'user003',9011,100301,'测试活动',100006,'700446814309','2024-05-25 02:52:20',100,100,100,NULL,'completed','user003_sku_20240525','2024-05-25 10:52:19','2024-05-25 10:52:19');

/*!40000 ALTER TABLE `raffle_activity_order_002` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'xiaofuge','send_award','23913710462','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"23913710462\",\"timestamp\":1712374909975}','completed','2024-04-06 11:41:50','2024-04-06 12:14:50'),
	(2,'xiaofuge','send_award','33004806135','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33004806135\",\"timestamp\":1712375273609}','completed','2024-04-06 11:47:54','2024-04-06 12:14:50'),
	(3,'xiaofuge','send_award','61315401992','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61315401992\",\"timestamp\":1712377009778}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
	(4,'xiaofuge','send_award','74920280321','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74920280321\",\"timestamp\":1712377010878}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
	(5,'xiaofuge','send_award','71692388884','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71692388884\",\"timestamp\":1712377011390}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
	(6,'xiaofuge','send_award','11524874230','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11524874230\",\"timestamp\":1712377011913}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
	(7,'xiaofuge','send_award','39972412889','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39972412889\",\"timestamp\":1712377012434}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
	(8,'xiaofuge','send_award','79019640497','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"79019640497\",\"timestamp\":1712377012955}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
	(9,'xiaofuge','send_award','97077031398','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97077031398\",\"timestamp\":1712377013498}','completed','2024-04-06 12:16:53','2024-04-06 12:16:53'),
	(10,'xiaofuge','send_award','08720582836','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08720582836\",\"timestamp\":1712377014017}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
	(11,'xiaofuge','send_award','60787815183','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"60787815183\",\"timestamp\":1712377014529}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
	(12,'xiaofuge','send_award','97145040946','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97145040946\",\"timestamp\":1712377015040}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
	(13,'xiaofuge','send_award','40165031868','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"40165031868\",\"timestamp\":1712377015553}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
	(14,'xiaofuge','send_award','31142176572','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"31142176572\",\"timestamp\":1712377016066}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
	(15,'xiaofuge','send_award','54723488249','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54723488249\",\"timestamp\":1712377016577}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
	(16,'xiaofuge','send_award','94553316274','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"94553316274\",\"timestamp\":1712377017090}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
	(17,'xiaofuge','send_award','47638237311','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"47638237311\",\"timestamp\":1712377017601}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
	(18,'xiaofuge','send_award','08472548108','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08472548108\",\"timestamp\":1712377018112}','completed','2024-04-06 12:16:58','2024-04-06 16:07:00'),
	(19,'xiaofuge','send_award','01704262897','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"01704262897\",\"timestamp\":1712391038041}','completed','2024-04-06 16:10:38','2024-04-06 16:10:38'),
	(20,'xiaofuge','send_award','96818112357','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96818112357\",\"timestamp\":1712391039234}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
	(21,'xiaofuge','send_award','39815817631','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39815817631\",\"timestamp\":1712391039751}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
	(22,'xiaofuge','send_award','44228382875','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44228382875\",\"timestamp\":1712391040268}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
	(23,'xiaofuge','send_award','61240314870','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61240314870\",\"timestamp\":1712391040784}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
	(24,'xiaofuge','send_award','30911821347','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"30911821347\",\"timestamp\":1712391041333}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
	(25,'xiaofuge','send_award','41575602711','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"41575602711\",\"timestamp\":1712391041849}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
	(26,'xiaofuge','send_award','72379603310','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"72379603310\",\"timestamp\":1712391042361}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
	(27,'xiaofuge','send_award','51671684313','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51671684313\",\"timestamp\":1712391042875}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
	(28,'xiaofuge','send_award','11840468669','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11840468669\",\"timestamp\":1712391043390}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
	(29,'xiaofuge','send_award','18467905170','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"18467905170\",\"timestamp\":1712391043908}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
	(30,'xiaofuge','send_award','33233781451','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33233781451\",\"timestamp\":1712391044424}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
	(31,'xiaofuge','send_award','09679212052','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09679212052\",\"timestamp\":1712391044938}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
	(32,'xiaofuge','send_award','96862889309','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96862889309\",\"timestamp\":1712391045450}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
	(33,'xiaofuge','send_award','69912628282','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69912628282\",\"timestamp\":1712391045962}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
	(34,'xiaofuge','send_award','26021447219','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"26021447219\",\"timestamp\":1712391046477}','completed','2024-04-06 16:10:46','2024-04-13 10:48:45'),
	(35,'xiaofuge','send_award','29510804265','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"29510804265\",\"timestamp\":1712391047005}','completed','2024-04-06 16:10:47','2024-04-13 10:48:45'),
	(36,'xiaofuge','send_award','99669876677','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"99669876677\",\"timestamp\":1712979841591}','completed','2024-04-13 11:44:01','2024-04-13 11:44:01'),
	(37,'xiaofuge','send_award','13183725005','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"13183725005\",\"timestamp\":1712979850853}','completed','2024-04-13 11:44:10','2024-04-13 11:44:10'),
	(38,'xiaofuge','send_award','13436201468','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"13436201468\",\"timestamp\":1712979854073}','completed','2024-04-13 11:44:14','2024-04-13 11:44:14'),
	(39,'xiaofuge','send_award','89567645271','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"89567645271\",\"timestamp\":1712979855601}','completed','2024-04-13 11:44:15','2024-04-13 11:44:15'),
	(40,'xiaofuge','send_award','00308200403','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"00308200403\",\"timestamp\":1712979856602}','completed','2024-04-13 11:44:16','2024-04-13 11:44:16'),
	(41,'xiaofuge','send_award','70460061560','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"70460061560\",\"timestamp\":1712979857586}','completed','2024-04-13 11:44:17','2024-04-13 11:44:17'),
	(42,'xiaofuge','send_award','03493035635','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03493035635\",\"timestamp\":1712979858714}','completed','2024-04-13 11:44:18','2024-04-13 11:44:18'),
	(43,'xiaofuge','send_award','22062172114','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"22062172114\",\"timestamp\":1712979929672}','completed','2024-04-13 11:45:29','2024-04-13 11:45:29'),
	(44,'xiaofuge','send_award','75973092346','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"75973092346\",\"timestamp\":1712979930723}','completed','2024-04-13 11:45:30','2024-04-13 11:45:30'),
	(45,'xiaofuge','send_award','32769685487','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"32769685487\",\"timestamp\":1712981693149}','completed','2024-04-13 12:14:53','2024-04-13 12:14:53'),
	(46,'xiaofuge','send_award','85144595338','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"85144595338\",\"timestamp\":1712981853669}','completed','2024-04-13 12:17:33','2024-04-13 12:17:33'),
	(47,'xiaofuge','send_award','44874364790','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44874364790\",\"timestamp\":1712981896942}','completed','2024-04-13 12:18:16','2024-04-13 12:18:16'),
	(48,'xiaofuge','send_award','85399883630','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"85399883630\",\"timestamp\":1712981903339}','completed','2024-04-13 12:18:23','2024-04-13 12:18:23'),
	(49,'xiaofuge','send_award','29729581514','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"29729581514\",\"timestamp\":1712981904841}','completed','2024-04-13 12:18:24','2024-04-13 12:18:24'),
	(50,'xiaofuge','send_award','74718298956','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"74718298956\",\"timestamp\":1712981905797}','completed','2024-04-13 12:18:25','2024-04-13 12:18:25'),
	(51,'xiaofuge','send_award','50114477022','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50114477022\",\"timestamp\":1712981916880}','completed','2024-04-13 12:18:36','2024-04-13 12:18:36'),
	(52,'xiaofuge','send_award','28956245329','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"28956245329\",\"timestamp\":1712982007542}','completed','2024-04-13 12:20:07','2024-04-13 12:20:07'),
	(53,'xiaofuge','send_award','99592907656','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"99592907656\",\"timestamp\":1712982009729}','completed','2024-04-13 12:20:09','2024-04-13 12:20:09'),
	(54,'xiaofuge','send_award','19525539782','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"19525539782\",\"timestamp\":1712982013711}','completed','2024-04-13 12:20:13','2024-04-13 12:20:13'),
	(55,'xiaofuge','send_award','47878047199','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"47878047199\",\"timestamp\":1712982014913}','completed','2024-04-13 12:20:14','2024-04-13 12:20:14'),
	(56,'xiaofuge','send_award','27264311844','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"27264311844\",\"timestamp\":1712982016134}','completed','2024-04-13 12:20:16','2024-04-13 12:20:16'),
	(57,'xiaofuge','send_award','77749836320','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"77749836320\",\"timestamp\":1712982020673}','completed','2024-04-13 12:20:20','2024-04-13 12:20:20'),
	(58,'xiaofuge','send_award','47587820823','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"47587820823\",\"timestamp\":1712988239372}','completed','2024-04-13 14:03:59','2024-04-13 14:03:59'),
	(59,'xiaofuge','send_award','58931754976','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"58931754976\",\"timestamp\":1712993105696}','completed','2024-04-13 15:25:06','2024-04-13 15:25:06'),
	(60,'xiaofuge','send_award','67608143436','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"67608143436\",\"timestamp\":1712993111209}','completed','2024-04-13 15:25:11','2024-04-13 15:25:11'),
	(61,'xiaofuge','send_award','22711974997','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"22711974997\",\"timestamp\":1712993112288}','completed','2024-04-13 15:25:12','2024-04-13 15:25:12'),
	(62,'xiaofuge','send_award','39728508373','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39728508373\",\"timestamp\":1712993121051}','completed','2024-04-13 15:25:21','2024-04-13 15:25:21'),
	(63,'xiaofuge','send_award','29346013696','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"29346013696\",\"timestamp\":1713586170567}','completed','2024-04-20 12:09:30','2024-04-20 12:09:30'),
	(64,'xiaofuge','send_award','26345538109','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"26345538109\",\"timestamp\":1713586284216}','completed','2024-04-20 12:11:24','2024-04-20 12:11:24'),
	(65,'xiaofuge','send_award','08631161692','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"08631161692\",\"timestamp\":1713597058001}','completed','2024-04-20 15:10:58','2024-04-20 15:10:58'),
	(66,'xiaofuge','send_award','39622786502','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39622786502\",\"timestamp\":1713598992837}','completed','2024-04-20 15:43:13','2024-04-20 15:43:13'),
	(67,'xiaofuge','send_award','66657753896','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66657753896\",\"timestamp\":1713603038553}','completed','2024-04-20 16:50:39','2024-04-20 16:50:39'),
	(68,'xiaofuge','send_award','87700384224','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"87700384224\",\"timestamp\":1714195178827}','completed','2024-04-27 13:19:38','2024-04-27 13:19:38'),
	(69,'xiaofuge','send_award','34246976218','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"34246976218\",\"timestamp\":1714195637200}','completed','2024-04-27 13:27:17','2024-04-27 13:27:17'),
	(70,'xiaofuge','send_award','67418825974','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"67418825974\",\"timestamp\":1714195665080}','completed','2024-04-27 13:27:45','2024-04-27 13:27:45'),
	(71,'xiaofuge','send_award','28182567445','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"28182567445\",\"timestamp\":1714195681839}','completed','2024-04-27 13:28:01','2024-04-27 13:28:01'),
	(72,'xiaofuge','send_award','43921644960','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge\"},\"id\":\"43921644960\",\"timestamp\":1714195745254}','completed','2024-04-27 13:29:05','2024-04-27 13:29:05'),
	(73,'xiaofuge','send_award','83192193690','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge\"},\"id\":\"83192193690\",\"timestamp\":1714195771714}','completed','2024-04-27 13:29:31','2024-04-27 13:29:31'),
	(74,'xiaofuge','send_award','71879339129','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge\"},\"id\":\"71879339129\",\"timestamp\":1714195797449}','completed','2024-04-27 13:29:57','2024-04-27 13:29:57'),
	(75,'xiaofuge','send_award','82583508840','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"82583508840\",\"timestamp\":1714195811069}','completed','2024-04-27 13:30:11','2024-04-27 13:30:11'),
	(76,'xiaofuge','send_award','21336975617','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"21336975617\",\"timestamp\":1714196187285}','completed','2024-04-27 13:36:27','2024-04-27 13:36:27'),
	(77,'xiaofuge','send_award','54277155930','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"54277155930\",\"timestamp\":1714196280178}','completed','2024-04-27 13:38:00','2024-04-27 13:38:00'),
	(78,'xiaofuge','send_award','90789466751','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"90789466751\",\"timestamp\":1714196335804}','completed','2024-04-27 13:38:55','2024-04-27 13:38:55'),
	(79,'xiaofuge','send_award','62146713103','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"62146713103\",\"timestamp\":1714196358336}','completed','2024-04-27 13:39:18','2024-04-27 13:39:18'),
	(80,'xiaofuge','send_award','69804673669','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"69804673669\",\"timestamp\":1714201196264}','completed','2024-04-27 14:59:56','2024-04-27 14:59:56'),
	(81,'xiaofuge','send_award','56789986275','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"56789986275\",\"timestamp\":1714201214179}','completed','2024-04-27 15:00:14','2024-04-27 15:00:14'),
	(82,'xiaofuge','send_award','05612212348','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"05612212348\",\"timestamp\":1714201222825}','completed','2024-04-27 15:00:22','2024-04-27 15:00:22'),
	(83,'xiaofuge','send_rebate','35170430024','{\"data\":{\"bizId\":\"xiaofuge_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"35170430024\",\"timestamp\":1714471292871}','completed','2024-04-30 18:01:33','2024-04-30 18:01:33'),
	(84,'xiaofuge','send_rebate','33541289034','{\"data\":{\"bizId\":\"xiaofuge_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"33541289034\",\"timestamp\":1714471544134}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
	(85,'xiaofuge','send_rebate','42019106000','{\"data\":{\"bizId\":\"xiaofuge_integral_20240430\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"42019106000\",\"timestamp\":1714471544137}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
	(86,'xiaofuge','send_rebate','19381004535','{\"data\":{\"bizId\":\"xiaofuge_sku_20240429\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"19381004535\",\"timestamp\":1714472470563}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
	(87,'xiaofuge','send_rebate','64076325441','{\"data\":{\"bizId\":\"xiaofuge_integral_20240429\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"64076325441\",\"timestamp\":1714472470567}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
	(88,'xiaofuge','send_rebate','68231201640','{\"data\":{\"bizId\":\"xiaofuge_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"68231201640\",\"timestamp\":1714528145559}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
	(89,'xiaofuge','send_rebate','50111005352','{\"data\":{\"bizId\":\"xiaofuge_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"50111005352\",\"timestamp\":1714528145563}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
	(90,'xiaofuge','send_rebate','75682316589','{\"data\":{\"bizId\":\"xiaofuge_sku_20240502\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"75682316589\",\"timestamp\":1714528244315}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
	(91,'xiaofuge','send_rebate','15910602537','{\"data\":{\"bizId\":\"xiaofuge_integral_20240502\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"15910602537\",\"timestamp\":1714528244322}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
	(92,'xiaofuge','send_rebate','84186056749','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042901\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"84186056749\",\"timestamp\":1714543316732}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
	(93,'xiaofuge','send_rebate','96465813570','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042901\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"96465813570\",\"timestamp\":1714543316735}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
	(94,'xiaofuge','send_rebate','52282173291','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042902\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"52282173291\",\"timestamp\":1714545280296}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
	(95,'xiaofuge','send_rebate','57252028754','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042902\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"xiaofuge\"},\"id\":\"57252028754\",\"timestamp\":1714545280298}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
	(96,'xiaofuge','send_rebate','49677315112','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042903\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"49677315112\",\"timestamp\":1714545434013}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
	(97,'xiaofuge','send_rebate','29687183027','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042903\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"29687183027\",\"timestamp\":1714545434017}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
	(98,'xiaofuge','send_rebate','55494780983','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042904\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"55494780983\",\"timestamp\":1714546304733}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
	(99,'xiaofuge','send_rebate','63676464061','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042904\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"63676464061\",\"timestamp\":1714546304736}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
	(100,'xiaofuge','send_rebate','97069945042','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042905\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"97069945042\",\"timestamp\":1714546475883}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
	(101,'xiaofuge','send_rebate','25711583274','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042905\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"25711583274\",\"timestamp\":1714546475885}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
	(102,'xiaofuge','send_award','42156280709','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"42156280709\",\"timestamp\":1714546659050}','completed','2024-05-01 14:57:39','2024-05-01 14:57:39'),
	(103,'xiaofuge','send_award','78085050648','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"78085050648\",\"timestamp\":1714546688551}','completed','2024-05-01 14:58:08','2024-05-01 14:58:08'),
	(104,'xiaofuge','send_award','55842869580','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"55842869580\",\"timestamp\":1714546773027}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(105,'xiaofuge','send_award','86587566543','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge\"},\"id\":\"86587566543\",\"timestamp\":1714546773422}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(106,'xiaofuge','send_award','88267642020','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"88267642020\",\"timestamp\":1714546773490}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(107,'xiaofuge','send_award','03348496593','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge\"},\"id\":\"03348496593\",\"timestamp\":1714546773570}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(108,'xiaofuge','send_award','20140993483','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"20140993483\",\"timestamp\":1714546773661}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(109,'xiaofuge','send_award','95682596295','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"95682596295\",\"timestamp\":1714546773713}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(110,'xiaofuge','send_award','95939034377','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"95939034377\",\"timestamp\":1714546773772}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(111,'xiaofuge','send_award','28569395651','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge\"},\"id\":\"28569395651\",\"timestamp\":1714546773829}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(112,'xiaofuge','send_award','37713199996','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"37713199996\",\"timestamp\":1714546773889}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(113,'xiaofuge','send_award','39729736863','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"39729736863\",\"timestamp\":1714546773937}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(114,'xiaofuge','send_award','63571397739','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"63571397739\",\"timestamp\":1714546774008}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(115,'xiaofuge','send_award','41779666583','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"41779666583\",\"timestamp\":1714546774083}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(116,'xiaofuge','send_award','35122333142','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"35122333142\",\"timestamp\":1714546774144}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(117,'xiaofuge','send_award','07007092150','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"07007092150\",\"timestamp\":1714546774211}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(118,'xiaofuge','send_award','08460963032','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"08460963032\",\"timestamp\":1714546774278}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(119,'xiaofuge','send_award','06210115971','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"06210115971\",\"timestamp\":1714546774344}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(120,'xiaofuge','send_award','78110342017','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"78110342017\",\"timestamp\":1714546774404}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(121,'xiaofuge','send_award','34349719655','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"34349719655\",\"timestamp\":1714546774481}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(122,'xiaofuge','send_award','16795012327','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"xiaofuge\"},\"id\":\"16795012327\",\"timestamp\":1714546774537}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(123,'xiaofuge','send_rebate','01343683507','{\"data\":{\"bizId\":\"xiaofuge_sku_2024042906\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"01343683507\",\"timestamp\":1714546811980}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
	(124,'xiaofuge','send_rebate','22675851113','{\"data\":{\"bizId\":\"xiaofuge_integral_2024042906\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"22675851113\",\"timestamp\":1714546811983}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
	(125,'xiaofuge','send_rebate','72790041499','{\"data\":{\"bizId\":\"xiaofuge_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"72790041499\",\"timestamp\":1714547646310}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
	(126,'xiaofuge','send_rebate','07532513295','{\"data\":{\"bizId\":\"xiaofuge_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"07532513295\",\"timestamp\":1714547646312}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
	(127,'12345','send_rebate','44168301206','{\"data\":{\"bizId\":\"12345_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"12345\"},\"id\":\"44168301206\",\"timestamp\":1714548524834}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
	(128,'12345','send_rebate','77696087444','{\"data\":{\"bizId\":\"12345_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"12345\"},\"id\":\"77696087444\",\"timestamp\":1714548524845}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
	(129,'xiaofuge','send_rebate','53358221321','{\"data\":{\"bizId\":\"xiaofuge_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"53358221321\",\"timestamp\":1714554815882}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
	(130,'xiaofuge','send_rebate','29895043546','{\"data\":{\"bizId\":\"xiaofuge_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"29895043546\",\"timestamp\":1714554815884}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
	(131,'xiaofuge','send_rebate','97779206565','{\"data\":{\"bizId\":\"xiaofuge_sku_20240420\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"97779206565\",\"timestamp\":1714556371985}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
	(132,'xiaofuge','send_rebate','63122692373','{\"data\":{\"bizId\":\"xiaofuge_integral_20240420\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"63122692373\",\"timestamp\":1714556371994}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
	(133,'xiaofuge','send_rebate','64655129366','{\"data\":{\"bizId\":\"xiaofuge_sku_20240401\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"64655129366\",\"timestamp\":1714556504378}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
	(134,'xiaofuge','send_rebate','38396244073','{\"data\":{\"bizId\":\"xiaofuge_integral_20240401\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"38396244073\",\"timestamp\":1714556504389}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
	(135,'xiaofuge','send_rebate','08184105296','{\"data\":{\"bizId\":\"xiaofuge_sku_20240402\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"08184105296\",\"timestamp\":1714556709389}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
	(136,'xiaofuge','send_rebate','16417473546','{\"data\":{\"bizId\":\"xiaofuge_integral_20240402\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"16417473546\",\"timestamp\":1714556709391}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
	(137,'xiaofuge','send_rebate','04164162705','{\"data\":{\"bizId\":\"xiaofuge_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"04164162705\",\"timestamp\":1714557266867}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
	(138,'xiaofuge','send_rebate','79924892493','{\"data\":{\"bizId\":\"xiaofuge_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"79924892493\",\"timestamp\":1714557266870}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
	(139,'xiaofuge','send_award','90576859616','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"90576859616\",\"timestamp\":1714698137578}','completed','2024-05-03 09:02:17','2024-05-03 09:02:17'),
	(140,'xiaofuge','send_award','65620335186','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"65620335186\",\"timestamp\":1714698596791}','completed','2024-05-03 09:09:57','2024-05-03 09:09:57'),
	(141,'xiaofuge','send_award','37556739286','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"37556739286\",\"timestamp\":1714698634894}','completed','2024-05-03 09:10:35','2024-05-03 09:10:35'),
	(142,'xiaofuge','send_award','55348135802','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"55348135802\",\"timestamp\":1714698697948}','completed','2024-05-03 09:11:38','2024-05-03 09:11:38'),
	(143,'xiaofuge','send_rebate','72638302928','{\"data\":{\"bizId\":\"xiaofuge_sku_20240503\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"72638302928\",\"timestamp\":1714714122098}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42'),
	(144,'xiaofuge','send_rebate','72714070579','{\"data\":{\"bizId\":\"xiaofuge_integral_20240503\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"72714070579\",\"timestamp\":1714714122101}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42'),
	(145,'xiaofuge','send_award','16274942215','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"16274942215\",\"timestamp\":1714786330913}','completed','2024-05-04 09:32:10','2024-05-04 09:32:10'),
	(146,'xiaofuge','send_award','11783185223','{\"data\":{\"awardId\":105,\"awardTitle\":\"小米su7周体验\",\"userId\":\"xiaofuge\"},\"id\":\"11783185223\",\"timestamp\":1714786931187}','completed','2024-05-04 09:42:11','2024-05-04 09:42:11'),
	(147,'xiaofuge','send_award','34265015511','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"34265015511\",\"timestamp\":1714788400164}','completed','2024-05-04 10:06:40','2024-05-04 10:06:40'),
	(148,'xiaofuge','send_award','11011728809','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"11011728809\",\"timestamp\":1714788456611}','completed','2024-05-04 10:07:36','2024-05-04 10:07:36'),
	(149,'xiaofuge','send_award','53652403098','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"53652403098\",\"timestamp\":1714788464629}','completed','2024-05-04 10:07:44','2024-05-04 10:07:44'),
	(150,'xiaofuge','send_award','51640617337','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"51640617337\",\"timestamp\":1714788921450}','completed','2024-05-04 10:15:21','2024-05-04 10:15:21'),
	(151,'xiaofuge','send_award','32259543619','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"32259543619\",\"timestamp\":1714788929172}','completed','2024-05-04 10:15:29','2024-05-04 10:15:29'),
	(152,'xiaofuge','send_award','00793022201','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"00793022201\",\"timestamp\":1714789011304}','completed','2024-05-04 10:16:51','2024-05-04 10:16:51'),
	(153,'xiaofuge','send_award','99216566028','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"99216566028\",\"timestamp\":1714789039582}','completed','2024-05-04 10:17:19','2024-05-04 10:17:19'),
	(154,'xiaofuge','send_award','04877391204','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"04877391204\",\"timestamp\":1714789089075}','completed','2024-05-04 10:18:09','2024-05-04 10:18:09'),
	(155,'xiaofuge','send_award','91534655048','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"91534655048\",\"timestamp\":1714789246122}','completed','2024-05-04 10:20:46','2024-05-04 10:20:46'),
	(156,'xiaofuge','send_award','60332832674','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"60332832674\",\"timestamp\":1714789254207}','completed','2024-05-04 10:20:54','2024-05-04 10:20:54'),
	(157,'xiaofuge','send_award','40483872758','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"40483872758\",\"timestamp\":1714790192823}','completed','2024-05-04 10:36:32','2024-05-04 10:36:32'),
	(158,'xiaofuge','send_award','11486109864','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"11486109864\",\"timestamp\":1714790245060}','completed','2024-05-04 10:37:25','2024-05-04 10:37:25'),
	(159,'xiaofuge','send_award','76753189160','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"76753189160\",\"timestamp\":1714790252173}','completed','2024-05-04 10:37:32','2024-05-04 10:37:32'),
	(160,'xiaofuge','send_award','58351463446','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"58351463446\",\"timestamp\":1714790259659}','completed','2024-05-04 10:37:39','2024-05-04 10:37:39'),
	(161,'xiaofuge','send_award','23537323373','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"23537323373\",\"timestamp\":1714790321485}','completed','2024-05-04 10:38:41','2024-05-04 10:38:41'),
	(162,'xiaofuge','send_award','94019822881','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"94019822881\",\"timestamp\":1714790329428}','completed','2024-05-04 10:38:49','2024-05-04 10:38:49'),
	(163,'xiaofuge','send_rebate','27195595790','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"27195595790\",\"timestamp\":1714791759648}','completed','2024-05-04 11:02:39','2024-05-04 11:02:39'),
	(164,'xiaofuge','send_rebate','61629814089','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"61629814089\",\"timestamp\":1714791759660}','completed','2024-05-04 11:02:39','2024-05-04 11:02:39'),
	(165,'xiaofuge','send_rebate','11862182444','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"11862182444\",\"timestamp\":1714792313049}','completed','2024-05-04 11:11:53','2024-05-04 11:11:53'),
	(166,'xiaofuge','send_rebate','15679450368','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"15679450368\",\"timestamp\":1714792313050}','completed','2024-05-04 11:11:53','2024-05-04 11:11:53'),
	(167,'xiaofuge','send_rebate','43063729637','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"43063729637\",\"timestamp\":1714792339076}','completed','2024-05-04 11:12:19','2024-05-04 11:12:19'),
	(168,'xiaofuge','send_rebate','98996977753','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"98996977753\",\"timestamp\":1714792339076}','completed','2024-05-04 11:12:19','2024-05-04 11:12:19'),
	(169,'xiaofuge','send_rebate','27475864066','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"27475864066\",\"timestamp\":1714792521633}','completed','2024-05-04 11:15:21','2024-05-04 11:15:21'),
	(170,'xiaofuge','send_rebate','92639713795','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"92639713795\",\"timestamp\":1714792521636}','completed','2024-05-04 11:15:21','2024-05-04 11:15:21'),
	(171,'xiaofuge','send_rebate','99203819313','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"99203819313\",\"timestamp\":1714792620935}','completed','2024-05-04 11:17:00','2024-05-04 11:17:01'),
	(172,'xiaofuge','send_rebate','74660956883','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"74660956883\",\"timestamp\":1714792620937}','completed','2024-05-04 11:17:00','2024-05-04 11:17:01'),
	(173,'xiaofuge','send_rebate','25704016034','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"25704016034\",\"timestamp\":1714793089441}','completed','2024-05-04 11:24:49','2024-05-04 11:24:49'),
	(174,'xiaofuge','send_rebate','22457985518','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"22457985518\",\"timestamp\":1714793089453}','completed','2024-05-04 11:24:49','2024-05-04 11:24:49'),
	(175,'xiaofuge','send_award','47589004216','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"47589004216\",\"timestamp\":1714793447481}','completed','2024-05-04 11:30:47','2024-05-04 11:30:47'),
	(176,'xiaofuge','send_rebate','42725365297','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"42725365297\",\"timestamp\":1714793669228}','completed','2024-05-04 11:34:29','2024-05-04 11:34:29'),
	(177,'xiaofuge','send_rebate','87435787450','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"87435787450\",\"timestamp\":1714793669228}','completed','2024-05-04 11:34:29','2024-05-04 11:34:29'),
	(178,'xiaofuge','send_rebate','49417412468','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"49417412468\",\"timestamp\":1714793834886}','completed','2024-05-04 11:37:14','2024-05-04 11:37:14'),
	(179,'xiaofuge','send_rebate','62113651314','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"62113651314\",\"timestamp\":1714793834886}','completed','2024-05-04 11:37:14','2024-05-04 11:37:14'),
	(180,'xiaofuge','send_rebate','72477008662','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"72477008662\",\"timestamp\":1714793967664}','completed','2024-05-04 11:39:27','2024-05-04 11:39:27'),
	(181,'xiaofuge','send_rebate','21764530878','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"21764530878\",\"timestamp\":1714793967664}','completed','2024-05-04 11:39:27','2024-05-04 11:39:27'),
	(182,'xiaofuge','send_rebate','81400180382','{\"data\":{\"bizId\":\"xiaofuge_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"81400180382\",\"timestamp\":1714794000070}','completed','2024-05-04 11:40:00','2024-05-04 11:40:00'),
	(183,'xiaofuge','send_rebate','54229506227','{\"data\":{\"bizId\":\"xiaofuge_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"54229506227\",\"timestamp\":1714794000070}','completed','2024-05-04 11:40:00','2024-05-04 11:40:00'),
	(184,'xiaofuge','send_award','65328722154','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"65328722154\",\"timestamp\":1714794009904}','completed','2024-05-04 11:40:09','2024-05-04 11:40:09'),
	(185,'xiaofuge','send_award','24734850097','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"xiaofuge\"},\"id\":\"24734850097\",\"timestamp\":1714794017003}','completed','2024-05-04 11:40:17','2024-05-04 11:40:17'),
	(186,'xiaofuge','send_award','83062798647','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"xiaofuge\"},\"id\":\"83062798647\",\"timestamp\":1714798160372}','completed','2024-05-04 12:49:20','2024-05-04 12:49:20'),
	(187,'xiaofuge','send_award','17077466970','{\"data\":{\"awardId\":105,\"awardTitle\":\"小米su7周体验\",\"userId\":\"xiaofuge\"},\"id\":\"17077466970\",\"timestamp\":1714798170291}','completed','2024-05-04 12:49:30','2024-05-04 12:49:30'),
	(188,'xiaofuge','send_award','96584733524','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"96584733524\",\"timestamp\":1714798182051}','completed','2024-05-04 12:49:42','2024-05-04 12:49:42'),
	(189,'xiaofuge','send_award','96383900014','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"96383900014\",\"timestamp\":1714798235777}','completed','2024-05-04 12:50:35','2024-05-04 12:50:35'),
	(190,'xiaofuge','send_award','75247980575','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"xiaofuge\"},\"id\":\"75247980575\",\"timestamp\":1714798244410}','completed','2024-05-04 12:50:44','2024-05-04 12:50:44'),
	(191,'xiaofuge','send_award','83936855188','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"83936855188\",\"timestamp\":1714807768291}','completed','2024-05-04 15:29:28','2024-05-04 15:29:28'),
	(192,'xiaofuge','send_award','05844230229','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge\"},\"id\":\"05844230229\",\"timestamp\":1714807775839}','completed','2024-05-04 15:29:35','2024-05-04 15:29:35'),
	(193,'xiaofuge','send_award','34200100481','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"34200100481\",\"timestamp\":1714807782994}','completed','2024-05-04 15:29:42','2024-05-04 15:29:43'),
	(194,'xiaofuge','send_award','51137440950','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"xiaofuge\"},\"id\":\"51137440950\",\"timestamp\":1714807789760}','completed','2024-05-04 15:29:49','2024-05-04 15:29:49'),
	(195,'xiaofuge','send_award','74638782814','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"xiaofuge\"},\"id\":\"74638782814\",\"timestamp\":1714807796220}','completed','2024-05-04 15:29:56','2024-05-04 15:29:56'),
	(196,'liergou','send_rebate','36637930434','{\"data\":{\"bizId\":\"liergou_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou\"},\"id\":\"36637930434\",\"timestamp\":1714807821210}','completed','2024-05-04 15:30:21','2024-05-04 15:30:21'),
	(197,'liergou','send_rebate','34715403057','{\"data\":{\"bizId\":\"liergou_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou\"},\"id\":\"34715403057\",\"timestamp\":1714807821216}','completed','2024-05-04 15:30:21','2024-05-04 15:30:21'),
	(198,'liergou','send_award','41597520105','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou\"},\"id\":\"41597520105\",\"timestamp\":1714807836090}','completed','2024-05-04 15:30:36','2024-05-04 15:30:36'),
	(199,'liergou','send_award','58675423754','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"liergou\"},\"id\":\"58675423754\",\"timestamp\":1714807877112}','completed','2024-05-04 15:31:17','2024-05-04 15:31:17'),
	(200,'liergou','send_award','99730641621','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"99730641621\",\"timestamp\":1714807884267}','completed','2024-05-04 15:31:24','2024-05-04 15:31:24'),
	(201,'liergou','send_award','92898084117','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"liergou\"},\"id\":\"92898084117\",\"timestamp\":1714807891073}','completed','2024-05-04 15:31:31','2024-05-04 15:31:31'),
	(202,'liergou','send_award','86334494433','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"liergou\"},\"id\":\"86334494433\",\"timestamp\":1714807898099}','completed','2024-05-04 15:31:38','2024-05-04 15:31:38'),
	(203,'liergou','send_award','51619066227','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"liergou\"},\"id\":\"51619066227\",\"timestamp\":1714807905011}','completed','2024-05-04 15:31:45','2024-05-04 15:31:45'),
	(204,'liergou','send_award','05800486959','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"liergou\"},\"id\":\"05800486959\",\"timestamp\":1714807911983}','completed','2024-05-04 15:31:51','2024-05-04 15:31:51'),
	(205,'liergou','send_award','94809887830','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"94809887830\",\"timestamp\":1714807919539}','completed','2024-05-04 15:31:59','2024-05-04 15:31:59'),
	(206,'liergou','send_award','45867676557','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou\"},\"id\":\"45867676557\",\"timestamp\":1714807926510}','completed','2024-05-04 15:32:06','2024-05-04 15:32:06'),
	(207,'liergou','send_award','06153737578','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"06153737578\",\"timestamp\":1714807933146}','completed','2024-05-04 15:32:13','2024-05-04 15:32:13'),
	(208,'liergou','send_rebate','70974160126','{\"data\":{\"bizId\":\"liergou_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou\"},\"id\":\"70974160126\",\"timestamp\":1714807945762}','completed','2024-05-04 15:32:25','2024-05-04 15:32:25'),
	(209,'liergou','send_rebate','02138996837','{\"data\":{\"bizId\":\"liergou_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou\"},\"id\":\"02138996837\",\"timestamp\":1714807945762}','completed','2024-05-04 15:32:25','2024-05-04 15:32:25'),
	(210,'liergou','send_award','94421726702','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"94421726702\",\"timestamp\":1714807949401}','completed','2024-05-04 15:32:29','2024-05-04 15:32:29'),
	(211,'liergou','send_award','39472863610','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"39472863610\",\"timestamp\":1714807955879}','completed','2024-05-04 15:32:35','2024-05-04 15:32:35'),
	(212,'liergou','send_award','87066045962','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou\"},\"id\":\"87066045962\",\"timestamp\":1714807962247}','completed','2024-05-04 15:32:42','2024-05-04 15:32:42'),
	(213,'liergou','send_award','71295562520','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"liergou\"},\"id\":\"71295562520\",\"timestamp\":1714808050789}','completed','2024-05-04 15:34:10','2024-05-04 15:34:10'),
	(214,'liergou2','send_rebate','69657914070','{\"data\":{\"bizId\":\"liergou2_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou2\"},\"id\":\"69657914070\",\"timestamp\":1714808152671}','completed','2024-05-04 15:35:52','2024-05-04 15:35:52'),
	(215,'liergou2','send_rebate','98631727300','{\"data\":{\"bizId\":\"liergou2_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou2\"},\"id\":\"98631727300\",\"timestamp\":1714808152672}','completed','2024-05-04 15:35:52','2024-05-04 15:35:52'),
	(216,'liergou2','send_award','04455448797','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"liergou2\"},\"id\":\"04455448797\",\"timestamp\":1714808156560}','completed','2024-05-04 15:35:56','2024-05-04 15:35:56'),
	(217,'liergou2','send_award','70112884978','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"70112884978\",\"timestamp\":1714808163337}','completed','2024-05-04 15:36:03','2024-05-04 15:36:03'),
	(218,'liergou2','send_award','20013321724','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou2\"},\"id\":\"20013321724\",\"timestamp\":1714808170383}','completed','2024-05-04 15:36:10','2024-05-04 15:36:10'),
	(219,'liergou2','send_award','69158770194','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"69158770194\",\"timestamp\":1714808182013}','completed','2024-05-04 15:36:22','2024-05-04 15:36:22'),
	(220,'liergou2','send_award','79778986609','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"79778986609\",\"timestamp\":1714808192767}','completed','2024-05-04 15:36:32','2024-05-04 15:36:32'),
	(221,'liergou2','send_award','99484906329','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"liergou2\"},\"id\":\"99484906329\",\"timestamp\":1714808199757}','completed','2024-05-04 15:36:39','2024-05-04 15:36:39'),
	(222,'liergou2','send_award','71461913030','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"71461913030\",\"timestamp\":1714808206546}','completed','2024-05-04 15:36:46','2024-05-04 15:36:46'),
	(223,'liergou2','send_award','65660637245','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"65660637245\",\"timestamp\":1714808213101}','completed','2024-05-04 15:36:53','2024-05-04 15:36:53'),
	(224,'liergou2','send_award','65599834779','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"liergou2\"},\"id\":\"65599834779\",\"timestamp\":1714808219849}','completed','2024-05-04 15:36:59','2024-05-04 15:36:59'),
	(225,'liergou2','send_award','56578189655','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou2\"},\"id\":\"56578189655\",\"timestamp\":1714808226524}','completed','2024-05-04 15:37:06','2024-05-04 15:37:06'),
	(226,'liergou2','send_award','93238638633','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"liergou2\"},\"id\":\"93238638633\",\"timestamp\":1714808233335}','completed','2024-05-04 15:37:13','2024-05-04 15:37:13'),
	(227,'liergou2','send_award','08920326769','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"liergou2\"},\"id\":\"08920326769\",\"timestamp\":1714808240830}','completed','2024-05-04 15:37:20','2024-05-04 15:37:20'),
	(228,'liergou2','send_award','23064270642','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"liergou2\"},\"id\":\"23064270642\",\"timestamp\":1714808248052}','completed','2024-05-04 15:37:28','2024-05-04 15:37:28'),
	(229,'liergou2','send_award','25530792328','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"liergou2\"},\"id\":\"25530792328\",\"timestamp\":1714808257717}','completed','2024-05-04 15:37:37','2024-05-04 15:37:37'),
	(230,'user003','send_rebate','76631988985','{\"data\":{\"bizId\":\"user003_sku_20240525\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"user003\"},\"id\":\"76631988985\",\"timestamp\":1716605538812}','completed','2024-05-25 10:52:19','2024-05-25 10:52:19'),
	(231,'user003','send_rebate','97630347951','{\"data\":{\"bizId\":\"user003_integral_20240525\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user003\"},\"id\":\"97630347951\",\"timestamp\":1716605538817}','completed','2024-05-25 10:52:19','2024-05-25 10:52:19'),
	(232,'user003','send_award','22110596663','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"248641902208\",\"userId\":\"user003\"},\"id\":\"22110596663\",\"timestamp\":1716605600148}','completed','2024-05-25 10:53:20','2024-05-25 10:53:20'),
	(233,'user003','send_award','55709995622','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"020196190863\",\"userId\":\"user003\"},\"id\":\"55709995622\",\"timestamp\":1716605670613}','completed','2024-05-25 10:54:31','2024-05-25 10:54:31'),
	(234,'xiaofuge','send_award','79454943847','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"472964574229\",\"userId\":\"xiaofuge\"},\"id\":\"79454943847\",\"timestamp\":1717025041975}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(235,'xiaofuge','send_award','09860278655','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"orderId\":\"096000668706\",\"userId\":\"xiaofuge\"},\"id\":\"09860278655\",\"timestamp\":1717025042498}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(236,'xiaofuge','send_award','43408061670','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"orderId\":\"053808941529\",\"userId\":\"xiaofuge\"},\"id\":\"43408061670\",\"timestamp\":1717025042660}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(237,'xiaofuge','send_award','98270300001','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"546003504055\",\"userId\":\"xiaofuge\"},\"id\":\"98270300001\",\"timestamp\":1717025042832}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(238,'xiaofuge','send_award','19901700385','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"orderId\":\"531425424850\",\"userId\":\"xiaofuge\"},\"id\":\"19901700385\",\"timestamp\":1717025042964}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(239,'xiaofuge','send_rebate','99298867364','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601001\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"99298867364\",\"timestamp\":1717210140295}','completed','2024-06-01 10:49:00','2024-06-01 10:49:00'),
	(240,'xiaofuge','send_rebate','84156214268','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601002\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"84156214268\",\"timestamp\":1717210318593}','completed','2024-06-01 10:51:58','2024-06-01 10:52:03'),
	(241,'xiaofuge','send_rebate','74711058753','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601003\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"74711058753\",\"timestamp\":1717210372351}','completed','2024-06-01 10:52:52','2024-06-01 10:52:52'),
	(242,'xiaofuge','send_rebate','11611351139','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601004\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"11611351139\",\"timestamp\":1717210470349}','completed','2024-06-01 10:54:30','2024-06-01 10:55:17'),
	(243,'xiaofuge','send_rebate','53202882014','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601005\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"53202882014\",\"timestamp\":1717210629229}','completed','2024-06-01 10:57:09','2024-06-01 10:57:09'),
	(244,'xiaofuge','send_rebate','61165550239','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601006\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"61165550239\",\"timestamp\":1717210827931}','completed','2024-06-01 11:00:28','2024-06-01 11:00:31'),
	(245,'xiaofuge','send_rebate','67030345130','{\"data\":{\"bizId\":\"xiaofuge_integral_20240601101\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"67030345130\",\"timestamp\":1717221767862}','completed','2024-06-01 14:02:48','2024-06-01 14:02:48'),
	(246,'xiaofuge','credit_adjust_success','42778910768','{\"data\":{\"amount\":-1.68,\"orderId\":\"313070417337\",\"outBusinessNo\":\"70009240608003\",\"userId\":\"xiaofuge\"},\"id\":\"42778910768\",\"timestamp\":1717849623150}','completed','2024-06-08 20:27:03','2024-06-08 20:27:15'),
	(247,'xiaofuge','credit_adjust_success','53121094706','{\"data\":{\"amount\":-1.68,\"orderId\":\"956437348272\",\"outBusinessNo\":\"70009240608007\",\"userId\":\"xiaofuge\"},\"id\":\"53121094706\",\"timestamp\":1717850053164}','completed','2024-06-08 20:34:13','2024-06-08 20:34:13'),
	(248,'xiaofuge','credit_adjust_success','04087257219','{\"data\":{\"amount\":-1.68,\"orderId\":\"825697847616\",\"outBusinessNo\":\"70009240609001\",\"userId\":\"xiaofuge\"},\"id\":\"04087257219\",\"timestamp\":1717895483369}','completed','2024-06-09 09:11:23','2024-06-09 09:11:24'),
	(249,'xiaofuge','credit_adjust_success','50806088557','{\"data\":{\"amount\":-1.68,\"orderId\":\"528225981137\",\"outBusinessNo\":\"70009240610002\",\"userId\":\"xiaofuge\"},\"id\":\"50806088557\",\"timestamp\":1717901110572}','completed','2024-06-09 10:45:11','2024-06-09 10:45:11');

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

LOCK TABLES `user_award_record_001` WRITE;
/*!40000 ALTER TABLE `user_award_record_001` DISABLE KEYS */;

INSERT INTO `user_award_record_001` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge',100301,100006,'313091076458',101,'OpenAI 增加使用次数','2024-04-06 03:41:50','create','2024-04-06 11:41:50','2024-04-06 11:41:50'),
	(3,'xiaofuge',100301,100006,'313091076459',101,'OpenAI 增加使用次数','2024-04-06 03:47:54','create','2024-04-06 11:47:54','2024-04-06 11:47:54'),
	(6,'xiaofuge',100301,100006,'658772889112',101,'OpenAI 增加使用次数','2024-04-06 04:16:50','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
	(7,'xiaofuge',100301,100006,'623291703218',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
	(8,'xiaofuge',100301,100006,'619841045154',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
	(9,'xiaofuge',100301,100006,'696947604604',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
	(10,'xiaofuge',100301,100006,'239997053403',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
	(11,'xiaofuge',100301,100006,'837228766840',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
	(12,'xiaofuge',100301,100006,'012609968231',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:53','2024-04-06 12:16:53'),
	(13,'xiaofuge',100301,100006,'540056227059',101,'OpenAI 增加使用次数','2024-04-06 04:16:54','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
	(14,'xiaofuge',100301,100006,'757384073568',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
	(15,'xiaofuge',100301,100006,'270533634609',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
	(16,'xiaofuge',100301,100006,'143517041178',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
	(17,'xiaofuge',100301,100006,'880610933571',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
	(18,'xiaofuge',100301,100006,'288939138548',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
	(19,'xiaofuge',100301,100006,'401825045013',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
	(20,'xiaofuge',100301,100006,'644483213191',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
	(21,'xiaofuge',100301,100006,'126942948062',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:58','2024-04-06 12:16:58'),
	(22,'xiaofuge',100301,100006,'388415276639',101,'OpenAI 增加使用次数','2024-04-06 08:10:38','create','2024-04-06 16:10:38','2024-04-06 16:10:38'),
	(23,'xiaofuge',100301,100006,'295404830039',101,'OpenAI 增加使用次数','2024-04-06 08:10:39','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
	(24,'xiaofuge',100301,100006,'396378174546',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
	(25,'xiaofuge',100301,100006,'216034880115',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
	(26,'xiaofuge',100301,100006,'587083012812',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
	(27,'xiaofuge',100301,100006,'179931564604',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
	(28,'xiaofuge',100301,100006,'266603270575',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
	(29,'xiaofuge',100301,100006,'708306230375',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
	(30,'xiaofuge',100301,100006,'099363576226',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
	(31,'xiaofuge',100301,100006,'330354920093',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
	(32,'xiaofuge',100301,100006,'824752758415',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
	(33,'xiaofuge',100301,100006,'064058506146',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
	(34,'xiaofuge',100301,100006,'923475474250',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
	(35,'xiaofuge',100301,100006,'565064446034',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
	(36,'xiaofuge',100301,100006,'665449773785',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
	(37,'xiaofuge',100301,100006,'099294776536',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:46','2024-04-06 16:10:46'),
	(38,'xiaofuge',100301,100006,'166766849249',101,'OpenAI 增加使用次数','2024-04-06 08:10:47','create','2024-04-06 16:10:47','2024-04-06 16:10:47'),
	(39,'xiaofuge',100301,100006,'569856975978',107,'2等奖','2024-04-13 03:44:02','create','2024-04-13 11:44:01','2024-04-13 11:44:01'),
	(40,'xiaofuge',100301,100006,'867136698684',103,'6等奖','2024-04-13 03:44:11','create','2024-04-13 11:44:10','2024-04-13 11:44:10'),
	(41,'xiaofuge',100301,100006,'250425115608',101,'随机积分','2024-04-13 03:44:14','create','2024-04-13 11:44:14','2024-04-13 11:44:14'),
	(42,'xiaofuge',100301,100006,'663910993767',106,'3等奖','2024-04-13 03:44:16','create','2024-04-13 11:44:15','2024-04-13 11:44:15'),
	(43,'xiaofuge',100301,100006,'218374542905',106,'3等奖','2024-04-13 03:44:17','create','2024-04-13 11:44:16','2024-04-13 11:44:16'),
	(44,'xiaofuge',100301,100006,'225714694474',104,'5等奖','2024-04-13 03:44:18','create','2024-04-13 11:44:17','2024-04-13 11:44:17'),
	(45,'xiaofuge',100301,100006,'431167372778',102,'7等奖','2024-04-13 03:44:19','create','2024-04-13 11:44:18','2024-04-13 11:44:18'),
	(46,'xiaofuge',100301,100006,'434079846497',103,'6等奖','2024-04-13 03:45:30','create','2024-04-13 11:45:29','2024-04-13 11:45:29'),
	(47,'xiaofuge',100301,100006,'965685676429',102,'7等奖','2024-04-13 03:45:31','create','2024-04-13 11:45:30','2024-04-13 11:45:30'),
	(48,'xiaofuge',100301,100006,'940273728363',102,'7等奖','2024-04-13 04:14:53','create','2024-04-13 12:14:53','2024-04-13 12:14:53'),
	(49,'xiaofuge',100301,100006,'240699246294',104,'5等奖','2024-04-13 04:17:34','create','2024-04-13 12:17:33','2024-04-13 12:17:33'),
	(50,'xiaofuge',100301,100006,'298101180210',103,'6等奖','2024-04-13 04:18:17','create','2024-04-13 12:18:16','2024-04-13 12:18:16'),
	(51,'xiaofuge',100301,100006,'565655944488',103,'6等奖','2024-04-13 04:18:23','create','2024-04-13 12:18:23','2024-04-13 12:18:23'),
	(52,'xiaofuge',100301,100006,'090289257534',104,'5等奖','2024-04-13 04:18:25','create','2024-04-13 12:18:24','2024-04-13 12:18:24'),
	(53,'xiaofuge',100301,100006,'668356046426',105,'4等奖','2024-04-13 04:18:26','create','2024-04-13 12:18:25','2024-04-13 12:18:25'),
	(54,'xiaofuge',100301,100006,'745680068300',107,'2等奖','2024-04-13 04:18:37','create','2024-04-13 12:18:36','2024-04-13 12:18:36'),
	(55,'xiaofuge',100301,100006,'285300597983',102,'7等奖','2024-04-13 04:20:08','create','2024-04-13 12:20:07','2024-04-13 12:20:07'),
	(56,'xiaofuge',100301,100006,'999361306023',104,'5等奖','2024-04-13 04:20:10','create','2024-04-13 12:20:09','2024-04-13 12:20:09'),
	(57,'xiaofuge',100301,100006,'063682699381',104,'5等奖','2024-04-13 04:20:14','create','2024-04-13 12:20:13','2024-04-13 12:20:13'),
	(58,'xiaofuge',100301,100006,'680488311338',105,'4等奖','2024-04-13 04:20:15','create','2024-04-13 12:20:14','2024-04-13 12:20:14'),
	(59,'xiaofuge',100301,100006,'399058527457',102,'7等奖','2024-04-13 04:20:16','create','2024-04-13 12:20:16','2024-04-13 12:20:16'),
	(60,'xiaofuge',100301,100006,'579122416749',106,'3等奖','2024-04-13 04:20:21','create','2024-04-13 12:20:20','2024-04-13 12:20:20'),
	(61,'xiaofuge',100301,100006,'854484054432',102,'7等奖','2024-04-13 06:03:59','create','2024-04-13 14:03:59','2024-04-13 14:03:59'),
	(62,'xiaofuge',100301,100006,'066823147917',104,'5等奖','2024-04-13 07:25:06','create','2024-04-13 15:25:06','2024-04-13 15:25:06'),
	(63,'xiaofuge',100301,100006,'022620846137',102,'7等奖','2024-04-13 07:25:11','create','2024-04-13 15:25:11','2024-04-13 15:25:11'),
	(64,'xiaofuge',100301,100006,'605666354632',101,'随机积分','2024-04-13 07:25:12','create','2024-04-13 15:25:12','2024-04-13 15:25:12'),
	(65,'xiaofuge',100301,100006,'604661560037',107,'2等奖','2024-04-13 07:25:21','create','2024-04-13 15:25:21','2024-04-13 15:25:21'),
	(66,'xiaofuge',100301,100006,'212448652580',105,'4等奖','2024-04-20 04:09:31','create','2024-04-20 12:09:30','2024-04-20 12:09:30'),
	(67,'xiaofuge',100301,100006,'356729331179',106,'3等奖','2024-04-20 04:11:24','create','2024-04-20 12:11:24','2024-04-20 12:11:24'),
	(68,'xiaofuge',100301,100006,'102669494145',105,'4等奖','2024-04-20 07:10:58','create','2024-04-20 15:10:58','2024-04-20 15:10:58'),
	(69,'xiaofuge',100301,100006,'730186113832',107,'2等奖','2024-04-20 07:43:13','create','2024-04-20 15:43:13','2024-04-20 15:43:13'),
	(70,'xiaofuge',100301,100006,'472281891603',106,'3等奖','2024-04-20 08:50:39','create','2024-04-20 16:50:39','2024-04-20 16:50:39'),
	(71,'xiaofuge',100301,100006,'931181504757',108,'暴走玩偶','2024-04-27 05:19:39','create','2024-04-27 13:19:38','2024-04-27 13:19:38'),
	(72,'xiaofuge',100301,100006,'664993621684',101,'随机积分','2024-04-27 05:27:17','create','2024-04-27 13:27:17','2024-04-27 13:27:17'),
	(73,'xiaofuge',100301,100006,'757674779249',104,'小米台灯','2024-04-27 05:27:45','create','2024-04-27 13:27:45','2024-04-27 13:27:45'),
	(74,'xiaofuge',100301,100006,'623885952534',102,'OpenAI会员卡','2024-04-27 05:28:02','create','2024-04-27 13:28:01','2024-04-27 13:28:01'),
	(75,'xiaofuge',100301,100006,'351875766756',106,'轻奢办公椅','2024-04-27 05:29:05','create','2024-04-27 13:29:05','2024-04-27 13:29:05'),
	(76,'xiaofuge',100301,100006,'803227763198',103,'支付优惠券','2024-04-27 05:29:32','create','2024-04-27 13:29:31','2024-04-27 13:29:31'),
	(77,'xiaofuge',100301,100006,'587527322073',106,'轻奢办公椅','2024-04-27 05:29:57','create','2024-04-27 13:29:57','2024-04-27 13:29:57'),
	(78,'xiaofuge',100301,100006,'552928609772',107,'小霸王游戏机','2024-04-27 05:30:11','create','2024-04-27 13:30:11','2024-04-27 13:30:11'),
	(79,'xiaofuge',100301,100006,'407462568156',107,'小霸王游戏机','2024-04-27 05:36:27','create','2024-04-27 13:36:27','2024-04-27 13:36:27'),
	(80,'xiaofuge',100301,100006,'688519386935',101,'随机积分','2024-04-27 05:38:00','create','2024-04-27 13:38:00','2024-04-27 13:38:00'),
	(81,'xiaofuge',100301,100006,'148984382545',104,'小米台灯','2024-04-27 05:38:56','create','2024-04-27 13:38:55','2024-04-27 13:38:55'),
	(82,'xiaofuge',100301,100006,'410701479648',101,'随机积分','2024-04-27 05:39:18','create','2024-04-27 13:39:18','2024-04-27 13:39:18'),
	(83,'xiaofuge',100301,100006,'521226371540',101,'随机积分','2024-04-27 06:59:56','create','2024-04-27 14:59:56','2024-04-27 14:59:56'),
	(84,'xiaofuge',100301,100006,'167000751553',102,'OpenAI会员卡','2024-04-27 07:00:14','create','2024-04-27 15:00:14','2024-04-27 15:00:14'),
	(85,'xiaofuge',100301,100006,'685179511666',104,'小米台灯','2024-04-27 07:00:23','create','2024-04-27 15:00:22','2024-04-27 15:00:22'),
	(86,'xiaofuge',100301,100006,'308424817839',108,'暴走玩偶','2024-05-01 06:57:39','create','2024-05-01 14:57:39','2024-05-01 14:57:39'),
	(87,'xiaofuge',100301,100006,'116865823300',101,'随机积分','2024-05-01 06:58:09','create','2024-05-01 14:58:08','2024-05-01 14:58:08'),
	(88,'xiaofuge',100301,100006,'272157347851',107,'小霸王游戏机','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(89,'xiaofuge',100301,100006,'400772556300',103,'支付优惠券','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(90,'xiaofuge',100301,100006,'494705137752',101,'随机积分','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(91,'xiaofuge',100301,100006,'728609897262',106,'轻奢办公椅','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(92,'xiaofuge',100301,100006,'085750418120',104,'小米台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(93,'xiaofuge',100301,100006,'884615410376',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(94,'xiaofuge',100301,100006,'380693771158',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(95,'xiaofuge',100301,100006,'801793933954',103,'支付优惠券','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(96,'xiaofuge',100301,100006,'153569048026',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(97,'xiaofuge',100301,100006,'239541957386',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(98,'xiaofuge',100301,100006,'417247136950',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(99,'xiaofuge',100301,100006,'556248667355',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(100,'xiaofuge',100301,100006,'828955445464',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(101,'xiaofuge',100301,100006,'756110942449',102,'OpenAI会员卡','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(102,'xiaofuge',100301,100006,'440069371435',101,'随机积分','2024-05-01 06:59:34','completed','2024-05-01 14:59:34','2024-05-24 22:11:59'),
	(103,'xiaofuge',100301,100006,'421594084633',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(104,'xiaofuge',100301,100006,'500905040429',104,'小米台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(105,'xiaofuge',100301,100006,'712386571628',101,'随机积分','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(106,'xiaofuge',100301,100006,'095923542021',108,'暴走玩偶','2024-05-01 06:59:35','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(107,'xiaofuge',100301,100006,'306233708878',104,'小米台灯','2024-05-03 01:02:18','create','2024-05-03 09:02:17','2024-05-03 09:02:17'),
	(108,'xiaofuge',100301,100006,'690124733440',101,'随机积分','2024-05-03 01:09:57','completed','2024-05-03 09:09:57','2024-05-24 22:14:22'),
	(109,'xiaofuge',100301,100006,'190487161872',102,'OpenAI会员卡','2024-05-03 01:10:35','create','2024-05-03 09:10:35','2024-05-03 09:10:35'),
	(110,'xiaofuge',100301,100006,'693117324295',102,'OpenAI会员卡','2024-05-03 01:11:38','create','2024-05-03 09:11:38','2024-05-03 09:11:38'),
	(111,'xiaofuge',100301,100006,'216557006872',107,'小霸王游戏机','2024-05-04 01:32:11','create','2024-05-04 09:32:10','2024-05-04 09:32:10'),
	(112,'xiaofuge',100301,100006,'769208157430',105,'小米su7周体验','2024-05-04 01:42:11','create','2024-05-04 09:42:11','2024-05-04 09:42:11'),
	(113,'xiaofuge',100301,100006,'122549611053',102,'OpenAI会员卡','2024-05-04 02:06:40','create','2024-05-04 10:06:40','2024-05-04 10:06:40'),
	(114,'xiaofuge',100301,100006,'098077770962',102,'OpenAI会员卡','2024-05-04 02:07:37','create','2024-05-04 10:07:36','2024-05-04 10:07:36'),
	(115,'xiaofuge',100301,100006,'783440464441',102,'OpenAI会员卡','2024-05-04 02:07:45','create','2024-05-04 10:07:44','2024-05-04 10:07:44'),
	(116,'xiaofuge',100301,100006,'311741760661',102,'OpenAI会员卡','2024-05-04 02:15:21','create','2024-05-04 10:15:21','2024-05-04 10:15:21'),
	(117,'xiaofuge',100301,100006,'882852499238',102,'OpenAI会员卡','2024-05-04 02:15:29','create','2024-05-04 10:15:29','2024-05-04 10:15:29'),
	(118,'xiaofuge',100301,100006,'815259576049',102,'OpenAI会员卡','2024-05-04 02:16:51','create','2024-05-04 10:16:51','2024-05-04 10:16:51'),
	(119,'xiaofuge',100301,100006,'398933081979',102,'OpenAI会员卡','2024-05-04 02:17:20','create','2024-05-04 10:17:19','2024-05-04 10:17:19'),
	(120,'xiaofuge',100301,100006,'724477812186',102,'OpenAI会员卡','2024-05-04 02:18:09','create','2024-05-04 10:18:09','2024-05-04 10:18:09'),
	(121,'xiaofuge',100301,100006,'963415104251',102,'OpenAI会员卡','2024-05-04 02:20:46','create','2024-05-04 10:20:46','2024-05-04 10:20:46'),
	(122,'xiaofuge',100301,100006,'406832687477',102,'OpenAI会员卡','2024-05-04 02:20:54','create','2024-05-04 10:20:54','2024-05-04 10:20:54'),
	(123,'xiaofuge',100301,100006,'683420026858',102,'OpenAI会员卡','2024-05-04 02:36:33','create','2024-05-04 10:36:32','2024-05-04 10:36:32'),
	(124,'xiaofuge',100301,100006,'022379743786',102,'OpenAI会员卡','2024-05-04 02:37:25','create','2024-05-04 10:37:25','2024-05-04 10:37:25'),
	(125,'xiaofuge',100301,100006,'005727284053',102,'OpenAI会员卡','2024-05-04 02:37:32','create','2024-05-04 10:37:32','2024-05-04 10:37:32'),
	(126,'xiaofuge',100301,100006,'157097996505',102,'OpenAI会员卡','2024-05-04 02:37:40','create','2024-05-04 10:37:39','2024-05-04 10:37:39'),
	(127,'xiaofuge',100301,100006,'286115274205',102,'OpenAI会员卡','2024-05-04 02:38:41','create','2024-05-04 10:38:41','2024-05-04 10:38:41'),
	(128,'xiaofuge',100301,100006,'714442509117',102,'OpenAI会员卡','2024-05-04 02:38:49','create','2024-05-04 10:38:49','2024-05-04 10:38:49'),
	(129,'xiaofuge',100301,100006,'124268508437',102,'OpenAI会员卡','2024-05-04 03:30:47','create','2024-05-04 11:30:47','2024-05-04 11:30:47'),
	(130,'xiaofuge',100301,100006,'024028065395',102,'OpenAI会员卡','2024-05-04 03:40:10','create','2024-05-04 11:40:09','2024-05-04 11:40:09'),
	(131,'xiaofuge',100301,100006,'011132554981',102,'OpenAI会员卡','2024-05-04 03:40:17','create','2024-05-04 11:40:17','2024-05-04 11:40:17'),
	(132,'xiaofuge',100301,100006,'748409799526',103,'支付优惠券','2024-05-04 04:49:20','create','2024-05-04 12:49:20','2024-05-04 12:49:20'),
	(133,'xiaofuge',100301,100006,'514483431161',105,'小米su7周体验','2024-05-04 04:49:30','create','2024-05-04 12:49:30','2024-05-04 12:49:30'),
	(134,'xiaofuge',100301,100006,'401352928023',104,'小米台灯','2024-05-04 04:49:42','create','2024-05-04 12:49:42','2024-05-04 12:49:42'),
	(135,'xiaofuge',100301,100006,'569764837195',104,'小米台灯','2024-05-04 04:50:36','create','2024-05-04 12:50:35','2024-05-04 12:50:35'),
	(136,'xiaofuge',100301,100006,'653239020479',104,'小米台灯','2024-05-04 04:50:44','create','2024-05-04 12:50:44','2024-05-04 12:50:44'),
	(137,'xiaofuge',100301,100006,'407172497549',107,'小霸王游戏机','2024-05-04 07:29:28','create','2024-05-04 15:29:28','2024-05-04 15:29:28'),
	(138,'xiaofuge',100301,100006,'799188603085',106,'轻奢办公椅','2024-05-04 07:29:36','create','2024-05-04 15:29:35','2024-05-04 15:29:35'),
	(139,'xiaofuge',100301,100006,'528987104958',107,'小霸王游戏机','2024-05-04 07:29:43','create','2024-05-04 15:29:42','2024-05-04 15:29:42'),
	(140,'xiaofuge',100301,100006,'966648280772',106,'轻奢办公椅','2024-05-04 07:29:50','create','2024-05-04 15:29:49','2024-05-04 15:29:49'),
	(141,'xiaofuge',100301,100006,'087190703146',107,'小霸王游戏机','2024-05-04 07:29:56','create','2024-05-04 15:29:56','2024-05-04 15:29:56'),
	(142,'liergou',100301,100006,'844440368058',101,'随机积分','2024-05-04 07:30:36','create','2024-05-04 15:30:36','2024-05-04 15:30:36'),
	(143,'liergou',100301,100006,'390787212758',104,'小米台灯','2024-05-04 07:31:17','create','2024-05-04 15:31:17','2024-05-04 15:31:17'),
	(144,'liergou',100301,100006,'640363472357',103,'支付优惠券','2024-05-04 07:31:24','create','2024-05-04 15:31:24','2024-05-04 15:31:24'),
	(145,'liergou',100301,100006,'974075965572',108,'暴走玩偶','2024-05-04 07:31:31','create','2024-05-04 15:31:31','2024-05-04 15:31:31'),
	(146,'liergou',100301,100006,'682189502378',106,'轻奢办公椅','2024-05-04 07:31:38','create','2024-05-04 15:31:38','2024-05-04 15:31:38'),
	(147,'liergou',100301,100006,'267171522488',104,'小米台灯','2024-05-04 07:31:45','create','2024-05-04 15:31:45','2024-05-04 15:31:45'),
	(148,'liergou',100301,100006,'840617006609',107,'小霸王游戏机','2024-05-04 07:31:52','create','2024-05-04 15:31:51','2024-05-04 15:31:51'),
	(149,'liergou',100301,100006,'412882808007',103,'支付优惠券','2024-05-04 07:32:00','create','2024-05-04 15:31:59','2024-05-04 15:31:59'),
	(150,'liergou',100301,100006,'909193532035',101,'随机积分','2024-05-04 07:32:07','create','2024-05-04 15:32:06','2024-05-04 15:32:06'),
	(151,'liergou',100301,100006,'941421834903',103,'支付优惠券','2024-05-04 07:32:13','create','2024-05-04 15:32:13','2024-05-04 15:32:13'),
	(152,'liergou',100301,100006,'502088692031',103,'支付优惠券','2024-05-04 07:32:29','create','2024-05-04 15:32:29','2024-05-04 15:32:29'),
	(153,'liergou',100301,100006,'983938339728',103,'支付优惠券','2024-05-04 07:32:36','create','2024-05-04 15:32:35','2024-05-04 15:32:35'),
	(154,'liergou',100301,100006,'300359343610',103,'支付优惠券','2024-05-04 07:32:42','create','2024-05-04 15:32:42','2024-05-04 15:32:42'),
	(155,'liergou',100301,100006,'205701271412',102,'OpenAI会员卡','2024-05-04 07:34:11','create','2024-05-04 15:34:10','2024-05-04 15:34:10'),
	(156,'xiaofuge',100301,100006,'472964574229',106,'轻奢办公椅','2024-05-29 23:24:02','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(157,'xiaofuge',100301,100006,'096000668706',107,'小霸王游戏机','2024-05-29 23:24:02','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(158,'xiaofuge',100301,100006,'053808941529',107,'小霸王游戏机','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(159,'xiaofuge',100301,100006,'546003504055',106,'轻奢办公椅','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(160,'xiaofuge',100301,100006,'531425424850',107,'小霸王游戏机','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02');

/*!40000 ALTER TABLE `user_award_record_001` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `user_award_record_002` WRITE;
/*!40000 ALTER TABLE `user_award_record_002` DISABLE KEYS */;

INSERT INTO `user_award_record_002` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
	(1,'liergou2',100301,100006,'319771078666',108,'暴走玩偶','2024-05-04 07:35:57','create','2024-05-04 15:35:56','2024-05-04 15:35:56'),
	(2,'liergou2',100301,100006,'953580004772',101,'随机积分','2024-05-04 07:36:03','create','2024-05-04 15:36:03','2024-05-04 15:36:03'),
	(3,'liergou2',100301,100006,'002033127656',103,'支付优惠券','2024-05-04 07:36:10','create','2024-05-04 15:36:10','2024-05-04 15:36:10'),
	(4,'liergou2',100301,100006,'786106818681',101,'随机积分','2024-05-04 07:36:22','create','2024-05-04 15:36:22','2024-05-04 15:36:22'),
	(5,'liergou2',100301,100006,'903521978453',101,'随机积分','2024-05-04 07:36:33','create','2024-05-04 15:36:32','2024-05-04 15:36:32'),
	(6,'liergou2',100301,100006,'599563157264',104,'小米台灯','2024-05-04 07:36:40','create','2024-05-04 15:36:39','2024-05-04 15:36:39'),
	(7,'liergou2',100301,100006,'236230739530',101,'随机积分','2024-05-04 07:36:47','create','2024-05-04 15:36:46','2024-05-04 15:36:46'),
	(8,'liergou2',100301,100006,'284065292342',101,'随机积分','2024-05-04 07:36:53','create','2024-05-04 15:36:53','2024-05-04 15:36:53'),
	(9,'liergou2',100301,100006,'667428166119',108,'暴走玩偶','2024-05-04 07:37:00','create','2024-05-04 15:36:59','2024-05-04 15:36:59'),
	(10,'liergou2',100301,100006,'320484285041',103,'支付优惠券','2024-05-04 07:37:07','create','2024-05-04 15:37:06','2024-05-04 15:37:06'),
	(11,'liergou2',100301,100006,'048048925549',102,'OpenAI会员卡','2024-05-04 07:37:13','create','2024-05-04 15:37:13','2024-05-04 15:37:13'),
	(12,'liergou2',100301,100006,'536732336372',103,'支付优惠券','2024-05-04 07:37:21','create','2024-05-04 15:37:20','2024-05-04 15:37:20'),
	(13,'liergou2',100301,100006,'378120929272',102,'OpenAI会员卡','2024-05-04 07:37:28','create','2024-05-04 15:37:28','2024-05-04 15:37:28'),
	(14,'liergou2',100301,100006,'368599869327',102,'OpenAI会员卡','2024-05-04 07:37:38','create','2024-05-04 15:37:37','2024-05-04 15:37:37'),
	(15,'user003',100301,100006,'248641902208',101,'随机积分','2024-05-25 02:53:20','completed','2024-05-25 10:53:20','2024-05-25 10:53:20'),
	(16,'user003',100301,100006,'020196190863',101,'随机积分','2024-05-25 02:54:31','completed','2024-05-25 10:54:31','2024-05-25 10:54:31');

/*!40000 ALTER TABLE `user_award_record_002` ENABLE KEYS */;
UNLOCK TABLES;


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
	(5,'xiaofuge','630841674684','sign','签到返利-sku额度','sku','9011','20240503','xiaofuge_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
	(6,'xiaofuge','552413408368','sign','签到返利-积分','integral','10','20240503','xiaofuge_integral_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
	(33,'liergou','658660043956','sign','签到返利-sku额度','sku','9011','20240504','liergou_sku_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
	(34,'liergou','659440313972','sign','签到返利-积分','integral','10','20240504','liergou_integral_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
	(35,'xiaofuge','577047817885','sign','签到返利-积分','integral','10','20240601001','xiaofuge_integral_20240601001','2024-06-01 10:49:00','2024-06-01 10:49:00'),
	(37,'xiaofuge','060366280132','sign','签到返利-积分','integral','10','20240601002','xiaofuge_integral_20240601002','2024-06-01 10:51:58','2024-06-01 10:51:58'),
	(38,'xiaofuge','735771087688','sign','签到返利-积分','integral','10','20240601003','xiaofuge_integral_20240601003','2024-06-01 10:52:52','2024-06-01 10:52:52'),
	(39,'xiaofuge','890916856671','sign','签到返利-积分','integral','10','20240601004','xiaofuge_integral_20240601004','2024-06-01 10:54:30','2024-06-01 10:54:30'),
	(40,'xiaofuge','881155696490','sign','签到返利-积分','integral','10','20240601005','xiaofuge_integral_20240601005','2024-06-01 10:57:09','2024-06-01 10:57:09'),
	(41,'xiaofuge','213871507610','sign','签到返利-积分','integral','10','20240601006','xiaofuge_integral_20240601006','2024-06-01 11:00:27','2024-06-01 11:00:27'),
	(43,'xiaofuge','031074415283','sign','签到返利-积分','integral','10','20240601101','xiaofuge_integral_20240601101','2024-06-01 14:02:47','2024-06-01 14:02:47');

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

LOCK TABLES `user_behavior_rebate_order_002` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_002` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_002` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
	(5,'liergou2','274252392446','sign','签到返利-sku额度','sku','9011','20240504','liergou2_sku_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
	(6,'liergou2','687741770429','sign','签到返利-积分','integral','10','20240504','liergou2_integral_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
	(7,'user003','317965139211','sign','签到返利-sku额度','sku','9011','20240525','user003_sku_20240525','2024-05-25 10:52:18','2024-05-25 10:52:18'),
	(8,'user003','429627541291','sign','签到返利-积分','integral','10','20240525','user003_integral_20240525','2024-05-25 10:52:19','2024-05-25 10:52:19');

/*!40000 ALTER TABLE `user_behavior_rebate_order_002` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'xiaofuge',85.85,85.85,'open','2024-05-24 22:11:59','2024-06-09 10:45:11'),
	(2,'user003',0.96,0.96,'open','2024-05-25 10:53:20','2024-05-25 10:54:31');

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

LOCK TABLES `user_credit_order_001` WRITE;
/*!40000 ALTER TABLE `user_credit_order_001` DISABLE KEYS */;

INSERT INTO `user_credit_order_001` (`id`, `user_id`, `order_id`, `trade_name`, `trade_type`, `trade_amount`, `out_business_no`, `create_time`, `update_time`)
VALUES
	(1,'xiaofuge','950333991038','行为返利','forward',10.19,'10000990990','2024-06-01 10:31:16','2024-06-01 10:31:16'),
	(4,'xiaofuge','957646101468','行为返利','forward',-10.19,'10000990991','2024-06-01 10:33:26','2024-06-01 10:33:26'),
	(5,'xiaofuge','105601831431','行为返利','forward',10.00,'xiaofuge_integral_20240601006','2024-06-01 11:00:45','2024-06-01 11:00:45'),
	(6,'xiaofuge','120781019441','行为返利','forward',10.19,'100009900001','2024-06-01 13:57:22','2024-06-01 13:57:22'),
	(7,'xiaofuge','626373070354','行为返利','reverse',-10.19,'100009900002','2024-06-01 13:58:23','2024-06-01 13:58:23'),
	(8,'xiaofuge','726664203611','行为返利','forward',10.00,'xiaofuge_integral_20240601101','2024-06-01 14:02:48','2024-06-01 14:02:48'),
	(9,'xiaofuge','337035866234','行为返利','forward',10.19,'100009909911','2024-06-01 14:27:20','2024-06-01 14:27:20'),
	(11,'xiaofuge','904262714981','行为返利','forward',10.19,'12406039900002','2024-06-03 07:28:02','2024-06-03 07:28:02'),
	(12,'xiaofuge','313070417337','兑换抽奖','reverse',-1.68,'70009240608003','2024-06-08 20:27:03','2024-06-08 20:27:03'),
	(15,'xiaofuge','956437348272','兑换抽奖','reverse',-1.68,'70009240608007','2024-06-08 20:34:13','2024-06-08 20:34:13'),
	(16,'xiaofuge','825697847616','兑换抽奖','reverse',-1.68,'70009240609001','2024-06-09 09:11:23','2024-06-09 09:11:23'),
	(17,'xiaofuge','528225981137','兑换抽奖','reverse',-1.68,'70009240610002','2024-06-09 10:45:11','2024-06-09 10:45:11');

/*!40000 ALTER TABLE `user_credit_order_001` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `user_raffle_order_001` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_001` DISABLE KEYS */;

INSERT INTO `user_raffle_order_001` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
	(5,'xiaofuge',100301,'测试活动',100006,'569856975978','2024-04-08 14:52:47','used','2024-04-08 22:52:47','2024-04-13 11:44:01'),
	(6,'xiaofuge',100301,'测试活动',100006,'867136698684','2024-04-13 03:44:07','used','2024-04-13 11:44:10','2024-04-13 11:44:10'),
	(7,'xiaofuge',100301,'测试活动',100006,'250425115608','2024-04-13 03:44:14','used','2024-04-13 11:44:14','2024-04-13 11:44:14'),
	(8,'xiaofuge',100301,'测试活动',100006,'663910993767','2024-04-13 03:44:16','used','2024-04-13 11:44:15','2024-04-13 11:44:15'),
	(9,'xiaofuge',100301,'测试活动',100006,'218374542905','2024-04-13 03:44:17','used','2024-04-13 11:44:16','2024-04-13 11:44:16'),
	(10,'xiaofuge',100301,'测试活动',100006,'225714694474','2024-04-13 03:44:18','used','2024-04-13 11:44:17','2024-04-13 11:44:17'),
	(11,'xiaofuge',100301,'测试活动',100006,'431167372778','2024-04-13 03:44:19','used','2024-04-13 11:44:18','2024-04-13 11:44:18'),
	(12,'xiaofuge',100301,'测试活动',100006,'434079846497','2024-04-13 03:45:30','used','2024-04-13 11:45:29','2024-04-13 11:45:29'),
	(13,'xiaofuge',100301,'测试活动',100006,'965685676429','2024-04-13 03:45:31','used','2024-04-13 11:45:30','2024-04-13 11:45:30'),
	(14,'xiaofuge',100301,'测试活动',100006,'940273728363','2024-04-13 04:14:53','used','2024-04-13 12:14:53','2024-04-13 12:14:53'),
	(15,'xiaofuge',100301,'测试活动',100006,'240699246294','2024-04-13 04:16:20','used','2024-04-13 12:16:19','2024-04-13 12:17:33'),
	(16,'xiaofuge',100301,'测试活动',100006,'298101180210','2024-04-13 04:18:05','used','2024-04-13 12:18:05','2024-04-13 12:18:16'),
	(17,'xiaofuge',100301,'测试活动',100006,'565655944488','2024-04-13 04:18:23','used','2024-04-13 12:18:23','2024-04-13 12:18:23'),
	(18,'xiaofuge',100301,'测试活动',100006,'090289257534','2024-04-13 04:18:25','used','2024-04-13 12:18:24','2024-04-13 12:18:24'),
	(19,'xiaofuge',100301,'测试活动',100006,'668356046426','2024-04-13 04:18:26','used','2024-04-13 12:18:25','2024-04-13 12:18:25'),
	(20,'xiaofuge',100301,'测试活动',100006,'745680068300','2024-04-13 04:18:27','used','2024-04-13 12:18:26','2024-04-13 12:18:36'),
	(21,'xiaofuge',100301,'测试活动',100006,'285300597983','2024-04-13 04:20:07','used','2024-04-13 12:20:07','2024-04-13 12:20:07'),
	(22,'xiaofuge',100301,'测试活动',100006,'999361306023','2024-04-13 04:20:10','used','2024-04-13 12:20:09','2024-04-13 12:20:09'),
	(23,'xiaofuge',100301,'测试活动',100006,'063682699381','2024-04-13 04:20:14','used','2024-04-13 12:20:13','2024-04-13 12:20:13'),
	(24,'xiaofuge',100301,'测试活动',100006,'680488311338','2024-04-13 04:20:15','used','2024-04-13 12:20:14','2024-04-13 12:20:14'),
	(25,'xiaofuge',100301,'测试活动',100006,'399058527457','2024-04-13 04:20:16','used','2024-04-13 12:20:16','2024-04-13 12:20:16'),
	(26,'xiaofuge',100301,'测试活动',100006,'579122416749','2024-04-13 04:20:17','used','2024-04-13 12:20:17','2024-04-13 12:20:20'),
	(27,'xiaofuge',100301,'测试活动',100006,'854484054432','2024-04-13 06:03:59','used','2024-04-13 14:03:59','2024-04-13 14:03:59'),
	(28,'xiaofuge',100301,'测试活动',100006,'066823147917','2024-04-13 07:24:59','used','2024-04-13 15:25:05','2024-04-13 15:25:06'),
	(29,'xiaofuge',100301,'测试活动',100006,'022620846137','2024-04-13 07:25:11','used','2024-04-13 15:25:11','2024-04-13 15:25:11'),
	(30,'xiaofuge',100301,'测试活动',100006,'605666354632','2024-04-13 07:25:12','used','2024-04-13 15:25:12','2024-04-13 15:25:12'),
	(31,'xiaofuge',100301,'测试活动',100006,'604661560037','2024-04-13 07:25:13','used','2024-04-13 15:25:13','2024-04-13 15:25:21'),
	(32,'xiaofuge',100301,'测试活动',100006,'212448652580','2024-04-20 04:09:30','used','2024-04-20 12:09:30','2024-04-20 12:09:30'),
	(33,'xiaofuge',100301,'测试活动',100006,'356729331179','2024-04-20 04:11:24','used','2024-04-20 12:11:24','2024-04-20 12:11:24'),
	(34,'xiaofuge',100301,'测试活动',100006,'102669494145','2024-04-20 07:10:44','used','2024-04-20 15:10:44','2024-04-20 15:10:58'),
	(35,'xiaofuge',100301,'测试活动',100006,'730186113832','2024-04-20 07:43:12','used','2024-04-20 15:43:12','2024-04-20 15:43:13'),
	(36,'xiaofuge',100301,'测试活动',100006,'472281891603','2024-04-20 08:50:37','used','2024-04-20 16:50:38','2024-04-20 16:50:39'),
	(37,'xiaofuge',100301,'测试活动',100006,'931181504757','2024-04-27 05:19:26','used','2024-04-27 13:19:26','2024-04-27 13:19:38'),
	(38,'xiaofuge',100301,'测试活动',100006,'664993621684','2024-04-27 05:26:49','used','2024-04-27 13:26:49','2024-04-27 13:27:17'),
	(39,'xiaofuge',100301,'测试活动',100006,'757674779249','2024-04-27 05:27:45','used','2024-04-27 13:27:45','2024-04-27 13:27:45'),
	(40,'xiaofuge',100301,'测试活动',100006,'623885952534','2024-04-27 05:28:02','used','2024-04-27 13:28:01','2024-04-27 13:28:01'),
	(41,'xiaofuge',100301,'测试活动',100006,'351875766756','2024-04-27 05:29:05','used','2024-04-27 13:29:05','2024-04-27 13:29:05'),
	(42,'xiaofuge',100301,'测试活动',100006,'803227763198','2024-04-27 05:29:32','used','2024-04-27 13:29:31','2024-04-27 13:29:31'),
	(43,'xiaofuge',100301,'测试活动',100006,'587527322073','2024-04-27 05:29:57','used','2024-04-27 13:29:57','2024-04-27 13:29:57'),
	(44,'xiaofuge',100301,'测试活动',100006,'552928609772','2024-04-27 05:30:11','used','2024-04-27 13:30:11','2024-04-27 13:30:11'),
	(45,'xiaofuge',100301,'测试活动',100006,'407462568156','2024-04-27 05:36:27','used','2024-04-27 13:36:27','2024-04-27 13:36:27'),
	(46,'xiaofuge',100301,'测试活动',100006,'688519386935','2024-04-27 05:38:00','used','2024-04-27 13:38:00','2024-04-27 13:38:00'),
	(47,'xiaofuge',100301,'测试活动',100006,'148984382545','2024-04-27 05:38:56','used','2024-04-27 13:38:55','2024-04-27 13:38:55'),
	(48,'xiaofuge',100301,'测试活动',100006,'410701479648','2024-04-27 05:39:18','used','2024-04-27 13:39:18','2024-04-27 13:39:18'),
	(49,'xiaofuge',100301,'测试活动',100006,'521226371540','2024-04-27 06:59:56','used','2024-04-27 14:59:56','2024-04-27 14:59:56'),
	(50,'xiaofuge',100301,'测试活动',100006,'167000751553','2024-04-27 07:00:14','used','2024-04-27 15:00:14','2024-04-27 15:00:14'),
	(51,'xiaofuge',100301,'测试活动',100006,'685179511666','2024-04-27 07:00:23','used','2024-04-27 15:00:22','2024-04-27 15:00:22'),
	(52,'xiaofuge',100301,'测试活动',100006,'308424817839','2024-05-01 06:33:42','used','2024-05-01 14:33:43','2024-05-01 14:57:39'),
	(53,'xiaofuge',100301,'测试活动',100006,'116865823300','2024-05-01 06:58:08','used','2024-05-01 14:58:08','2024-05-01 14:58:08'),
	(54,'xiaofuge',100301,'测试活动',100006,'272157347851','2024-05-01 06:59:32','used','2024-05-01 14:59:32','2024-05-01 14:59:33'),
	(55,'xiaofuge',100301,'测试活动',100006,'400772556300','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(56,'xiaofuge',100301,'测试活动',100006,'494705137752','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(57,'xiaofuge',100301,'测试活动',100006,'728609897262','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(58,'xiaofuge',100301,'测试活动',100006,'085750418120','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(59,'xiaofuge',100301,'测试活动',100006,'884615410376','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(60,'xiaofuge',100301,'测试活动',100006,'380693771158','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(61,'xiaofuge',100301,'测试活动',100006,'801793933954','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(62,'xiaofuge',100301,'测试活动',100006,'153569048026','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(63,'xiaofuge',100301,'测试活动',100006,'239541957386','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
	(64,'xiaofuge',100301,'测试活动',100006,'417247136950','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:34'),
	(65,'xiaofuge',100301,'测试活动',100006,'556248667355','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(66,'xiaofuge',100301,'测试活动',100006,'828955445464','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(67,'xiaofuge',100301,'测试活动',100006,'756110942449','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(68,'xiaofuge',100301,'测试活动',100006,'440069371435','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(69,'xiaofuge',100301,'测试活动',100006,'421594084633','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(70,'xiaofuge',100301,'测试活动',100006,'500905040429','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(71,'xiaofuge',100301,'测试活动',100006,'712386571628','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(72,'xiaofuge',100301,'测试活动',100006,'095923542021','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
	(73,'xiaofuge',100301,'测试活动',100006,'306233708878','2024-05-03 01:00:27','used','2024-05-03 09:00:28','2024-05-03 09:02:17'),
	(74,'xiaofuge',100301,'测试活动',100006,'690124733440','2024-05-03 01:09:42','used','2024-05-03 09:09:42','2024-05-03 09:09:57'),
	(75,'xiaofuge',100301,'测试活动',100006,'190487161872','2024-05-03 01:10:28','used','2024-05-03 09:10:28','2024-05-03 09:10:35'),
	(76,'xiaofuge',100301,'测试活动',100006,'693117324295','2024-05-03 01:11:32','used','2024-05-03 09:11:32','2024-05-03 09:11:38'),
	(77,'xiaofuge',100301,'测试活动',100006,'216557006872','2024-05-04 01:32:02','used','2024-05-04 09:32:02','2024-05-04 09:32:10'),
	(78,'xiaofuge',100301,'测试活动',100006,'769208157430','2024-05-04 01:42:11','used','2024-05-04 09:42:11','2024-05-04 09:42:11'),
	(79,'xiaofuge',100301,'测试活动',100006,'122549611053','2024-05-04 02:06:40','used','2024-05-04 10:06:40','2024-05-04 10:06:40'),
	(80,'xiaofuge',100301,'测试活动',100006,'098077770962','2024-05-04 02:07:37','used','2024-05-04 10:07:36','2024-05-04 10:07:36'),
	(81,'xiaofuge',100301,'测试活动',100006,'783440464441','2024-05-04 02:07:45','used','2024-05-04 10:07:44','2024-05-04 10:07:44'),
	(82,'xiaofuge',100301,'测试活动',100006,'311741760661','2024-05-04 02:15:21','used','2024-05-04 10:15:21','2024-05-04 10:15:21'),
	(83,'xiaofuge',100301,'测试活动',100006,'882852499238','2024-05-04 02:15:29','used','2024-05-04 10:15:29','2024-05-04 10:15:29'),
	(84,'xiaofuge',100301,'测试活动',100006,'815259576049','2024-05-04 02:16:51','used','2024-05-04 10:16:51','2024-05-04 10:16:51'),
	(85,'xiaofuge',100301,'测试活动',100006,'398933081979','2024-05-04 02:17:20','used','2024-05-04 10:17:19','2024-05-04 10:17:19'),
	(86,'xiaofuge',100301,'测试活动',100006,'724477812186','2024-05-04 02:18:09','used','2024-05-04 10:18:09','2024-05-04 10:18:09'),
	(87,'xiaofuge',100301,'测试活动',100006,'963415104251','2024-05-04 02:20:46','used','2024-05-04 10:20:46','2024-05-04 10:20:46'),
	(88,'xiaofuge',100301,'测试活动',100006,'406832687477','2024-05-04 02:20:54','used','2024-05-04 10:20:54','2024-05-04 10:20:54'),
	(89,'xiaofuge',100301,'测试活动',100006,'683420026858','2024-05-04 02:36:33','used','2024-05-04 10:36:32','2024-05-04 10:36:32'),
	(90,'xiaofuge',100301,'测试活动',100006,'022379743786','2024-05-04 02:37:25','used','2024-05-04 10:37:25','2024-05-04 10:37:25'),
	(91,'xiaofuge',100301,'测试活动',100006,'005727284053','2024-05-04 02:37:32','used','2024-05-04 10:37:32','2024-05-04 10:37:32'),
	(92,'xiaofuge',100301,'测试活动',100006,'157097996505','2024-05-04 02:37:40','used','2024-05-04 10:37:39','2024-05-04 10:37:39'),
	(93,'xiaofuge',100301,'测试活动',100006,'286115274205','2024-05-04 02:38:41','used','2024-05-04 10:38:41','2024-05-04 10:38:41'),
	(94,'xiaofuge',100301,'测试活动',100006,'714442509117','2024-05-04 02:38:49','used','2024-05-04 10:38:49','2024-05-04 10:38:49'),
	(95,'xiaofuge',100301,'测试活动',100006,'124268508437','2024-05-04 03:30:47','used','2024-05-04 11:30:47','2024-05-04 11:30:47'),
	(96,'xiaofuge',100301,'测试活动',100006,'024028065395','2024-05-04 03:40:10','used','2024-05-04 11:40:09','2024-05-04 11:40:09'),
	(97,'xiaofuge',100301,'测试活动',100006,'011132554981','2024-05-04 03:40:17','used','2024-05-04 11:40:16','2024-05-04 11:40:17'),
	(98,'xiaofuge',100301,'测试活动',100006,'748409799526','2024-05-04 04:49:12','used','2024-05-04 12:49:11','2024-05-04 12:49:20'),
	(99,'xiaofuge',100301,'测试活动',100006,'514483431161','2024-05-04 04:49:30','used','2024-05-04 12:49:30','2024-05-04 12:49:30'),
	(100,'xiaofuge',100301,'测试活动',100006,'401352928023','2024-05-04 04:49:42','used','2024-05-04 12:49:42','2024-05-04 12:49:42'),
	(101,'xiaofuge',100301,'测试活动',100006,'569764837195','2024-05-04 04:50:36','used','2024-05-04 12:50:35','2024-05-04 12:50:35'),
	(102,'xiaofuge',100301,'测试活动',100006,'653239020479','2024-05-04 04:50:44','used','2024-05-04 12:50:44','2024-05-04 12:50:44'),
	(103,'xiaofuge',100301,'测试活动',100006,'407172497549','2024-05-04 07:29:28','used','2024-05-04 15:29:28','2024-05-04 15:29:28'),
	(104,'xiaofuge',100301,'测试活动',100006,'799188603085','2024-05-04 07:29:36','used','2024-05-04 15:29:35','2024-05-04 15:29:35'),
	(105,'xiaofuge',100301,'测试活动',100006,'528987104958','2024-05-04 07:29:43','used','2024-05-04 15:29:42','2024-05-04 15:29:43'),
	(106,'xiaofuge',100301,'测试活动',100006,'966648280772','2024-05-04 07:29:50','used','2024-05-04 15:29:49','2024-05-04 15:29:49'),
	(107,'xiaofuge',100301,'测试活动',100006,'087190703146','2024-05-04 07:29:56','used','2024-05-04 15:29:56','2024-05-04 15:29:56'),
	(108,'liergou',100301,'测试活动',100006,'844440368058','2024-05-04 07:30:36','used','2024-05-04 15:30:36','2024-05-04 15:30:36'),
	(109,'liergou',100301,'测试活动',100006,'390787212758','2024-05-04 07:31:17','used','2024-05-04 15:31:17','2024-05-04 15:31:17'),
	(110,'liergou',100301,'测试活动',100006,'640363472357','2024-05-04 07:31:24','used','2024-05-04 15:31:24','2024-05-04 15:31:24'),
	(111,'liergou',100301,'测试活动',100006,'974075965572','2024-05-04 07:31:31','used','2024-05-04 15:31:31','2024-05-04 15:31:31'),
	(112,'liergou',100301,'测试活动',100006,'682189502378','2024-05-04 07:31:38','used','2024-05-04 15:31:38','2024-05-04 15:31:38'),
	(113,'liergou',100301,'测试活动',100006,'267171522488','2024-05-04 07:31:45','used','2024-05-04 15:31:44','2024-05-04 15:31:45'),
	(114,'liergou',100301,'测试活动',100006,'840617006609','2024-05-04 07:31:52','used','2024-05-04 15:31:51','2024-05-04 15:31:51'),
	(115,'liergou',100301,'测试活动',100006,'412882808007','2024-05-04 07:31:59','used','2024-05-04 15:31:59','2024-05-04 15:31:59'),
	(116,'liergou',100301,'测试活动',100006,'909193532035','2024-05-04 07:32:06','used','2024-05-04 15:32:06','2024-05-04 15:32:06'),
	(117,'liergou',100301,'测试活动',100006,'941421834903','2024-05-04 07:32:13','used','2024-05-04 15:32:13','2024-05-04 15:32:13'),
	(118,'liergou',100301,'测试活动',100006,'502088692031','2024-05-04 07:32:29','used','2024-05-04 15:32:29','2024-05-04 15:32:29'),
	(119,'liergou',100301,'测试活动',100006,'983938339728','2024-05-04 07:32:36','used','2024-05-04 15:32:35','2024-05-04 15:32:35'),
	(120,'liergou',100301,'测试活动',100006,'300359343610','2024-05-04 07:32:42','used','2024-05-04 15:32:42','2024-05-04 15:32:42'),
	(121,'liergou',100301,'测试活动',100006,'205701271412','2024-05-04 07:34:11','used','2024-05-04 15:34:10','2024-05-04 15:34:10'),
	(122,'xiaofuge',100301,'测试活动',100006,'472964574229','2024-05-29 23:24:01','used','2024-05-30 07:24:01','2024-05-30 07:24:02'),
	(123,'xiaofuge',100301,'测试活动',100006,'096000668706','2024-05-29 23:24:02','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(124,'xiaofuge',100301,'测试活动',100006,'053808941529','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(125,'xiaofuge',100301,'测试活动',100006,'546003504055','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(126,'xiaofuge',100301,'测试活动',100006,'531425424850','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
	(127,'xiaofuge',100301,'测试活动',100006,'101866910505','2024-05-30 00:02:18','create','2024-05-30 08:02:18','2024-05-30 08:02:18');

/*!40000 ALTER TABLE `user_raffle_order_001` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `user_raffle_order_002` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_002` DISABLE KEYS */;

INSERT INTO `user_raffle_order_002` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
	(1,'liergou2',100301,'测试活动',100006,'319771078666','2024-05-04 07:35:56','used','2024-05-04 15:35:56','2024-05-04 15:35:56'),
	(2,'liergou2',100301,'测试活动',100006,'953580004772','2024-05-04 07:36:03','used','2024-05-04 15:36:03','2024-05-04 15:36:03'),
	(3,'liergou2',100301,'测试活动',100006,'002033127656','2024-05-04 07:36:10','used','2024-05-04 15:36:10','2024-05-04 15:36:10'),
	(4,'liergou2',100301,'测试活动',100006,'786106818681','2024-05-04 07:36:22','used','2024-05-04 15:36:21','2024-05-04 15:36:22'),
	(5,'liergou2',100301,'测试活动',100006,'903521978453','2024-05-04 07:36:33','used','2024-05-04 15:36:32','2024-05-04 15:36:32'),
	(6,'liergou2',100301,'测试活动',100006,'599563157264','2024-05-04 07:36:40','used','2024-05-04 15:36:39','2024-05-04 15:36:39'),
	(7,'liergou2',100301,'测试活动',100006,'236230739530','2024-05-04 07:36:47','used','2024-05-04 15:36:46','2024-05-04 15:36:46'),
	(8,'liergou2',100301,'测试活动',100006,'284065292342','2024-05-04 07:36:53','used','2024-05-04 15:36:53','2024-05-04 15:36:53'),
	(9,'liergou2',100301,'测试活动',100006,'667428166119','2024-05-04 07:37:00','used','2024-05-04 15:36:59','2024-05-04 15:36:59'),
	(10,'liergou2',100301,'测试活动',100006,'320484285041','2024-05-04 07:37:06','used','2024-05-04 15:37:06','2024-05-04 15:37:06'),
	(11,'liergou2',100301,'测试活动',100006,'048048925549','2024-05-04 07:37:13','used','2024-05-04 15:37:13','2024-05-04 15:37:13'),
	(12,'liergou2',100301,'测试活动',100006,'536732336372','2024-05-04 07:37:21','used','2024-05-04 15:37:20','2024-05-04 15:37:20'),
	(13,'liergou2',100301,'测试活动',100006,'378120929272','2024-05-04 07:37:28','used','2024-05-04 15:37:28','2024-05-04 15:37:28'),
	(14,'liergou2',100301,'测试活动',100006,'368599869327','2024-05-04 07:37:38','used','2024-05-04 15:37:37','2024-05-04 15:37:37'),
	(15,'user003',100301,'测试活动',100006,'248641902208','2024-05-25 02:53:19','used','2024-05-25 10:53:19','2024-05-25 10:53:20'),
	(16,'user003',100301,'测试活动',100006,'020196190863','2024-05-25 02:54:30','used','2024-05-25 10:54:30','2024-05-25 10:54:31');

/*!40000 ALTER TABLE `user_raffle_order_002` ENABLE KEYS */;
UNLOCK TABLES;


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




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
