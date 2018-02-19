/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : 127.0.0.1:3306
Source Database       : renren

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2018-01-07 23:35:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_5', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', null, 'edu.gdut.imis.byf3114004859.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015FA584B2907874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000672656E72656E70737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', null, 'edu.gdut.imis.byf3114004859.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000047400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_5', 'DEFAULT', null, 'edu.gdut.imis.byf3114004859.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000574000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-LE3P71R1514359201281', '1514387785278', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', 'TASK_3', 'DEFAULT', null, '1514388600000', '1514386800000', '5', 'WAITING', 'CRON', '1514180323000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015FA584B2907874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000672656E72656E70737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', 'TASK_4', 'DEFAULT', null, '1514388600000', '1514386800000', '5', 'WAITING', 'CRON', '1514180324000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000047400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_5', 'DEFAULT', 'TASK_5', 'DEFAULT', null, '1514181600000', '-1', '5', 'PAUSED', 'CRON', '1514180324000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200406564752E676475742E696D69732E627966333131343030343835392E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000574000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for race_category
-- ----------------------------
DROP TABLE IF EXISTS `race_category`;
CREATE TABLE `race_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `create_user` bigint(255) DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='比赛分类';

-- ----------------------------
-- Records of race_category
-- ----------------------------
INSERT INTO `race_category` VALUES ('1', '乒乓球', '1', '2017-11-10 14:30:05');
INSERT INTO `race_category` VALUES ('2', '篮球', '1', '2017-11-10 23:32:31');
INSERT INTO `race_category` VALUES ('3', '羽毛球', '1', '2017-11-11 11:37:23');

-- ----------------------------
-- Table structure for race_competition
-- ----------------------------
DROP TABLE IF EXISTS `race_competition`;
CREATE TABLE `race_competition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '场次id',
  `name` varchar(255) DEFAULT NULL COMMENT '场次名称',
  `ground_id` bigint(20) DEFAULT NULL COMMENT '场地id',
  `order` int(11) DEFAULT NULL COMMENT '场次进行顺序',
  `games_total` int(11) DEFAULT NULL COMMENT '局数',
  `stage_id` bigint(20) NOT NULL COMMENT '轮次id',
  `winner_id` bigint(20) DEFAULT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `guest_id` bigint(20) DEFAULT NULL,
  `host_point` bigint(20) DEFAULT NULL,
  `guest_point` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stage_id` (`stage_id`),
  CONSTRAINT `race_competition_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `race_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='比赛场次';

-- ----------------------------
-- Records of race_competition
-- ----------------------------
INSERT INTO `race_competition` VALUES ('9', '第1场', '1', '1', '5', '1', '10', '10', '8', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('10', '第2场', '2', '2', '5', '1', '7', '9', '7', '1', '3', '3');
INSERT INTO `race_competition` VALUES ('11', '第1场', '1', '1', '5', '4', '7', '7', '10', '3', '1', '3');
INSERT INTO `race_competition` VALUES ('12', '第1场', '1', '1', '5', '6', '25', '25', '39', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('13', '第2场', '2', '2', '5', '6', '43', '23', '43', '0', '3', '3');
INSERT INTO `race_competition` VALUES ('14', '第3场', '3', '3', '5', '6', '40', '40', '37', '3', '1', '3');
INSERT INTO `race_competition` VALUES ('15', '第4场', '4', '4', '5', '6', '41', '41', '38', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('16', '第5场', '1', '5', '5', '6', '26', '26', '13', '3', '2', '3');
INSERT INTO `race_competition` VALUES ('17', '第6场', '2', '6', '5', '6', '24', '24', '42', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('18', '第7场', '3', '7', '5', '6', '36', '35', '36', '1', '3', '3');
INSERT INTO `race_competition` VALUES ('19', '第8场', '4', '8', '5', '6', '22', '22', '21', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('28', '第1场', '1', '1', '5', '7', '25', '25', '43', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('29', '第2场', '2', '2', '5', '7', '36', '36', '40', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('30', '第3场', '3', '3', '5', '7', '22', '22', '26', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('31', '第4场', '4', '4', '5', '7', '24', '24', '41', '3', '0', '3');
INSERT INTO `race_competition` VALUES ('32', '第1场', '1', '1', '5', '8', '36', '22', '36', '0', '3', '3');
INSERT INTO `race_competition` VALUES ('33', '第2场', '2', '2', '5', '8', '25', '24', '25', '0', '3', '3');

-- ----------------------------
-- Table structure for race_competition_player
-- ----------------------------
DROP TABLE IF EXISTS `race_competition_player`;
CREATE TABLE `race_competition_player` (
  `id` int(11) NOT NULL,
  `player` varchar(255) DEFAULT NULL COMMENT '运动员id',
  `competition_id` bigint(20) DEFAULT NULL COMMENT '场次id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场次-运动员 中间表';

-- ----------------------------
-- Records of race_competition_player
-- ----------------------------

-- ----------------------------
-- Table structure for race_enroll
-- ----------------------------
DROP TABLE IF EXISTS `race_enroll`;
CREATE TABLE `race_enroll` (
  `enroll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `race_id` bigint(20) DEFAULT NULL,
  `enroll_time` datetime DEFAULT NULL,
  PRIMARY KEY (`enroll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of race_enroll
-- ----------------------------
INSERT INTO `race_enroll` VALUES ('1', '7', '2', '2017-12-25 16:23:57');
INSERT INTO `race_enroll` VALUES ('15', '8', '2', null);
INSERT INTO `race_enroll` VALUES ('16', '9', '2', null);
INSERT INTO `race_enroll` VALUES ('17', '10', '2', null);
INSERT INTO `race_enroll` VALUES ('20', '21', '16', null);
INSERT INTO `race_enroll` VALUES ('21', '22', '16', null);
INSERT INTO `race_enroll` VALUES ('22', '23', '16', null);
INSERT INTO `race_enroll` VALUES ('23', '24', '16', null);
INSERT INTO `race_enroll` VALUES ('24', '25', '16', null);
INSERT INTO `race_enroll` VALUES ('25', '26', '16', null);
INSERT INTO `race_enroll` VALUES ('26', '13', '16', null);
INSERT INTO `race_enroll` VALUES ('27', '36', '16', null);
INSERT INTO `race_enroll` VALUES ('28', '37', '16', null);
INSERT INTO `race_enroll` VALUES ('29', '38', '16', null);
INSERT INTO `race_enroll` VALUES ('30', '39', '16', null);
INSERT INTO `race_enroll` VALUES ('31', '40', '16', null);
INSERT INTO `race_enroll` VALUES ('32', '41', '16', null);
INSERT INTO `race_enroll` VALUES ('33', '42', '16', null);
INSERT INTO `race_enroll` VALUES ('34', '13', '16', null);
INSERT INTO `race_enroll` VALUES ('35', '43', '16', '2017-12-27 13:33:17');

-- ----------------------------
-- Table structure for race_ground
-- ----------------------------
DROP TABLE IF EXISTS `race_ground`;
CREATE TABLE `race_ground` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '场地名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '场地种类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='场地';

-- ----------------------------
-- Records of race_ground
-- ----------------------------
INSERT INTO `race_ground` VALUES ('1', '1号场地', '1');
INSERT INTO `race_ground` VALUES ('2', '2号场地', '1');
INSERT INTO `race_ground` VALUES ('3', '3号场地', '1');
INSERT INTO `race_ground` VALUES ('4', '4号场地', '1');

-- ----------------------------
-- Table structure for race_group
-- ----------------------------
DROP TABLE IF EXISTS `race_group`;
CREATE TABLE `race_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `group_no` int(11) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小组循环赛分组';

-- ----------------------------
-- Records of race_group
-- ----------------------------

-- ----------------------------
-- Table structure for race_group_player
-- ----------------------------
DROP TABLE IF EXISTS `race_group_player`;
CREATE TABLE `race_group_player` (
  `id` bigint(20) NOT NULL,
  `player_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of race_group_player
-- ----------------------------

-- ----------------------------
-- Table structure for race_point
-- ----------------------------
DROP TABLE IF EXISTS `race_point`;
CREATE TABLE `race_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `race_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `competition_id` bigint(20) DEFAULT NULL,
  `round_id` bigint(20) DEFAULT NULL,
  `point` int(11) DEFAULT NULL COMMENT '0',
  `order` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1:比赛总得分 2:轮次得分 3:场次得分 4:局得分',
  `user_id` bigint(20) DEFAULT NULL,
  `bye` int(11) DEFAULT NULL COMMENT '1：轮空，0：不轮空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of race_point
-- ----------------------------
INSERT INTO `race_point` VALUES ('1', null, '1', null, null, '3', null, null, null, '7', '0');
INSERT INTO `race_point` VALUES ('2', null, '1', null, null, '0', null, null, null, '8', '0');
INSERT INTO `race_point` VALUES ('3', null, '1', null, null, '1', null, null, null, '9', '0');
INSERT INTO `race_point` VALUES ('4', null, '1', null, null, '3', null, null, null, '10', '0');
INSERT INTO `race_point` VALUES ('21', null, '4', null, null, '1', null, null, null, '10', '0');
INSERT INTO `race_point` VALUES ('22', null, '4', null, null, '3', null, null, null, '7', '0');
INSERT INTO `race_point` VALUES ('29', null, '5', null, null, null, null, null, null, '7', null);
INSERT INTO `race_point` VALUES ('30', '2', null, null, null, null, '1', null, '1', '7', null);
INSERT INTO `race_point` VALUES ('31', '2', null, null, null, null, '4', null, '4', '8', null);
INSERT INTO `race_point` VALUES ('32', '2', null, null, null, null, '4', null, '4', '9', null);
INSERT INTO `race_point` VALUES ('33', '2', null, null, null, null, '2', null, '2', '10', null);
INSERT INTO `race_point` VALUES ('35', '16', null, null, null, null, '8', null, null, '43', null);
INSERT INTO `race_point` VALUES ('36', '16', null, null, null, null, null, null, null, '21', null);
INSERT INTO `race_point` VALUES ('37', '16', null, null, null, null, '4', null, null, '22', null);
INSERT INTO `race_point` VALUES ('38', '16', null, null, null, null, null, null, null, '23', null);
INSERT INTO `race_point` VALUES ('39', '16', null, null, null, null, '4', null, null, '24', null);
INSERT INTO `race_point` VALUES ('40', '16', null, null, null, null, '4', null, null, '25', null);
INSERT INTO `race_point` VALUES ('41', '16', null, null, null, null, '8', null, null, '26', null);
INSERT INTO `race_point` VALUES ('42', '16', null, null, null, null, null, null, null, '13', null);
INSERT INTO `race_point` VALUES ('43', '16', null, null, null, null, '4', null, null, '36', null);
INSERT INTO `race_point` VALUES ('44', '16', null, null, null, null, null, null, null, '37', null);
INSERT INTO `race_point` VALUES ('45', '16', null, null, null, null, null, null, null, '38', null);
INSERT INTO `race_point` VALUES ('46', '16', null, null, null, null, null, null, null, '39', null);
INSERT INTO `race_point` VALUES ('47', '16', null, null, null, null, '8', null, null, '40', null);
INSERT INTO `race_point` VALUES ('48', '16', null, null, null, null, '8', null, null, '41', null);
INSERT INTO `race_point` VALUES ('49', '16', null, null, null, null, null, null, null, '42', null);
INSERT INTO `race_point` VALUES ('51', '16', null, null, null, null, null, null, null, '35', null);
INSERT INTO `race_point` VALUES ('52', null, '6', null, null, '3', null, null, null, '35', '0');
INSERT INTO `race_point` VALUES ('53', null, '6', null, null, '0', null, null, null, '42', '0');
INSERT INTO `race_point` VALUES ('54', null, '6', null, null, '0', null, null, null, '41', '0');
INSERT INTO `race_point` VALUES ('55', null, '6', null, null, '1', null, null, null, '40', '0');
INSERT INTO `race_point` VALUES ('56', null, '6', null, null, '0', null, null, null, '39', '0');
INSERT INTO `race_point` VALUES ('57', null, '6', null, null, '0', null, null, null, '38', '0');
INSERT INTO `race_point` VALUES ('58', null, '6', null, null, '1', null, null, null, '37', '0');
INSERT INTO `race_point` VALUES ('59', null, '6', null, null, '3', null, null, null, '36', '0');
INSERT INTO `race_point` VALUES ('60', null, '6', null, null, '2', null, null, null, '13', '0');
INSERT INTO `race_point` VALUES ('61', null, '6', null, null, '2', null, null, null, '26', '0');
INSERT INTO `race_point` VALUES ('62', null, '6', null, null, '0', null, null, null, '25', '0');
INSERT INTO `race_point` VALUES ('63', null, '6', null, null, '0', null, null, null, '24', '0');
INSERT INTO `race_point` VALUES ('64', null, '6', null, null, '3', null, null, null, '23', '0');
INSERT INTO `race_point` VALUES ('65', null, '6', null, null, '0', null, null, null, '22', '0');
INSERT INTO `race_point` VALUES ('66', null, '6', null, null, '0', null, null, null, '21', '0');
INSERT INTO `race_point` VALUES ('67', null, '6', null, null, '3', null, null, null, '43', '0');
INSERT INTO `race_point` VALUES ('92', null, '7', null, null, '0', null, null, null, '25', '0');
INSERT INTO `race_point` VALUES ('93', null, '7', null, null, '0', null, null, null, '43', '0');
INSERT INTO `race_point` VALUES ('94', null, '7', null, null, '0', null, null, null, '40', '0');
INSERT INTO `race_point` VALUES ('95', null, '7', null, null, '0', null, null, null, '41', '0');
INSERT INTO `race_point` VALUES ('96', null, '7', null, null, '0', null, null, null, '26', '0');
INSERT INTO `race_point` VALUES ('97', null, '7', null, null, '0', null, null, null, '24', '0');
INSERT INTO `race_point` VALUES ('98', null, '7', null, null, '0', null, null, null, '36', '0');
INSERT INTO `race_point` VALUES ('99', null, '7', null, null, '0', null, null, null, '22', '0');
INSERT INTO `race_point` VALUES ('100', null, '8', null, null, null, null, null, null, '25', null);
INSERT INTO `race_point` VALUES ('101', null, '8', null, null, null, null, null, null, '36', null);
INSERT INTO `race_point` VALUES ('102', null, '8', null, null, null, null, null, null, '22', null);
INSERT INTO `race_point` VALUES ('103', null, '8', null, null, null, null, null, null, '24', null);

-- ----------------------------
-- Table structure for race_race
-- ----------------------------
DROP TABLE IF EXISTS `race_race`;
CREATE TABLE `race_race` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '比赛id',
  `name` varchar(255) DEFAULT NULL COMMENT '比赛名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `place` varchar(255) DEFAULT NULL COMMENT '活动地点',
  `details` text COMMENT '活动详情',
  `status` int(11) DEFAULT NULL COMMENT '活动状态 1:未开始 2:进行中 3:已结束',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `enroll_deadline` datetime DEFAULT NULL,
  `gender` int(11) DEFAULT '-1' COMMENT '-1:不限，0男，1女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='比赛';

-- ----------------------------
-- Records of race_race
-- ----------------------------
INSERT INTO `race_race` VALUES ('2', '第二届乒乓球比赛-男子组', '1', '2017-11-10 00:00:00', '2017-11-11 00:00:00', '龙洞校区乒乓球室', '', '3', null, null, '2017-12-29 10:20:44', '0');
INSERT INTO `race_race` VALUES ('16', '第二届乒乓球比赛-女子组', '1', '2017-11-10 00:00:00', '2017-11-11 00:00:00', '龙洞校区乒乓球室', null, '2', null, null, '2017-12-29 10:20:44', '1');

-- ----------------------------
-- Table structure for race_round
-- ----------------------------
DROP TABLE IF EXISTS `race_round`;
CREATE TABLE `race_round` (
  `round_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '小局id',
  `host_id` int(11) DEFAULT NULL COMMENT '主场',
  `guest_id` int(11) DEFAULT NULL COMMENT '客场',
  `host_point` int(255) DEFAULT NULL COMMENT '主场得分',
  `guest_point` int(11) DEFAULT NULL COMMENT '客场得分',
  `competition_id` bigint(20) DEFAULT NULL COMMENT '场次',
  `order` int(11) DEFAULT NULL COMMENT '小局顺序',
  PRIMARY KEY (`round_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of race_round
-- ----------------------------
INSERT INTO `race_round` VALUES ('17', '2', '3', '8', '11', '2', '1');
INSERT INTO `race_round` VALUES ('18', '9', '10', '11', '2', '7', '1');
INSERT INTO `race_round` VALUES ('19', '9', '10', '2', '11', '7', '1');
INSERT INTO `race_round` VALUES ('20', '9', '10', '11', '2', '7', '1');
INSERT INTO `race_round` VALUES ('21', '9', '10', '11', '3', '7', '1');
INSERT INTO `race_round` VALUES ('22', '10', '8', '11', '2', '9', '1');
INSERT INTO `race_round` VALUES ('23', '10', '8', '11', '2', '9', '1');
INSERT INTO `race_round` VALUES ('24', '10', '8', '11', '8', '9', '1');
INSERT INTO `race_round` VALUES ('25', '9', '7', '2', '11', '10', '1');
INSERT INTO `race_round` VALUES ('26', '9', '7', '1', '11', '10', '1');
INSERT INTO `race_round` VALUES ('27', '9', '7', '12', '10', '10', '1');
INSERT INTO `race_round` VALUES ('28', '9', '7', '6', '11', '10', '1');
INSERT INTO `race_round` VALUES ('29', '7', '10', '12', '10', '11', '1');
INSERT INTO `race_round` VALUES ('30', '7', '10', '10', '12', '11', '1');
INSERT INTO `race_round` VALUES ('31', '7', '10', '11', '7', '11', '1');
INSERT INTO `race_round` VALUES ('32', '7', '10', '11', '3', '11', '1');
INSERT INTO `race_round` VALUES ('33', '25', '39', '11', '2', '12', '1');
INSERT INTO `race_round` VALUES ('34', '25', '39', '11', '2', '12', '1');
INSERT INTO `race_round` VALUES ('35', '25', '39', '11', '2', '12', '1');
INSERT INTO `race_round` VALUES ('36', '23', '43', '2', '11', '13', '1');
INSERT INTO `race_round` VALUES ('37', '23', '43', '2', '11', '13', '1');
INSERT INTO `race_round` VALUES ('38', '23', '43', '2', '11', '13', '1');
INSERT INTO `race_round` VALUES ('39', '40', '37', '12', '10', '14', '1');
INSERT INTO `race_round` VALUES ('40', '40', '37', '10', '12', '14', '1');
INSERT INTO `race_round` VALUES ('41', '40', '37', '12', '10', '14', '1');
INSERT INTO `race_round` VALUES ('42', '40', '37', '11', '3', '14', '1');
INSERT INTO `race_round` VALUES ('43', '41', '38', '11', '9', '15', '1');
INSERT INTO `race_round` VALUES ('44', '41', '38', '11', '3', '15', '1');
INSERT INTO `race_round` VALUES ('45', '41', '38', '11', '4', '15', '1');
INSERT INTO `race_round` VALUES ('46', '26', '13', '2', '11', '16', '1');
INSERT INTO `race_round` VALUES ('47', '26', '13', '11', '3', '16', '1');
INSERT INTO `race_round` VALUES ('48', '26', '13', '11', '4', '16', '1');
INSERT INTO `race_round` VALUES ('49', '26', '13', '4', '11', '16', '1');
INSERT INTO `race_round` VALUES ('50', '26', '13', '11', '4', '16', '1');
INSERT INTO `race_round` VALUES ('51', '24', '42', '11', '3', '17', '1');
INSERT INTO `race_round` VALUES ('52', '24', '42', '11', '3', '17', '1');
INSERT INTO `race_round` VALUES ('53', '24', '42', '11', '3', '17', '1');
INSERT INTO `race_round` VALUES ('54', '22', '21', '11', '3', '19', '1');
INSERT INTO `race_round` VALUES ('55', '22', '21', '11', '2', '19', '1');
INSERT INTO `race_round` VALUES ('56', '22', '21', '11', '7', '19', '1');
INSERT INTO `race_round` VALUES ('57', '35', '36', '11', '2', '18', '1');
INSERT INTO `race_round` VALUES ('58', '35', '36', '2', '11', '18', '1');
INSERT INTO `race_round` VALUES ('59', '35', '36', '4', '11', '18', '1');
INSERT INTO `race_round` VALUES ('60', '35', '36', '5', '11', '18', '1');
INSERT INTO `race_round` VALUES ('61', '25', '43', '11', '6', '28', '1');
INSERT INTO `race_round` VALUES ('62', '25', '43', '11', '2', '28', '1');
INSERT INTO `race_round` VALUES ('63', '25', '43', '11', '2', '28', '1');
INSERT INTO `race_round` VALUES ('64', '36', '40', '11', '2', '29', '1');
INSERT INTO `race_round` VALUES ('65', '36', '40', '11', '2', '29', '1');
INSERT INTO `race_round` VALUES ('66', '36', '40', '11', '2', '29', '1');
INSERT INTO `race_round` VALUES ('67', '22', '26', '11', '2', '30', '1');
INSERT INTO `race_round` VALUES ('68', '22', '26', '11', '2', '30', '1');
INSERT INTO `race_round` VALUES ('69', '22', '26', '11', '2', '30', '1');
INSERT INTO `race_round` VALUES ('70', '24', '41', '11', '2', '31', '1');
INSERT INTO `race_round` VALUES ('71', '24', '41', '11', '2', '31', '1');
INSERT INTO `race_round` VALUES ('72', '24', '41', '11', '2', '31', '1');
INSERT INTO `race_round` VALUES ('73', '22', '36', '2', '11', '32', '1');
INSERT INTO `race_round` VALUES ('74', '22', '36', '2', '11', '32', '1');
INSERT INTO `race_round` VALUES ('75', '22', '36', '2', '11', '32', '1');
INSERT INTO `race_round` VALUES ('76', '24', '25', '2', '11', '33', '1');
INSERT INTO `race_round` VALUES ('77', '24', '25', '1', '11', '33', '1');
INSERT INTO `race_round` VALUES ('78', '24', '25', '2', '11', '33', '1');

-- ----------------------------
-- Table structure for race_stage
-- ----------------------------
DROP TABLE IF EXISTS `race_stage`;
CREATE TABLE `race_stage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮次id',
  `name` varchar(255) DEFAULT NULL COMMENT '轮次名称',
  `order` int(11) DEFAULT NULL COMMENT '顺序',
  `race_id` int(11) DEFAULT NULL COMMENT '比赛id',
  `status` int(11) DEFAULT NULL COMMENT '1:未开始 2:进行中 3:已结束',
  `type` int(11) DEFAULT NULL COMMENT '1:淘汰赛，2:循环赛，3:小组循环赛',
  `gamesTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='比赛轮次';

-- ----------------------------
-- Records of race_stage
-- ----------------------------
INSERT INTO `race_stage` VALUES ('1', '第一轮', '1', '2', '3', '1', '5');
INSERT INTO `race_stage` VALUES ('4', '第二轮', '2', '2', '3', '1', '5');
INSERT INTO `race_stage` VALUES ('6', '十六进八', '1', '16', '3', '1', '5');
INSERT INTO `race_stage` VALUES ('7', '八进四', '2', '16', '3', '1', '5');
INSERT INTO `race_stage` VALUES ('8', '四进二', '3', '16', '2', '1', '5');
INSERT INTO `race_stage` VALUES ('9', '决赛', '4', '16', '1', '1', '7');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('3', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', null, '2017-11-10 18:40:58');
INSERT INTO `schedule_job` VALUES ('4', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('5', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1074', '2017-11-08 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1582', '2017-11-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2017-11-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1164', '2017-11-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1140', '2017-11-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2017-11-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1030', '2017-11-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2017-11-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1459', '2017-11-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1208', '2017-11-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2017-11-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1125', '2017-11-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1211', '2017-11-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2017-11-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1152', '2017-11-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1186', '2017-11-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1121', '2017-11-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2017-11-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '3', 'testTask', 'test', 'renren', '0', null, '1342', '2017-11-10 18:41:13');
INSERT INTO `schedule_job_log` VALUES ('23', '3', 'testTask', 'test', 'renren', '0', null, '1193', '2017-11-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '3', 'testTask', 'test', 'renren', '0', null, '1173', '2017-11-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '3', 'testTask', 'test', 'renren', '0', null, '1194', '2017-11-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '3', 'testTask', 'test', 'renren', '0', null, '1755', '2017-11-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('29', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-11-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('30', '3', 'testTask', 'test', 'renren', '0', null, '1106', '2017-11-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('31', '3', 'testTask', 'test', 'renren', '0', null, '1391', '2017-11-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('32', '3', 'testTask', 'test', 'renren', '0', null, '1095', '2017-11-11 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('33', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-11-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '3', 'testTask', 'test', 'renren', '0', null, '1153', '2017-11-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '3', 'testTask', 'test', 'renren', '0', null, '1007', '2017-11-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '3', 'testTask', 'test', 'renren', '0', null, '1029', '2017-11-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '3', 'testTask', 'test', 'renren', '0', null, '1011', '2017-11-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '3', 'testTask', 'test', 'renren', '0', null, '1013', '2017-11-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '3', 'testTask', 'test', 'renren', '0', null, '1019', '2017-11-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '3', 'testTask', 'test', 'renren', '0', null, '1015', '2017-11-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '3', 'testTask', 'test', 'renren', '0', null, '1011', '2017-11-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '3', 'testTask', 'test', 'renren', '0', null, '1043', '2017-11-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('46', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-11-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '3', 'testTask', 'test', 'renren', '0', null, '1073', '2017-11-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '3', 'testTask', 'test', 'renren', '0', null, '1142', '2017-11-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '3', 'testTask', 'test', 'renren', '0', null, '1043', '2017-11-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '3', 'testTask', 'test', 'renren', '0', null, '1071', '2017-11-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('51', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('52', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '3', 'testTask', 'test', 'renren', '0', null, '1120', '2017-11-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '3', 'testTask', 'test', 'renren', '0', null, '6255', '2017-11-11 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('55', '3', 'testTask', 'test', 'renren', '0', null, '1029', '2017-11-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '3', 'testTask', 'test', 'renren', '0', null, '1021', '2017-11-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('57', '3', 'testTask', 'test', 'renren', '0', null, '1035', '2017-11-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('58', '3', 'testTask', 'test', 'renren', '0', null, '1486', '2017-11-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('59', '3', 'testTask', 'test', 'renren', '0', null, '1147', '2017-11-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '3', 'testTask', 'test', 'renren', '0', null, '1034', '2017-11-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '3', 'testTask', 'test', 'renren', '0', null, '1153', '2017-11-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '3', 'testTask', 'test', 'renren', '0', null, '1390', '2017-11-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('63', '3', 'testTask', 'test', 'renren', '0', null, '1022', '2017-11-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '3', 'testTask', 'test', 'renren', '0', null, '1014', '2017-11-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '3', 'testTask', 'test', 'renren', '0', null, '1102', '2017-11-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('67', '3', 'testTask', 'test', 'renren', '0', null, '1230', '2017-11-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '3', 'testTask', 'test', 'renren', '0', null, '1075', '2017-11-15 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('69', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-11-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '3', 'testTask', 'test', 'renren', '0', null, '1070', '2017-11-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '3', 'testTask', 'test', 'renren', '0', null, '1014', '2017-11-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '3', 'testTask', 'test', 'renren', '0', null, '1094', '2017-11-16 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('73', '3', 'testTask', 'test', 'renren', '0', null, '1031', '2017-11-16 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('74', '3', 'testTask', 'test', 'renren', '0', null, '1095', '2017-11-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-11-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '3', 'testTask', 'test', 'renren', '0', null, '1153', '2017-11-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '3', 'testTask', 'test', 'renren', '0', null, '1134', '2017-11-16 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-11-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '3', 'testTask', 'test', 'renren', '0', null, '1031', '2017-11-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '3', 'testTask', 'test', 'renren', '0', null, '1061', '2017-11-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '3', 'testTask', 'test', 'renren', '0', null, '1021', '2017-11-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '3', 'testTask', 'test', 'renren', '0', null, '1020', '2017-11-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '3', 'testTask', 'test', 'renren', '0', null, '1026', '2017-11-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '3', 'testTask', 'test', 'renren', '0', null, '1025', '2017-11-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '3', 'testTask', 'test', 'renren', '0', null, '1119', '2017-11-17 12:46:37');
INSERT INTO `schedule_job_log` VALUES ('86', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-11-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('87', '3', 'testTask', 'test', 'renren', '0', null, '1035', '2017-11-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('88', '3', 'testTask', 'test', 'renren', '0', null, '1058', '2017-11-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('89', '3', 'testTask', 'test', 'renren', '0', null, '1007', '2017-11-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('90', '3', 'testTask', 'test', 'renren', '0', null, '1008', '2017-11-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '3', 'testTask', 'test', 'renren', '0', null, '1215', '2017-12-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('92', '3', 'testTask', 'test', 'renren', '0', null, '1019', '2017-12-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('93', '3', 'testTask', 'test', 'renren', '0', null, '1136', '2017-12-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('94', '3', 'testTask', 'test', 'renren', '0', null, '1078', '2017-12-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('95', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('97', '3', 'testTask', 'test', 'renren', '0', null, '1177', '2017-12-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('98', '3', 'testTask', 'test', 'renren', '0', null, '1125', '2017-12-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '3', 'testTask', 'test', 'renren', '0', null, '1016', '2017-12-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('101', '3', 'testTask', 'test', 'renren', '0', null, '1011', '2017-12-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('102', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('103', '3', 'testTask', 'test', 'renren', '0', null, '1011', '2017-12-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('104', '3', 'testTask', 'test', 'renren', '0', null, '1021', '2017-12-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('105', '3', 'testTask', 'test', 'renren', '0', null, '1345', '2017-12-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('106', '3', 'testTask', 'test', 'renren', '0', null, '1132', '2017-12-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('107', '3', 'testTask', 'test', 'renren', '0', null, '1166', '2017-12-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('108', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-14 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('109', '3', 'testTask', 'test', 'renren', '0', null, '1017', '2017-12-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('110', '3', 'testTask', 'test', 'renren', '0', null, '1019', '2017-12-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('111', '3', 'testTask', 'test', 'renren', '0', null, '1042', '2017-12-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '3', 'testTask', 'test', 'renren', '0', null, '1015', '2017-12-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('113', '3', 'testTask', 'test', 'renren', '0', null, '1014', '2017-12-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('114', '3', 'testTask', 'test', 'renren', '0', null, '1104', '2017-12-17 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('115', '3', 'testTask', 'test', 'renren', '0', null, '1044', '2017-12-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('116', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('117', '3', 'testTask', 'test', 'renren', '0', null, '1017', '2017-12-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '3', 'testTask', 'test', 'renren', '0', null, '1022', '2017-12-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('119', '3', 'testTask', 'test', 'renren', '0', null, '1152', '2017-12-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('120', '3', 'testTask', 'test', 'renren', '0', null, '1246', '2017-12-21 08:19:07');
INSERT INTO `schedule_job_log` VALUES ('121', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('122', '3', 'testTask', 'test', 'renren', '0', null, '4231', '2017-12-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('123', '4', 'testTask', 'test', 'renren', '0', null, '3928', '2017-12-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('124', '3', 'testTask', 'test', 'renren', '0', null, '1248', '2017-12-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('125', '4', 'testTask', 'test', 'renren', '0', null, '1140', '2017-12-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '4', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '3', 'testTask', 'test', 'renren', '0', null, '1132', '2017-12-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('128', '4', 'testTask', 'test', 'renren', '0', null, '1113', '2017-12-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('129', '3', 'testTask', 'test', 'renren', '0', null, '1215', '2017-12-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '4', 'testTask', 'test', 'renren', '0', null, '1004', '2017-12-26 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('132', '3', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '4', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('134', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '4', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-26 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('136', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '4', 'testTask', 'test', 'renren', '0', null, '1008', '2017-12-26 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('138', '3', 'testTask', 'test', 'renren', '0', null, '1003', '2017-12-26 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '4', 'testTask', 'test', 'renren', '0', null, '1004', '2017-12-26 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('140', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-12-26 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '4', 'testTask', 'test', 'renren', '0', null, '1016', '2017-12-26 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('142', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '4', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-26 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('144', '3', 'testTask', 'test', 'renren', '0', null, '1004', '2017-12-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '4', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('146', '3', 'testTask', 'test', 'renren', '0', null, '1004', '2017-12-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '4', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-26 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('148', '3', 'testTask', 'test', 'renren', '0', null, '1027', '2017-12-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('149', '4', 'testTask', 'test', 'renren', '0', null, '1123', '2017-12-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('150', '4', 'testTask', 'test', 'renren', '0', null, '1041', '2017-12-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('151', '3', 'testTask', 'test', 'renren', '0', null, '1125', '2017-12-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('152', '4', 'testTask', 'test', 'renren', '0', null, '1155', '2017-12-26 11:00:02');
INSERT INTO `schedule_job_log` VALUES ('153', '3', 'testTask', 'test', 'renren', '0', null, '1271', '2017-12-26 11:00:02');
INSERT INTO `schedule_job_log` VALUES ('154', '3', 'testTask', 'test', 'renren', '0', null, '1048', '2017-12-26 12:31:42');
INSERT INTO `schedule_job_log` VALUES ('155', '3', 'testTask', 'test', 'renren', '0', null, '1125', '2017-12-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('156', '4', 'testTask', 'test', 'renren', '0', null, '1105', '2017-12-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '3', 'testTask', 'test', 'renren', '0', null, '1061', '2017-12-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '4', 'testTask', 'test', 'renren', '0', null, '1058', '2017-12-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('159', '3', 'testTask', 'test', 'renren', '0', null, '1046', '2017-12-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('160', '4', 'testTask', 'test', 'renren', '0', null, '1008', '2017-12-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '3', 'testTask', 'test', 'renren', '0', null, '1055', '2017-12-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '4', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('163', '3', 'testTask', 'test', 'renren', '0', null, '1221', '2017-12-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('164', '4', 'testTask', 'test', 'renren', '0', null, '1205', '2017-12-26 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('165', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-12-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '4', 'testTask', 'test', 'renren', '0', null, '1015', '2017-12-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('167', '4', 'testTask', 'test', 'renren', '0', null, '1028', '2017-12-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('168', '3', 'testTask', 'test', 'renren', '0', null, '1157', '2017-12-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '3', 'testTask', 'test', 'renren', '0', null, '1276', '2017-12-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('170', '4', 'testTask', 'test', 'renren', '0', null, '1150', '2017-12-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '3', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '4', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('173', '3', 'testTask', 'test', 'renren', '0', null, '1185', '2017-12-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('174', '4', 'testTask', 'test', 'renren', '0', null, '1180', '2017-12-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('175', '3', 'testTask', 'test', 'renren', '0', null, '1145', '2017-12-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('176', '4', 'testTask', 'test', 'renren', '0', null, '1130', '2017-12-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('177', '3', 'testTask', 'test', 'renren', '0', null, '1069', '2017-12-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '4', 'testTask', 'test', 'renren', '0', null, '1027', '2017-12-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('179', '3', 'testTask', 'test', 'renren', '0', null, '1063', '2017-12-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('180', '4', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('181', '3', 'testTask', 'test', 'renren', '0', null, '1099', '2017-12-26 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('182', '4', 'testTask', 'test', 'renren', '0', null, '1015', '2017-12-26 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('183', '3', 'testTask', 'test', 'renren', '0', null, '1113', '2017-12-26 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '4', 'testTask', 'test', 'renren', '0', null, '1225', '2017-12-26 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('185', '4', 'testTask', 'test', 'renren', '0', null, '1122', '2017-12-27 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('186', '3', 'testTask', 'test', 'renren', '0', null, '1223', '2017-12-27 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('187', '3', 'testTask', 'test', 'renren', '0', null, '1286', '2017-12-27 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '4', 'testTask', 'test', 'renren', '0', null, '1185', '2017-12-27 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('189', '3', 'testTask', 'test', 'renren', '0', null, '1207', '2017-12-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('190', '4', 'testTask', 'test', 'renren', '0', null, '1025', '2017-12-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('191', '3', 'testTask', 'test', 'renren', '0', null, '1275', '2017-12-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('192', '4', 'testTask', 'test', 'renren', '0', null, '1361', '2017-12-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('193', '3', 'testTask', 'test', 'renren', '0', null, '1059', '2017-12-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('194', '4', 'testTask', 'test', 'renren', '0', null, '1009', '2017-12-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('195', '3', 'testTask', 'test', 'renren', '0', null, '1037', '2017-12-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '4', 'testTask', 'test', 'renren', '0', null, '1015', '2017-12-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('197', '3', 'testTask', 'test', 'renren', '0', null, '1285', '2017-12-27 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('198', '4', 'testTask', 'test', 'renren', '0', null, '1034', '2017-12-27 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('199', '4', 'testTask', 'test', 'renren', '0', null, '1012', '2017-12-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '3', 'testTask', 'test', 'renren', '0', null, '1112', '2017-12-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('201', '3', 'testTask', 'test', 'renren', '0', null, '1066', '2017-12-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('202', '4', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-27 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('203', '3', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('204', '4', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('205', '3', 'testTask', 'test', 'renren', '0', null, '1009', '2017-12-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('206', '4', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '4', 'testTask', 'test', 'renren', '0', null, '1005', '2017-12-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('209', '3', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('210', '4', 'testTask', 'test', 'renren', '0', null, '1008', '2017-12-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('211', '3', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('212', '4', 'testTask', 'test', 'renren', '0', null, '1007', '2017-12-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('213', '3', 'testTask', 'test', 'renren', '0', null, '1055', '2017-12-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('214', '4', 'testTask', 'test', 'renren', '0', null, '1020', '2017-12-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('215', '3', 'testTask', 'test', 'renren', '0', null, '1017', '2017-12-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('216', '4', 'testTask', 'test', 'renren', '0', null, '1017', '2017-12-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('217', '3', 'testTask', 'test', 'renren', '0', null, '1033', '2017-12-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('218', '4', 'testTask', 'test', 'renren', '0', null, '1018', '2017-12-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('219', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('220', '4', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('221', '3', 'testTask', 'test', 'renren', '0', null, '1010', '2017-12-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('222', '4', 'testTask', 'test', 'renren', '0', null, '1020', '2017-12-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('223', '3', 'testTask', 'test', 'renren', '0', null, '1024', '2017-12-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('224', '4', 'testTask', 'test', 'renren', '0', null, '1006', '2017-12-27 23:00:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '注册用户', '9', '0');
INSERT INTO `sys_dept` VALUES ('7', '0', '组委会', '1', '0');
INSERT INTO `sys_dept` VALUES ('8', '7', '裁判组', '0', '0');
INSERT INTO `sys_dept` VALUES ('9', '7', '策划组', '0', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"会员管理\",\"type\":0,\"orderNum\":0}', '52', '0:0:0:0:0:0:0:1', '2017-11-08 21:26:19');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"会员列表\",\"url\":\"modules/registeredUser/list.html\",\"perms\":\"registeredUser:list\",\"type\":1,\"orderNum\":0}', '71', '0:0:0:0:0:0:0:1', '2017-11-08 21:32:15');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":37,\"parentId\":36,\"parentName\":\"会员管理\",\"name\":\"会员列表\",\"url\":\"modules/registeredUser/list.html\",\"perms\":\"registeredUser:list\",\"type\":1,\"orderNum\":0}', '91', '0:0:0:0:0:0:0:1', '2017-11-08 21:32:50');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"apandi\",\"password\":\"85e02e38d2bfe2909ba766c5ac969e7e14ed1f80bf70382be6701f9b7d67404c\",\"salt\":\"vBXj1vnxsS3OPPKynFZl\",\"email\":\"baiyunfeiii@foxmail.com\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 8, 2017 10:59:56 PM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '186', '0:0:0:0:0:0:0:1', '2017-11-08 22:59:57');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"apandi\",\"salt\":\"vBXj1vnxsS3OPPKynFZl\",\"email\":\"baiyunfeiii@foxmail.com\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 8, 2017 10:59:56 PM\",\"deptId\":6,\"deptName\":\"注册用户\"}', '81', '0:0:0:0:0:0:0:1', '2017-11-08 23:00:22');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"比赛管理\",\"perms\":\"\",\"type\":0,\"orderNum\":2}', '51', '0:0:0:0:0:0:0:1', '2017-11-10 14:21:38');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":43,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛管理\",\"url\":\"modules/generator/race.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '85', '0:0:0:0:0:0:0:1', '2017-11-10 14:22:22');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":48,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛分类\",\"url\":\"modules/generator/category.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '69', '0:0:0:0:0:0:0:1', '2017-11-10 14:22:52');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除定时任务', 'edu.gdut.imis.byf3114004859.modules.job.controller.ScheduleJobController.delete()', '[1,2]', '512', '0:0:0:0:0:0:0:1', '2017-11-10 18:40:12');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存定时任务', 'edu.gdut.imis.byf3114004859.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test\",\"params\":\"renren\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"createTime\":\"Nov 10, 2017 6:40:57 PM\"}', '808', '0:0:0:0:0:0:0:1', '2017-11-10 18:40:58');
INSERT INTO `sys_log` VALUES ('11', 'admin', '立即执行任务', 'edu.gdut.imis.byf3114004859.modules.job.controller.ScheduleJobController.run()', '[3]', '138', '0:0:0:0:0:0:0:1', '2017-11-10 18:41:13');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"成员管理\",\"type\":0,\"orderNum\":0}', '85', '0:0:0:0:0:0:0:1', '2017-11-15 22:22:44');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"管理员管理\",\"url\":\"modules/sys/user.html\",\"type\":1,\"icon\":\"fa fa-user\",\"orderNum\":1}', '135', '0:0:0:0:0:0:0:1', '2017-11-15 22:23:09');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"部门管理\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '78', '0:0:0:0:0:0:0:1', '2017-11-15 22:23:19');
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":38,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"注册会员管理\",\"url\":\"modules/sys/registeduser.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '74', '0:0:0:0:0:0:0:1', '2017-11-15 22:23:31');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"负责人\",\"deptId\":7,\"deptName\":\"组委会\",\"menuIdList\":[59,2,15,16,17,18,31,32,33,34,35,38,39,40,41,42,53,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58],\"deptIdList\":[7,8,9,6],\"createTime\":\"Nov 15, 2017 10:24:54 PM\"}', '924', '0:0:0:0:0:0:0:1', '2017-11-15 22:24:55');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"裁判员\",\"deptId\":8,\"deptName\":\"裁判组\",\"menuIdList\":[59,38,39,53,43,44,48,49,54,55,56,57,58],\"deptIdList\":[9],\"createTime\":\"Nov 15, 2017 10:26:35 PM\"}', '82', '0:0:0:0:0:0:0:1', '2017-11-15 22:26:36');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"组织成员列表\",\"url\":\"modules/sys/user.html\",\"type\":1,\"icon\":\"fa fa-user\",\"orderNum\":1}', '69', '0:0:0:0:0:0:0:1', '2017-11-16 18:52:03');
INSERT INTO `sys_log` VALUES ('19', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"注册会员\",\"deptId\":1,\"deptName\":\"注册用户\",\"menuIdList\":[],\"deptIdList\":[1],\"createTime\":\"Nov 16, 2017 7:01:20 PM\"}', '61', '0:0:0:0:0:0:0:1', '2017-11-16 19:01:21');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"负责人\",\"deptId\":7,\"deptName\":\"组委会\",\"menuIdList\":[59,2,15,16,17,18,31,32,33,34,35,38,39,40,41,42,53,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58],\"deptIdList\":[7,8,9],\"createTime\":\"Nov 15, 2017 10:24:54 PM\"}', '111', '0:0:0:0:0:0:0:1', '2017-11-16 19:02:57');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"judge01\",\"password\":\"494cc3c07ed3cc6b263e46e43ea97a2cdb9780502393fc32471006f45c602c5f\",\"salt\":\"e6Y2sWf9vwf9ELAlkFxu\",\"email\":\"judge01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Nov 16, 2017 7:35:55 PM\",\"deptId\":8,\"deptName\":\"裁判组\"}', '1946', '0:0:0:0:0:0:0:1', '2017-11-16 19:35:56');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"admin@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":7,\"deptName\":\"组委会\"}', '81', '0:0:0:0:0:0:0:1', '2017-11-16 19:36:18');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":59,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"成员管理\",\"type\":0,\"icon\":\"users\",\"orderNum\":0}', '72', '0:0:0:0:0:0:0:1', '2017-11-16 21:30:25');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":59,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"成员管理\",\"type\":0,\"icon\":\"fa fa-users\",\"orderNum\":0}', '77', '0:0:0:0:0:0:0:1', '2017-11-16 21:32:12');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"部门管理\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-address-book\",\"orderNum\":1}', '74', '0:0:0:0:0:0:0:1', '2017-11-16 21:33:14');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":38,\"parentId\":59,\"parentName\":\"成员管理\",\"name\":\"注册会员管理\",\"url\":\"modules/sys/registeduser.html\",\"type\":1,\"icon\":\"fa fa-user-circle-o\",\"orderNum\":6}', '82', '0:0:0:0:0:0:0:1', '2017-11-16 21:33:45');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":53,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"比赛管理\",\"perms\":\"\",\"type\":0,\"icon\":\"fa fa-dribbble\",\"orderNum\":2}', '79', '0:0:0:0:0:0:0:1', '2017-11-16 21:35:28');
INSERT INTO `sys_log` VALUES ('28', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":43,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛管理\",\"url\":\"modules/race/race.html\",\"type\":1,\"icon\":\"fa fa-dribbble\",\"orderNum\":6}', '69', '0:0:0:0:0:0:0:1', '2017-11-16 21:35:58');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":48,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛分类\",\"url\":\"modules/race/category.html\",\"type\":1,\"icon\":\"fa fa-list\",\"orderNum\":6}', '70', '0:0:0:0:0:0:0:1', '2017-11-16 21:36:37');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":54,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛轮次\",\"url\":\"modules/race/stage.html\",\"type\":1,\"icon\":\"fa fa-circle-o-notch\",\"orderNum\":6}', '76', '0:0:0:0:0:0:0:1', '2017-11-16 21:38:06');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":9}', '79', '0:0:0:0:0:0:0:1', '2017-11-16 21:38:33');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.save()', '{\"userId\":4,\"username\":\"plan01\",\"password\":\"f74035b508576ae235c5a882e93e1225d74dbdb88d8d93bfb9494da4dc527a78\",\"salt\":\"IdoM739cjzyvEopdsPV7\",\"email\":\"plan01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 17, 2017 1:49:27 PM\",\"deptId\":9,\"deptName\":\"策划组\"}', '726', '0:0:0:0:0:0:0:1', '2017-11-17 13:49:27');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"judge01\",\"password\":\"29ff20c18f3c9e6f738bda489940992129b4cfe49fc4bf789f9aa743e23befdf\",\"salt\":\"e6Y2sWf9vwf9ELAlkFxu\",\"email\":\"judge01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Nov 16, 2017 7:35:56 PM\",\"deptId\":8,\"deptName\":\"裁判组\"}', '113', '0:0:0:0:0:0:0:1', '2017-11-17 13:50:42');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"策划组员\",\"deptId\":9,\"deptName\":\"策划组\",\"menuIdList\":[53,43,44,45,46,48,49,50,51,52,54,55],\"deptIdList\":[],\"createTime\":\"Nov 17, 2017 1:52:00 PM\"}', '208', '0:0:0:0:0:0:0:1', '2017-11-17 13:52:01');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":5,\"roleName\":\"组长\",\"deptId\":7,\"deptName\":\"组委会\",\"menuIdList\":[59,2,15,16,17,18],\"deptIdList\":[],\"createTime\":\"Nov 17, 2017 1:52:33 PM\"}', '81', '0:0:0:0:0:0:0:1', '2017-11-17 13:52:34');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"plan01\",\"salt\":\"IdoM739cjzyvEopdsPV7\",\"email\":\"plan01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[4,5],\"createTime\":\"Nov 17, 2017 1:49:27 PM\",\"deptId\":9,\"deptName\":\"策划组\"}', '84', '0:0:0:0:0:0:0:1', '2017-11-17 13:52:47');
INSERT INTO `sys_log` VALUES ('37', 'admin', '修改用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"plan01\",\"password\":\"978fd66604ceba11e6eee0f51cbedba704e80f9dcc04771e02258a6cf6715aa7\",\"salt\":\"IdoM739cjzyvEopdsPV7\",\"email\":\"plan01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[4,5],\"createTime\":\"Nov 17, 2017 1:49:27 PM\",\"deptId\":9,\"deptName\":\"策划组\"}', '52', '0:0:0:0:0:0:0:1', '2017-11-17 13:52:59');
INSERT INTO `sys_log` VALUES ('38', 'admin', '修改用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"judge01\",\"salt\":\"e6Y2sWf9vwf9ELAlkFxu\",\"email\":\"judge01@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[2,5],\"createTime\":\"Nov 16, 2017 7:35:56 PM\",\"deptId\":8,\"deptName\":\"裁判组\"}', '82', '0:0:0:0:0:0:0:1', '2017-11-17 13:53:04');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"报名参赛\",\"type\":0,\"icon\":\"fa fa-dribbble\",\"orderNum\":0}', '91', '0:0:0:0:0:0:0:1', '2017-11-17 13:54:40');
INSERT INTO `sys_log` VALUES ('40', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":60,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"报名参赛\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-dribbble\",\"orderNum\":0}', '85', '0:0:0:0:0:0:0:1', '2017-11-17 13:55:24');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"我的比赛\",\"type\":0,\"icon\":\"fa fa-user-o\",\"orderNum\":0}', '80', '0:0:0:0:0:0:0:1', '2017-11-17 13:55:49');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.save()', '{\"parentId\":61,\"parentName\":\"我的比赛\",\"name\":\"我报名的比赛\",\"url\":\"#\",\"type\":1,\"icon\":\"fa fa-dribbble\",\"orderNum\":0}', '72', '0:0:0:0:0:0:0:1', '2017-11-17 13:56:22');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.save()', '{\"parentId\":61,\"parentName\":\"我的比赛\",\"name\":\"我的成绩\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', '82', '0:0:0:0:0:0:0:1', '2017-11-17 13:56:42');
INSERT INTO `sys_log` VALUES ('44', 'admin', '修改角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"注册会员\",\"deptId\":1,\"deptName\":\"注册用户\",\"menuIdList\":[60,61,62,63],\"deptIdList\":[1],\"createTime\":\"Nov 16, 2017 7:01:21 PM\"}', '114', '0:0:0:0:0:0:0:1', '2017-11-17 13:57:39');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.save()', '{\"userId\":5,\"username\":\"president\",\"password\":\"b88ee188e1432859af6285279391848b2b0f12e54f20d9ac231c0704595d41bc\",\"salt\":\"1oNDaNMfWA1bx6gDlWhZ\",\"email\":\"president@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 17, 2017 2:02:29 PM\",\"deptId\":7,\"deptName\":\"组委会\"}', '41', '0:0:0:0:0:0:0:1', '2017-11-17 14:02:29');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存用户', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController.save()', '{\"userId\":6,\"username\":\"manager\",\"password\":\"5b01838e8d9df92f2f0834a54fef3b96785c7cc3bd80d108ecf1a486edb1d651\",\"salt\":\"CpdvEjpNpNvBYc4HhS4R\",\"email\":\"manager@cooode.cn\",\"mobile\":\"15626299517\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 17, 2017 2:24:12 PM\",\"deptId\":7,\"deptName\":\"组委会\"}', '112', '0:0:0:0:0:0:0:1', '2017-11-17 14:24:13');
INSERT INTO `sys_log` VALUES ('47', 'admin', '保存角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.save()', '{\"roleId\":6,\"roleName\":\"系统管理员\",\"deptId\":7,\"deptName\":\"组委会\",\"menuIdList\":[59,2,15,16,17,18,31,32,33,34,35,38,39,40,41,42,53,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58,1,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,28],\"deptIdList\":[],\"createTime\":\"Nov 17, 2017 2:24:52 PM\"}', '104', '0:0:0:0:0:0:0:1', '2017-11-17 14:24:52');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.update()', '{\"menuId\":64,\"parentId\":53,\"parentName\":\"比赛管理\",\"name\":\"比赛场次\",\"url\":\"modules/race/competition.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '44', '0:0:0:0:0:0:0:1', '2017-12-12 11:02:30');
INSERT INTO `sys_log` VALUES ('49', 'admin', '修改角色', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"注册会员\",\"deptId\":1,\"deptName\":\"注册用户\",\"menuIdList\":[60,90,61,62,63,89,91],\"deptIdList\":[1],\"createTime\":\"Nov 16, 2017 7:01:21 PM\"}', '777', '0:0:0:0:0:0:0:1', '2017-12-27 11:36:56');
INSERT INTO `sys_log` VALUES ('50', 'admin', '删除菜单', 'edu.gdut.imis.byf3114004859.modules.sys.controller.SysMenuController.delete()', '79', '7', '0:0:0:0:0:0:0:1', '2017-12-27 15:25:53');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '9');
INSERT INTO `sys_menu` VALUES ('2', '59', '组织成员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'modules/gen/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '8');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '59', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-address-book', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '59', '注册会员管理', 'modules/sys/registeduser.html', null, '1', 'fa fa-user-circle-o', '6');
INSERT INTO `sys_menu` VALUES ('39', '38', '查看', null, 'registeduser:list,registeduser:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '38', '新增', null, 'registeduser:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '38', '修改', null, 'registeduser:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('42', '38', '删除', null, 'registeduser:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '53', '比赛管理', 'modules/race/race.html', null, '1', 'fa fa-dribbble', '6');
INSERT INTO `sys_menu` VALUES ('44', '43', '查看', null, 'race:race:list,race:race:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '43', '新增', null, 'race:race:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '43', '修改', null, 'race:race:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('47', '43', '删除', null, 'race:race:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '53', '比赛分类', 'modules/race/category.html', null, '1', 'fa fa-list', '6');
INSERT INTO `sys_menu` VALUES ('49', '48', '查看', null, 'race:category:list,race:category:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '48', '新增', null, 'race:category:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '48', '修改', null, 'race:category:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '48', '删除', null, 'race:category:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('53', '0', '比赛管理', null, '', '0', 'fa fa-dribbble', '2');
INSERT INTO `sys_menu` VALUES ('54', '53', '比赛轮次', 'modules/race/stage.html', null, '1', 'fa fa-circle-o-notch', '6');
INSERT INTO `sys_menu` VALUES ('55', '54', '查看', null, 'race:stage:list,race:stage:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '54', '新增', null, 'race:stage:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('57', '54', '修改', null, 'race:stage:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('58', '54', '删除', null, 'race:stage:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '0', '成员管理', null, null, '0', 'fa fa-users', '0');
INSERT INTO `sys_menu` VALUES ('60', '0', '报名参赛', 'modules/race/enroll_raceList.html', '', '1', 'fa fa-dribbble', '0');
INSERT INTO `sys_menu` VALUES ('61', '0', '我的比赛', null, null, '0', 'fa fa-user-o', '0');
INSERT INTO `sys_menu` VALUES ('62', '61', '我报名的比赛', 'modules/race/enroll_user.html', null, '1', 'fa fa-dribbble', '0');
INSERT INTO `sys_menu` VALUES ('63', '61', '我的成绩', 'main.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '53', '比赛场次', 'modules/race/competition.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('65', '64', '查看', null, 'competition:list,competition:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('66', '64', '新增', null, 'competition:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('67', '64', '修改', null, 'competition:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('68', '64', '删除', null, 'competition:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('69', '1', '成绩表', 'modules/race/point.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('70', '69', '查看', null, 'point:list,point:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('71', '69', '新增', null, 'point:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('72', '69', '修改', null, 'point:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('73', '69', '删除', null, 'point:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('74', '1', '场地', 'modules/race/ground.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('75', '74', '查看', null, 'ground:list,ground:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('76', '74', '新增', null, 'ground:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('77', '74', '修改', null, 'ground:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('78', '74', '删除', null, 'ground:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('79', '53', '小局管理', 'modules/race/round.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('80', '79', '查看', null, 'round:list,round:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('81', '79', '新增', null, 'round:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('82', '79', '修改', null, 'round:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('83', '79', '删除', null, 'round:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('89', '61', '查看已报名比赛', null, 'guest:enroll:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '60', '新增已报名比赛', null, 'guest:enroll:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('91', '61', '删除已报名比赛', null, 'guest:enroll:delete', '2', null, '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_registed_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_registed_user`;
CREATE TABLE `sys_registed_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '注册用户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '对应的系统用户id',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `institute` varchar(255) DEFAULT NULL COMMENT '学院',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `className` varchar(255) DEFAULT NULL COMMENT '班级名称',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_registed_user
-- ----------------------------
INSERT INTO `sys_registed_user` VALUES ('1', '2', '白云飞已被注册', '白云飞', '广东工业大学', '管理学院', '信息管理与信息系统', '2014', '14信管1班', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '负责人', null, '7', '2017-11-15 22:24:54');
INSERT INTO `sys_role` VALUES ('2', '裁判员', null, '8', '2017-11-15 22:26:36');
INSERT INTO `sys_role` VALUES ('3', '注册会员', null, '1', '2017-11-16 19:01:21');
INSERT INTO `sys_role` VALUES ('4', '策划组员', null, '9', '2017-11-17 13:52:00');
INSERT INTO `sys_role` VALUES ('5', '组长', null, '7', '2017-11-17 13:52:34');
INSERT INTO `sys_role` VALUES ('6', '系统管理员', null, '7', '2017-11-17 14:24:52');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('5', '2', '9');
INSERT INTO `sys_role_dept` VALUES ('7', '1', '7');
INSERT INTO `sys_role_dept` VALUES ('8', '1', '8');
INSERT INTO `sys_role_dept` VALUES ('9', '1', '9');
INSERT INTO `sys_role_dept` VALUES ('11', '3', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('33', '2', '59');
INSERT INTO `sys_role_menu` VALUES ('34', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('35', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('36', '2', '53');
INSERT INTO `sys_role_menu` VALUES ('37', '2', '43');
INSERT INTO `sys_role_menu` VALUES ('38', '2', '44');
INSERT INTO `sys_role_menu` VALUES ('39', '2', '48');
INSERT INTO `sys_role_menu` VALUES ('40', '2', '49');
INSERT INTO `sys_role_menu` VALUES ('41', '2', '54');
INSERT INTO `sys_role_menu` VALUES ('42', '2', '55');
INSERT INTO `sys_role_menu` VALUES ('43', '2', '56');
INSERT INTO `sys_role_menu` VALUES ('44', '2', '57');
INSERT INTO `sys_role_menu` VALUES ('45', '2', '58');
INSERT INTO `sys_role_menu` VALUES ('46', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('47', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('48', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('49', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('50', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('51', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('55', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('56', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('57', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('58', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('59', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('60', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('61', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('62', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('63', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('64', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('65', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('66', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('67', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('68', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('69', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('70', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('71', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('72', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('73', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('74', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('75', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('76', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('77', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('78', '4', '53');
INSERT INTO `sys_role_menu` VALUES ('79', '4', '43');
INSERT INTO `sys_role_menu` VALUES ('80', '4', '44');
INSERT INTO `sys_role_menu` VALUES ('81', '4', '45');
INSERT INTO `sys_role_menu` VALUES ('82', '4', '46');
INSERT INTO `sys_role_menu` VALUES ('83', '4', '48');
INSERT INTO `sys_role_menu` VALUES ('84', '4', '49');
INSERT INTO `sys_role_menu` VALUES ('85', '4', '50');
INSERT INTO `sys_role_menu` VALUES ('86', '4', '51');
INSERT INTO `sys_role_menu` VALUES ('87', '4', '52');
INSERT INTO `sys_role_menu` VALUES ('88', '4', '54');
INSERT INTO `sys_role_menu` VALUES ('89', '4', '55');
INSERT INTO `sys_role_menu` VALUES ('90', '5', '59');
INSERT INTO `sys_role_menu` VALUES ('91', '5', '2');
INSERT INTO `sys_role_menu` VALUES ('92', '5', '15');
INSERT INTO `sys_role_menu` VALUES ('93', '5', '16');
INSERT INTO `sys_role_menu` VALUES ('94', '5', '17');
INSERT INTO `sys_role_menu` VALUES ('95', '5', '18');
INSERT INTO `sys_role_menu` VALUES ('100', '6', '59');
INSERT INTO `sys_role_menu` VALUES ('101', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('102', '6', '15');
INSERT INTO `sys_role_menu` VALUES ('103', '6', '16');
INSERT INTO `sys_role_menu` VALUES ('104', '6', '17');
INSERT INTO `sys_role_menu` VALUES ('105', '6', '18');
INSERT INTO `sys_role_menu` VALUES ('106', '6', '31');
INSERT INTO `sys_role_menu` VALUES ('107', '6', '32');
INSERT INTO `sys_role_menu` VALUES ('108', '6', '33');
INSERT INTO `sys_role_menu` VALUES ('109', '6', '34');
INSERT INTO `sys_role_menu` VALUES ('110', '6', '35');
INSERT INTO `sys_role_menu` VALUES ('111', '6', '38');
INSERT INTO `sys_role_menu` VALUES ('112', '6', '39');
INSERT INTO `sys_role_menu` VALUES ('113', '6', '40');
INSERT INTO `sys_role_menu` VALUES ('114', '6', '41');
INSERT INTO `sys_role_menu` VALUES ('115', '6', '42');
INSERT INTO `sys_role_menu` VALUES ('116', '6', '53');
INSERT INTO `sys_role_menu` VALUES ('117', '6', '43');
INSERT INTO `sys_role_menu` VALUES ('118', '6', '44');
INSERT INTO `sys_role_menu` VALUES ('119', '6', '45');
INSERT INTO `sys_role_menu` VALUES ('120', '6', '46');
INSERT INTO `sys_role_menu` VALUES ('121', '6', '47');
INSERT INTO `sys_role_menu` VALUES ('122', '6', '48');
INSERT INTO `sys_role_menu` VALUES ('123', '6', '49');
INSERT INTO `sys_role_menu` VALUES ('124', '6', '50');
INSERT INTO `sys_role_menu` VALUES ('125', '6', '51');
INSERT INTO `sys_role_menu` VALUES ('126', '6', '52');
INSERT INTO `sys_role_menu` VALUES ('127', '6', '54');
INSERT INTO `sys_role_menu` VALUES ('128', '6', '55');
INSERT INTO `sys_role_menu` VALUES ('129', '6', '56');
INSERT INTO `sys_role_menu` VALUES ('130', '6', '57');
INSERT INTO `sys_role_menu` VALUES ('131', '6', '58');
INSERT INTO `sys_role_menu` VALUES ('132', '6', '1');
INSERT INTO `sys_role_menu` VALUES ('133', '6', '3');
INSERT INTO `sys_role_menu` VALUES ('134', '6', '19');
INSERT INTO `sys_role_menu` VALUES ('135', '6', '20');
INSERT INTO `sys_role_menu` VALUES ('136', '6', '21');
INSERT INTO `sys_role_menu` VALUES ('137', '6', '22');
INSERT INTO `sys_role_menu` VALUES ('138', '6', '4');
INSERT INTO `sys_role_menu` VALUES ('139', '6', '23');
INSERT INTO `sys_role_menu` VALUES ('140', '6', '24');
INSERT INTO `sys_role_menu` VALUES ('141', '6', '25');
INSERT INTO `sys_role_menu` VALUES ('142', '6', '26');
INSERT INTO `sys_role_menu` VALUES ('143', '6', '5');
INSERT INTO `sys_role_menu` VALUES ('144', '6', '6');
INSERT INTO `sys_role_menu` VALUES ('145', '6', '7');
INSERT INTO `sys_role_menu` VALUES ('146', '6', '8');
INSERT INTO `sys_role_menu` VALUES ('147', '6', '9');
INSERT INTO `sys_role_menu` VALUES ('148', '6', '10');
INSERT INTO `sys_role_menu` VALUES ('149', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('150', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('151', '6', '13');
INSERT INTO `sys_role_menu` VALUES ('152', '6', '14');
INSERT INTO `sys_role_menu` VALUES ('153', '6', '27');
INSERT INTO `sys_role_menu` VALUES ('154', '6', '30');
INSERT INTO `sys_role_menu` VALUES ('155', '6', '29');
INSERT INTO `sys_role_menu` VALUES ('156', '6', '28');
INSERT INTO `sys_role_menu` VALUES ('157', '3', '60');
INSERT INTO `sys_role_menu` VALUES ('158', '3', '90');
INSERT INTO `sys_role_menu` VALUES ('159', '3', '61');
INSERT INTO `sys_role_menu` VALUES ('160', '3', '62');
INSERT INTO `sys_role_menu` VALUES ('161', '3', '63');
INSERT INTO `sys_role_menu` VALUES ('162', '3', '89');
INSERT INTO `sys_role_menu` VALUES ('163', '3', '91');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '0男，1女',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'admin@cooode.cn', '15626299517', '1', '7', '2016-11-11 11:11:11', null, '白云飞', '0');
INSERT INTO `sys_user` VALUES ('2', 'apandi', '85e02e38d2bfe2909ba766c5ac969e7e14ed1f80bf70382be6701f9b7d67404c', 'vBXj1vnxsS3OPPKynFZl', 'baiyunfeiii@foxmail.com', '15626299517', '1', '1', '2017-11-08 22:59:56', null, '运动员2', '0');
INSERT INTO `sys_user` VALUES ('3', 'judge01', '29ff20c18f3c9e6f738bda489940992129b4cfe49fc4bf789f9aa743e23befdf', 'e6Y2sWf9vwf9ELAlkFxu', 'judge01@cooode.cn', '15626299517', '1', '8', '2017-11-16 19:35:56', null, null, '0');
INSERT INTO `sys_user` VALUES ('4', 'plan01', '978fd66604ceba11e6eee0f51cbedba704e80f9dcc04771e02258a6cf6715aa7', 'IdoM739cjzyvEopdsPV7', 'plan01@cooode.cn', '15626299517', '1', '9', '2017-11-17 13:49:27', null, null, '1');
INSERT INTO `sys_user` VALUES ('5', 'president', 'b88ee188e1432859af6285279391848b2b0f12e54f20d9ac231c0704595d41bc', '1oNDaNMfWA1bx6gDlWhZ', 'president@cooode.cn', '15626299517', '1', '7', '2017-11-17 14:02:29', null, null, '1');
INSERT INTO `sys_user` VALUES ('6', 'manager', '5b01838e8d9df92f2f0834a54fef3b96785c7cc3bd80d108ecf1a486edb1d651', 'CpdvEjpNpNvBYc4HhS4R', 'manager@cooode.cn', '15626299517', '1', '7', '2017-11-17 14:24:13', null, null, '1');
INSERT INTO `sys_user` VALUES ('7', 'player1', 'b8a6fe2da29e06c1e1e47422b5ac7247bef1fcbad07c44acb9fc4b4fdc5e557b', 'bVAEEvuvYoe4EYWqzZY1', 'player1@cooode.cn', '13311111111', '1', '1', '2017-12-26 17:44:28', null, '运动员男1', '0');
INSERT INTO `sys_user` VALUES ('8', 'player2', '8eaa37adf27f1acc0ce004d181563c9aec5cf4c24fcb99575217bc219af06830', 'BCYQ5mgjIN2JC91CFM8o', 'player2@cooode.cn', '13322222222', '1', '1', '2017-12-26 17:55:11', null, '运动员男2', '0');
INSERT INTO `sys_user` VALUES ('9', 'player3', '59aa093f02b2362018a3507f431671afa5c6c7b5aca1df7078c278616a4df556', 'VqHvat9ZqjIQ1Vl7xEJo', 'player3@cooode.cn', '13333333333', '1', '1', '2017-12-26 18:02:17', null, '运动员男3', '0');
INSERT INTO `sys_user` VALUES ('10', 'player4', '2b79865fd73349314b1c83cdfc359be51d808801ce3fb9d90ed324ec746bc991', 'Qkm9CuXEiM6r7lhT4dqS', 'player4@cooode.cn', '13344444444', '1', '1', '2017-12-26 18:53:17', null, '运动员4男', '0');
INSERT INTO `sys_user` VALUES ('11', '005', '43712b2e33ac5e60f43d0899c0828b846ea60d95388ab912ccacf278c54004bd', 'sQ27b12gBbfBRDQhKsl1', 'player5@cooode.cn', '13355555555', '1', '1', '2017-12-26 18:54:07', null, '运动员5', '0');
INSERT INTO `sys_user` VALUES ('12', 'player10', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7060', 'QCMuTxgRiD1SgAIwMAzY', 'player10@cooode.cn', '12312312311', '1', '1', '2017-12-27 11:34:28', null, '马龙', '0');
INSERT INTO `sys_user` VALUES ('13', 'player11', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7061', 'QCMuTxgRiD2SgAIwMAzY', 'player11@cooode.cn', '12312312312', '1', '1', '2017-12-28 11:34:00', null, '运动员女1', '1');
INSERT INTO `sys_user` VALUES ('21', 'player12', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7062', 'QCMuTxgRiD3SgAIwMAzY', 'player12@cooode.cn', '12312312313', '1', '1', '2017-12-29 11:34:00', null, '运动员女2', '1');
INSERT INTO `sys_user` VALUES ('22', 'player13', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7063', 'QCMuTxgRiD4SgAIwMAzY', 'player13@cooode.cn', '12312312314', '1', '1', '2017-12-30 11:34:00', null, '运动员女3', '1');
INSERT INTO `sys_user` VALUES ('23', 'player14', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7064', 'QCMuTxgRiD5SgAIwMAzY', 'player14@cooode.cn', '12312312315', '1', '1', '2017-12-31 11:34:00', null, '运动员女4', '1');
INSERT INTO `sys_user` VALUES ('24', 'player15', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7065', 'QCMuTxgRiD6SgAIwMAzY', 'player15@cooode.cn', '12312312316', '1', '1', '2018-01-01 11:34:00', null, '运动员女5', '1');
INSERT INTO `sys_user` VALUES ('25', 'player16', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7066', 'QCMuTxgRiD7SgAIwMAzY', 'player16@cooode.cn', '12312312317', '1', '1', '2018-01-02 11:34:00', null, '运动员女6', '1');
INSERT INTO `sys_user` VALUES ('26', 'player17', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7067', 'QCMuTxgRiD8SgAIwMAzY', 'player17@cooode.cn', '12312312318', '1', '1', '2018-01-03 11:34:00', null, '运动员女7', '1');
INSERT INTO `sys_user` VALUES ('35', 'player18', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7068', 'QCMuTxgRiD9SgAIwMAzY', 'player18@cooode.cn', '12312312319', '1', '1', '2018-01-04 11:34:00', null, '运动员女8', '1');
INSERT INTO `sys_user` VALUES ('36', 'player19', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7069', null, 'player19@cooode.cn', '12312312320', '1', '1', '2018-01-05 11:34:00', null, '运动员女9', '1');
INSERT INTO `sys_user` VALUES ('37', 'player20', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7070', null, 'player20@cooode.cn', '12312312321', '1', '1', '2018-01-06 11:34:00', null, '运动员女10', '1');
INSERT INTO `sys_user` VALUES ('38', 'player21', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7071', null, 'player21@cooode.cn', '12312312322', '1', '1', '2018-01-07 11:34:00', null, '运动员女11', '1');
INSERT INTO `sys_user` VALUES ('39', 'player22', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7072', null, 'player22@cooode.cn', '12312312323', '1', '1', '2018-01-08 11:34:00', null, '运动员女12', '1');
INSERT INTO `sys_user` VALUES ('40', 'player23', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7073', null, 'player23@cooode.cn', '12312312324', '1', '1', '2018-01-09 11:34:00', null, '运动员女13', '1');
INSERT INTO `sys_user` VALUES ('41', 'player24', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7074', null, 'player24@cooode.cn', '12312312325', '1', '1', '2018-01-10 11:34:00', null, '运动员女14', '1');
INSERT INTO `sys_user` VALUES ('42', 'player25', 'd9219cd7e64ce82011c9ad401adadb570e3fe1bfa7dc05352629e33269ec7075', null, 'player25@cooode.cn', '12312312326', '1', '1', '2018-01-11 11:34:00', null, '运动员女15', '1');
INSERT INTO `sys_user` VALUES ('43', 'guoyue', '23fbf2a9e81f640b752450af6b1881977febee4aacd6d85363f41b49cb44a3d7', 'Uv318GtlJ0agh1NeYEcA', 'guoyue@cooode.cn', '12312312312', '1', '1', '2017-12-27 13:15:35', null, '郭跃', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('5', '4', '4');
INSERT INTO `sys_user_role` VALUES ('6', '4', '5');
INSERT INTO `sys_user_role` VALUES ('7', '3', '2');
INSERT INTO `sys_user_role` VALUES ('8', '3', '5');
INSERT INTO `sys_user_role` VALUES ('9', '2', '3');
INSERT INTO `sys_user_role` VALUES ('10', '5', '1');
INSERT INTO `sys_user_role` VALUES ('11', '6', '1');
INSERT INTO `sys_user_role` VALUES ('12', '7', '3');
INSERT INTO `sys_user_role` VALUES ('13', '8', '3');
INSERT INTO `sys_user_role` VALUES ('14', '9', '3');
INSERT INTO `sys_user_role` VALUES ('15', '10', '3');
INSERT INTO `sys_user_role` VALUES ('16', '11', '3');
INSERT INTO `sys_user_role` VALUES ('17', '12', '3');
INSERT INTO `sys_user_role` VALUES ('18', '43', '3');
INSERT INTO `sys_user_role` VALUES ('19', '13', '3');
INSERT INTO `sys_user_role` VALUES ('20', '14', '3');
INSERT INTO `sys_user_role` VALUES ('21', '15', '3');
INSERT INTO `sys_user_role` VALUES ('22', '16', '3');
INSERT INTO `sys_user_role` VALUES ('23', '17', '3');
INSERT INTO `sys_user_role` VALUES ('24', '18', '3');
INSERT INTO `sys_user_role` VALUES ('25', '19', '3');
INSERT INTO `sys_user_role` VALUES ('26', '20', '3');
INSERT INTO `sys_user_role` VALUES ('27', '21', '3');
INSERT INTO `sys_user_role` VALUES ('28', '22', '3');
INSERT INTO `sys_user_role` VALUES ('29', '23', '3');
INSERT INTO `sys_user_role` VALUES ('30', '24', '3');
INSERT INTO `sys_user_role` VALUES ('31', '25', '3');
INSERT INTO `sys_user_role` VALUES ('32', '26', '3');
INSERT INTO `sys_user_role` VALUES ('33', '27', '3');
