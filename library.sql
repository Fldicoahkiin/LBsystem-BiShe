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
 
 Date: 30/04/2025 15:00:00 -- Doubled data records without changing structure
 */
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `adminType` int(11) NULL DEFAULT NULL COMMENT '管理员类型 (1: 超级管理员, 0: 普通管理员)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) -- Added unique constraint back for safety
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员';
-- ----------------------------
-- Records of admin (Original 3)
-- ----------------------------
INSERT INTO `admin` (`id`, `username`, `password`, `adminType`)
VALUES (1, 'admin', '123456', 1);
INSERT INTO `admin` (`id`, `username`, `password`, `adminType`)
VALUES (2, 'yx5411', '12345', 0);
INSERT INTO `admin` (`id`, `username`, `password`, `adminType`)
VALUES (3, 'xy1221', '12345', 0);
-- ----------------------------
-- Records of admin (New 3)
-- ----------------------------
INSERT INTO `admin` (`username`, `password`, `adminType`)
VALUES ('admin_new', '654321', 0);
INSERT INTO `admin` (`username`, `password`, `adminType`)
VALUES ('test_admin', 'testpass', 0);
INSERT INTO `admin` (`username`, `password`, `adminType`)
VALUES ('librarian01', 'libpass', 0);
-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `registerDate` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  `readerNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读者编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_readerNumber` (`readerNumber`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '读者信息';
-- ----------------------------
-- Records of reader_info (Original 3)
-- ----------------------------
INSERT INTO `reader_info` (
    `id`,
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    1,
    'chengduo',
    '12345',
    '陈朵',
    '男',
    '2001-04-01',
    '江西南昌',
    '13767134834',
    'chengduo@test.com',
    '2025-04-02 13:18:59',
    'RD20250001'
  );
INSERT INTO `reader_info` (
    `id`,
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    2,
    'mary',
    '12345',
    '陈恋',
    '女',
    '2004-04-01',
    '湖北武汉',
    '15270839599',
    'mary.chen@test.com',
    '2025-03-06 07:57:56',
    'RD20250002'
  );
INSERT INTO `reader_info` (
    `id`,
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    3,
    'zhaolian',
    '12345',
    '赵莲',
    '女',
    '2010-04-04',
    '北京海淀',
    '13834141133',
    'zhaolian@test.com',
    '2025-04-04 13:36:42',
    'RD20250003'
  );
-- ----------------------------
-- Records of reader_info (New 3)
-- ----------------------------
INSERT INTO `reader_info` (
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    'lisi',
    'password',
    '李四',
    '男',
    '1999-08-15',
    '上海浦东',
    '13912345678',
    'lisi@example.com',
    NOW(),
    'RD20250004'
  );
INSERT INTO `reader_info` (
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    'wangwu',
    'pass123',
    '王五',
    '男',
    '2005-11-20',
    '广东深圳',
    '13887654321',
    'wangwu@sample.net',
    NOW(),
    'RD20250005'
  );
INSERT INTO `reader_info` (
    `username`,
    `password`,
    `realName`,
    `sex`,
    `birthday`,
    `address`,
    `tel`,
    `email`,
    `registerDate`,
    `readerNumber`
  )
VALUES (
    'zhaoliu',
    'securepwd',
    '赵六',
    '女',
    '2002-03-10',
    '四川成都',
    '13798765432',
    'zhaoliu@mail.org',
    NOW(),
    'RD20250006'
  );
-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类名称',
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '图书类型表';
-- ----------------------------
-- Records of type_info (Original 10)
-- ----------------------------
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (1, '文学类', '小说、散文、诗歌等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (2, '历史类', '通史、断代史、史学理论等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (3, '工学类', '工程技术相关');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (4, '法学类', '民法、刑法、法律理论等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (5, '经济学类', '宏观、微观、金融、贸易等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (6, '统计学类', '概率论、数理统计、应用统计等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (7, '计算机类', '编程、网络、数据库、人工智能等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (8, '科幻类', '科学幻想小说等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (9, '社会学类', '社会理论、社会调查等');
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (10, '科普类', '普及自然科学和社会科学知识');
-- ----------------------------
-- Records of type_info (New 10)
-- ----------------------------
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('哲学类', '中西方哲学、伦理学等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('艺术类', '绘画、音乐、戏剧、设计等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('医学类', '基础医学、临床医学、药学等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('教育学类', '教育理论、教学方法等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('心理学类', '基础心理学、应用心理学等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('传记类', '人物传记、回忆录等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('地理类', '自然地理、人文地理等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('军事类', '军事理论、战史战例等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('语言学类', '语言理论、文字学等');
INSERT INTO `type_info` (`name`, `remarks`)
VALUES ('环境科学类', '环境保护、生态学等');
-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `publish` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISBN编号',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版时间',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '书籍类型ID',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态：0未借出，1已借出',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_isbn` (`isbn`),
  KEY `fk_book_type` (`type_id`),
  CONSTRAINT `fk_book_type` FOREIGN KEY (`type_id`) REFERENCES `type_info` (`id`) ON DELETE
  SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '图书信息';
-- ----------------------------
-- Records of book_info (Original 15)
-- ----------------------------
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
    0
  );
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
    0
  );
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
    0
  );
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
    0
  );
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
    0
  );
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
INSERT INTO `book_info` (
    `id`,
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
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
-- Records of book_info (New 15)
-- ----------------------------
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '理想国',
    '柏拉图',
    '商务印书馆',
    '9787100017947',
    '古希腊哲学家柏拉图创作的哲学对话体著作。',
    '中文',
    32.00,
    '1986-08-01',
    11,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '艺术的故事',
    '贡布里希',
    '广西美术出版社',
    '9787549400809',
    '一部关于西方艺术发展史的入门读物。',
    '中文',
    168.00,
    '2008-04-01',
    12,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '黄帝内经',
    '佚名',
    '中医古籍出版社',
    '9787801741642',
    '中国最早的医学典籍之一，传统医学四大经典著作之一。',
    '中文',
    45.00,
    '2005-01-01',
    13,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '爱的教育',
    '埃迪蒙托·德·亚米契斯',
    '人民文学出版社',
    '9787020049684',
    '意大利作家埃迪蒙托·德·亚米契斯创作的日记体小说。',
    '中文',
    18.00,
    '2004-01-01',
    14,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '梦的解析',
    '西格蒙德·弗洛伊德',
    '国际文化出版公司',
    '9787801735870',
    '精神分析学说的重要组成部分。',
    '中文',
    39.80,
    '2004-01-01',
    15,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '乔布斯传',
    '沃尔特·艾萨克森',
    '中信出版社',
    '9787508630069',
    '史蒂夫·乔布斯唯一授权的官方传记。',
    '中文',
    88.00,
    '2011-10-24',
    16,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '枪炮、病菌与钢铁',
    '贾雷德·戴蒙德',
    '上海译文出版社',
    '9787532739237',
    '探讨人类社会发展不平等的根源。',
    '中文',
    68.00,
    '2006-04-01',
    17,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '孙子兵法',
    '孙武',
    '中华书局',
    '9787101009117',
    '中国现存最早的兵书，也是世界上最早的军事著作。',
    '中文',
    15.00,
    '1995-01-01',
    18,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '现代汉语词典（第7版）',
    '中国社会科学院语言研究所词典编辑室',
    '商务印书馆',
    '9787100124508',
    '中国第一部规范性的现代汉语词典。',
    '中文',
    109.00,
    '2016-08-01',
    19,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '寂静的春天',
    '蕾切尔·卡森',
    '上海译文出版社',
    '9787532748666',
    '开启了现代环保运动。',
    '中文',
    32.00,
    '2010-03-01',
    20,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '三体II：黑暗森林',
    '刘慈欣',
    '重庆出版社',
    '9787536693968',
    '三体系列第二部。',
    '中文',
    68.00,
    '2008-05-01',
    8,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '许三观卖血记',
    '余华',
    '南海出版公司',
    '9787544258224',
    '余华创作的长篇小说。',
    '中文',
    35.00,
    '2012-08-01',
    1,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '深入理解Java虚拟机（第3版）',
    '周志明',
    '机械工业出版社',
    '9787111616198',
    '系统深入讲解JVM。',
    '中文',
    129.00,
    '2019-07-01',
    7,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '未来简史',
    '尤瓦尔·赫拉利',
    '中信出版社',
    '9787508672069',
    '《人类简史》作者新作，探讨人类未来。',
    '中文',
    68.00,
    '2017-02-01',
    2,
    0
  );
INSERT INTO `book_info` (
    `name`,
    `author`,
    `publish`,
    `isbn`,
    `introduction`,
    `language`,
    `price`,
    `publish_date`,
    `type_id`,
    `status`
  )
VALUES (
    '刑法学讲义',
    '罗翔',
    '云南大学出版社',
    '9787548233645',
    '知名法律学者罗翔的刑法普及读物。',
    '中文',
    58.00,
    '2020-10-01',
    4,
    0
  );
-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bookId` int(11) NOT NULL COMMENT '图书ID',
  `readerId` int(11) NOT NULL COMMENT '读者ID',
  `lendDate` datetime(0) NOT NULL COMMENT '借书时间',
  `backDate` datetime(0) NULL DEFAULT NULL COMMENT '还书时间',
  `backType` int(1) NULL DEFAULT NULL COMMENT '归还类型(0:正常, 1:续借后归还, 2:逾期归还, 3:异常归还)',
  `exceptRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_lend_book` (`bookId`),
  KEY `fk_lend_reader` (`readerId`),
  CONSTRAINT `fk_lend_book` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_lend_reader` FOREIGN KEY (`readerId`) REFERENCES `reader_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '借阅记录';
-- ----------------------------
-- Records of lend_list (Original 13)
-- ----------------------------
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    1,
    2,
    1,
    '2025-04-01 09:15:30',
    '2025-04-15 16:30:00',
    0,
    NULL
  );
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    2,
    3,
    2,
    '2025-04-02 11:05:10',
    '2025-04-20 10:00:00',
    0,
    NULL
  );
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    3,
    3,
    3,
    '2025-04-04 21:50:22',
    '2025-04-04 21:50:32',
    3,
    'Book Damaged Slightly'
  );
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    4,
    5,
    1,
    '2025-04-05 21:35:35',
    '2025-04-05 21:35:47',
    1,
    NULL
  );
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (5, 6, 3, '2025-04-05 21:42:35', NULL, NULL, NULL);
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (6, 4, 1, '2025-04-10 10:00:00', NULL, NULL, NULL);
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (7, 7, 2, '2025-04-11 14:30:00', NULL, NULL, NULL);
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    8,
    13,
    3,
    '2025-04-12 09:00:00',
    '2025-04-28 11:00:00',
    0,
    NULL
  );
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    9,
    14,
    1,
    '2025-04-15 16:20:00',
    NULL,
    NULL,
    NULL
  );
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    10,
    15,
    2,
    '2025-04-18 11:15:00',
    NULL,
    NULL,
    NULL
  );
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    11,
    1,
    3,
    '2025-04-20 17:00:00',
    NULL,
    NULL,
    NULL
  );
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    12,
    8,
    1,
    '2025-04-22 08:45:00',
    NULL,
    NULL,
    NULL
  );
-- Lent
INSERT INTO `lend_list` (
    `id`,
    `bookId`,
    `readerId`,
    `lendDate`,
    `backDate`,
    `backType`,
    `exceptRemarks`
  )
VALUES (
    13,
    10,
    2,
    '2025-04-25 13:00:00',
    NULL,
    NULL,
    NULL
  );
-- Lent
-- ----------------------------
-- Records of lend_list (New 13) - Using reader IDs 1-6 and available book IDs 1-30
-- ----------------------------
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (16, 4, NOW());
-- 理想国 -> 李四 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (17, 5, NOW());
-- 艺术的故事 -> 王五 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (18, 6, NOW());
-- 黄帝内经 -> 赵六 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (19, 1, NOW());
-- 爱的教育 -> 陈朵 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (20, 2, NOW());
-- 梦的解析 -> 陈恋 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (21, 3, NOW());
-- 乔布斯传 -> 赵莲 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (22, 4, NOW());
-- 枪炮、病菌与钢铁 -> 李四 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (23, 5, NOW());
-- 孙子兵法 -> 王五 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (24, 6, NOW());
-- 现代汉语词典 -> 赵六 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (25, 1, NOW());
-- 寂静的春天 -> 陈朵 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (26, 2, NOW());
-- 三体II -> 陈恋 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (27, 3, NOW());
-- 许三观卖血记 -> 赵莲 (Lent)
INSERT INTO `lend_list` (`bookId`, `readerId`, `lendDate`)
VALUES (28, 4, NOW());
-- 深入理解Java虚拟机 -> 李四 (Lent)
-- Note: Books 2, 3, 5, 13 are returned. Books 9, 11, 12, 29, 30 are available (were not lent in original data)
-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `topic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告主题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '公告';
-- ----------------------------
-- Records of notice (Original 5)
-- ----------------------------
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    1,
    '五一劳动节假期开放时间通知',
    '尊敬的读者：根据国家法定节假日安排，本图书馆五一劳动节期间（5月1日至5月5日）开放时间调整为：上午9:00 - 下午17:00。请各位读者合理安排时间。祝大家节日快乐！',
    'admin',
    '2025-04-28 10:00:00'
  );
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    2,
    '新书推荐：《长安的荔枝》',
    '本馆近期采购了一批新书，包括马伯庸新作《长安的荔枝》等热门图书，现已上架，欢迎读者前来借阅。详细书单请见图书馆入口处公告栏或咨询工作人员。',
    'admin',
    '2025-04-25 15:30:00'
  );
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    3,
    '关于延长图书借阅期限的通知',
    '为方便读者阅读，自2025年5月1日起，普通图书借阅期限将由30天延长至45天（不含续借）。请大家相互转告。',
    'yx5411',
    '2025-04-20 09:00:00'
  );
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    4,
    '图书馆WIFI网络升级通知',
    '为提供更优质的网络服务，图书馆将于2025年5月8日（周三）晚上22:00至次日凌晨6:00进行WIFI网络升级维护，期间网络将中断。给您带来的不便敬请谅解。',
    'xy1221',
    '2025-04-29 11:00:00'
  );
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    5,
    '"品读经典，书香致远"读书分享会报名通知',
    '图书馆将于5月15日下午举办"品读经典，书香致远"读书分享会，邀请您一同分享阅读的快乐。名额有限，请于服务台扫码报名。',
    'admin',
    '2025-04-27 14:00:00'
  );
