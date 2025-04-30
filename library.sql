/*
 Navicat MySQL Data Transfer
 
 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : library
 
 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001
 
 Date: 29/04/2025 10:00:00 -- Updated Date
 */
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `adminType` int(11) NULL DEFAULT NULL COMMENT '管理员类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES (1, 'admin', '123456', 1);
INSERT INTO `admin`
VALUES (2, 'yx5411', '12345', 0);
INSERT INTO `admin`
VALUES (4, 'xy1221', '12345', 0);
-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `publish` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `isbn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍编号',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版时间',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '书籍类型',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0未借出，1已借出',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书信息' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info`
VALUES (
    1,
    '三体',
    '刘慈欣',
    '重庆出版社',
    '9787536692930',
    '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划"红岸工程"取得了突破性进展。',
    '中文',
    68.00,
    '2008-01-10',
    8,
    0
  );
INSERT INTO `book_info`
VALUES (
    2,
    '活着',
    '余华',
    '南海出版公司',
    '9787544255988',
    '讲述了在大时代背景下，随着内战、三反五反、大跃进、文化大革命等社会变革，徐福贵的人生和家庭不断经受着苦难的故事。',
    '中文',
    32.00,
    '2012-08-01',
    1,
    1
  );
INSERT INTO `book_info`
VALUES (
    3,
    '百年孤独',
    '加西亚·马尔克斯',
    '南海出版公司',
    '9787544253991',
    '描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰。',
    '中文',
    39.50,
    '2011-06-01',
    1,
    1
  );
INSERT INTO `book_info`
VALUES (
    4,
    'Effective Java (第三版)',
    'Joshua Bloch',
    '机械工业出版社',
    '9787111673481',
    '包含90个条目，阐述了在Java程序设计中大多数开发人员可能会遇到的关键问题和实用建议。',
    '英文',
    119.00,
    '2020-09-01',
    7,
    0
  );
INSERT INTO `book_info`
VALUES (
    5,
    '人类简史：从动物到上帝',
    '尤瓦尔·赫拉利',
    '中信出版社',
    '9787508647357',
    '从十万年前有生命迹象开始到21世纪资本、科技交织的人类发展史。',
    '中文',
    68.00,
    '2014-11-01',
    2,
    0
  );
INSERT INTO `book_info`
VALUES (
    6,
    '民法典（实用版）',
    '全国人大常委会法工委',
    '中国法制出版社',
    '9787521608026',
    '中华人民共和国民法典条文释义与应用。',
    '中文',
    58.00,
    '2020-06-01',
    4,
    1
  );
INSERT INTO `book_info`
VALUES (
    7,
    'Python编程：从入门到实践',
    'Eric Matthes',
    '人民邮电出版社',
    '9787115428028',
    '旨在让读者快速掌握编程基础知识并运用到实践项目中。',
    '中文',
    89.00,
    '2016-07-01',
    7,
    0
  );
INSERT INTO `book_info`
VALUES (
    8,
    '乡土中国',
    '费孝通',
    '上海人民出版社',
    '9787208069236',
    '中国社会学和人类学的奠基之作之一，深刻剖析了中国乡土社会的结构与变迁。',
    '中文',
    20.00,
    '2006-08-01',
    9,
    0
  );
INSERT INTO `book_info`
VALUES (
    9,
    '时间简史',
    '史蒂芬·霍金',
    '湖南科学技术出版社',
    '9787535762191',
    '探索时间和空间核心秘密的引人入胜的故事。',
    '中文',
    29.80,
    '2011-01-01',
    10,
    1
  );
INSERT INTO `book_info`
VALUES (
    10,
    '思考，快与慢',
    '丹尼尔·卡尼曼',
    '中信出版社',
    '9787508633558',
    '介绍大脑的两种作决定的方式：快速、直觉性的思考（系统1）和缓慢、需要投入更多努力的思考（系统2）。',
    '中文',
    69.00,
    '2012-07-01',
    5,
    0
  );
INSERT INTO `book_info`
VALUES (
    11,
    '明朝那些事儿（全集）',
    '当年明月',
    '中国友谊出版公司',
    '9787505731307',
    '以通俗易懂的方式讲述了明朝三百年间发生的历史故事。',
    '中文',
    358.00,
    '2013-06-01',
    2,
    0
  );
