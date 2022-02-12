/*
 Navicat Premium Data Transfer

 Source Server         : host
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/02/2022 16:26:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `endDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('50868e1c99a245c2a886f3d9c1a83b95', '40f6cdea0bd34aceb77492a1656d9fb3', '������1239', '2022-01-11', '2022-01-11', '30��', 'adsfads', '2022-01-11 22:52:05', '����', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('94d0fd07078c46f8bf36246f07b2ef2f', '40f6cdea0bd34aceb77492a1656d9fb3', '������1238', '2022-01-11', '2022-01-11', '30��', 'adsfads', '2022-01-11 22:52:05', '����', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('cc1a80e7aea640d3869852222be8ee16', '40f6cdea0bd34aceb77492a1656d9fb3', '������121', '2022-01-11', '2022-01-11', '30��', 'asfdgads', '2022-01-11 22:51:43', '����', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('ec649b714ec54f63948804e8decd50b9', '40f6cdea0bd34aceb77492a1656d9fb3', '������', '2022-01-11', '2022-01-11', '30��', '�޸���', '2022-01-11 22:52:27', '����', '2022-01-12 16:26:23', '����');

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0��ʾδ�޸ģ�1��ʾ���޸�',
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('1185040b06194c7ea8ed93935f46d93f', '������ӱ�ע', '2022-01-20 00:36:53', '����', NULL, NULL, '0', '94d0fd07078c46f8bf36246f07b2ef2f');
INSERT INTO `tbl_activity_remark` VALUES ('af731bb42e3e4b329c2c7a77a194adcc', '������ӣ������޸ģ��ٴβ���', '2022-01-16 11:06:50', '����', '2022-01-16 11:58:38', '����', '1', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_activity_remark` VALUES ('d3710bc195d24bad8086abcff837c253', '���β�����ӣ������޸�', '2022-01-16 11:11:51', '����', '2022-01-16 11:56:38', '����', '1', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_activity_remark` VALUES ('ec649b714ec54f63948804e8decd50b1', '��Ӵ', '2022-01-11 22:52:27', '����', '', '����', '0', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_activity_remark` VALUES ('ec649b714ec54f63948804e8decd50b2', '����', '2022-01-11 23:52:27', '����', '', '����', '0', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_activity_remark` VALUES ('ec649b714ec54f63948804e8decd50b3', 'Ŷ��', '2022-01-10 22:52:27', '����', '2022-01-12 16:26:23', '����', '1', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_activity_remark` VALUES ('ec649b714ec54f63948804e8decd50b4', '�Ǻ�', '2022-01-09 22:52:27', '����', '2022-01-12 16:26:23', '����', '1', 'cc1a80e7aea640d3869852222be8ee16');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('5bb105cb7bf84579bcf3bb9723535242', '����', '����', '40f6cdea0bd34aceb77492a1656d9fb3', '��Ѷ', 'CEO', '@mht.com', '12345678911', 'www.tx.com', '12345678999', '��Ҫ����', '����������ֻ�', '����', '2022-01-21 11:30:55', NULL, NULL, '��Ѷ���գ���Ҹߺ�', '123', '2022-10-15', '�㶫����');
INSERT INTO `tbl_clue` VALUES ('ca7e1781740f48edbee8d1c8cea7a6ac', '����', '����', '40f6cdea0bd34aceb77492a1656d9fb3', '����Ͱ�', 'CEO', 'mayun@al.com', '12345678911', 'www.al.com', '12345678999', '����ϵ', '����������ֻ�', '����', '2022-01-22 15:15:34', NULL, NULL, '��������', '��ϵ��Ҫ', '2022-01-22', '�㽭����');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('2716dc6fd8314664ac92f4fdcfb7f4a0', 'ca7e1781740f48edbee8d1c8cea7a6ac', '50868e1c99a245c2a886f3d9c1a83b95');
INSERT INTO `tbl_clue_activity_relation` VALUES ('50868e1c99a245c2a886f3d9c1a83b9e', '5bb105cb7bf84579bcf3bb9723535242', 'ec649b714ec54f63948804e8decd50b9');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e10d9eff2d21494cbb4023b01e10fbaf', '5bb105cb7bf84579bcf3bb9723535242', '50868e1c99a245c2a886f3d9c1a83b95');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clueId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('e8a5bf0a60ef4dbebb8e7abce5715939', '����', '����������ֻ�', '1ff5739ebfd3403495733437a6959fb8', '����', '����', 'mayun@al.com', '12345678999', 'CEO', NULL, '����', '2022-02-08 10:53:16', NULL, NULL, '��������', '��ϵ��Ҫ', '2022-01-22', '�㽭����');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('4bdb560d4a694fb69c33079a13bf5936', 'e8a5bf0a60ef4dbebb8e7abce5715939', 'cc1a80e7aea640d3869852222be8ee16');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('a221b9ea4c3640e49cb87af489e1d50a', 'e8a5bf0a60ef4dbebb8e7abce5715939', 'ec649b714ec54f63948804e8decd50b9');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('1ff5739ebfd3403495733437a6959fb8', '����', '����Ͱ�', 'www.al.com', '12345678911', '����', '2022-02-08 10:53:16', NULL, NULL, '��ϵ��Ҫ', '2022-01-22', '��������', '�㽭����');

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type`  (
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '����������������Ϊ�գ����ܺ������ġ�',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '�ƺ�', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '����״̬', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '�ط����ȼ�', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '�ط�״̬', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '��Դ', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '�׶�', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '��������', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '����������UUID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '����Ϊ�գ�����Ҫ��ͬһ���ֵ��������ֵ�ֵ�����ظ�������Ψһ�ԡ�',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '����Ϊ��',
  `orderNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '����Ϊ�գ�����Ϊ�յ�ʱ��Ҫ�������������',
  `typeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '���',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '�������', '�������', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '�����ʼ�', '�����ʼ�', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '���׻�', '���׻�', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '���', '���', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '����', '����', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '������ϵ', '������ϵ', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '��ʧ����', '��ʧ����', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', 'δ����', 'δ����', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07�ɽ�', '07�ɽ�', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '��ͼ��ϵ', '��ͼ��ϵ', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '��ʿ', '��ʿ', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01�������', '01�������', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08��ʧ������', '08��ʧ������', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '����', '����', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '��', '��', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '���', '���', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '����������ֻ�', '����������ֻ�', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '����', '����', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '��', '��', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '����', '����', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09������ʧ�ر�', '09������ʧ�ر�', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web����', 'web����', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '�������', '�������', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', 'δ��ϵ', 'δ��ϵ', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '�ڲ����ֻ�', '�ڲ����ֻ�', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '������', '������', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '����ҵ��', '����ҵ��', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '����ϵ', '����ϵ', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '�Ƴ�', '�Ƴ�', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '��ҵ��', '��ҵ��', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '���', '���', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '��Ҫ����', '��Ҫ����', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02�������', '02�������', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '�ȴ�ĳ��', '�ȴ�ĳ��', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '�����绰', '�����绰', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '����', '����', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05�᰸/����', '05�᰸/����', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web����', 'web����', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03��ֵ����', '03��ֵ����', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '���', '���', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', 'Ա������', 'Ա������', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04ȷ��������', '04ȷ��������', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', 'Ůʿ', 'Ůʿ', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06̸��/����', '06̸��/����', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '�����̳�', '�����̳�', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '����ý��', '����ý��', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '�ⲿ����', '�ⲿ����', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd0', '40f6cdea0bd34aceb77492a1656d9fb3', '50', 'ҽ����Ŀ����ϵͳ', '2022-02-08', '1ff5739ebfd3403495733437a6959fb8', '07�ɽ�', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '����', '2022-02-11 23:07:08', '��������1', '��ϵ��Ҫ1', '2022-01-22');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd1', '40f6cdea0bd34aceb77492a1656d9fb3', '600', 'ϵͳ1', '2022-02-14', '1ff5739ebfd3403495733437a6959fb8', 'δ����', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '', '', '��������2', '��ϵ��Ҫ2', '2022-01-20');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd2', '40f6cdea0bd34aceb77492a1656d9fb3', '600000', 'ϵͳ2', '2022-02-19', '1ff5739ebfd3403495733437a6959fb8', '���', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '', '', '��������3', '��ϵ��Ҫ3', '2022-01-19');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd3', '40f6cdea0bd34aceb77492a1656d9fb3', '521', 'ϵͳ3', '2022-02-20', '1ff5739ebfd3403495733437a6959fb8', '�����ʼ�', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '', '', '��������4', '��ϵ��Ҫ4', '2022-01-20');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd4', '40f6cdea0bd34aceb77492a1656d9fb3', '520', 'ϵͳ4', '2022-02-16', '1ff5739ebfd3403495733437a6959fb8', '�����ʼ�', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '', '', '��������5', '��ϵ��Ҫ5', '2022-01-20');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd5', '40f6cdea0bd34aceb77492a1656d9fb3', '502', 'ϵͳ5', '2022-02-13', '1ff5739ebfd3403495733437a6959fb8', '����', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '����', '2022-02-11 22:59:15', '��������6', '��ϵ��Ҫ6', '2022-01-18');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd6', '40f6cdea0bd34aceb77492a1656d9fb3', '5000', 'ϵͳ6', '2022-02-15', '1ff5739ebfd3403495733437a6959fb8', '����', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '', '', '��������7', '��ϵ��Ҫ7', '2022-01-17');
INSERT INTO `tbl_tran` VALUES ('cea58f4c41344879b7baeb6bf4239bd7', '40f6cdea0bd34aceb77492a1656d9fb3', '500', 'ϵͳ7', '2022-02-16', '1ff5739ebfd3403495733437a6959fb8', '07�ɽ�', '��ҵ��', '����������ֻ�', '50868e1c99a245c2a886f3d9c1a83b95', 'e8a5bf0a60ef4dbebb8e7abce5715939', '����', '2022-02-08 10:53:16', '����', '2022-02-11 22:59:15', '��������8', '��ϵ��Ҫ8', '2022-01-16');

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('1c05162dfafe4629907ae996b76a20a0', '04ȷ��������', '50', '2022-02-20', '2022-02-10 19:41:19', '����', '9f058cdf1e914e91b555c00c9cbfd44e');
INSERT INTO `tbl_tran_history` VALUES ('4dd729b49f3a40dbade65d701a8a5e73', '07�ɽ�', '50', '2022-02-08', '2022-02-11 23:07:08', '����', 'cea58f4c41344879b7baeb6bf4239bd0');
INSERT INTO `tbl_tran_history` VALUES ('769061231bdb4dcc852f4e68717461eb', '08��ʧ������', '50', '2022-02-08', '2022-02-11 22:59:07', '����', 'cea58f4c41344879b7baeb6bf4239bd0');
INSERT INTO `tbl_tran_history` VALUES ('a76169dc57294798aaf79a9ee8d0f434', '07�ɽ�', '50', '2022-02-08', '2022-02-11 22:55:28', '����', 'cea58f4c41344879b7baeb6bf4239bd0');
INSERT INTO `tbl_tran_history` VALUES ('bb1672b16e5743bc819e99743c4af483', '05�᰸/����', '50', '2022-02-08', '2022-02-08 10:53:16', '����', 'cea58f4c41344879b7baeb6bf4239bd0');
INSERT INTO `tbl_tran_history` VALUES ('bd44d871650240b4b52ce583f6b0688f', '09������ʧ�ر�', '50', '2022-02-08', '2022-02-11 23:07:02', '����', 'cea58f4c41344879b7baeb6bf4239bd0');
INSERT INTO `tbl_tran_history` VALUES ('cf4f03ad15b74f22896a06a62184eede', '07�ɽ�', '50', '2022-02-08', '2022-02-11 22:59:15', '����', 'cea58f4c41344879b7baeb6bf4239bd0');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `loginPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '���벻�ܲ������Ĵ洢���������ģ�MD5����֮�������',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expireTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ʧЧʱ��Ϊ�յ�ʱ���ʾ����ʧЧ��ʧЧʱ��Ϊ2018-10-10 10:10:10�����ʾ�ڸ�ʱ��֮ǰ���˻����á�',
  `lockState` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '����״̬Ϊ��ʱ��ʾ���ã�Ϊ0ʱ��ʾ������Ϊ1ʱ��ʾ���á�',
  `deptno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `allowIps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '������ʵ�IPΪ��ʱ��ʾIP��ַ�������ޣ�������ʵ�IP������һ����Ҳ�����Ƕ���������IP��ַ��ʱ�򣬲��ð�Ƕ��ŷָ�������IP��192.168.100.2����ʾ���û�ֻ����IP��ַΪ192.168.100.2�Ļ�����ʹ�á�',
  `createTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '����', '202cb962ac59075b964b07152d234b70', 'ls@163.com', '2018-11-27 21:50:05', '1', 'A001', '192.168.1.1', '2018-11-22 12:11:40', '����', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '����', '202cb962ac59075b964b07152d234b70', 'zs@qq.com', '2022-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1', '2018-11-22 11:37:34', '����', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
