/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : easythink

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-09-09 20:32:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `et_admin`
-- ----------------------------
DROP TABLE IF EXISTS `et_admin`;
CREATE TABLE `et_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_admin
-- ----------------------------
INSERT INTO `et_admin` VALUES ('1', 'admin', '2c367ff07a297b718c1c19cd598ab76a', '1', 'RsXWTf', '0.0.0.0', '1441162785', 'test@163.com', '');

-- ----------------------------
-- Table structure for `et_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `et_admin_role`;
CREATE TABLE `et_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_admin_role
-- ----------------------------
INSERT INTO `et_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `et_admin_role` VALUES ('2', '普通用户', '普通用户', '0', '0');

-- ----------------------------
-- Table structure for `et_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `et_admin_role_priv`;
CREATE TABLE `et_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  KEY `roleid` (`roleid`,`c`,`a`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `et_category`
-- ----------------------------
DROP TABLE IF EXISTS `et_category`;
CREATE TABLE `et_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `url` varchar(100) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_category
-- ----------------------------

-- ----------------------------
-- Table structure for `et_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `et_category_priv`;
CREATE TABLE `et_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `et_link`
-- ----------------------------
DROP TABLE IF EXISTS `et_link`;
CREATE TABLE `et_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_link
-- ----------------------------

-- ----------------------------
-- Table structure for `et_log`
-- ----------------------------
DROP TABLE IF EXISTS `et_log`;
CREATE TABLE `et_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(15) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`controller`,`action`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_log
-- ----------------------------

-- ----------------------------
-- Table structure for `et_menu`
-- ----------------------------
DROP TABLE IF EXISTS `et_menu`;
CREATE TABLE `et_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_menu
-- ----------------------------
INSERT INTO `et_menu` VALUES ('1', '我的面板', '0', 'Admin', 'public_top', '', '1', '1', '1');
INSERT INTO `et_menu` VALUES ('2', '系统设置', '0', 'Setting', 'top', '', '0', '2', '1');
INSERT INTO `et_menu` VALUES ('3', '内容管理', '0', 'Content', 'top', '', '0', '3', '1');
INSERT INTO `et_menu` VALUES ('4', '用户管理', '0', 'Member', 'top', '', '0', '4', '1');
INSERT INTO `et_menu` VALUES ('5', '后台管理', '0', 'System', 'top', '', '0', '5', '1');
INSERT INTO `et_menu` VALUES ('6', '个人信息', '1', 'Admin', 'public_left', '', '1', '0', '1');
INSERT INTO `et_menu` VALUES ('7', '修改密码', '6', 'Admin', 'public_editPwd', '', '1', '1', '1');
INSERT INTO `et_menu` VALUES ('8', '修改个人信息', '6', 'Admin', 'public_editInfo', '', '1', '0', '1');
INSERT INTO `et_menu` VALUES ('9', '系统设置', '2', 'Setting', 'left', '', '0', '1', '1');
INSERT INTO `et_menu` VALUES ('10', '站点设置', '9', 'Setting', 'site', '', '0', '1', '1');
INSERT INTO `et_menu` VALUES ('11', '管理员设置', '2', 'Admin', 'left', '', '0', '2', '1');
INSERT INTO `et_menu` VALUES ('12', '管理员管理', '11', 'Admin', 'memberList', '', '0', '1', '1');
INSERT INTO `et_menu` VALUES ('13', '角色管理', '11', 'Admin', 'roleList', '', '0', '2', '1');
INSERT INTO `et_menu` VALUES ('14', '后台管理', '5', 'System', 'left', '', '0', '1', '1');
INSERT INTO `et_menu` VALUES ('15', '日志管理', '14', 'System', 'logList', '', '0', '1', '1');
INSERT INTO `et_menu` VALUES ('16', '菜单管理', '14', 'System', 'menuList', '', '0', '2', '1');
INSERT INTO `et_menu` VALUES ('17', '查看菜单', '16', 'System', 'menuView', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('18', '添加菜单', '16', 'System', 'menuAdd', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('19', '修改菜单', '16', 'System', 'menuEdit', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('20', '删除菜单', '16', 'System', 'menuDelete', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('21', '菜单排序', '16', 'System', 'menuOrder', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('22', '查看日志', '15', 'System', 'logView', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('23', '删除日志', '15', 'System', 'logDelete', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('24', '查看管理员', '12', 'Admin', 'memberView', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('25', '添加管理员', '12', 'Admin', 'memberAdd', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('26', '编辑管理员', '12', 'Admin', 'memberEdit', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('27', '删除管理员', '12', 'Admin', 'memberDelete', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('28', '查看角色', '13', 'Admin', 'roleView', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('29', '添加角色', '13', 'Admin', 'roleAdd', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('30', '编辑角色', '13', 'Admin', 'roleEdit', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('31', '删除角色', '13', 'Admin', 'roleDelete', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('32', '角色排序', '13', 'Admin', 'roleOrder', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('33', '权限设置', '13', 'Admin', 'roleSet', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('34', '发布管理', '3', 'Content', 'left', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('35', '内容管理', '34', 'Content', 'index', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('36', '栏目管理', '34', 'Category', 'categoryList', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('37', '查看栏目', '36', 'Category', 'categoryView', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('38', '添加栏目', '36', 'Category', 'categoryAdd', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('39', '编辑栏目', '36', 'Category', 'categoryEdit', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('40', '删除栏目', '36', 'Category', 'categoryDelete', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('41', '栏目排序', '36', 'Category', 'categoryOrder', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('42', '用户中心', '4', 'Member', 'left', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('43', '用户列表', '42', 'Member', 'memberList', '', '0', '0', '1');
INSERT INTO `et_menu` VALUES ('44', '用户分类', '42', 'Member', 'typeList', '', '0', '0', '1');

-- ----------------------------
-- Table structure for `et_news`
-- ----------------------------
DROP TABLE IF EXISTS `et_news`;
CREATE TABLE `et_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_news
-- ----------------------------

-- ----------------------------
-- Table structure for `et_page`
-- ----------------------------
DROP TABLE IF EXISTS `et_page`;
CREATE TABLE `et_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_page
-- ----------------------------

-- ----------------------------
-- Table structure for `et_setting`
-- ----------------------------
DROP TABLE IF EXISTS `et_setting`;
CREATE TABLE `et_setting` (
  `key` varchar(50) NOT NULL,
  `value` varchar(5000) DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `et_times`
-- ----------------------------
DROP TABLE IF EXISTS `et_times`;
CREATE TABLE `et_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of et_times
-- ----------------------------
