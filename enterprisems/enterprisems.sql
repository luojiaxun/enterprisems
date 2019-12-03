/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : enterprisems

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 03/12/2019 09:58:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '罗家勋', '罗总', '133333333', '133333333@ljx.com');
INSERT INTO `member` VALUES (2, '李四', '李总', '133333334', '133333334@ls.com');
INSERT INTO `member` VALUES (3, '王五', '王总', '133333334', '133333334@ww.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` int(11) NOT NULL,
  `travellerId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `travellerIdfk`(`travellerId`) USING BTREE,
  CONSTRAINT `orderIdfk` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `travellerIdfk` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES (1, 1);
INSERT INTO `order_traveller` VALUES (2, 2);
INSERT INTO `order_traveller` VALUES (1, 3);
INSERT INTO `order_traveller` VALUES (3, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orderTime` datetime(0) NULL DEFAULT NULL,
  `peopleCount` int(255) NULL DEFAULT NULL,
  `orderDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payType` int(255) NULL DEFAULT NULL,
  `orderStatus` int(255) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `memberId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productfk`(`productId`) USING BTREE,
  INDEX `memberfk`(`memberId`) USING BTREE,
  CONSTRAINT `memberfk` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productfk` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '12345', '2019-11-27 00:00:00', 4, '去北京的', 0, 0, 1, 1);
INSERT INTO `orders` VALUES (2, '12346', '2019-11-28 00:00:00', 5, '去西安的', 1, 1, 2, 2);
INSERT INTO `orders` VALUES (3, '12347', '2019-11-29 00:00:00', 6, '去南京的', 2, 1, 3, 3);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL,
  `permissionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'user findALL', '/user/findAll.do');
INSERT INTO `permission` VALUES (2, 'user findById', '/user/findById.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义，主键uuid',
  `productNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT ' 产品编号，唯一，不为空\r\n',
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT ' 产品名称（路线名称）\r\n\r\n',
  `cityName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT ' 出发城市\r\n',
  `DepartureTime` datetime(0) NULL DEFAULT NULL COMMENT ' 出发时间\r\n',
  `productPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `productDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品描述',
  `productStatus` int(255) NULL DEFAULT NULL COMMENT '状态(0 关闭 1 开启)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '001', '北京三日游', '北京', '2019-11-27 00:00:00', 1200.00, '好玩实惠', 1);
INSERT INTO `product` VALUES (2, '002', '西安三日游', '西安', '2019-11-28 00:00:00', 1400.00, '东西好吃，天气冷', 1);
INSERT INTO `product` VALUES (3, '003', '南京三日游', '南京', '2019-11-29 00:00:00', 1600.00, '南京小笼包好吃', 1);
INSERT INTO `product` VALUES (4, '005', '杭州四日游', '杭州', '2019-11-28 17:25:00', 1300.00, '杭州西湖好看', 1);
INSERT INTO `product` VALUES (7, '006', '杭州四日游', '杭州', '2019-11-28 17:25:00', 1111.00, '33333', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'manager', '系统管理员');
INSERT INTO `role` VALUES (2, 'admin', '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime(0) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `executionTime` int(11) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (1, '2019-12-03 01:46:44', 'luojiaxun', '0:0:0:0:0:0:0:1', '/user/findAll.do', 45, '[类名] controller.UserControlller[方法名] findAll');
INSERT INTO `syslog` VALUES (2, '2019-12-03 01:47:32', 'luojiaxun', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 26, '[类名] controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (3, '2019-12-03 01:50:42', 'luojiaxun', '0:0:0:0:0:0:0:1', '/user/findAll.do', 23, '[类名] controller.UserControlller[方法名] findAll');
INSERT INTO `syslog` VALUES (4, '2019-12-03 01:50:44', 'luojiaxun', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 16, '[类名] controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (5, '2019-12-03 01:53:37', 'luojiaxun', '0:0:0:0:0:0:0:1', '/role/findAll.do', 24, '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (6, '2019-12-03 01:53:39', 'luojiaxun', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 15, '[类名] controller.SysLogController[方法名] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credentialsType` int(255) NULL DEFAULT NULL,
  `credentialsNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `travellerType` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES (1, '罗家勋', '男', '133333333', 0, '4402811998xxxx', 0);
INSERT INTO `traveller` VALUES (2, '张晓丽', '女', '133333334', 1, '440xxxxxxxxxxxx', 1);
INSERT INTO `traveller` VALUES (3, '张小龙', '男', '133333335', 2, '440xxxxxxxxxxxx', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'ljx@ljx.com', 'luojiaxun', '$2a$10$eWKp9g64ZEncU6nY29YZ8eBoOs8MP20jVB9RnLdPdW0169WGd/4Ny', '1388888888', 1);
INSERT INTO `users` VALUES (2, 'luojiawei@ljw.com', 'luojiawei', '$2a$10$642WPic0i9iI4HlW32rlMOVAt3EnS2Ivrlfw/O5sKmtLpqAl5Cf0G', '110', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleIdKey`(`roleId`) USING BTREE,
  CONSTRAINT `roleIdKey` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userIdKey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