INSERT INTO `book_info`
VALUES (
    12,
    '深度学习',
    'Ian Goodfellow 等',
    '人民邮电出版社',
    '9787115461438',
    '系统性地介绍了深度学习的基本数学原理和算法。',
    '中文',
    138.00,
    '2017-08-01',
    7,
    1
  );
INSERT INTO `book_info`
VALUES (
    13,
    '围城',
    '钱钟书',
    '人民文学出版社',
    '9787020024759',
    '中国现代文学史上一部风格独特的讽刺小说，被誉为"新儒林外史"。',
    '中文',
    19.00,
    '1991-02-01',
    1,
    0
  );
INSERT INTO `book_info`
VALUES (
    14,
    '国富论',
    '亚当·斯密',
    '陕西人民出版社',
    '9787224090196',
    '现代经济学的奠基之作，系统阐述了劳动价值论、分工与市场等概念。',
    '中文',
    36.00,
    '2009-06-01',
    5,
    0
  );
INSERT INTO `book_info`
VALUES (
    15,
    '概率论基础教程',
    'Sheldon M. Ross',
    '人民邮电出版社',
    '9787115250698',
    '概率论的经典入门教材，内容深入浅出。',
    '英文',
    69.00,
    '2011-03-01',
    6,
    0
  );
-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bookId` int(11) NULL DEFAULT NULL COMMENT '图书id',
  `readerId` int(11) NULL DEFAULT NULL COMMENT '读者id',
  `lendDate` datetime(0) NULL DEFAULT NULL COMMENT '借书时间',
  `backDate` datetime(0) NULL DEFAULT NULL COMMENT '还书时间',
  `backType` int(11) NULL DEFAULT NULL COMMENT '归还类型(0:正常, 1:续借后归还, 2:逾期归还, 3:异常归还)',
  `exceptRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_lend_book` (`bookId`),
  KEY `fk_lend_reader` (`readerId`),
  CONSTRAINT `fk_lend_book` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`id`),
  CONSTRAINT `fk_lend_reader` FOREIGN KEY (`readerId`) REFERENCES `reader_info` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借阅记录' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list`
VALUES (
    15,
    2,
    1,
    '2025-04-01 09:15:30',
    '2025-04-15 16:30:00',
    0,
    NULL
  );
INSERT INTO `lend_list`
VALUES (
    36,
    3,
    2,
    '2025-04-02 11:05:10',
    '2025-04-20 10:00:00',
    0,
    NULL
  );
INSERT INTO `lend_list`
VALUES (
    37,
    3,
    3,
    '2025-04-04 21:50:22',
    '2025-04-04 21:50:32',
    3,
    NULL
  );
INSERT INTO `lend_list`
VALUES (
    38,
    5,
    1,
    '2025-04-05 21:35:35',
    '2025-04-05 21:35:47',
    1,
    NULL
  );
INSERT INTO `lend_list`
VALUES (
    39,
    6,
    3,
    '2025-04-05 21:42:35',
    NULL,
    NULL,
    NULL
  );
INSERT INTO `lend_list`
VALUES (
    51,
    8,
    1,
    '2025-04-22 08:45:00',
    NULL,
    NULL,
    NULL
  );
-- Currently lent, 乡土中国
INSERT INTO `lend_list`
VALUES (
    52,
    10,
    2,
    '2025-04-25 13:00:00',
    NULL,
    NULL,
    NULL
  );
-- Currently lent, 思考，快与慢
-- Add 26 more records to reach 3x the original count (13 * 3 = 39 total)
INSERT INTO `lend_list`
VALUES (
    53,
    11,
    3,
    '2025-03-10 10:00:00',
    '2025-04-10 10:00:00',
    0,
    NULL
  );
-- 明朝那些事儿
INSERT INTO `lend_list`
VALUES (
    54,
    12,
    1,
    '2025-03-15 11:20:00',
    '2025-04-15 11:20:00',
    0,
    NULL
  );
-- 深度学习
INSERT INTO `lend_list`
VALUES (
    55,
    16,
    2,
    '2025-04-26 09:00:00',
    NULL,
    NULL,
    NULL
  );
-- 三体II
INSERT INTO `lend_list`
VALUES (
    56,
    17,
    3,
    '2025-04-27 14:00:00',
    NULL,
    NULL,
    NULL
  );
