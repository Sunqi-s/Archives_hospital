/*
 Navicat MySQL Data Transfer

 Source Server         : 内部8.0-root-123456
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 192.168.10.124:3308
 Source Schema         : archives_new

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 06/08/2024 14:48:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for archive_category
-- ----------------------------
DROP TABLE IF EXISTS `archive_category`;
CREATE TABLE `archive_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `parent_id` int(0) NULL DEFAULT 0 COMMENT '父分类ID',
  `parent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父分类名称',
  `level` int(0) NULL DEFAULT 0 COMMENT '分类层级',
  `type` tinyint(1) NOT NULL COMMENT '类别：0档案节点，1档案库',
  `is_active` tinyint(1) NULL DEFAULT 1 COMMENT '显示状态：0显示，1隐藏',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '档案分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive_category
-- ----------------------------
INSERT INTO `archive_category` VALUES (15, '文书档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-07 11:40:43', NULL, '2024-07-11 11:09:36');
INSERT INTO `archive_category` VALUES (32, '文件目录', 15, '', 0, 1, 0, 0, NULL, '2024-07-11 14:16:08', NULL, '2024-07-11 14:16:07');
INSERT INTO `archive_category` VALUES (34, '科技档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:10:27', NULL, '2024-07-11 16:10:26');
INSERT INTO `archive_category` VALUES (35, '科技案卷', 34, '', 0, 1, 0, 0, NULL, '2024-07-11 16:10:41', NULL, '2024-07-11 16:10:40');
INSERT INTO `archive_category` VALUES (36, '科技卷内', 34, '', 0, 1, 0, 0, NULL, '2024-07-11 16:10:53', NULL, '2024-07-11 16:10:53');
INSERT INTO `archive_category` VALUES (37, '科技项目', 34, '', 0, 1, 0, 0, NULL, '2024-07-11 16:11:02', NULL, '2024-07-11 16:11:01');
INSERT INTO `archive_category` VALUES (38, '人事档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:11:19', NULL, '2024-07-11 16:11:18');
INSERT INTO `archive_category` VALUES (39, '人事卷内', 38, '', 0, 1, 0, 0, NULL, '2024-07-11 16:11:31', NULL, '2024-07-11 16:11:31');
INSERT INTO `archive_category` VALUES (40, '人事案卷', 38, '', 0, 1, 0, 0, NULL, '2024-07-11 16:11:44', NULL, '2024-07-11 16:11:44');
INSERT INTO `archive_category` VALUES (41, '会计档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:11:57', NULL, '2024-07-11 16:11:56');
INSERT INTO `archive_category` VALUES (42, '会计案卷', 41, '', 0, 1, 0, 0, NULL, '2024-07-11 16:12:14', NULL, '2024-07-11 16:12:13');
INSERT INTO `archive_category` VALUES (43, '会计卷内', 41, '', 0, 1, 0, 0, NULL, '2024-07-11 16:12:22', NULL, '2024-07-11 16:12:22');
INSERT INTO `archive_category` VALUES (44, '照片档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:12:32', NULL, '2024-07-11 16:12:31');
INSERT INTO `archive_category` VALUES (45, '照片案卷', 44, '', 0, 1, 0, 0, NULL, '2024-07-11 16:12:43', NULL, '2024-07-11 16:12:42');
INSERT INTO `archive_category` VALUES (46, '照片卷内', 44, '', 0, 1, 0, 0, NULL, '2024-07-11 16:12:50', NULL, '2024-07-11 16:12:49');
INSERT INTO `archive_category` VALUES (47, '录音档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:13:00', NULL, '2024-07-11 16:13:00');
INSERT INTO `archive_category` VALUES (48, '录音案卷', 47, '', 0, 1, 0, 0, NULL, '2024-07-11 16:13:15', NULL, '2024-07-11 16:13:15');
INSERT INTO `archive_category` VALUES (49, '录音卷内', 47, '', 0, 1, 0, 0, NULL, '2024-07-11 16:13:23', NULL, '2024-07-11 16:13:22');
INSERT INTO `archive_category` VALUES (50, '录像档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:13:37', NULL, '2024-07-11 16:13:36');
INSERT INTO `archive_category` VALUES (51, '录像案卷', 50, '', 0, 1, 0, 0, NULL, '2024-07-11 16:13:46', NULL, '2024-07-11 16:13:46');
INSERT INTO `archive_category` VALUES (52, '录像卷内', 50, '', 0, 1, 0, 0, NULL, '2024-07-11 16:13:54', NULL, '2024-07-11 16:13:54');
INSERT INTO `archive_category` VALUES (53, '实物档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:14:05', NULL, '2024-07-11 16:14:05');
INSERT INTO `archive_category` VALUES (54, '实物案卷', 53, '', 0, 1, 0, 0, NULL, '2024-07-11 16:14:15', NULL, '2024-07-11 16:14:25');
INSERT INTO `archive_category` VALUES (55, '光盘档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:14:36', NULL, '2024-07-11 16:14:36');
INSERT INTO `archive_category` VALUES (56, '光盘案卷', 55, '', 0, 1, 0, 0, NULL, '2024-07-11 16:14:47', NULL, '2024-07-11 16:14:46');
INSERT INTO `archive_category` VALUES (57, '光盘卷内', 55, '', 0, 1, 0, 0, NULL, '2024-07-11 16:15:00', NULL, '2024-07-11 16:14:59');
INSERT INTO `archive_category` VALUES (58, '专题档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:15:22', NULL, '2024-07-11 16:15:22');
INSERT INTO `archive_category` VALUES (59, '收文档案', 58, '', 0, 1, 0, 0, NULL, '2024-07-11 16:15:36', NULL, '2024-07-11 16:15:35');
INSERT INTO `archive_category` VALUES (60, '发文档案', 58, '', 0, 1, 0, 0, NULL, '2024-07-11 16:15:44', NULL, '2024-07-11 16:15:44');
INSERT INTO `archive_category` VALUES (61, '会议纪要', 58, '', 0, 1, 0, 0, NULL, '2024-07-11 16:15:53', NULL, '2024-07-11 16:15:52');
INSERT INTO `archive_category` VALUES (62, '规则制度', 58, '', 0, 1, 0, 0, NULL, '2024-07-11 16:16:04', NULL, '2024-07-11 16:16:03');
INSERT INTO `archive_category` VALUES (63, '业务档案', 0, '', 0, 0, 0, 0, NULL, '2024-07-11 16:16:11', NULL, '2024-07-11 16:16:10');

-- ----------------------------
-- Table structure for archive_info
-- ----------------------------
DROP TABLE IF EXISTS `archive_info`;
CREATE TABLE `archive_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(0) NOT NULL COMMENT '档案分类id',
  `fonds_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '全宗号',
  `fonds_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '全宗名称',
  `retention_period` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '保管期限',
  `item_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '件号',
  `archive_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '档号',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归档部门',
  `archiver` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归档人',
  `archive_date` datetime(0) NULL DEFAULT NULL COMMENT '归档时间',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备注',
  `archive_status` tinyint(0) NULL DEFAULT 0 COMMENT '归档状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `category_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类代码',
  `field1` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段1',
  `field2` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段2',
  `field3` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段3',
  `field4` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段4',
  `field5` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段5',
  `field6` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段6',
  `field7` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段7',
  `field8` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段8',
  `field9` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段9',
  `field10` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段10',
  `field11` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段11',
  `field12` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段12',
  `field13` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段13',
  `field14` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段14',
  `field15` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段15',
  `field16` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段16',
  `field17` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段17',
  `field18` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段18',
  `field19` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段19',
  `field20` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段20',
  `field21` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段21',
  `field22` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段22',
  `field23` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段23',
  `field24` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段24',
  `field25` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段25',
  `field26` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段26',
  `field27` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段27',
  `field28` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段28',
  `field29` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段29',
  `field30` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段30',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '档案信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive_info
-- ----------------------------

-- ----------------------------
-- Table structure for archive_item
-- ----------------------------
DROP TABLE IF EXISTS `archive_item`;
CREATE TABLE `archive_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '分类ID',
  `item_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目名称',
  `item_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '项目类型',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_length` int(0) NULL DEFAULT NULL COMMENT '字段长度',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'text' COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典类型',
  `html_group` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面显示分组',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2117 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '档案信息模板定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive_item
-- ----------------------------
INSERT INTO `archive_item` VALUES (1059, 32, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, '2024-07-12 16:18:30');
INSERT INTO `archive_item` VALUES (1060, 32, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, '2024-07-12 16:18:30');
INSERT INTO `archive_item` VALUES (1061, 32, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, '2024-07-12 16:18:30');
INSERT INTO `archive_item` VALUES (1062, 32, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1063, 32, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1064, 32, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1065, 32, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1066, 32, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1067, 32, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1068, 32, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1069, 32, '归档状态', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, '2024-07-12 16:18:31');
INSERT INTO `archive_item` VALUES (1070, 32, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, '2024-07-12 16:18:32');
INSERT INTO `archive_item` VALUES (1071, 32, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, '2024-07-12 16:18:32');
INSERT INTO `archive_item` VALUES (1072, 32, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, '2024-07-12 16:18:32');
INSERT INTO `archive_item` VALUES (1073, 32, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, '2024-07-12 16:18:32');
INSERT INTO `archive_item` VALUES (1074, 32, '分类代码', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, '2024-07-12 16:18:33');
INSERT INTO `archive_item` VALUES (1075, 32, '年度', 'String', 'field1', 500, 'varchar(500)', '1', '1', '1', '1', '1', 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, '2024-07-12 16:18:33');
INSERT INTO `archive_item` VALUES (1076, 32, '分类名称', 'String', 'field2', 500, 'varchar(500)', '1', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, '2024-07-12 16:18:33');
INSERT INTO `archive_item` VALUES (1077, 32, '机构或问题', 'String', 'field3', 500, 'varchar(500)', '1', '1', '1', '1', '1', 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, '2024-07-12 16:18:33');
INSERT INTO `archive_item` VALUES (1078, 32, '参见号', 'String', 'field4', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, '2024-07-12 16:18:33');
INSERT INTO `archive_item` VALUES (1079, 32, '盒号', 'String', 'field5', 500, 'varchar(500)', '1', '1', '1', '1', '1', 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, '2024-07-12 16:18:34');
INSERT INTO `archive_item` VALUES (1080, 32, '盒厚度', 'String', 'field6', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, '2024-07-12 16:18:34');
INSERT INTO `archive_item` VALUES (1081, 32, '责任者', 'String', 'field7', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, '2024-07-12 16:18:34');
INSERT INTO `archive_item` VALUES (1082, 32, '文件编号', 'String', 'field8', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, '2024-07-12 16:18:34');
INSERT INTO `archive_item` VALUES (1083, 32, '题名', 'String', 'field9', 500, 'varchar(500)', '1', '1', '1', '1', '1', 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1084, 32, '密级', 'String', 'field10', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1085, 32, '日期', 'String', 'field11', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1086, 32, '页数', 'String', 'field12', 500, 'varchar(500)', '1', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1087, 32, '文件类型', 'String', 'field13', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1088, 32, '形成单位', 'String', 'field14', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, '2024-07-12 16:18:35');
INSERT INTO `archive_item` VALUES (1089, 32, '立档单位', 'String', 'field15', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, '2024-07-12 16:18:36');
INSERT INTO `archive_item` VALUES (1090, 32, '主办部门', 'String', 'field16', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, '2024-07-12 16:18:36');
INSERT INTO `archive_item` VALUES (1091, 32, '拟稿人', 'String', 'field17', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, '2024-07-12 16:18:36');
INSERT INTO `archive_item` VALUES (1092, 32, '签发人', 'String', 'field18', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, '2024-07-12 16:18:36');
INSERT INTO `archive_item` VALUES (1093, 32, '接收人', 'String', 'field19', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, '2024-07-12 16:18:36');
INSERT INTO `archive_item` VALUES (1094, 32, '整理人', 'String', 'field20', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1095, 32, '整理时间', 'String', 'field21', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1096, 32, '检查人', 'String', 'field22', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1097, 32, '检查时间', 'String', 'field23', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1098, 32, '录入时间', 'String', 'field24', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1099, 32, '件', 'String', 'field25', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1100, 32, '电子文件号', 'String', 'field26', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, '2024-07-12 16:18:37');
INSERT INTO `archive_item` VALUES (1101, 32, '电子文档序号', 'String', 'field27', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, '2024-07-12 16:18:38');
INSERT INTO `archive_item` VALUES (1102, 32, '归档份数', 'String', 'field28', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, '2024-07-12 16:18:38');
INSERT INTO `archive_item` VALUES (1103, 32, '电子文件标题', 'String', 'field29', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, '2024-07-12 16:18:38');
INSERT INTO `archive_item` VALUES (1104, 32, '附件总数', 'String', 'field30', 500, 'varchar(500)', '0', '1', '1', NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, '2024-07-12 16:18:38');
INSERT INTO `archive_item` VALUES (1151, 35, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1152, 35, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1153, 35, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1154, 35, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1155, 35, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1156, 35, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1157, 35, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1158, 35, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1159, 35, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1160, 35, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1161, 35, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1162, 35, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1163, 35, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1164, 35, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1165, 35, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1166, 35, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1167, 35, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1168, 35, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1169, 35, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1170, 35, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1171, 35, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1172, 35, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1173, 35, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1174, 35, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1175, 35, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1176, 35, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1177, 35, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1178, 35, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1179, 35, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1180, 35, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1181, 35, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1182, 35, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1183, 35, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1184, 35, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1185, 35, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1186, 35, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1187, 35, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1188, 35, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1189, 35, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1190, 35, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1191, 35, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1192, 35, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1193, 35, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1194, 35, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1195, 35, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1196, 35, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1197, 36, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1198, 36, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1199, 36, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1200, 36, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1201, 36, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1202, 36, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1203, 36, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1204, 36, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1205, 36, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1206, 36, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1207, 36, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1208, 36, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1209, 36, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1210, 36, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1211, 36, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1212, 36, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1213, 36, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1214, 36, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1215, 36, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1216, 36, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1217, 36, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1218, 36, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1219, 36, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1220, 36, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1221, 36, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1222, 36, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1223, 36, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1224, 36, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1225, 36, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1226, 36, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1227, 36, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1228, 36, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1229, 36, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1230, 36, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1231, 36, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1232, 36, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1233, 36, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1234, 36, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1235, 36, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1236, 36, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1237, 36, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1238, 36, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1239, 36, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1240, 36, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1241, 36, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1242, 36, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1243, 37, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1244, 37, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1245, 37, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1246, 37, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1247, 37, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1248, 37, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1249, 37, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1250, 37, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1251, 37, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1252, 37, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1253, 37, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1254, 37, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1255, 37, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1256, 37, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1257, 37, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1258, 37, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1259, 37, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1260, 37, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1261, 37, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1262, 37, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1263, 37, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1264, 37, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1265, 37, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1266, 37, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1267, 37, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1268, 37, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1269, 37, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1270, 37, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1271, 37, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1272, 37, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1273, 37, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1274, 37, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1275, 37, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1276, 37, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1277, 37, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1278, 37, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1279, 37, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1280, 37, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1281, 37, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1282, 37, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1283, 37, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1284, 37, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1285, 37, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1286, 37, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1287, 37, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1288, 37, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1289, 39, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1290, 39, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1291, 39, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1292, 39, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1293, 39, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1294, 39, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1295, 39, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1296, 39, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1297, 39, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1298, 39, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1299, 39, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1300, 39, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1301, 39, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1302, 39, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1303, 39, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1304, 39, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1305, 39, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1306, 39, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1307, 39, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1308, 39, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1309, 39, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1310, 39, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1311, 39, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1312, 39, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1313, 39, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1314, 39, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1315, 39, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1316, 39, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1317, 39, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1318, 39, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1319, 39, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1320, 39, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1321, 39, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1322, 39, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1323, 39, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1324, 39, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1325, 39, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1326, 39, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1327, 39, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1328, 39, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1329, 39, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1330, 39, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1331, 39, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1332, 39, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1333, 39, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1334, 39, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1335, 40, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1336, 40, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1337, 40, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1338, 40, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1339, 40, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1340, 40, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1341, 40, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1342, 40, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1343, 40, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1344, 40, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1345, 40, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1346, 40, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1347, 40, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1348, 40, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1349, 40, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1350, 40, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1351, 40, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1352, 40, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1353, 40, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1354, 40, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1355, 40, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1356, 40, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1357, 40, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1358, 40, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1359, 40, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1360, 40, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1361, 40, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1362, 40, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1363, 40, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1364, 40, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1365, 40, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1366, 40, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1367, 40, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1368, 40, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1369, 40, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1370, 40, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1371, 40, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1372, 40, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1373, 40, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1374, 40, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1375, 40, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1376, 40, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1377, 40, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1378, 40, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1379, 40, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1380, 40, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1381, 42, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1382, 42, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1383, 42, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1384, 42, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1385, 42, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1386, 42, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1387, 42, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1388, 42, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1389, 42, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1390, 42, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1391, 42, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1392, 42, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1393, 42, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1394, 42, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1395, 42, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1396, 42, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1397, 42, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1398, 42, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1399, 42, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1400, 42, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1401, 42, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1402, 42, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1403, 42, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1404, 42, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1405, 42, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1406, 42, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1407, 42, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1408, 42, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1409, 42, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1410, 42, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1411, 42, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1412, 42, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1413, 42, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1414, 42, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1415, 42, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1416, 42, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1417, 42, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1418, 42, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1419, 42, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1420, 42, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1421, 42, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1422, 42, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1423, 42, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1424, 42, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1425, 42, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1426, 42, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1427, 43, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1428, 43, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1429, 43, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1430, 43, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1431, 43, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1432, 43, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1433, 43, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1434, 43, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1435, 43, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1436, 43, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1437, 43, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1438, 43, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1439, 43, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1440, 43, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1441, 43, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1442, 43, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1443, 43, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1444, 43, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1445, 43, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1446, 43, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1447, 43, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1448, 43, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1449, 43, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1450, 43, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1451, 43, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1452, 43, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1453, 43, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1454, 43, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1455, 43, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1456, 43, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1457, 43, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1458, 43, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1459, 43, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1460, 43, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1461, 43, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1462, 43, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1463, 43, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1464, 43, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1465, 43, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1466, 43, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1467, 43, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1468, 43, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1469, 43, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1470, 43, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1471, 43, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1472, 43, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1473, 45, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1474, 45, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1475, 45, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1476, 45, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1477, 45, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1478, 45, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1479, 45, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1480, 45, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1481, 45, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1482, 45, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1483, 45, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1484, 45, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1485, 45, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1486, 45, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1487, 45, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1488, 45, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1489, 45, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1490, 45, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1491, 45, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1492, 45, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1493, 45, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1494, 45, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1495, 45, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1496, 45, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1497, 45, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1498, 45, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1499, 45, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1500, 45, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1501, 45, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1502, 45, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1503, 45, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1504, 45, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1505, 45, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1506, 45, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1507, 45, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1508, 45, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1509, 45, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1510, 45, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1511, 45, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1512, 45, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1513, 45, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1514, 45, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1515, 45, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1516, 45, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1517, 45, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1518, 45, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1519, 46, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1520, 46, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1521, 46, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1522, 46, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1523, 46, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1524, 46, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1525, 46, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1526, 46, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1527, 46, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1528, 46, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1529, 46, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1530, 46, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1531, 46, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1532, 46, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1533, 46, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1534, 46, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1535, 46, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1536, 46, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1537, 46, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1538, 46, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1539, 46, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1540, 46, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1541, 46, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1542, 46, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1543, 46, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1544, 46, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1545, 46, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1546, 46, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1547, 46, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1548, 46, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1549, 46, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1550, 46, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1551, 46, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1552, 46, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1553, 46, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1554, 46, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1555, 46, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1556, 46, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1557, 46, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1558, 46, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1559, 46, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1560, 46, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1561, 46, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1562, 46, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1563, 46, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1564, 46, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1565, 48, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1566, 48, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1567, 48, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1568, 48, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1569, 48, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1570, 48, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1571, 48, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1572, 48, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1573, 48, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1574, 48, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1575, 48, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1576, 48, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1577, 48, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1578, 48, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1579, 48, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1580, 48, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1581, 48, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1582, 48, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1583, 48, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1584, 48, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1585, 48, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1586, 48, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1587, 48, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1588, 48, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1589, 48, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1590, 48, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1591, 48, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1592, 48, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1593, 48, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1594, 48, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1595, 48, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1596, 48, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1597, 48, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1598, 48, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1599, 48, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1600, 48, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1601, 48, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1602, 48, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1603, 48, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1604, 48, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1605, 48, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1606, 48, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1607, 48, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1608, 48, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1609, 48, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1610, 48, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1611, 49, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1612, 49, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1613, 49, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1614, 49, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1615, 49, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1616, 49, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1617, 49, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1618, 49, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1619, 49, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1620, 49, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1621, 49, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1622, 49, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1623, 49, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1624, 49, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1625, 49, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1626, 49, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1627, 49, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1628, 49, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1629, 49, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1630, 49, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1631, 49, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1632, 49, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1633, 49, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1634, 49, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1635, 49, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1636, 49, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1637, 49, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1638, 49, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1639, 49, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1640, 49, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1641, 49, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1642, 49, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1643, 49, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1644, 49, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1645, 49, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1646, 49, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1647, 49, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1648, 49, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1649, 49, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1650, 49, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1651, 49, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1652, 49, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1653, 49, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1654, 49, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1655, 49, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1656, 49, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1657, 51, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1658, 51, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1659, 51, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1660, 51, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1661, 51, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1662, 51, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1663, 51, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1664, 51, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1665, 51, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1666, 51, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1667, 51, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1668, 51, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1669, 51, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1670, 51, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1671, 51, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1672, 51, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1673, 51, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1674, 51, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1675, 51, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1676, 51, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1677, 51, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1678, 51, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1679, 51, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1680, 51, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1681, 51, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1682, 51, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1683, 51, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1684, 51, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1685, 51, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1686, 51, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1687, 51, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1688, 51, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1689, 51, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1690, 51, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1691, 51, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1692, 51, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1693, 51, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1694, 51, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1695, 51, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1696, 51, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1697, 51, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1698, 51, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1699, 51, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1700, 51, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1701, 51, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1702, 51, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1703, 52, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1704, 52, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1705, 52, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1706, 52, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1707, 52, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1708, 52, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1709, 52, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1710, 52, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1711, 52, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1712, 52, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1713, 52, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1714, 52, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1715, 52, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1716, 52, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1717, 52, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1718, 52, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1719, 52, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1720, 52, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1721, 52, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1722, 52, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1723, 52, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1724, 52, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1725, 52, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1726, 52, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1727, 52, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1728, 52, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1729, 52, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1730, 52, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1731, 52, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1732, 52, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1733, 52, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1734, 52, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1735, 52, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1736, 52, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1737, 52, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1738, 52, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1739, 52, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1740, 52, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1741, 52, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1742, 52, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1743, 52, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1744, 52, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1745, 52, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1746, 52, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1747, 52, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1748, 52, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1749, 54, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1750, 54, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1751, 54, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1752, 54, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1753, 54, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1754, 54, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1755, 54, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1756, 54, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1757, 54, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1758, 54, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1759, 54, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1760, 54, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1761, 54, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1762, 54, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1763, 54, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1764, 54, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1765, 54, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1766, 54, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1767, 54, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1768, 54, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1769, 54, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1770, 54, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1771, 54, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1772, 54, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1773, 54, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1774, 54, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1775, 54, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1776, 54, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1777, 54, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1778, 54, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1779, 54, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1780, 54, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1781, 54, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1782, 54, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1783, 54, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1784, 54, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1785, 54, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1786, 54, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1787, 54, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1788, 54, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1789, 54, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1790, 54, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1791, 54, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1792, 54, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1793, 54, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1794, 54, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1795, 54, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1796, 54, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1797, 54, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1798, 54, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1799, 54, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1800, 54, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1801, 54, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1802, 54, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1803, 54, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1804, 54, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1805, 54, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1806, 54, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1807, 54, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1808, 54, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1809, 54, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1810, 54, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1811, 54, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1812, 54, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1813, 54, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1814, 54, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1815, 54, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1816, 54, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1817, 54, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1818, 54, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1819, 54, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1820, 54, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1821, 54, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1822, 54, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1823, 54, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1824, 54, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1825, 54, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1826, 54, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1827, 54, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1828, 54, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1829, 54, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1830, 54, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1831, 54, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1832, 54, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1833, 54, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1834, 54, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1835, 54, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1836, 54, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1837, 54, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1838, 54, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1839, 54, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1840, 54, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1841, 56, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1842, 56, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1843, 56, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1844, 56, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1845, 56, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1846, 56, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1847, 56, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1848, 56, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1849, 56, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1850, 56, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1851, 56, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1852, 56, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1853, 56, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1854, 56, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1855, 56, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1856, 56, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1857, 56, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1858, 56, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1859, 56, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1860, 56, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1861, 56, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1862, 56, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1863, 56, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1864, 56, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1865, 56, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1866, 56, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1867, 56, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1868, 56, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1869, 56, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1870, 56, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1871, 56, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1872, 56, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1873, 56, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1874, 56, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1875, 56, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1876, 56, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1877, 56, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1878, 56, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1879, 56, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1880, 56, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1881, 56, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1882, 56, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1883, 56, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1884, 56, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1885, 56, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1886, 56, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1887, 57, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1888, 57, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1889, 57, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1890, 57, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1891, 57, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1892, 57, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1893, 57, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1894, 57, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1895, 57, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1896, 57, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1897, 57, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1898, 57, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1899, 57, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1900, 57, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1901, 57, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1902, 57, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1903, 57, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1904, 57, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1905, 57, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1906, 57, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1907, 57, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1908, 57, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1909, 57, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1910, 57, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1911, 57, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1912, 57, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1913, 57, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1914, 57, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1915, 57, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1916, 57, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1917, 57, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1918, 57, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1919, 57, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1920, 57, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1921, 57, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1922, 57, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1923, 57, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1924, 57, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1925, 57, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1926, 57, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1927, 57, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1928, 57, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1929, 57, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1930, 57, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1931, 57, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1932, 57, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1933, 59, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1934, 59, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1935, 59, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1936, 59, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1937, 59, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1938, 59, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1939, 59, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1940, 59, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1941, 59, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1942, 59, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1943, 59, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1944, 59, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1945, 59, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1946, 59, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1947, 59, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1948, 59, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1949, 59, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1950, 59, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1951, 59, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1952, 59, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1953, 59, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1954, 59, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1955, 59, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1956, 59, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1957, 59, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1958, 59, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1959, 59, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1960, 59, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1961, 59, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1962, 59, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1963, 59, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1964, 59, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1965, 59, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1966, 59, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1967, 59, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1968, 59, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1969, 59, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1970, 59, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1971, 59, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1972, 59, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1973, 59, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1974, 59, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1975, 59, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1976, 59, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1977, 59, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1978, 59, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1979, 60, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1980, 60, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1981, 60, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1982, 60, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1983, 60, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1984, 60, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1985, 60, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1986, 60, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1987, 60, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1988, 60, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1989, 60, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1990, 60, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1991, 60, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1992, 60, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1993, 60, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1994, 60, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1995, 60, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1996, 60, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1997, 60, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1998, 60, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (1999, 60, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2000, 60, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2001, 60, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2002, 60, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2003, 60, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2004, 60, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2005, 60, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2006, 60, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2007, 60, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2008, 60, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2009, 60, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2010, 60, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2011, 60, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2012, 60, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2013, 60, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2014, 60, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2015, 60, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2016, 60, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2017, 60, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2018, 60, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2019, 60, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2020, 60, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2021, 60, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2022, 60, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2023, 60, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2024, 60, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2025, 61, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2026, 61, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2027, 61, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2028, 61, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2029, 61, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2030, 61, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2031, 61, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2032, 61, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2033, 61, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2034, 61, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2035, 61, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2036, 61, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2037, 61, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2038, 61, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2039, 61, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2040, 61, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2041, 61, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2042, 61, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2043, 61, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2044, 61, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2045, 61, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2046, 61, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2047, 61, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2048, 61, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2049, 61, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2050, 61, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2051, 61, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2052, 61, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2053, 61, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2054, 61, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2055, 61, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2056, 61, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2057, 61, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2058, 61, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2059, 61, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2060, 61, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2061, 61, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2062, 61, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2063, 61, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2064, 61, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2065, 61, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2066, 61, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2067, 61, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2068, 61, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2069, 61, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2070, 61, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2071, 62, '主键ID', 'Long', 'id', NULL, 'int', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2072, 62, '全宗号', 'String', 'fonds_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2073, 62, '全宗名称', 'String', 'fonds_name', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2074, 62, '保管期限', 'String', 'retention_period', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2075, 62, '件号', 'String', 'item_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2076, 62, '档号，由系统生成', 'String', 'archive_number', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2077, 62, '归档部门', 'String', 'department', 255, 'varchar(255)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2078, 62, '归档人', 'String', 'archiver', 100, 'varchar(100)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2079, 62, '归档时间', 'Date', 'archive_date', NULL, 'datetime', '1', '1', '1', '1', '1', 'EQ', 'datetime', NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2080, 62, '备注', 'String', 'remarks', 65535, 'text', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2081, 62, '归档状态：0收发文，1待归档，2已归档', 'Long', 'archive_status', NULL, 'tinyint', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, NULL, 11, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2082, 62, '创建者', 'String', 'create_by', 64, 'varchar(64)', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, NULL, 12, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2083, 62, '创建时间', 'Date', 'create_time', NULL, 'datetime', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', NULL, NULL, 13, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2084, 62, '更新者', 'String', 'update_by', 64, 'varchar(64)', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, NULL, 14, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2085, 62, '更新时间', 'Date', 'update_time', NULL, 'datetime', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2086, 62, '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'String', 'category_code', 10, 'varchar(10)', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, NULL, 16, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2087, 62, '备用字段1', 'String', 'field1', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 17, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2088, 62, '备用字段2', 'String', 'field2', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 18, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2089, 62, '备用字段3', 'String', 'field3', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 19, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2090, 62, '备用字段4', 'String', 'field4', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 20, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2091, 62, '备用字段5', 'String', 'field5', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 21, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2092, 62, '备用字段6', 'String', 'field6', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2093, 62, '备用字段7', 'String', 'field7', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 23, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2094, 62, '备用字段8', 'String', 'field8', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 24, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2095, 62, '备用字段9', 'String', 'field9', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 25, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2096, 62, '备用字段10', 'String', 'field10', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 26, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2097, 62, '备用字段11', 'String', 'field11', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2098, 62, '备用字段12', 'String', 'field12', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 28, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2099, 62, '备用字段13', 'String', 'field13', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 29, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2100, 62, '备用字段14', 'String', 'field14', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2101, 62, '备用字段15', 'String', 'field15', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 31, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2102, 62, '备用字段16', 'String', 'field16', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 32, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2103, 62, '备用字段17', 'String', 'field17', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 33, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2104, 62, '备用字段18', 'String', 'field18', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 34, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2105, 62, '备用字段19', 'String', 'field19', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 35, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2106, 62, '备用字段20', 'String', 'field20', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 36, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2107, 62, '备用字段21', 'String', 'field21', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 37, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2108, 62, '备用字段22', 'String', 'field22', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 38, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2109, 62, '备用字段23', 'String', 'field23', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 39, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2110, 62, '备用字段24', 'String', 'field24', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 40, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2111, 62, '备用字段25', 'String', 'field25', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 41, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2112, 62, '备用字段26', 'String', 'field26', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 42, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2113, 62, '备用字段27', 'String', 'field27', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 43, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2114, 62, '备用字段28', 'String', 'field28', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 44, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2115, 62, '备用字段29', 'String', 'field29', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 45, NULL, NULL, NULL, NULL);
INSERT INTO `archive_item` VALUES (2116, 62, '备用字段30', 'String', 'field30', 500, 'varchar(500)', '0', NULL, NULL, NULL, NULL, 'EQ', 'textarea', NULL, NULL, 46, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for archive_relation
-- ----------------------------
DROP TABLE IF EXISTS `archive_relation`;
CREATE TABLE `archive_relation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `link_category_id` int(0) NOT NULL COMMENT '主分类ID',
  `linked_category_id` int(0) NOT NULL COMMENT '子分类ID',
  `link_column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '关联字段名称',
  `linked_column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被关联字段名称',
  `column_length` int(0) NOT NULL COMMENT '字段长度',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '档案分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive_relation
-- ----------------------------

-- ----------------------------
-- Table structure for archive_report_templates
-- ----------------------------
DROP TABLE IF EXISTS `archive_report_templates`;
CREATE TABLE `archive_report_templates`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `content` mediumblob NULL COMMENT '模板内容',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '档案报表模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive_report_templates
-- ----------------------------
INSERT INTO `archive_report_templates` VALUES (9, 'test2.ureport.xml', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E3C757265706F72743E3C63656C6C20657870616E643D22446F776E22206E616D653D2241312220726F773D22312220636F6C3D2231223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C646174617365742D76616C756520646174617365742D6E616D653D22E68AA5E8A1A8E6A8A1E69DBF22206167677265676174653D2273656C656374222070726F70657274793D22696422206F726465723D226E6F6E6522206D617070696E672D747970653D2273696D706C65223E3C2F646174617365742D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D22446F776E22206E616D653D2242312220726F773D22312220636F6C3D2232223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C646174617365742D76616C756520646174617365742D6E616D653D22E68AA5E8A1A8E6A8A1E69DBF22206167677265676174653D2273656C656374222070726F70657274793D226E616D6522206F726465723D226E6F6E6522206D617070696E672D747970653D2273696D706C65223E3C2F646174617365742D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2243312220726F773D22312220636F6C3D2233223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B6363635D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2244312220726F773D22312220636F6C3D2234223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2241322220726F773D22322220636F6C3D2231223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2242322220726F773D22322220636F6C3D2232223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2243322220726F773D22322220636F6C3D2233223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2244322220726F773D22322220636F6C3D2234223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2241332220726F773D22332220636F6C3D2231223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2242332220726F773D22332220636F6C3D2232223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2243332220726F773D22332220636F6C3D2233223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C63656C6C20657870616E643D224E6F6E6522206E616D653D2244332220726F773D22332220636F6C3D2234223E3C63656C6C2D7374796C6520666F6E742D73697A653D2231302220616C69676E3D2263656E746572222076616C69676E3D226D6964646C65223E3C6C6566742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C72696768742D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C746F702D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C626F74746F6D2D626F726465722077696474683D223122207374796C653D22736F6C69642220636F6C6F723D22302C302C30222F3E3C2F63656C6C2D7374796C653E3C73696D706C652D76616C75653E3C215B43444154415B5D5D3E3C2F73696D706C652D76616C75653E3C2F63656C6C3E3C726F7720726F772D6E756D6265723D223122206865696768743D223138222F3E3C726F7720726F772D6E756D6265723D223222206865696768743D223138222F3E3C726F7720726F772D6E756D6265723D223322206865696768743D223138222F3E3C636F6C756D6E20636F6C2D6E756D6265723D2231222077696474683D223830222F3E3C636F6C756D6E20636F6C2D6E756D6265723D2232222077696474683D223830222F3E3C636F6C756D6E20636F6C2D6E756D6265723D2233222077696474683D223830222F3E3C636F6C756D6E20636F6C2D6E756D6265723D2234222077696474683D223830222F3E3C64617461736F75726365206E616D653D22E69CACE59CB0E695B0E68DAEE5BA932220747970653D226A6462632220757365726E616D653D22726F6F74222070617373776F72643D22726F6F74222075726C3D226A6462633A6D7973716C3A2F2F6C6F63616C686F73743A333330382F61726368697665735F6E65773F757365556E69636F64653D7472756526616D703B636861726163746572456E636F64696E673D7574663826616D703B7A65726F4461746554696D654265686176696F723D636F6E76657274546F4E756C6C26616D703B75736553534C3D7472756526616D703B73657276657254696D657A6F6E653D474D542532423822206472697665723D22636F6D2E6D7973716C2E636A2E6A6462632E447269766572223E3C64617461736574206E616D653D22E68AA5E8A1A8E6A8A1E69DBF2220747970653D2273716C223E3C73716C3E3C215B43444154415B53454C454354202A2046524F4D20617263686976655F7265706F72745F74656D706C6174657320776865726520696420696E20283A6964290A200A0A5D5D3E3C2F73716C3E3C6669656C64206E616D653D226964222F3E3C6669656C64206E616D653D226E616D65222F3E3C6669656C64206E616D653D22636F6E74656E74222F3E3C6669656C64206E616D653D226372656174655F6279222F3E3C6669656C64206E616D653D226372656174655F74696D65222F3E3C6669656C64206E616D653D227570646174655F6279222F3E3C6669656C64206E616D653D227570646174655F74696D65222F3E3C706172616D65746572206E616D653D2269642220747970653D224C697374222064656661756C742D76616C75653D2230222F3E3C2F646174617365743E3C2F64617461736F757263653E3C706170657220747970653D22413422206C6566742D6D617267696E3D223930222072696768742D6D617267696E3D223930220A20202020746F702D6D617267696E3D2237322220626F74746F6D2D6D617267696E3D2237322220706167696E672D6D6F64653D22666974706167652220666978726F77733D2230220A2020202077696474683D2235393522206865696768743D2238343222206F7269656E746174696F6E3D22706F727472616974222068746D6C2D7265706F72742D616C69676E3D226C656674222062672D696D6167653D22222068746D6C2D696E74657276616C2D726566726573682D76616C75653D22302220636F6C756D6E2D656E61626C65643D2266616C7365223E3C2F70617065723E3C2F757265706F72743E, '', '2024-07-06 15:17:11', '', '2024-07-06 15:50:38');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'archive_item', '档案信息模板', '', '', 'ArchiveItem', 'crud', 'element-ui', 'com.archives.archive', 'archive', 'item', '档案信息模板', '高小川', '0', '/', '{}', 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52', NULL);
INSERT INTO `gen_table` VALUES (4, 'archive_category', '档案分类', '', '', 'ArchiveCategory', 'tree', 'element-ui', 'com.archives.archive', 'archive', 'category', '档案分类', '高小川', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2011\"}', 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30', NULL);
INSERT INTO `gen_table` VALUES (5, 'archive_info', '档案信息表', NULL, NULL, 'ArchiveInfo', 'crud', 'element-ui', 'com.archives.archive', 'archive', 'info', '档案信息', 'é«å°å·', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (56, 3, 'id', '主键ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (57, 3, 'category_id', '分类ID', 'int', 'Long', 'categoryId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (58, 3, 'item_name', '项目名称', 'varchar(200)', 'String', 'itemName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (59, 3, 'item_type', '项目类型', 'varchar(100)', 'String', 'itemType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (60, 3, 'column_name', '列名称', 'varchar(200)', 'String', 'columnName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (61, 3, 'column_length', '字段长度', 'int', 'Long', 'columnLength', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (62, 3, 'is_required', '是否必填（1是）', 'char(1)', 'String', 'isRequired', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (63, 3, 'is_insert', '是否为插入字段（1是）', 'char(1)', 'String', 'isInsert', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (64, 3, 'is_edit', '是否编辑字段（1是）', 'char(1)', 'String', 'isEdit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (65, 3, 'is_list', '是否列表字段（1是）', 'char(1)', 'String', 'isList', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (66, 3, 'is_query', '是否查询字段（1是）', 'char(1)', 'String', 'isQuery', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (67, 3, 'query_type', '查询方式（等于、不等于、大于、小于、范围）', 'varchar(200)', 'String', 'queryType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 12, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (68, 3, 'html_type', '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）', 'varchar(200)', 'String', 'htmlType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 13, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (69, 3, 'dict_type', '字典类型', 'varchar(200)', 'String', 'dictType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 14, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (70, 3, 'html_group', '页面显示分组', 'varchar(100)', 'String', 'htmlGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (71, 3, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (72, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (73, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (74, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (75, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2024-06-30 00:42:29', '', '2024-07-06 22:08:52');
INSERT INTO `gen_table_column` VALUES (76, 4, 'id', '主键ID', 'int', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (77, 4, 'name', '分类名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (78, 4, 'parent_id', '父分类ID', 'int', 'Long', 'parentId', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 3, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (79, 4, 'level', '分类层级', 'int', 'Long', 'level', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 4, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (80, 4, 'type', '类别', 'varchar(10)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'archive_node_type', 5, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (81, 4, 'is_active', '显示状态', 'tinyint(1)', 'Integer', 'isActive', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_show_hide', 6, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (82, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (83, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (84, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (85, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-07-02 12:58:06', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (86, 4, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, '', '2024-07-06 20:42:41', '', '2024-07-11 13:23:30');
INSERT INTO `gen_table_column` VALUES (87, 5, 'id', '主键ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (88, 5, 'fonds_number', '全宗号', 'varchar(100)', 'String', 'fondsNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (89, 5, 'fonds_name', '全宗名称', 'varchar(255)', 'String', 'fondsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (90, 5, 'retention_period', '保管期限', 'varchar(100)', 'String', 'retentionPeriod', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (91, 5, 'item_number', '件号', 'varchar(100)', 'String', 'itemNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (92, 5, 'archive_number', '档号', 'varchar(100)', 'String', 'archiveNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (93, 5, 'department', '归档部门', 'varchar(255)', 'String', 'department', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (94, 5, 'archiver', '归档人', 'varchar(100)', 'String', 'archiver', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (95, 5, 'archive_date', '归档时间', 'datetime', 'Date', 'archiveDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (96, 5, 'remarks', '备注', 'text', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (97, 5, 'archive_status', '归档状态', 'tinyint', 'Long', 'archiveStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (98, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (99, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (100, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (101, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (102, 5, 'category_code', '档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)', 'varchar(10)', 'String', 'categoryCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (103, 5, 'field1', '备用字段1', 'varchar(500)', 'String', 'field1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 17, 'admin', '2024-07-11 10:22:06', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (104, 5, 'field2', '备用字段2', 'varchar(500)', 'String', 'field2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (105, 5, 'field3', '备用字段3', 'varchar(500)', 'String', 'field3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 19, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (106, 5, 'field4', '备用字段4', 'varchar(500)', 'String', 'field4', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 20, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (107, 5, 'field5', '备用字段5', 'varchar(500)', 'String', 'field5', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 21, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (108, 5, 'field6', '备用字段6', 'varchar(500)', 'String', 'field6', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 22, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (109, 5, 'field7', '备用字段7', 'varchar(500)', 'String', 'field7', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 23, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (110, 5, 'field8', '备用字段8', 'varchar(500)', 'String', 'field8', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 24, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (111, 5, 'field9', '备用字段9', 'varchar(500)', 'String', 'field9', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 25, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (112, 5, 'field10', '备用字段10', 'varchar(500)', 'String', 'field10', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 26, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (113, 5, 'field11', '备用字段11', 'varchar(500)', 'String', 'field11', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 27, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (114, 5, 'field12', '备用字段12', 'varchar(500)', 'String', 'field12', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 28, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (115, 5, 'field13', '备用字段13', 'varchar(500)', 'String', 'field13', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 29, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (116, 5, 'field14', '备用字段14', 'varchar(500)', 'String', 'field14', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 30, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (117, 5, 'field15', '备用字段15', 'varchar(500)', 'String', 'field15', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 31, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (118, 5, 'field16', '备用字段16', 'varchar(500)', 'String', 'field16', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 32, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (119, 5, 'field17', '备用字段17', 'varchar(500)', 'String', 'field17', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 33, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (120, 5, 'field18', '备用字段18', 'varchar(500)', 'String', 'field18', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 34, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (121, 5, 'field19', '备用字段19', 'varchar(500)', 'String', 'field19', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 35, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (122, 5, 'field20', '备用字段20', 'varchar(500)', 'String', 'field20', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 36, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (123, 5, 'field21', '备用字段21', 'varchar(500)', 'String', 'field21', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 37, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (124, 5, 'field22', '备用字段22', 'varchar(500)', 'String', 'field22', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 38, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (125, 5, 'field23', '备用字段23', 'varchar(500)', 'String', 'field23', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 39, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (126, 5, 'field24', '备用字段24', 'varchar(500)', 'String', 'field24', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 40, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (127, 5, 'field25', '备用字段25', 'varchar(500)', 'String', 'field25', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 41, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (128, 5, 'field26', '备用字段26', 'varchar(500)', 'String', 'field26', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 42, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (129, 5, 'field27', '备用字段27', 'varchar(500)', 'String', 'field27', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 43, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (130, 5, 'field28', '备用字段28', 'varchar(500)', 'String', 'field28', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 44, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (131, 5, 'field29', '备用字段29', 'varchar(500)', 'String', 'field29', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 45, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');
INSERT INTO `gen_table_column` VALUES (132, 5, 'field30', '备用字段30', 'varchar(500)', 'String', 'field30', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 46, 'admin', '2024-07-11 10:22:07', '', '2024-07-11 13:23:39');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-29 00:03:54', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (100, '登录页面-系统名称', 'sys.login.sysName', '坤鹏档案@数字档案管理系统', 'Y', 'admin', '2024-06-29 00:10:47', 'admin', '2024-07-02 14:31:26', '设置首页系统名称格式：公司名称@系统名称');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '坤鹏档案服务公司', 0, '高小川', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', 'admin', '2024-07-11 15:47:52');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '大连总公司', 1, '高', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', 'admin', '2024-07-11 15:48:09');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '开发区分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', 'admin', '2024-07-11 15:48:19');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-29 00:03:42', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-29 00:03:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '档案节点', '0', 'archive_node_type', NULL, 'default', 'N', '0', 'admin', '2024-06-30 01:40:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '档案库', '1', 'archive_node_type', NULL, 'default', 'N', '0', 'admin', '2024-06-30 01:40:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-29 00:03:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '档案节点类型', 'archive_node_type', '0', 'admin', '2024-06-30 01:38:57', 'admin', '2024-06-30 01:39:32', '档案节点类型列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-06-29 00:03:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-29 00:03:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-29 00:03:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 00:04:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 00:19:51');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 00:20:02');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 00:23:05');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:00:04');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 01:00:43');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-29 01:09:47');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:09:58');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 01:10:07');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:16:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 01:16:38');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:31:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 01:34:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-29 01:36:48');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:36:52');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-29 01:44:39');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-06-29 01:49:59');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-29 01:50:06');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-30 10:21:27');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 12:55:11');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 14:29:43');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-02 15:23:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 15:23:25');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 17:45:00');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-02 18:32:51');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 18:32:59');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 09:15:29');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 10:00:38');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-03 12:52:18');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 12:52:25');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 20:16:45');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 21:33:36');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-03 21:53:47');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 21:53:53');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-03 22:01:08');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 22:01:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-04 15:11:31');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 15:11:35');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 13:34:19');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 11:16:09');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:16:15');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:32:54');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:33:00');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:37:04');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-07-06 11:39:06');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:39:10');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 11:39:46');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 11:40:00');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 11:40:04');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 11:40:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 12:21:20');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 12:31:41');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 12:31:46');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 13:54:27');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 15:17:27');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 15:17:31');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 15:50:00');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 15:50:07');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-06 15:50:12');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 15:50:16');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-06 16:02:10');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 16:02:18');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-06 19:46:48');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 00:52:42');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 10:30:20');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-07 11:02:56');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 11:03:03');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 12:18:34');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-07 16:44:29');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 16:44:33');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 21:48:22');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-08 14:47:39');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-09 07:25:32');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 10:17:21');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 13:05:17');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '192.168.20.100', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 15:22:39');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-11 15:25:08');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 14:02:01');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '192.168.20.112', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 14:39:16');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 17:04:53');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-12 17:49:10');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-15 11:14:16');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 11:14:24');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.20.119', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 16:29:13');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '192.168.20.119', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 17:12:39');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-17 13:48:51');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-17 17:44:00');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 10:09:42');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 14:14:15');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '192.168.20.119', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 15:51:42');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '192.168.10.103', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 16:40:45');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:03:07');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:15:31');
INSERT INTO `sys_logininfor` VALUES (193, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 17:15:37');
INSERT INTO `sys_logininfor` VALUES (194, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-18 17:15:40');
INSERT INTO `sys_logininfor` VALUES (195, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-18 17:15:55');
INSERT INTO `sys_logininfor` VALUES (196, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-18 17:15:58');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:16:06');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:16:35');
INSERT INTO `sys_logininfor` VALUES (199, '系统管理', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-18 17:16:44');
INSERT INTO `sys_logininfor` VALUES (200, '系统管理', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-07-18 17:16:58');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:17:08');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:18:11');
INSERT INTO `sys_logininfor` VALUES (203, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:18:18');
INSERT INTO `sys_logininfor` VALUES (204, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:19:12');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:19:17');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:19:49');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:19:53');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-18 17:20:04');
INSERT INTO `sys_logininfor` VALUES (209, 'system', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-18 17:20:09');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-07-19 00:07:17');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '192.168.20.105', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-19 00:07:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2041 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 6, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-06-29 00:03:46', 'admin', '2024-07-02 15:22:17', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 7, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-06-29 00:03:46', 'admin', '2024-07-02 15:22:26', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '开发工具', 0, 8, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-06-29 00:03:46', 'admin', '2024-07-02 15:22:37', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-06-29 00:03:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-06-29 00:03:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-29 00:03:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-06-29 00:03:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-06-29 00:03:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 3, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-06-29 00:03:46', 'admin', '2024-07-06 20:02:24', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 3, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-06-29 00:03:46', 'admin', '2024-07-06 20:02:41', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-06-29 00:03:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-06-29 00:03:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-06-29 00:03:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-06-29 00:03:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-06-29 00:03:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-06-29 00:03:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-06-29 00:03:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-29 00:03:46', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-06-29 00:03:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-06-29 00:03:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-06-29 00:03:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-06-29 00:03:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-29 00:03:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-06-29 00:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '档案库设定', 2011, 1, 'category', 'archive/category/index', NULL, 1, 0, 'C', '0', '0', 'archive:category:list', '#', 'admin', '2024-06-30 00:51:22', 'admin', '2024-07-11 14:35:21', '档案分类菜单');
INSERT INTO `sys_menu` VALUES (2001, '档案分类查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:category:query', '#', 'admin', '2024-06-30 00:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '档案分类新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:category:add', '#', 'admin', '2024-06-30 00:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '档案分类修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:category:edit', '#', 'admin', '2024-06-30 00:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '档案分类删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:category:remove', '#', 'admin', '2024-06-30 00:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '档案分类导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:category:export', '#', 'admin', '2024-06-30 00:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '预归档案', 0, 1, 'PreArchive', NULL, NULL, 1, 0, 'M', '0', '0', '', '预归档案', 'admin', '2024-07-02 15:15:42', 'admin', '2024-07-02 15:15:59', '');
INSERT INTO `sys_menu` VALUES (2007, '档案管理', 0, 2, 'ArchiveManagement', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '档案资源', 'admin', '2024-07-02 15:18:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '档案利用', 0, 3, 'ArchiveUse', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '档案利用', 'admin', '2024-07-02 15:19:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '库房管理', 0, 4, 'repository', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '库房管理', 'admin', '2024-07-02 15:21:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '档案统计', 0, 5, 'ArchiveStatistics', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '档案统计', 'admin', '2024-07-02 15:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '业务设置', 1, 0, 'biz-settings', NULL, NULL, 1, 0, 'M', '0', '0', '', '设置', 'admin', '2024-07-02 15:26:13', 'admin', '2024-07-06 11:39:40', '');
INSERT INTO `sys_menu` VALUES (2012, '报表管理', 2011, 2, 'rpttemplates', 'archive/rpttemplates/index', NULL, 1, 0, 'C', '0', '0', 'archive:rpttemplates:list', '#', 'admin', '2024-07-05 13:51:25', 'admin', '2024-07-11 19:45:16', '报表管理菜单');
INSERT INTO `sys_menu` VALUES (2013, '报表管理查询', 2012, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:rpttemplates:query', '#', 'admin', '2024-07-05 13:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '报表管理新增', 2012, 2, '#', '', NULL, 1, 0, 'F', '0', '1', 'archive:rpttemplates:add', '#', 'admin', '2024-07-05 13:51:26', 'admin', '2024-07-06 11:24:22', '');
INSERT INTO `sys_menu` VALUES (2015, '报表管理修改', 2012, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:rpttemplates:edit', '#', 'admin', '2024-07-05 13:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '报表管理删除', 2012, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:rpttemplates:remove', '#', 'admin', '2024-07-05 13:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '报表管理导出', 2012, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:rpttemplates:export', '#', 'admin', '2024-07-05 13:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '报表新增', 2011, 99, 'designer', 'archive/rpttemplates/designer', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-07-06 12:28:42', 'admin', '2024-07-06 14:21:34', '');
INSERT INTO `sys_menu` VALUES (2020, '报表设计', 2011, 99, 'designer/:tpl_name', 'archive/rpttemplates/designer', NULL, 1, 0, 'C', '1', '0', NULL, '#', 'admin', '2024-07-06 14:00:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '报表预览', 2011, 99, 'preview/:tpl_name', 'archive/rpttemplates/preview', '', 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-07-06 14:09:39', 'admin', '2024-07-06 15:42:57', '');
INSERT INTO `sys_menu` VALUES (2028, '文件上传', 3, 1, 'oss', 'system/oss/index', NULL, 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2024-07-11 15:10:42', 'admin', '2024-07-11 15:12:45', '文件上传菜单');
INSERT INTO `sys_menu` VALUES (2029, '文件上传查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2024-07-11 15:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '文件上传新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2024-07-11 15:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '文件上传修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2024-07-11 15:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '文件上传删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2024-07-11 15:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '文件上传导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:oss:export', '#', 'admin', '2024-07-11 15:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '整理库', 2007, 1, 'info', 'archive/info/index', NULL, 1, 0, 'C', '0', '0', 'archive:info:list', 'edit', 'admin', '2024-07-11 16:30:22', 'admin', '2024-07-11 16:31:25', '档案信息菜单');
INSERT INTO `sys_menu` VALUES (2035, '档案信息查询', 2034, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:info:query', '#', 'admin', '2024-07-11 16:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '档案信息新增', 2034, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:info:add', '#', 'admin', '2024-07-11 16:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '档案信息修改', 2034, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:info:edit', '#', 'admin', '2024-07-11 16:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '档案信息删除', 2034, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:info:remove', '#', 'admin', '2024-07-11 16:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '档案信息导出', 2034, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'archive:info:export', '#', 'admin', '2024-07-11 16:30:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '文书档案测试', 2007, 1, 'document', 'archive/info/document', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-07-12 13:18:39', 'admin', '2024-07-12 13:19:14', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 346 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.archives.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"admin@163.com\",\"nickName\":\"档案管理\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 00:06:00', 74);
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.archives.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/06/29/2024-06-24_213339_20240629000623A001.jpg\",\"code\":200}', 0, NULL, '2024-06-29 00:06:23', 174);
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.archives.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"admin@163.com\",\"nickName\":\"档案管理\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 00:06:25', 74);
INSERT INTO `sys_oper_log` VALUES (103, '参数管理', 1, 'com.archives.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"sys.login.sysName\",\"configName\":\"登录页面-系统名称\",\"configType\":\"Y\",\"configValue\":\"坤鹏档案@数字档案管理系统\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 00:10:47', 73);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.archives.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-06-29 00:03:45\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 01:32:26', 388);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 3, 'com.archives.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-29 01:32:32', 99);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'com.archives.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category,archive_item,archive_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 00:42:29', 786);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 00:44:17', 142);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-06-30 00:47:11', 106);
INSERT INTO `sys_oper_log` VALUES (109, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-30 01:21:17\",\"level\":1,\"name\":\"文书档案\",\"params\":{},\"parentId\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\devTools\\WorkSpace\\Archives_workspace\\Archives\\Archives\\Archives-system\\target\\classes\\mapper\\archive\\ArchiveCategoryMapper.xml]\r\n### The error may involve com.archives.archive.mapper.ArchiveCategoryMapper.insertArchiveCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into archive_category          ( name,             parent_id,             level,                                       create_time )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2024-06-30 01:21:17', 273);
INSERT INTO `sys_oper_log` VALUES (110, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-30 01:21:22\",\"level\":1,\"name\":\"文书档案\",\"params\":{},\"parentId\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\devTools\\WorkSpace\\Archives_workspace\\Archives\\Archives\\Archives-system\\target\\classes\\mapper\\archive\\ArchiveCategoryMapper.xml]\r\n### The error may involve com.archives.archive.mapper.ArchiveCategoryMapper.insertArchiveCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into archive_category          ( name,             parent_id,             level,                                       create_time )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2024-06-30 01:21:22', 4);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 00:44:17\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类别名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 00:44:17\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类别\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 00:44:17\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:32:39', 105);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:32:39\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类别名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:32:39\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类别\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:32:39\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:34:43', 170);
INSERT INTO `sys_oper_log` VALUES (113, '字典类型', 1, 'com.archives.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"档案节点类型\",\"dictType\":\"archive_node_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:38:58', 48);
INSERT INTO `sys_oper_log` VALUES (114, '字典类型', 2, 'com.archives.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-06-30 01:38:57\",\"dictId\":100,\"dictName\":\"档案节点类型\",\"dictType\":\"archive_node_type\",\"params\":{},\"remark\":\"档案节点类型列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:39:32', 95);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.archives.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"档案节点\",\"dictSort\":0,\"dictType\":\"archive_node_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:40:03', 98);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.archives.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"档案库\",\"dictSort\":0,\"dictType\":\"archive_node_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:40:55', 65);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:34:43\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类别名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:34:43\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类别\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:34:43\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:41:50', 85);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-06-30 01:41:58', 241);
INSERT INTO `sys_oper_log` VALUES (119, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-30 01:46:45\",\"id\":1,\"name\":\"文书档案\",\"params\":{},\"parentId\":0,\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:46:45', 91);
INSERT INTO `sys_oper_log` VALUES (120, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-30 01:47:17\",\"id\":2,\"name\":\"文件级\",\"params\":{},\"parentId\":1,\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:47:18', 201);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"ArchiveItem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":56,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"分类ID\",\"columnId\":57,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"项目名称\",\"columnId\":58,\"columnName\":\"item_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ItemType\",\"columnComment\":\"项目类型\",\"columnId\":59,\"columnName\":\"item_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:54:19', 294);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:41:50\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类别名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:41:50\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类别\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:41:50\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:55:35', 98);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:55:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类别名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:55:35\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类别\",\"columnId\":3,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:55:35\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":4,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 01:56:26', 107);
INSERT INTO `sys_oper_log` VALUES (124, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-30 10:22:22\",\"id\":3,\"name\":\"案卷级\",\"params\":{},\"parentId\":1,\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-30 10:22:22', 62);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 3, 'com.archives.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 12:57:18', 309);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 6, 'com.archives.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 12:58:06', 184);
INSERT INTO `sys_oper_log` VALUES (127, '参数管理', 2, 'com.archives.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":100,\"configKey\":\"sys.login.sysName\",\"configName\":\"登录页面-系统名称\",\"configType\":\"Y\",\"configValue\":\"坤鹏档案@数字档案管理系统\",\"createBy\":\"admin\",\"createTime\":\"2024-06-29 00:10:47\",\"params\":{},\"remark\":\"设置首页系统名称格式：公司名称@系统名称\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 14:31:26', 38);
INSERT INTO `sys_oper_log` VALUES (128, '参数管理', 9, 'com.archives.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 14:31:31', 96);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"预归档案\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预归档案\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"Pre-Archive\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:15:42', 241);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 15:15:42\",\"icon\":\"预归档案\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"预归档案\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"PreArchive\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:15:59', 115);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"档案资源\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"档案管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"ArchiveManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:18:15', 215);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"档案利用\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"档案利用\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"ArchiveUse\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:19:28', 166);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"库房管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"库房管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"repository\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:21:31', 92);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"档案统计\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"档案统计\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"ArchiveStatistics\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:22:09', 76);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-29 00:03:46\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:22:18', 64);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-29 00:03:46\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:22:26', 62);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-29 00:03:46\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"开发工具\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:22:37', 64);
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 2, 'com.archives.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":true,\"createTime\":\"2024-06-29 00:03:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007,2008,2009,2010,1,100,1000,1001,1002,1003,1004,1005,1006,2000,2001,2002,2003,2004,2005,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"超级管理员\",\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员角色', '2024-07-02 15:23:12', 15);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"设置\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业务设置\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"BusinessSettings\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:26:13', 61);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 15:26:13\",\"icon\":\"设置\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"业务设置\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"BusinessSettings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:26:36', 62);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/category/index\",\"createTime\":\"2024-06-30 00:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"档案分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"path\":\"category\",\"perms\":\"archive:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:26:53', 72);
INSERT INTO `sys_oper_log` VALUES (142, '个人信息', 2, 'com.archives.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"admin@163.com\",\"nickName\":\"档案管理\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-02 15:37:14', 70);
INSERT INTO `sys_oper_log` VALUES (143, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:04\",\"id\":1,\"name\":\"文书档案\",\"params\":{},\"parentId\":0,\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 20:20:05', 861);
INSERT INTO `sys_oper_log` VALUES (144, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:30\",\"id\":2,\"name\":\"文件级\",\"params\":{},\"parentId\":1,\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 20:20:30', 67);
INSERT INTO `sys_oper_log` VALUES (145, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:48\",\"id\":3,\"name\":\"科技档案\",\"params\":{},\"parentId\":0,\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 20:20:48', 90);
INSERT INTO `sys_oper_log` VALUES (146, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:22:00\",\"id\":4,\"name\":\"案卷目录\",\"params\":{},\"parentId\":3,\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 20:22:00', 66);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"level\",\"javaType\":\"Lon', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 21:41:40', 803);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:41:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:41:40\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:41:40\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 21:45:31', 327);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-07-03 21:46:31', 370);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:45:30\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:45:30\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:45:30\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 21:55:32', 130);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-07-03 21:55:41', 102);
INSERT INTO `sys_oper_log` VALUES (152, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:05\",\"id\":1,\"level\":0,\"name\":\"文书档案\",\"params\":{},\"parentId\":0,\"type\":\"0\",\"updateTime\":\"2024-07-03 22:04:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:04:51', 92);
INSERT INTO `sys_oper_log` VALUES (153, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:30\",\"id\":2,\"level\":0,\"name\":\"文件级\",\"params\":{},\"parentId\":1,\"type\":\"1\",\"updateTime\":\"2024-07-03 22:05:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:05:16', 51);
INSERT INTO `sys_oper_log` VALUES (154, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:30\",\"id\":2,\"isActive\":0,\"level\":0,\"name\":\"文件级\",\"params\":{},\"parentId\":1,\"type\":\"1\",\"updateTime\":\"2024-07-03 22:11:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:11:45', 67);
INSERT INTO `sys_oper_log` VALUES (155, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:49\",\"id\":3,\"isActive\":0,\"level\":0,\"name\":\"科技档案\",\"params\":{},\"parentId\":0,\"type\":\"0\",\"updateTime\":\"2024-07-03 22:11:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:11:50', 71);
INSERT INTO `sys_oper_log` VALUES (156, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:20:05\",\"id\":1,\"isActive\":0,\"level\":0,\"name\":\"文书档案\",\"params\":{},\"parentId\":0,\"type\":\"0\",\"updateTime\":\"2024-07-03 22:11:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:11:54', 66);
INSERT INTO `sys_oper_log` VALUES (157, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 20:22:00\",\"id\":4,\"isActive\":0,\"level\":0,\"name\":\"案卷目录\",\"params\":{},\"parentId\":3,\"type\":\"1\",\"updateTime\":\"2024-07-03 22:11:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:11:57', 93);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:55:32\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:55:32\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-03 21:55:32\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:12:47', 127);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-07-03 22:32:25', 285);
INSERT INTO `sys_oper_log` VALUES (160, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 22:38:12\",\"id\":5,\"isActive\":0,\"name\":\"会计档案\",\"params\":{},\"parentId\":0,\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:38:13', 232);
INSERT INTO `sys_oper_log` VALUES (161, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-03 22:38:13\",\"id\":5,\"isActive\":1,\"level\":0,\"name\":\"会计档案\",\"params\":{},\"parentId\":0,\"type\":\"0\",\"updateTime\":\"2024-07-03 22:38:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:38:20', 108);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"ArchiveInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FondsNumber\",\"columnComment\":\"全宗号\",\"columnId\":11,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FondsName\",\"columnComment\":\"全宗名称\",\"columnId\":12,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RetentionPeriod\",\"columnComment\":\"保管期限\",\"columnId\":13,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-03 22:52:42', 355);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/index\",\"createTime\":\"2024-07-05 13:51:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"报表管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"path\":\"rpttemplates\",\"perms\":\"archive:rpttemplates:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:17:55', 115);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-05 13:51:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"报表管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"#\",\"perms\":\"archive:rpttemplates:add\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:24:22', 284);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"views/archive/rpttemplates/designer\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:26:41', 216);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 11:26:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:26:55', 95);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 15:26:13\",\"icon\":\"设置\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"业务设置\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"bizsettings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:28:55', 107);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 11:26:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:31:16', 102);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 15:26:13\",\"icon\":\"设置\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"业务设置\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"biz-settings\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 11:39:40', 87);
INSERT INTO `sys_oper_log` VALUES (170, '报表设计', 5, 'com.archives.web.controller.archive.ArchiveReportTemplatesController.export()', 'POST', 1, 'admin', '研发部门', '/archive/rpttemplates/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-07-06 11:41:54', 2126);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.archives.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:21:47', 282);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:28:43', 93);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:31:38', 123);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/category/index\",\"createTime\":\"2024-06-30 00:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"档案分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"category\",\"perms\":\"archive:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:32:27', 65);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/category/index\",\"createTime\":\"2024-06-30 00:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"档案分类\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"path\":\"category\",\"perms\":\"archive:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:33:25', 59);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 12:33:36', 44);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 13:15:49', 169);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2011,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 13:18:41', 115);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2012,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 13:56:08', 138);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2011,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 13:58:36', 104);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报表设计\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"designer/:tpl_name\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 14:00:18', 116);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"新增报表\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 14:00:28', 82);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"报表新增\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 14:00:49', 56);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 1, 'com.archives.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/preview\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报表预览\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"preview/:tpl_name\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 14:09:39', 224);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/designer\",\"createTime\":\"2024-07-06 12:28:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"报表新增\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"designer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 14:21:34', 94);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/preview\",\"createTime\":\"2024-07-06 14:09:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"报表预览\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"preview/:tpl_name\",\"perms\":\"\",\"query\":\"ids\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 15:40:14', 105);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/rpttemplates/preview\",\"createTime\":\"2024-07-06 14:09:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"报表预览\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":2011,\"path\":\"preview/:tpl_name\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 15:42:57', 99);
INSERT INTO `sys_oper_log` VALUES (188, '报表设计', 3, 'com.archives.web.controller.archive.ArchiveReportTemplatesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/rpttemplates/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 15:45:12', 190);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-06-29 00:03:46\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":3,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:02:24', 181);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-06-29 00:03:46\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":3,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:02:41', 251);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.archives.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/archive_category', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:42:41', 1473);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:42:41\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:42:41\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:42:41\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 20:48:18', 359);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_category\"}', NULL, 0, NULL, '2024-07-06 20:48:27', 128);
INSERT INTO `sys_oper_log` VALUES (194, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-06 21:08:41\",\"id\":6,\"isActive\":0,\"name\":\"声像档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:08:42', 191);
INSERT INTO `sys_oper_log` VALUES (195, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-06 21:08:42\",\"id\":6,\"isActive\":0,\"level\":0,\"name\":\"声像档案\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"type\":0,\"updateTime\":\"2024-07-06 21:10:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:10:13', 91);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:48:18\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:48:18\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 20:48:18\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:13:16', 147);
INSERT INTO `sys_oper_log` VALUES (197, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-06 21:17:29\",\"id\":7,\"isActive\":0,\"name\":\"卷内目录\",\"orderNum\":1,\"params\":{},\"parentId\":6,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:17:29', 93);
INSERT INTO `sys_oper_log` VALUES (198, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-06 21:38:49\",\"id\":8,\"isActive\":0,\"name\":\"案卷目录\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:38:49', 103);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"ArchiveItem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":56,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:54:18\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"分类ID\",\"columnId\":57,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:54:18\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"项目名称\",\"columnId\":58,\"columnName\":\"item_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 01:54:18\",\"usableColumn\":false},{\"capJavaField\":\"ItemType\",\"columnComment\":\"项目类型\",\"columnId\":59,\"columnName\":\"item_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 21:50:34', 186);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"item\",\"className\":\"ArchiveItem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":56,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:50:34\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"分类ID\",\"columnId\":57,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:50:34\",\"usableColumn\":false},{\"capJavaField\":\"ItemName\",\"columnComment\":\"项目名称\",\"columnId\":58,\"columnName\":\"item_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"itemName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:50:34\",\"usableColumn\":false},{\"capJavaField\":\"ItemType\",\"columnComment\":\"项目类型\",\"columnId\":59,\"columnName\":\"item_type\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 00:42:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 22:08:53', 318);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_item\"}', NULL, 0, NULL, '2024-07-06 22:09:27', 139);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/item/index\",\"createTime\":\"2024-07-06 22:14:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"档案信息模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"path\":\"item\",\"perms\":\"archive:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-06 22:33:28', 120);
INSERT INTO `sys_oper_log` VALUES (203, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:03:42\",\"id\":9,\"isActive\":0,\"name\":\"实物档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:03:42', 123);
INSERT INTO `sys_oper_log` VALUES (204, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:04:03\",\"id\":10,\"isActive\":0,\"name\":\"案卷目录\",\"orderNum\":1,\"params\":{},\"parentId\":9,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:04:04', 79);
INSERT INTO `sys_oper_log` VALUES (205, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:00', 147);
INSERT INTO `sys_oper_log` VALUES (206, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:03', 38);
INSERT INTO `sys_oper_log` VALUES (207, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:06', 88);
INSERT INTO `sys_oper_log` VALUES (208, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:09', 65);
INSERT INTO `sys_oper_log` VALUES (209, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:13', 109);
INSERT INTO `sys_oper_log` VALUES (210, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:16', 70);
INSERT INTO `sys_oper_log` VALUES (211, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:18', 56);
INSERT INTO `sys_oper_log` VALUES (212, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:22', 71);
INSERT INTO `sys_oper_log` VALUES (213, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:24', 99);
INSERT INTO `sys_oper_log` VALUES (214, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:27', 121);
INSERT INTO `sys_oper_log` VALUES (215, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:09:35\",\"id\":11,\"isActive\":0,\"name\":\"文书档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:09:36', 207);
INSERT INTO `sys_oper_log` VALUES (216, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:09:57\",\"id\":12,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":11,\"type\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'column_length\' cannot be null\r\n### The error may exist in file [D:\\devTools\\WorkSpace\\Archives_workspace\\Archives\\Archives\\Archives-system\\target\\classes\\mapper\\archive\\ArchiveItemMapper.xml]\r\n### The error may involve com.archives.archive.mapper.ArchiveItemMapper.insertArchiveItemsBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO archive_item (category_id, item_name, item_type, column_name, column_length, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, html_group, sort, create_by, create_time, update_by, update_time)         VALUES                        (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)          ,              (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?', '2024-07-07 11:09:58', 525);
INSERT INTO `sys_oper_log` VALUES (217, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:14:16\",\"id\":13,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":11,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:14:17', 258);
INSERT INTO `sys_oper_log` VALUES (218, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:14:36', 55);
INSERT INTO `sys_oper_log` VALUES (219, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:14:38', 90);
INSERT INTO `sys_oper_log` VALUES (220, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:14:50\",\"id\":14,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":11,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:14:50', 301);
INSERT INTO `sys_oper_log` VALUES (221, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:38:33', 147);
INSERT INTO `sys_oper_log` VALUES (222, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:38:36', 81);
INSERT INTO `sys_oper_log` VALUES (223, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:40:42\",\"id\":15,\"isActive\":0,\"name\":\"文书档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:40:42', 113);
INSERT INTO `sys_oper_log` VALUES (224, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:40:53\",\"id\":16,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 11:40:53', 243);
INSERT INTO `sys_oper_log` VALUES (225, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:42:09', 191);
INSERT INTO `sys_oper_log` VALUES (226, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 12:46:12\",\"id\":17,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-07 12:46:13', 753);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 3, 'com.archives.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:21:38', 273);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 6, 'com.archives.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"archive_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:22:07', 1274);
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"ArchiveInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":87,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FondsNumber\",\"columnComment\":\"全宗号\",\"columnId\":88,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FondsName\",\"columnComment\":\"全宗名称\",\"columnId\":89,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RetentionPeriod\",\"columnComment\":\"保管期限\",\"columnId\":90,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:35:07', 392);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.archives.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"archive_info\"}', NULL, 0, NULL, '2024-07-11 10:35:14', 449);
INSERT INTO `sys_oper_log` VALUES (231, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:38:24', 174);
INSERT INTO `sys_oper_log` VALUES (232, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 10:38:33\",\"id\":18,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:38:34', 457);
INSERT INTO `sys_oper_log` VALUES (233, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:53:11', 101);
INSERT INTO `sys_oper_log` VALUES (234, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 10:55:35\",\"id\":19,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:55:36', 211);
INSERT INTO `sys_oper_log` VALUES (235, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 10:56:23\",\"id\":20,\"isActive\":0,\"name\":\"案卷目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:56:23', 423);
INSERT INTO `sys_oper_log` VALUES (236, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 10:57:02', 93);
INSERT INTO `sys_oper_log` VALUES (237, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:00:10', 34451);
INSERT INTO `sys_oper_log` VALUES (238, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:02:08\",\"id\":21,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:02:08', 629);
INSERT INTO `sys_oper_log` VALUES (239, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:03:06', 6640);
INSERT INTO `sys_oper_log` VALUES (240, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:03:57\",\"id\":22,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:03:57', 377);
INSERT INTO `sys_oper_log` VALUES (241, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:06:37', 132495);
INSERT INTO `sys_oper_log` VALUES (242, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/22', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-07-11 11:07:31', 30);
INSERT INTO `sys_oper_log` VALUES (243, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/22', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-07-11 11:08:24', 14836);
INSERT INTO `sys_oper_log` VALUES (244, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:08:38\",\"id\":23,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:08:38', 195);
INSERT INTO `sys_oper_log` VALUES (245, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:09:11', 218);
INSERT INTO `sys_oper_log` VALUES (246, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:40:43\",\"id\":15,\"isActive\":0,\"level\":0,\"name\":\"文书档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":1,\"updateTime\":\"2024-07-11 11:09:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:09:22', 318);
INSERT INTO `sys_oper_log` VALUES (247, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-07 11:40:43\",\"id\":15,\"isActive\":0,\"level\":0,\"name\":\"文书档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0,\"updateTime\":\"2024-07-11 11:09:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:09:35', 119);
INSERT INTO `sys_oper_log` VALUES (248, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:10:02\",\"id\":24,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:10:02', 167);
INSERT INTO `sys_oper_log` VALUES (249, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:10:03\",\"id\":24,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":0,\"updateTime\":\"2024-07-11 11:10:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:10:20', 108);
INSERT INTO `sys_oper_log` VALUES (250, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:10:03\",\"id\":24,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1,\"updateTime\":\"2024-07-11 11:10:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:10:30', 168);
INSERT INTO `sys_oper_log` VALUES (251, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/24', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:10:43', 131);
INSERT INTO `sys_oper_log` VALUES (252, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:18:04\",\"id\":25,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:18:05', 838);
INSERT INTO `sys_oper_log` VALUES (253, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:28:48', 263);
INSERT INTO `sys_oper_log` VALUES (254, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:29:23\",\"id\":26,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:29:23', 319);
INSERT INTO `sys_oper_log` VALUES (255, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:29:23\",\"id\":26,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":0,\"updateTime\":\"2024-07-11 11:32:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:32:56', 578);
INSERT INTO `sys_oper_log` VALUES (256, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:29:23\",\"id\":26,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1,\"updateTime\":\"2024-07-11 11:33:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:33:02', 813);
INSERT INTO `sys_oper_log` VALUES (257, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:36:16', 330);
INSERT INTO `sys_oper_log` VALUES (258, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:36:25\",\"id\":27,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:36:27', 1134);
INSERT INTO `sys_oper_log` VALUES (259, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:36:26\",\"id\":27,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":0,\"updateTime\":\"2024-07-11 11:44:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:44:34', 235);
INSERT INTO `sys_oper_log` VALUES (260, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:36:26\",\"id\":27,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1,\"updateTime\":\"2024-07-11 11:44:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 11:44:40', 279);
INSERT INTO `sys_oper_log` VALUES (261, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '{\"categoryId\":27,\"params\":{},\"updateTime\":\"2024-07-11 11:59:58\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-07-11 11:59:58', 11);
INSERT INTO `sys_oper_log` VALUES (262, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '{\"categoryId\":27,\"params\":{},\"updateTime\":\"2024-07-11 12:00:08\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-07-11 12:00:08', 7);
INSERT INTO `sys_oper_log` VALUES (263, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-07-11 13:08:41\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-07-11 13:08:41', 6);
INSERT INTO `sys_oper_log` VALUES (264, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-07-11 13:10:00\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-07-11 13:10:00', 49261);
INSERT INTO `sys_oper_log` VALUES (265, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-07-11 13:16:08\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-07-11 13:16:18', 87239);
INSERT INTO `sys_oper_log` VALUES (266, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":783,\"isInsert\":\"1\",\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 13:22:44\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":784,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 13:22:48\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":785,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 13:22:49\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":786,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 13:22:49\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":787,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 13:22:49\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":788,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 13:22:49\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":789,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:22:51', 23084);
INSERT INTO `sys_oper_log` VALUES (267, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":783,\"isInsert\":\"1\",\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":784,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":785,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":786,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":787,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":788,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 13:23:03\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":789,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:23:07', 3657);
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ArchiveCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":76,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:13:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"分类名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:13:16\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父分类ID\",\"columnId\":78,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-07-06 21:13:16\",\"usableColumn\":true},{\"capJavaField\":\"Level\",\"columnComment\":\"分类层级\",\"columnId\":79,\"columnName\":\"level\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 12:58:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:23:30', 182);
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 2, 'com.archives.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"ArchiveInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":87,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 10:35:07\",\"usableColumn\":false},{\"capJavaField\":\"FondsNumber\",\"columnComment\":\"全宗号\",\"columnId\":88,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 10:35:07\",\"usableColumn\":false},{\"capJavaField\":\"FondsName\",\"columnComment\":\"全宗名称\",\"columnId\":89,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fondsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-07-11 10:35:07\",\"usableColumn\":false},{\"capJavaField\":\"RetentionPeriod\",\"columnComment\":\"保管期限\",\"columnId\":90,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-07-11 10:22:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:23:39', 386);
INSERT INTO `sys_oper_log` VALUES (270, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":783,\"isInsert\":\"1\",\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":784,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":785,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":786,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":787,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":788,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 13:24:06\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":789,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:24:09', 2642);
INSERT INTO `sys_oper_log` VALUES (271, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":783,\"isInsert\":\"1\",\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 13:24:39\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":784,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 13:24:39\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":785,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 13:24:39\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":786,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 13:24:40\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":787,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 13:24:40\"},{\"categoryId\":27,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":788,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 13:24:40\"},{\"categoryId\":27,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":789,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 13:24:42', 2430);
INSERT INTO `sys_oper_log` VALUES (272, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:36:26\",\"id\":27,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":0,\"updateTime\":\"2024-07-11 14:00:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:00:06', 264);
INSERT INTO `sys_oper_log` VALUES (273, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 11:36:26\",\"id\":27,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1,\"updateTime\":\"2024-07-11 14:00:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:00:11', 359);
INSERT INTO `sys_oper_log` VALUES (274, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:06:26', 202);
INSERT INTO `sys_oper_log` VALUES (275, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:06:34\",\"id\":28,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:06:34', 331);
INSERT INTO `sys_oper_log` VALUES (276, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/28', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:08:58', 89);
INSERT INTO `sys_oper_log` VALUES (277, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:09:07\",\"id\":29,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:09:07', 122);
INSERT INTO `sys_oper_log` VALUES (278, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:09:07\",\"id\":29,\"isActive\":0,\"level\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1,\"updateTime\":\"2024-07-11 14:09:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:09:17', 310);
INSERT INTO `sys_oper_log` VALUES (279, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:10:05\",\"id\":30,\"isActive\":0,\"name\":\"案卷目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:10:59', 54104);
INSERT INTO `sys_oper_log` VALUES (280, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:12:26\",\"id\":31,\"isActive\":0,\"name\":\"案卷目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:12:27', 969);
INSERT INTO `sys_oper_log` VALUES (281, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/31', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:12:31', 215);
INSERT INTO `sys_oper_log` VALUES (282, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/30', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:12:32', 175);
INSERT INTO `sys_oper_log` VALUES (283, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/29', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:12:40', 182);
INSERT INTO `sys_oper_log` VALUES (284, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 14:16:07\",\"id\":32,\"isActive\":0,\"name\":\"文件目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:16:07', 213);
INSERT INTO `sys_oper_log` VALUES (285, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 14:16:55\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:16:57', 2641);
INSERT INTO `sys_oper_log` VALUES (286, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 14:19:58\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:20:01', 3090);
INSERT INTO `sys_oper_log` VALUES (287, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 14:20:21\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:20:25', 3800);
INSERT INTO `sys_oper_log` VALUES (288, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 14:21:23\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 14:21:23\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 14:21:24\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 14:21:24\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 14:21:24\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 14:21:24\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:21:25', 2057);
INSERT INTO `sys_oper_log` VALUES (289, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-11 14:21:35\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-11 14:21:36\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-11 14:21:36\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-11 14:21:36\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-11 14:21:36\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-11 14:21:36\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:21:38', 2175);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.archives.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"archive/category/index\",\"createTime\":\"2024-06-30 00:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"档案库设定\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"path\":\"category\",\"perms\":\"archive:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 14:35:22', 123);
INSERT INTO `sys_oper_log` VALUES (291, '部门管理', 2, 'com.archives.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.103', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"坤鹏档案服务公司\",\"email\":\"ry@qq.com\",\"leader\":\"高小川\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:47:52', 125);
INSERT INTO `sys_oper_log` VALUES (292, '部门管理', 2, 'com.archives.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.103', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"大连总公司\",\"email\":\"ry@qq.com\",\"leader\":\"高\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"坤鹏档案服务公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:48:10', 150);
INSERT INTO `sys_oper_log` VALUES (293, '部门管理', 2, 'com.archives.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.10.103', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"开发区分公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"坤鹏档案服务公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:48:19', 141);
INSERT INTO `sys_oper_log` VALUES (294, '用户管理', 2, 'com.archives.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '192.168.10.103', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-29 00:03:43\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-06-29 00:03:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"高\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:48:39', 201);
INSERT INTO `sys_oper_log` VALUES (295, '通知公告', 3, 'com.archives.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/2', '192.168.10.103', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:49:16', 103);
INSERT INTO `sys_oper_log` VALUES (296, '通知公告', 3, 'com.archives.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/1', '192.168.10.103', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 15:49:18', 88);
INSERT INTO `sys_oper_log` VALUES (297, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:07:34\",\"id\":33,\"isActive\":0,\"name\":\"电子文件级目录\",\"orderNum\":0,\"params\":{},\"parentId\":15,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:07:35', 614);
INSERT INTO `sys_oper_log` VALUES (298, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:10:26\",\"id\":34,\"isActive\":0,\"name\":\"科技档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:10:26', 125);
INSERT INTO `sys_oper_log` VALUES (299, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:10:40\",\"id\":35,\"isActive\":0,\"name\":\"科技案卷\",\"orderNum\":0,\"params\":{},\"parentId\":34,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:10:41', 357);
INSERT INTO `sys_oper_log` VALUES (300, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:10:53\",\"id\":36,\"isActive\":0,\"name\":\"科技卷内\",\"orderNum\":0,\"params\":{},\"parentId\":34,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:10:53', 277);
INSERT INTO `sys_oper_log` VALUES (301, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:11:01\",\"id\":37,\"isActive\":0,\"name\":\"科技项目\",\"orderNum\":0,\"params\":{},\"parentId\":34,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:11:02', 211);
INSERT INTO `sys_oper_log` VALUES (302, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:11:18\",\"id\":38,\"isActive\":0,\"name\":\"人事档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:11:18', 127);
INSERT INTO `sys_oper_log` VALUES (303, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:11:31\",\"id\":39,\"isActive\":0,\"name\":\"人事卷内\",\"orderNum\":0,\"params\":{},\"parentId\":38,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:11:31', 516);
INSERT INTO `sys_oper_log` VALUES (304, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:11:44\",\"id\":40,\"isActive\":0,\"name\":\"人事案卷\",\"orderNum\":0,\"params\":{},\"parentId\":38,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:11:44', 228);
INSERT INTO `sys_oper_log` VALUES (305, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:11:56\",\"id\":41,\"isActive\":0,\"name\":\"会计档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:11:57', 233);
INSERT INTO `sys_oper_log` VALUES (306, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:12:13\",\"id\":42,\"isActive\":0,\"name\":\"会计案卷\",\"orderNum\":0,\"params\":{},\"parentId\":41,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:12:14', 247);
INSERT INTO `sys_oper_log` VALUES (307, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:12:22\",\"id\":43,\"isActive\":0,\"name\":\"会计卷内\",\"orderNum\":0,\"params\":{},\"parentId\":41,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:12:22', 330);
INSERT INTO `sys_oper_log` VALUES (308, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:12:31\",\"id\":44,\"isActive\":0,\"name\":\"照片档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:12:31', 93);
INSERT INTO `sys_oper_log` VALUES (309, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:12:42\",\"id\":45,\"isActive\":0,\"name\":\"照片案卷\",\"orderNum\":0,\"params\":{},\"parentId\":44,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:12:42', 293);
INSERT INTO `sys_oper_log` VALUES (310, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:12:49\",\"id\":46,\"isActive\":0,\"name\":\"照片卷内\",\"orderNum\":0,\"params\":{},\"parentId\":44,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:12:50', 203);
INSERT INTO `sys_oper_log` VALUES (311, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:00\",\"id\":47,\"isActive\":0,\"name\":\"录音档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:00', 98);
INSERT INTO `sys_oper_log` VALUES (312, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:15\",\"id\":48,\"isActive\":0,\"name\":\"录音案卷\",\"orderNum\":0,\"params\":{},\"parentId\":47,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:15', 545);
INSERT INTO `sys_oper_log` VALUES (313, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:22\",\"id\":49,\"isActive\":0,\"name\":\"录音卷内\",\"orderNum\":0,\"params\":{},\"parentId\":47,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:22', 191);
INSERT INTO `sys_oper_log` VALUES (314, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:36\",\"id\":50,\"isActive\":0,\"name\":\"录像档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:36', 107);
INSERT INTO `sys_oper_log` VALUES (315, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:46\",\"id\":51,\"isActive\":0,\"name\":\"录像案卷\",\"orderNum\":0,\"params\":{},\"parentId\":50,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:46', 419);
INSERT INTO `sys_oper_log` VALUES (316, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:13:54\",\"id\":52,\"isActive\":0,\"name\":\"录像卷内\",\"orderNum\":0,\"params\":{},\"parentId\":50,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:13:54', 279);
INSERT INTO `sys_oper_log` VALUES (317, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:05\",\"id\":53,\"isActive\":0,\"name\":\"实物档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:14:05', 86);
INSERT INTO `sys_oper_log` VALUES (318, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:14\",\"id\":54,\"isActive\":0,\"name\":\"实物案卷\",\"orderNum\":0,\"params\":{},\"parentId\":53,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:14:14', 298);
INSERT INTO `sys_oper_log` VALUES (319, '档案分类', 2, 'com.archives.web.controller.archive.ArchiveCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:15\",\"id\":54,\"isActive\":0,\"level\":0,\"name\":\"实物案卷\",\"orderNum\":0,\"params\":{},\"parentId\":53,\"type\":1,\"updateTime\":\"2024-07-11 16:14:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:14:25', 314);
INSERT INTO `sys_oper_log` VALUES (320, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:36\",\"id\":55,\"isActive\":0,\"name\":\"光盘档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:14:36', 117);
INSERT INTO `sys_oper_log` VALUES (321, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:46\",\"id\":56,\"isActive\":0,\"name\":\"光盘案卷\",\"orderNum\":0,\"params\":{},\"parentId\":55,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:14:47', 259);
INSERT INTO `sys_oper_log` VALUES (322, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:14:59\",\"id\":57,\"isActive\":0,\"name\":\"光盘卷内\",\"orderNum\":0,\"params\":{},\"parentId\":55,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:15:00', 307);
INSERT INTO `sys_oper_log` VALUES (323, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:15:22\",\"id\":58,\"isActive\":0,\"name\":\"专题档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:15:22', 98);
INSERT INTO `sys_oper_log` VALUES (324, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:15:35\",\"id\":59,\"isActive\":0,\"name\":\"收文档案\",\"orderNum\":0,\"params\":{},\"parentId\":58,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:15:35', 217);
INSERT INTO `sys_oper_log` VALUES (325, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:15:44\",\"id\":60,\"isActive\":0,\"name\":\"发文档案\",\"orderNum\":0,\"params\":{},\"parentId\":58,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:15:44', 355);
INSERT INTO `sys_oper_log` VALUES (326, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:15:52\",\"id\":61,\"isActive\":0,\"name\":\"会议纪要\",\"orderNum\":0,\"params\":{},\"parentId\":58,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:15:53', 381);
INSERT INTO `sys_oper_log` VALUES (327, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:16:03\",\"id\":62,\"isActive\":0,\"name\":\"规则制度\",\"orderNum\":0,\"params\":{},\"parentId\":58,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:16:04', 259);
INSERT INTO `sys_oper_log` VALUES (328, '档案分类', 1, 'com.archives.web.controller.archive.ArchiveCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/archive/category', '192.168.10.103', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-11 16:16:10\",\"id\":63,\"isActive\":0,\"name\":\"业务档案\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:16:11', 86);
INSERT INTO `sys_oper_log` VALUES (329, '档案分类', 3, 'com.archives.web.controller.archive.ArchiveCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/archive/category/33', '192.168.10.103', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-11 16:24:44', 370);
INSERT INTO `sys_oper_log` VALUES (330, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '192.168.10.103', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-12 14:14:52\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-12 14:14:52\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-12 14:14:53\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-12 14:14:53\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-12 14:14:53\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-12 14:14:53\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-12 14:15:00', 7766);
INSERT INTO `sys_oper_log` VALUES (331, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '192.168.10.103', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-12 14:14:56\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-12 14:14:56\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-12 14:14:56\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-12 14:14:56\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-12 14:15:04', 8745);
INSERT INTO `sys_oper_log` VALUES (332, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '192.168.10.103', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-12 14:14:57\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-12 14:14:58\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-12 14:14:58\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-12 14:15:04', 7610);
INSERT INTO `sys_oper_log` VALUES (333, '档案信息', 1, 'com.archives.web.controller.archive.ArchiveInfoController.add()', 'POST', 1, 'admin', '研发部门', '/archive/info', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-07-12 16:16:38\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\devTools\\WorkSpace\\Archives_workspace\\Archives\\Archives\\Archives-system\\target\\classes\\mapper\\archive\\ArchiveInfoMapper.xml]\r\n### The error may involve com.archives.archive.mapper.ArchiveInfoMapper.insertArchiveInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into archive_info          ( create_time )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\n; Field \'category_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'category_id\' doesn\'t have a default value', '2024-07-12 16:16:36', 98);
INSERT INTO `sys_oper_log` VALUES (334, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-12 16:18:25\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-12 16:18:26\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-12 16:18:26\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-12 16:18:26\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-12 16:18:26\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-12 16:18:26\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-12 16:18:31', 7496);
INSERT INTO `sys_oper_log` VALUES (335, '档案信息模板', 2, 'com.archives.web.controller.archive.ArchiveItemController.edit()', 'PUT', 1, 'admin', '研发部门', '/archive/item', '127.0.0.1', '内网IP', '[{\"categoryId\":32,\"columnName\":\"id\",\"columnType\":\"int\",\"htmlType\":\"input\",\"id\":1059,\"isRequired\":\"0\",\"itemName\":\"主键ID\",\"itemType\":\"Long\",\"params\":{},\"queryType\":\"EQ\",\"sort\":1,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"fonds_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1060,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":2,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"fonds_name\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1061,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"全宗名称\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"LIKE\",\"sort\":3,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"retention_period\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1062,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"保管期限\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":4,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"item_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1063,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"件号\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":5,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":100,\"columnName\":\"archive_number\",\"columnType\":\"varchar(100)\",\"htmlType\":\"input\",\"id\":1064,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"档号，由系统生成\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",\"sort\":6,\"updateTime\":\"2024-07-12 16:18:30\"},{\"categoryId\":32,\"columnLength\":255,\"columnName\":\"department\",\"columnType\":\"varchar(255)\",\"htmlType\":\"input\",\"id\":1065,\"isEdit\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"itemName\":\"归档部门\",\"itemType\":\"String\",\"params\":{},\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-12 16:18:36', 8486);
INSERT INTO `sys_oper_log` VALUES (336, '档案信息', 1, 'com.archives.web.controller.archive.ArchiveInfoController.add()', 'POST', 1, 'admin', '研发部门', '/archive/info', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-07-12 16:19:38\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\devTools\\WorkSpace\\Archives_workspace\\Archives\\Archives\\Archives-system\\target\\classes\\mapper\\archive\\ArchiveInfoMapper.xml]\r\n### The error may involve com.archives.archive.mapper.ArchiveInfoMapper.insertArchiveInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into archive_info          ( create_time )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\n; Field \'category_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'category_id\' doesn\'t have a default value', '2024-07-12 16:19:37', 14);
INSERT INTO `sys_oper_log` VALUES (337, '用户头像', 2, 'com.archives.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '192.168.10.103', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/17/86ee21c54c6ed2a753c7d924fe33b861_20240717175907A001.jpeg\",\"code\":200}', 0, NULL, '2024-07-17 17:59:07', 213);
INSERT INTO `sys_oper_log` VALUES (338, '个人信息', 2, 'com.archives.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '192.168.10.103', '内网IP', '{\"admin\":false,\"email\":\"admin@163.com\",\"nickName\":\"档案管理\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-17 17:59:13', 104);
INSERT INTO `sys_oper_log` VALUES (339, '角色管理', 1, 'com.archives.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '192.168.20.105', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007,2034,2035,2036,2037,2038,2039,2040,2008,2009,2010,1,2011,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2017,2019,2020,2021,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2028,2029,2030,2031,2032,2033,116,1055,1056,1057,1058,1059,1060,117,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-18 17:11:39', 281);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 1, 'com.archives.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '192.168.20.105', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"system\",\"params\":{},\"phonenumber\":\"15999999999\",\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"系统管理\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-18 17:13:47', 489);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 3, 'com.archives.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '192.168.20.105', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-18 17:17:33', 166);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 1, 'com.archives.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '192.168.20.105', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"系统管理员\",\"params\":{},\"postIds\":[2],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"system\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-18 17:18:03', 536);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 2, 'com.archives.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '192.168.20.105', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-07-18 17:18:02\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"坤鹏档案服务公司\",\"leader\":\"高小川\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-07-18 17:18:19\",\"loginIp\":\"192.168.20.105\",\"nickName\":\"系统管理员\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"system\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-18 17:19:44', 138);
INSERT INTO `sys_oper_log` VALUES (344, '用户头像', 2, 'com.archives.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'system', '坤鹏档案服务公司', '/system/user/profile/avatar', '192.168.20.105', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/07/18/未标题-1_20240718172321A001.png\",\"code\":200}', 0, NULL, '2024-07-18 17:23:21', 194);
INSERT INTO `sys_oper_log` VALUES (345, '文件上传', 1, 'com.archives.web.controller.system.SysOssController.add()', 'POST', 1, 'admin', '研发部门', '/system/oss', '192.168.20.105', '内网IP', '[{\"createTime\":\"2024-07-19 00:07:58\",\"name\":\"未标题-1_20240719000752A004.png\",\"params\":{},\"path\":\"\",\"size\":\"480195\",\"suffix\":\"png\",\"url\":\"/profile/upload/2024/07/19/未标题-1_20240719000752A004.png\"}]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-07-19 00:07:58', 123);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `path` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件路径',
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'URL地址',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件名',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件大小',
  `fid` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联ID',
  `suffix` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件后缀',
  `delete_flg` tinyint(0) NULL DEFAULT NULL COMMENT '删除标志 0：否 1：是',
  `delete_date` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (1, '', '/profile/upload/2024/07/19/未标题-1_20240719000752A004.png', '未标题-1_20240719000752A004.png', '480195', NULL, 'png', NULL, NULL, NULL, '2024-07-19 00:07:58', NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-06-29 00:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-06-29 00:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-06-29 00:03:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-06-29 00:03:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-29 00:03:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-06-29 00:03:45', 'admin', '2024-06-29 01:32:25', '普通角色');
INSERT INTO `sys_role` VALUES (100, '系统管理员', 'system', 2, '1', 1, 1, '0', '0', 'admin', '2024-07-18 17:11:39', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '档案管理', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2024/07/17/86ee21c54c6ed2a753c7d924fe33b861_20240717175907A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.20.105', '2024-07-19 00:07:23', 'admin', '2024-06-29 00:03:43', '', '2024-07-19 00:07:23', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '高', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-29 00:03:43', 'admin', '2024-06-29 00:03:43', 'admin', '2024-07-11 15:48:39', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, '系统管理', 'system', '00', '', '15999999999', '0', '', '$2a$10$KY1TCNgYiQljjZ4ZSF8DCOohMZ1NkyCS.XqhC4zdrNfdSGvO9w93K', '0', '2', '', NULL, 'admin', '2024-07-18 17:13:47', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 100, 'system', '系统管理员', '00', '', '', '0', '/profile/avatar/2024/07/18/未标题-1_20240718172321A001.png', '$2a$10$W6Q2qS2Sg3HdLRFI.4drF.kZ2ZaSUk8.r9yDXjDE6k5Wjm5paA5Ke', '0', '0', '192.168.20.105', '2024-07-18 17:20:09', 'admin', '2024-07-18 17:18:02', 'admin', '2024-07-18 17:20:09', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (101, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);

-- ----------------------------
-- Procedure structure for proc_jmdemo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_jmdemo`;
delimiter ;;
CREATE PROCEDURE `proc_jmdemo`(IN pageNo INT,IN pageSize INT)
BEGIN
		DECLARE begin_no INT;
		SET begin_no = (pageNo-1)*pageSize;
 
		-- 分页查询列表
		SELECT * FROM rep_demo_dxtj
		WHERE id >= (
			SELECT id FROM rep_demo_dxtj
			ORDER BY id ASC
			LIMIT begin_no,1
		)
		ORDER BY id ASC
		LIMIT pageSize;
 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
