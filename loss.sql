CREATE DATABASE  IF NOT EXISTS `loss`;
USE `loss`;

/*
Navicat MySQL Data Transfer

Source Server         : yanyanghong
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : loss

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2019-06-04 08:31:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for loss_application
-- ----------------------------
DROP TABLE IF EXISTS `loss_application`;
CREATE TABLE `loss_application` (
  `appl_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title_x` varchar(50) NOT NULL,
  `type_x` varchar(20) NOT NULL,
  `address_x` varchar(50) NOT NULL,
  `content_x` varchar(250) NOT NULL,
  `create_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(20) NOT NULL,
  `status_ref` varchar(64) NOT NULL,
  PRIMARY KEY (`appl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loss_appl_status
-- ----------------------------
DROP TABLE IF EXISTS `loss_appl_status`;
CREATE TABLE `loss_appl_status` (
  `status_ref` varchar(64) NOT NULL,
  `appl_id` int(11) NOT NULL,
  `belong_id` int(11) DEFAULT NULL,
  `desc_x` varchar(250) DEFAULT NULL,
  `status_x` varchar(10) NOT NULL,
  `process_by` varchar(20) DEFAULT NULL,
  `process_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(20) NOT NULL,
  PRIMARY KEY (`status_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loss_login_history
-- ----------------------------
DROP TABLE IF EXISTS `loss_login_history`;
CREATE TABLE `loss_login_history` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username_x` varchar(20) NOT NULL,
  `ip_x` varchar(50) NOT NULL,
  `status_x` varchar(10) NOT NULL,
  `create_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loss_user
-- ----------------------------
DROP TABLE IF EXISTS `loss_user`;
CREATE TABLE `loss_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username_x` varchar(20) NOT NULL,
  `password_x` varchar(20) NOT NULL,
  `sex_c` varchar(2) NOT NULL,
  `age_i` int(11) DEFAULT NULL,
  `email_x` varchar(200) NOT NULL,
  `phone_x` varchar(11) DEFAULT NULL,
  `desc_x` varchar(200) DEFAULT NULL,
  `type_c` varchar(10) NOT NULL,
  `create_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