-- 许三观卖血记
INSERT INTO `lend_list`
VALUES (
    57,
    18,
    1,
    '2025-04-28 10:30:00',
    NULL,
    NULL,
    NULL
  );
-- 霍乱时期的爱情
INSERT INTO `lend_list`
VALUES (
    58,
    19,
    2,
    '2025-03-01 15:00:00',
    '2025-04-01 15:00:00',
    0,
    NULL
  );
-- 深入理解Java虚拟机
INSERT INTO `lend_list`
VALUES (
    59,
    20,
    3,
    '2025-04-29 16:00:00',
    NULL,
    NULL,
    NULL
  );
-- 未来简史
INSERT INTO `lend_list`
VALUES (
    60,
    21,
    1,
    '2025-04-30 11:00:00',
    NULL,
    NULL,
    NULL
  );
-- 刑法学讲义
INSERT INTO `lend_list`
VALUES (
    61,
    22,
    2,
    '2025-03-05 09:45:00',
    '2025-04-05 09:45:00',
    0,
    NULL
  );
-- 流畅的Python
INSERT INTO `lend_list`
VALUES (
    62,
    23,
    3,
    '2025-05-01 13:15:00',
    NULL,
    NULL,
    NULL
  );
-- 江村经济
INSERT INTO `lend_list`
VALUES (
    63,
    24,
    1,
    '2025-05-02 10:00:00',
    NULL,
    NULL,
    NULL
  );
-- 果壳中的宇宙
INSERT INTO `lend_list`
VALUES (
    64,
    25,
    2,
    '2025-03-11 16:30:00',
    '2025-04-11 16:30:00',
    0,
    NULL
  );
-- 影响力
INSERT INTO `lend_list`
VALUES (
    65,
    26,
    3,
    '2025-05-03 08:00:00',
    NULL,
    NULL,
    NULL
  );
-- 万历十五年
INSERT INTO `lend_list`
VALUES (
    66,
    27,
    1,
    '2025-05-04 14:00:00',
    NULL,
    NULL,
    NULL
  );
-- 机器学习
INSERT INTO `lend_list`
VALUES (
    67,
    28,
    2,
    '2025-05-05 10:10:00',
    NULL,
    NULL,
    NULL
  );
-- 白鹿原
INSERT INTO `lend_list`
VALUES (
    68,
    29,
    3,
    '2025-03-20 12:00:00',
    '2025-04-20 12:00:00',
    0,
    NULL
  );
-- 经济学原理
INSERT INTO `lend_list`
VALUES (
    69,
    30,
    1,
    '2025-05-06 17:00:00',
    NULL,
    NULL,
    NULL
  );
-- 统计学习方法
INSERT INTO `lend_list`
VALUES (
    70,
    2,
    3,
    '2025-05-07 09:30:00',
    NULL,
    NULL,
    NULL
  );
-- 活着 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    71,
    3,
    1,
    '2025-05-08 11:00:00',
    NULL,
    NULL,
    NULL
  );
-- 百年孤独 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    72,
    6,
    2,
    '2025-05-09 15:15:00',
    NULL,
    NULL,
    NULL
  );
-- 民法典 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    73,
    9,
    3,
    '2025-03-25 14:45:00',
    '2025-04-25 14:45:00',
    1,
    NULL
  );
-- 时间简史 (Renewed then returned)
INSERT INTO `lend_list`
VALUES (
    74,
    12,
    1,
    '2025-05-10 10:40:00',
    NULL,
    NULL,
    NULL
  );
-- 深度学习 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    75,
    19,
    2,
    '2025-05-11 13:00:00',
    NULL,
    NULL,
    NULL
  );
-- 深入理解Java虚拟机 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    76,
    22,
    3,
    '2025-05-12 16:50:00',
    NULL,
    NULL,
    NULL
  );
-- 流畅的Python (Another borrow)
INSERT INTO `lend_list`
VALUES (
    77,
    25,
    1,
    '2025-05-13 09:00:00',
    NULL,
    NULL,
    NULL
  );
-- 影响力 (Another borrow)
INSERT INTO `lend_list`
VALUES (
    78,
    29,
    2,
    '2025-05-14 11:25:00',
    NULL,
    NULL,
    NULL
  );
