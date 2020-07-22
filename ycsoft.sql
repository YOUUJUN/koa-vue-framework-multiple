/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ycsoft

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-06-03 14:51:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(255) NOT NULL,
  `post_author` varchar(255) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` mediumtext,
  `topic_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('112', '46f81770-a4a3-11ea-9ee1-d525ae67413d', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', '2020-06-02 15:49:24', '这是我的第一篇文章', 'Hello World!\n![](\\users\\f9961040-a4a2-11ea-b7ad-435b01e06adf\\images\\articles\\0.3217907901890731.jpeg)\n\n\nyeah!\nno', '29');
INSERT INTO `article` VALUES ('113', 'fe537040-a4ad-11ea-b527-0d69c8fc9fcd', '9271af90-a4a3-11ea-9ee1-d525ae67413d', '2020-06-02 16:50:12', '这是一篇关于JavaScript的文章', '这是一篇关于JavaScript的文章，  well', '30');

-- ----------------------------
-- Table structure for `article_comment`
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` varchar(255) DEFAULT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES ('22', 'da464570-a4ac-11ea-a051-87eaec67270c', '46f81770-a4a3-11ea-9ee1-d525ae67413d', '9271af90-a4a3-11ea-9ee1-d525ae67413d', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', 'That\'s cute', '2020-06-02 16:41:29');

-- ----------------------------
-- Table structure for `article_drafts`
-- ----------------------------
DROP TABLE IF EXISTS `article_drafts`;
CREATE TABLE `article_drafts` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(255) NOT NULL,
  `post_author` varchar(255) DEFAULT NULL,
  `latest_modify_date` datetime DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` mediumtext,
  `topic_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_drafts
-- ----------------------------
INSERT INTO `article_drafts` VALUES ('36', '46f81770-a4a3-11ea-9ee1-d525ae67413d', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', '2020-06-02 15:33:36', '这是我的第一篇文章', 'Hello World!\n![](\\users\\f9961040-a4a2-11ea-b7ad-435b01e06adf\\images\\articles\\0.3217907901890731.jpeg)', '29');
INSERT INTO `article_drafts` VALUES ('37', '46f81770-a4a3-11ea-9ee1-d525ae67413d', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', null, '这是我的第一篇文章', 'Hello World!\n![](\\users\\f9961040-a4a2-11ea-b7ad-435b01e06adf\\images\\articles\\0.3217907901890731.jpeg)', '29');
INSERT INTO `article_drafts` VALUES ('38', '46f81770-a4a3-11ea-9ee1-d525ae67413d', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', null, '这是我的第一篇文章', 'Hello World!\n![](\\users\\f9961040-a4a2-11ea-b7ad-435b01e06adf\\images\\articles\\0.3217907901890731.jpeg)\n\nyeah!', '29');
INSERT INTO `article_drafts` VALUES ('39', 'fe537040-a4ad-11ea-b527-0d69c8fc9fcd', '9271af90-a4a3-11ea-9ee1-d525ae67413d', '2020-06-02 16:50:12', '这是一篇关于JavaScript的文章', '这是一篇关于JavaScript的文章，  well', '30');

-- ----------------------------
-- Table structure for `article_recomment`
-- ----------------------------
DROP TABLE IF EXISTS `article_recomment`;
CREATE TABLE `article_recomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` varchar(255) DEFAULT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_recomment
-- ----------------------------

-- ----------------------------
-- Table structure for `article_watchs`
-- ----------------------------
DROP TABLE IF EXISTS `article_watchs`;
CREATE TABLE `article_watchs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(255) DEFAULT NULL,
  `post_author` varchar(255) DEFAULT NULL,
  `article_views` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_watchs
-- ----------------------------
INSERT INTO `article_watchs` VALUES ('37', '46f81770-a4a3-11ea-9ee1-d525ae67413d', '824000803@qq.com', '14');
INSERT INTO `article_watchs` VALUES ('38', 'fe537040-a4ad-11ea-b527-0d69c8fc9fcd', '1', '0');

-- ----------------------------
-- Table structure for `doc_drafts`
-- ----------------------------
DROP TABLE IF EXISTS `doc_drafts`;
CREATE TABLE `doc_drafts` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(255) NOT NULL,
  `post_author` varchar(255) DEFAULT NULL,
  `latest_modify_date` datetime DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` mediumtext,
  `post_category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doc_drafts
-- ----------------------------

-- ----------------------------
-- Table structure for `framework_document`
-- ----------------------------
DROP TABLE IF EXISTS `framework_document`;
CREATE TABLE `framework_document` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(255) NOT NULL,
  `post_author` varchar(255) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` mediumtext,
  `post_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of framework_document
-- ----------------------------

-- ----------------------------
-- Table structure for `framework_document_category`
-- ----------------------------
DROP TABLE IF EXISTS `framework_document_category`;
CREATE TABLE `framework_document_category` (
  `post_category_id` int(4) NOT NULL AUTO_INCREMENT,
  `post_category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of framework_document_category
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(4) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('29', 'Cat');
INSERT INTO `topic` VALUES ('30', 'JavaScript');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `if_admin` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('34', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', '824000803@qq.com', '柯涵', '1', null);
INSERT INTO `users` VALUES ('35', '9271af90-a4a3-11ea-9ee1-d525ae67413d', '1', 'YOUJUN', '1', null);

-- ----------------------------
-- Table structure for `user_focus`
-- ----------------------------
DROP TABLE IF EXISTS `user_focus`;
CREATE TABLE `user_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `topic_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_focus
-- ----------------------------
INSERT INTO `user_focus` VALUES ('25', '1', '29');

-- ----------------------------
-- Table structure for `user_follow`
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_follow
-- ----------------------------
INSERT INTO `user_follow` VALUES ('43', '1', 'f9961040-a4a2-11ea-b7ad-435b01e06adf');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `portrait` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `blog_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('12', 'f9961040-a4a2-11ea-b7ad-435b01e06adf', '/user-images/0.1436446423680504.jpg', 'CSGO职业哥', 'freaking cat ', '');
INSERT INTO `user_info` VALUES ('13', '9271af90-a4a3-11ea-9ee1-d525ae67413d', '/user-images/0.1436446423680504.jpg', 'WEB前端开发工程师', 'CSGO', '');
INSERT INTO `user_info` VALUES ('14', '70d101d0-a4ab-11ea-ad27-bf25b97f645d', '/user-images/0.1436446423680504.jpg', '', '', '');
INSERT INTO `user_info` VALUES ('15', '9ae17090-a4ab-11ea-90fe-f904279b86e9', '/user-images/0.1436446423680504.jpg', '', '', '');
INSERT INTO `user_info` VALUES ('16', 'ab8f0060-a4ab-11ea-8018-4503c94eb854', '/user-images/0.1436446423680504.jpg', '', '', '');
INSERT INTO `user_info` VALUES ('17', '172851f0-a4ac-11ea-b30e-cbd8a52fecb3', '/user-images/0.1436446423680504.jpg', '', '', '');
INSERT INTO `user_info` VALUES ('18', '9dbd1a30-a564-11ea-98a2-555a890517f8', '/user-images/0.1436446423680504.jpg', '', '', '');

-- ----------------------------
-- Table structure for `user_like`
-- ----------------------------
DROP TABLE IF EXISTS `user_like`;
CREATE TABLE `user_like` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_like
-- ----------------------------
INSERT INTO `user_like` VALUES ('136', '1', 'fe537040-a4ad-11ea-b527-0d69c8fc9fcd');
INSERT INTO `user_like` VALUES ('138', '1', '46f81770-a4a3-11ea-9ee1-d525ae67413d');
