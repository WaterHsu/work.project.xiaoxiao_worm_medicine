/*
MySQL Data Transfer
Source Host: localhost
Source Database: xiaoxiao_worm
Target Host: localhost
Target Database: xiaoxiao_worm
Date: 2013/3/30 0:06:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for xpf_books
-- ----------------------------
DROP TABLE IF EXISTS `xpf_books`;
CREATE TABLE `xpf_books` (
  `id` int(64) NOT NULL auto_increment,
  `xpf_books_number` varchar(256) default NULL,
  `xpf_book_name` varchar(512) default NULL,
  `xpf_book_number` varchar(256) default NULL,
  `xpf_book_kind` varchar(512) default NULL,
  `xpf_book_begintime` varchar(256) default NULL,
  `xpf_book_buytime` varchar(256) default NULL,
  `xpf_book_dutypeople` varchar(512) default NULL,
  `xpf_book_buymount` int(32) default NULL,
  `xpf_book_nowmount` int(32) default NULL,
  `xpf_book_lendmount` int(32) default NULL,
  `xpf_book_inmount` int(32) default NULL,
  `xpf_book_location` varchar(512) default NULL,
  `xpf_book_belongto` varchar(512) default NULL,
  `xpf_book_other` text,
  `xpf_book_time` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xpf_device
-- ----------------------------
DROP TABLE IF EXISTS `xpf_device`;
CREATE TABLE `xpf_device` (
  `id` int(64) NOT NULL auto_increment,
  `xpf_device_number` varchar(256) default NULL,
  `xpf_dev_name` varchar(256) default NULL,
  `xpf_dev_number` varchar(256) default NULL,
  `xpf_dev_property` varchar(256) default NULL,
  `xpf_dev_begintime` varchar(256) default NULL,
  `xpf_dev_endtime` varchar(256) default NULL,
  `xpf_dev_buytime` varchar(256) default NULL,
  `xpf_dev_dutypeople` varchar(256) default NULL,
  `xpf_dev_buymount` int(32) default NULL,
  `xpf_dev_nowmount` int(32) default NULL,
  `xpf_dev_lendmount` int(32) default NULL,
  `xpf_dev_inmount` int(32) default NULL,
  `xpf_dev_mountdanwei` varchar(128) default NULL,
  `xpf_dev_location` varchar(512) default NULL,
  `xpf_dev_belongto` varchar(512) default NULL,
  `xpf_dev_other` text,
  `xpf_dev_time` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xpf_medicine
-- ----------------------------
DROP TABLE IF EXISTS `xpf_medicine`;
CREATE TABLE `xpf_medicine` (
  `id` int(64) NOT NULL auto_increment,
  `xpf_medicine_number` varchar(256) default NULL,
  `xpf_med_name` varchar(512) default NULL,
  `xpf_med_number` varchar(512) default NULL,
  `xpf_med_kind` varchar(512) default NULL,
  `xpf_med_property` varchar(256) default NULL,
  `xpf_med_begintime` varchar(256) default NULL,
  `xpf_med_endtime` varchar(256) default NULL,
  `xpf_med_buytime` varchar(256) default NULL,
  `xpf_med_dutypeople` varchar(256) default NULL,
  `xpf_med_buymount` int(16) default NULL,
  `xpf_med_nowmount` int(16) default NULL,
  `xpf_med_mountdanwei` varchar(64) default NULL,
  `xpf_med_location` varchar(512) default NULL,
  `xpf_med_belongto` varchar(512) default NULL,
  `xpf_med_other` text,
  `xpf_med_time` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `xpf_books` VALUES ('1', '201331821331477', '乔布斯传', 'LT3328', '传记', '2012年4月', '2013年2月', '比尔盖茨', '10000', '10000', '100', '9900', '图书馆', '派出所', '浪费', '2013-3-18 21:33');
INSERT INTO `xpf_books` VALUES ('3', '201331821361260', '笑傲江湖', 'LN3813', '武侠', '2011年8月', '2012年2月', '金庸', '28', '27', '7', '20', '西大', '计信院', '可能吗', '2013-3-18 21:36');
INSERT INTO `xpf_device` VALUES ('1', '201331817142187', '飞机', 'J11', '战斗机', '2010年3月', '2040年4月', '2011年2月', '太太国母', '2500', '2300', '100', '2200', '架', '垃圾场', '丐帮', '哈哈sx', '2013-3-18 17:14');
INSERT INTO `xpf_device` VALUES ('3', '201331817192361', '潜艇', 'Jd3321', '没用', '1998年4月8日', '2018年2月31日', '1188', '丐帮老总老婆', '1188', '1100', '88', '1012', '嗖', '天上', '丐帮的妹妹', '犀利', '2013-3-18 17:19');
INSERT INTO `xpf_medicine` VALUES ('2', '201331720062317', '碳酸钙', 'CN3124', '消耗品盐类', '无毒', '2012年3月28日', '2020年4月20日', '2013年10月1日', '老毛', '20', '14', '吨', '白宫', '二炮', '也很犀利', '2013-3-17 20:06');
INSERT INTO `xpf_medicine` VALUES ('4', '201331721277827', '水银', 'NM33912', '消耗品', '剧毒', '2012年4月2日', '2018年5月1日', '2013年3月13日', '蒋公', '100', '80', '吨', '东海海底', '南海舰队', '哈哈', '2013-3-17 21:27');