-- 经济学原理 (Another borrow)
-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of notice
-- ----------------------------
DELETE FROM `notice`;
-- Clear old test data
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '五一劳动节假期开放时间通知',
    '尊敬的读者：根据国家法定节假日安排，本图书馆五一劳动节期间（5月1日至5月5日）开放时间调整为：上午9:00 - 下午17:00。请各位读者合理安排时间。祝大家节日快乐！',
    'admin',
    '2025-04-28 10:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '新书推荐：《长安的荔枝》',
    '本馆近期采购了一批新书，包括马伯庸新作《长安的荔枝》等热门图书，现已上架，欢迎读者前来借阅。详细书单请见图书馆入口处公告栏或咨询工作人员。',
    'admin',
    '2025-04-25 15:30:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '关于延长图书借阅期限的通知',
    '为方便读者阅读，自2025年5月1日起，普通图书借阅期限将由30天延长至45天（不含续借）。请大家相互转告。',
    'yx5411',
    '2025-04-20 09:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '图书馆WIFI网络升级通知',
    '为提供更优质的网络服务，图书馆将于2025年5月8日（周三）晚上22:00至次日凌晨6:00进行WIFI网络升级维护，期间网络将中断。给您带来的不便敬请谅解。',
    'xy1221',
    '2025-04-29 11:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '"品读经典，书香致远"读书分享会报名通知',
    '图书馆将于5月15日下午举办"品读经典，书香致远"读书分享会，邀请您一同分享阅读的快乐。名额有限，请于服务台扫码报名。',
    'admin',
    '2025-04-27 14:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '关于规范使用自习室座位的通知',
    '为维护良好的学习环境，请勿长时间占用座位或放置私人物品占座。离开超过30分钟请自觉带走个人物品。感谢您的配合。',
    'admin',
    '2025-05-06 09:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '图书馆春季读者问卷调查',
    '为更好地了解读者需求、提升服务质量，图书馆现开展春季读者问卷调查，请扫描二维码参与。您的意见对我们非常重要！',
    'yx5411',
    '2025-05-07 11:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '"世界读书日"系列活动预告',
    '为迎接4月23日世界读书日，图书馆将举办图书漂流、名家讲座、经典电影展映等系列活动，敬请关注后续通知。',
    'admin',
    '2025-04-15 10:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '电子资源远程访问说明',
    '本校师生可通过VPN或图书馆统一认证平台在校外访问图书馆购买的电子资源。具体操作指南请见图书馆网站"服务"栏目。',
    'xy1221',
    '2025-05-09 14:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '失物招领：一把雨伞',
    '昨日在二楼阅览区拾到一把黑色折叠雨伞，请失主凭有效证件到服务台认领。',
    'admin',
    '2025-05-10 08:30:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '关于调整部分区域开放时间的通知',
    '因内部施工需要，本周六（5月11日）下午，四楼北侧自习区将暂停开放。其他区域正常开放。不便之处，敬请谅解。',
    'yx5411',
    '2025-05-10 16:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '图书馆志愿者招募',
    '为更好地服务读者，图书馆现面向全校招募志愿者，参与图书整理、活动协助等工作。有意者请到服务台咨询报名。',
    'admin',
    '2025-05-12 09:30:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '数据库培训讲座通知：如何高效利用知网',
    '图书馆将于下周三（5月22日）下午举办知网数据库使用技巧讲座，帮助读者提高文献检索效率。欢迎参加！地点：一楼报告厅。',
    'xy1221',
    '2025-05-13 15:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '请保持安静，共建文明阅读环境',
    '图书馆是学习和阅读的公共场所，请读者自觉保持安静，将手机调至静音或震动模式，不大声喧哗、接打电话。感谢您的理解与支持！',
    'admin',
    '2025-05-14 10:00:00'
  );
INSERT INTO `notice` (`topic`, `content`, `author`, `createDate`)
VALUES (
    '图书捐赠倡议',
    '如果您手中有闲置的、具有阅读价值的图书（七成新以上），欢迎捐赠给图书馆。您的爱心将丰富馆藏，惠及更多读者。捐赠地点：服务台。',
    'yx5411',
    '2025-05-15 11:00:00'
  );
SET FOREIGN_KEY_CHECKS = 1;