-- ----------------------------
-- Records of notice (New 5)
-- ----------------------------
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
-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `reader_id` int(11) NOT NULL COMMENT '读者ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `submission_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `fk_feedback_reader` (`reader_id`),
  CONSTRAINT `fk_feedback_reader` FOREIGN KEY (`reader_id`) REFERENCES `reader_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci COMMENT = '问题反馈表';
-- ----------------------------
-- Records of feedback (Original 6)
-- ----------------------------
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    1,
    1,
    '图书馆三楼靠窗的座位电源插座好像坏了，希望能尽快维修一下，谢谢！',
    '2025-04-28 11:30:00'
  );
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    2,
    2,
    '建议增加一些最新的计算机科学方面的期刊，特别是人工智能和机器学习方向的。',
    '2025-04-27 16:45:00'
  );
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    3,
    3,
    '图书馆的饮水机经常没有热水，希望能够保证热水供应。',
    '2025-04-29 08:15:00'
  );
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    4,
    1,
    '希望延长周末的开放时间，方便上班族和学生周末来自习。',
    '2025-04-26 19:20:00'
  );
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    5,
    2,
    '《三体》这本书太火了，经常借不到，建议多采购几本副本。',
    '2025-04-29 10:05:00'
  );
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    6,
    3,
    '四楼自习区的空调好像不太制冷，夏天快到了，希望能检查一下。',
    '2025-04-28 14:55:00'
  );
-- ----------------------------
-- Records of feedback (New 6) - Using Reader IDs 1-6
-- ----------------------------
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (
    4,
    '建议采购一些设计类的杂志，比如《Wallpaper*》或者《Domus》。',
    NOW()
  );
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (5, '图书馆网站的搜索功能希望能优化一下，有时候搜不太准。', NOW());
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (6, '打印机经常缺纸或者墨水，希望能及时补充。', NOW());
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (1, '二楼卫生间的洗手液没了，麻烦补充一下。', NOW());
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (2, '建议增加一些考研相关的专业课书籍。', NOW());
INSERT INTO `feedback` (`reader_id`, `content`, `submission_time`)
VALUES (3, '借书处的自助借还机反应有点慢，可以检查下系统吗？', NOW());
-- ----------------------------
-- Final Update book_info status based on all lend_list records
-- ----------------------------
UPDATE book_info
SET status = 0;
-- Reset all book status first
UPDATE book_info
SET status = 1
WHERE id IN (
    SELECT bookId
    FROM lend_list
    WHERE backDate IS NULL
  );
-- Set status for currently lent books
SET FOREIGN_KEY_CHECKS = 1;