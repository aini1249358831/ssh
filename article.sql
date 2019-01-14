/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : lk_blog

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-14 18:00:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) DEFAULT NULL,
  `article_time` bigint(20) DEFAULT NULL,
  `article_content` varchar(255) DEFAULT NULL,
  `article_pic` varchar(255) DEFAULT NULL,
  `article_desc` varchar(255) DEFAULT NULL,
  `article_cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `article_category` (`article_cid`),
  CONSTRAINT `article_category` FOREIGN KEY (`article_cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
