/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : xinhua_library

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 09/05/2021 17:48:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `admin_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('admin', 'admin', 'admin', '男', '119');

-- ----------------------------
-- Table structure for bookdb
-- ----------------------------
DROP TABLE IF EXISTS `bookdb`;
CREATE TABLE `bookdb`  (
  `book_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_price` double(10, 0) NOT NULL,
  `book_kunumber` int(11) NOT NULL,
  `book_xiaonumber` int(11) NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `bookdb_ibfk_1`(`book_category`) USING BTREE,
  CONSTRAINT `bookdb_ibfk_1` FOREIGN KEY (`book_category`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookdb
-- ----------------------------
INSERT INTO `bookdb` VALUES ('2c086867-bcac-4d8a-b060-dc74ed5b3f3b', '《深入了解计算机系统》', 'HaC', 'HelloCoder出版社', '143c60c6-e608-46cc-b846-620d0404f958', 'src=http___www.5jjc.net_tu5jJDEwLmFsaWNkbi5jb20vdGZzY29tL2kxLzI1OTk0NDA2NTAvVEIxRVNrcGRqZ3lfdUpqU1pMZVhYYVBsRlhhXyEhJDM.jpg&refer=http___www.5jjc.jpg', 'books', '', 100, 4, 1);
INSERT INTO `bookdb` VALUES ('a5ce0bd0-c4cc-4b5a-8574-7a82649a2794', '《Unix编程艺术》', 'HaC', 'HelloCoder出版社', 'c6cf2402-c04a-426d-a339-8ea029bd5689', 'f6ed178e-b3bf-49c0-a30e-1692330ffa75.jpg', 'books', 'HelloCoder出版社的主编HaC大神亲自写的Unix编程书，值得一看', 60, 100, 0);
INSERT INTO `bookdb` VALUES ('ad79a235-ae1b-4ca2-9b08-b3f06caa23d0', '《程序员颈椎康复指南》', 'HaC', 'HelloCoder出版社', 'c6cf2402-c04a-426d-a339-8ea029bd5689', 'c6cf2402-c04a-426d-a339-8ea029bd5689.jpg', 'books', '帮助程序员康复颈椎的一本书', 40, 100, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('143c60c6-e608-46cc-b846-620d0404f958', '操作系统', '');
INSERT INTO `category` VALUES ('370d8f59-9e84-4929-8d58-bfa38d36beaa', '计算机网络', '');
INSERT INTO `category` VALUES ('3abbc4aa-ca71-4f10-a916-11966baf38a6', '文学艺术', '');
INSERT INTO `category` VALUES ('7a555b5f-a6cd-4fc0-943c-6c55dcc8fab6', '前端', '前端大全');
INSERT INTO `category` VALUES ('c6cf2402-c04a-426d-a339-8ea029bd5689', '后端', '');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `favorite_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `book_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`favorite_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `bookdb` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('fab61d2d-b8f2-4d1d-89d1-8979844a2740', 'd4d4e886-a1a9-450c-a227-63cf663cd341', '2c086867-bcac-4d8a-b060-dc74ed5b3f3b');

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `book_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ordernum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_id_fk`(`book_id`) USING BTREE,
  INDEX `ordernum_fk`(`ordernum`) USING BTREE,
  CONSTRAINT `book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `bookdb` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordernum_fk` FOREIGN KEY (`ordernum`) REFERENCES `orders` (`ordernum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('202105095520400219828300', 2, 200, '2c086867-bcac-4d8a-b060-dc74ed5b3f3b', '202105095520400219357300');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ordernum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ordernum`) USING BTREE,
  INDEX `user_Id_fk`(`userId`) USING BTREE,
  CONSTRAINT `user_Id_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('202105095520400219357300', 2, 200, '2021-05-09 16:55:15', 0, 'd4d4e886-a1a9-450c-a227-63cf663cd341');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('d4d4e886-a1a9-450c-a227-63cf663cd341', 'HaC', '123', 'C哥', NULL, '', '');

SET FOREIGN_KEY_CHECKS = 1;
