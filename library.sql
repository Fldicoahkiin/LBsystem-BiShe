SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ============================================================
--                  Admin Table
-- ============================================================
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
INSERT INTO `admin` (`id`, `username`, `password`, `adminType`)
VALUES (1, 'admin', '123456', 1),
  (2, 'yx5411', '12345', 0),
  (3, 'xy1221', '12345', 0),
  (4, 'admin_new', '654321', 0),
  (5, 'test_admin', 'testpass', 0),
  (6, 'librarian01', 'libpass', 0),
  (7, 'super_admin', 'superpass', 1),
  (8, 'staff01', 'staffpass', 0),
  (9, 'manager01', 'managerpass', 0),
  (10, 'readonly_admin', 'readonly', 0);
-- ============================================================
--                  Reader Info Table
-- ============================================================
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime(0) NULL DEFAULT NULL,
  `readerNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_readerNumber` (`readerNumber`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
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
    '江西南昌市东湖区',
    '13767134834',
    'chengduo@test.com',
    '2025-04-02 13:18:59',
    'RD20250001'
  ),
  (
    2,
    'mary',
    '12345',
    '陈恋',
    '女',
    '2004-04-01',
    '湖北武汉市武昌区',
    '15270839599',
    'mary.chen@test.com',
    '2025-03-06 07:57:56',
    'RD20250002'
  ),
  (
    3,
    'zhaolian',
    '12345',
    '赵莲',
    '女',
    '2010-04-04',
    '北京海淀区中关村',
    '13834141133',
    'zhaolian@test.com',
    '2025-04-04 13:36:42',
    'RD20250003'
  ),
  (
    4,
    'lisi',
    'password',
    '李四',
    '男',
    '1999-08-15',
    '上海浦东新区张江',
    '13912345678',
    'lisi@example.com',
    '2025-04-10 10:00:00',
    'RD20250004'
  ),
  (
    5,
    'wangwu',
    'pass123',
    '王五',
    '男',
    '2005-11-20',
    '广东深圳市南山区',
    '13887654321',
    'wangwu@sample.net',
    '2025-04-11 11:00:00',
    'RD20250005'
  ),
  (
    6,
    'zhaoliu',
    'securepwd',
    '赵六',
    '女',
    '2002-03-10',
    '四川成都市高新区',
    '13798765432',
    'zhaoliu@mail.org',
    '2025-04-12 12:00:00',
    'RD20250006'
  ),
  (
    7,
    'zhangsan',
    'pass7',
    '张三',
    '男',
    '1995-05-10',
    '北京朝阳区三里屯',
    '13511112222',
    'zhangsan@mail.com',
    '2025-04-13 13:00:00',
    'RD20250007'
  ),
  (
    8,
    'tianqi',
    'pass8',
    '田七',
    '男',
    '2000-12-01',
    '天津南开区大学城',
    '13633334444',
    'tianqi@mail.com',
    '2025-04-14 14:00:00',
    'RD20250008'
  ),
  (
    9,
    'xiaohong',
    'pass9',
    '小红',
    '女',
    '1998-07-22',
    '重庆渝中区解放碑',
    '13755556666',
    'xiaohong@mail.com',
    '2025-04-15 15:00:00',
    'RD20250009'
  ),
  (
    10,
    'xiaoming',
    'pass10',
    '小明',
    '男',
    '2003-09-15',
    '西安雁塔区小寨',
    '13877778888',
    'xiaoming@mail.com',
    '2025-04-16 16:00:00',
    'RD20250010'
  ),
  (
    11,
    'sunqi',
    'pass11',
    '孙琪',
    '女',
    '1997-01-18',
    '浙江杭州市西湖区',
    '13122223333',
    'sunqi@corp.cn',
    '2025-04-17 17:00:00',
    'RD20250011'
  ),
  (
    12,
    'zhouba',
    'pass12',
    '周扒',
    '男',
    '2006-06-25',
    '江苏南京市鼓楼区',
    '13244445555',
    'zhouba@school.edu',
    '2025-04-18 18:00:00',
    'RD20250012'
  ),
  (
    13,
    'wujiu',
    'pass13',
    '吴九',
    '男',
    '1996-02-14',
    '山东青岛市市南区',
    '13366667777',
    'wujiu@gov.org',
    '2025-04-19 19:00:00',
    'RD20250013'
  ),
  (
    14,
    'zhengshi',
    'pass14',
    '郑石',
    '男',
    '2008-10-30',
    '福建厦门市思明区',
    '13488889999',
    'zhengshi@company.com',
    '2025-04-20 20:00:00',
    'RD20250014'
  ),
  (
    15,
    'fengjie',
    'pass15',
    '冯杰',
    '女',
    '1994-03-08',
    '辽宁大连市中山区',
    '13510101010',
    'fengjie@studio.net',
    '2025-04-21 08:00:00',
    'RD20250015'
  ),
  (
    16,
    'chenmei',
    'pass16',
    '陈梅',
    '女',
    '2007-08-17',
    '湖南长沙市岳麓区',
    '13621212121',
    'chenmei@art.org',
    '2025-04-22 09:00:00',
    'RD20250016'
  ),
  (
    17,
    'chuhe',
    'pass17',
    '褚河',
    '男',
    '1993-11-11',
    '安徽合肥市蜀山区',
    '13732323232',
    'chuhe@tech.io',
    '2025-04-23 10:00:00',
    'RD20250017'
  ),
  (
    18,
    'weiqian',
    'pass18',
    '卫潜',
    '女',
    '2009-05-20',
    '河北石家庄市长安区',
    '13843434343',
    'weiqian@mail.cc',
    '2025-04-24 11:00:00',
    'RD20250018'
  ),
  (
    19,
    'jiangxun',
    'pass19',
    '蒋寻',
    '男',
    '1992-01-01',
    '山西太原市小店区',
    '13954545454',
    'jiangxun@research.ac',
    '2025-04-25 12:00:00',
    'RD20250019'
  ),
  (
    20,
    'shenshi',
    'pass20',
    '沈诗',
    '女',
    '2011-07-07',
    '广西桂林市七星区',
    '13065656565',
    'shenshi@travel.info',
    '2025-04-26 13:00:00',
    'RD20250020'
  );
-- ============================================================
--                  Type Info Table
-- ============================================================
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
-- Reset AUTO_INCREMENT
-- Start of regenerated Type Info data
DELETE FROM `type_info`;
ALTER TABLE `type_info` AUTO_INCREMENT = 1;
INSERT INTO `type_info` (`id`, `name`, `remarks`)
VALUES (1, '小说', '各类虚构文学作品'),
  (2, '计算机', '编程、算法、网络、数据库等'),
  (3, '历史', '世界史、中国史、断代史等'),
  (4, '经管', '经济学、管理学、金融、市场营销等'),
  (5, '科普', '自然科学、社会科学普及读物'),
  (6, '哲学', '中西方哲学、伦理学等'),
  (7, '传记', '人物生平事迹记录'),
  (8, '艺术', '绘画、音乐、设计、摄影等'),
  (9, '社科', '社会学、心理学、法律等'),
  (10, '工具书', '词典、手册、指南等'),
  (11, '科幻', '科学幻想类作品'),
  (12, '悬疑推理', '包含悬念和解谜元素'),
  (13, '散文随笔', '非虚构叙事或议论'),
  (14, '诗歌', '韵律和意象的文学形式'),
  (15, '教材教辅', '教学用书及辅助材料'),
  (16, '漫画绘本', '图画叙事类书籍'),
  (17, '旅游地理', '旅行指南、地理知识'),
  (18, '健康养生', '医学保健、生活方式'),
  (19, '育儿教育', '育儿方法、教育理论'),
  (20, '期刊杂志', '定期出版物');
-- End of regenerated Type Info data
-- ============================================================
--                  Book Info Table
-- ============================================================
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `publish_date` date NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_isbn` (`isbn`),
  KEY `fk_book_type` (`type_id`),
  CONSTRAINT `fk_book_type` FOREIGN KEY (`type_id`) REFERENCES `type_info` (`id`) ON DELETE
  SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
-- Reset AUTO_INCREMENT
-- Start of regenerated Book Info data
DELETE FROM `book_info`;
ALTER TABLE `book_info` AUTO_INCREMENT = 1;
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
    '流浪地球',
    '刘慈欣',
    '长江文艺出版社',
    '9787535497743',
    '太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新家园。',
    '中文',
    38.00,
    '2019-02-01',
    11,
    0
  ),
  (
    2,
    'Java核心技术 卷I',
    'Cay S. Horstmann',
    '机械工业出版社',
    '9787111682230',
    '经典的Java入门和进阶书籍，涵盖基础知识和面向对象特性。',
    '中文',
    139.00,
    '2021-06-01',
    2,
    0
  ),
  (
    3,
    '明朝那些事儿(壹)',
    '当年明月',
    '中国海关出版社',
    '9787801655937',
    '以幽默风趣的语言讲述明朝开国到万历年间的历史。',
    '中文',
    39.80,
    '2009-04-01',
    3,
    0
  ),
  (
    4,
    '经济学原理(微观)',
    'N. Gregory Mankiw',
    '北京大学出版社',
    '9787301253115',
    '全球广泛使用的经济学入门教材之一。',
    '中文',
    88.00,
    '2015-04-01',
    4,
    0
  ),
  (
    5,
    '时间简史',
    '史蒂芬·霍金',
    '湖南科学技术出版社',
    '9787535762191',
    '探索宇宙起源和命运的科普经典。',
    '中文',
    45.00,
    '2017-01-01',
    5,
    0
  ),
  (
    6,
    '苏菲的世界',
    '乔斯坦·贾德',
    '作家出版社',
    '9787506380968',
    '一部深入浅出的西方哲学史入门小说。',
    '中文',
    39.00,
    '2015-03-01',
    6,
    0
  ),
  (
    7,
    '乔布斯传',
    '沃尔特·艾萨克森',
    '中信出版社',
    '9787508630069',
    '苹果公司创始人史蒂夫·乔布斯的官方授权传记。',
    '中文',
    88.00,
    '2011-10-24',
    7,
    0
  ),
  (
    8,
    '认识电影',
    '路易斯·贾内梯',
    '世界图书出版公司',
    '9787519219241',
    '经典的电影理论入门教材。',
    '中文',
    128.00,
    '2016-12-01',
    8,
    0
  ),
  (
    9,
    '乌合之众',
    '古斯塔夫·勒庞',
    '中央编译出版社',
    '9787511719833',
    '研究大众心理学的经典著作。',
    '中文',
    28.00,
    '2014-01-01',
    9,
    0
  ),
  (
    10,
    '现代汉语词典(第7版)',
    '中国社会科学院语言研究所',
    '商务印书馆',
    '9787100124508',
    '权威的现代汉语工具书。',
    '中文',
    109.00,
    '2016-08-01',
    10,
    0
  ),
  (
    11,
    '三体',
    '刘慈欣',
    '重庆出版社',
    '9787536692930',
    '中国科幻文学的里程碑之作。',
    '中文',
    68.00,
    '2008-01-10',
    11,
    0
  ),
  (
    12,
    'Effective C++',
    'Scott Meyers',
    '电子工业出版社',
    '9787121125388',
    '改善C++程序设计的55个具体做法。',
    '中文',
    75.00,
    '2011-03-01',
    2,
    0
  ),
  (
    13,
    '全球通史',
    '斯塔夫里阿诺斯',
    '北京大学出版社',
    '9787301244328',
    '从全球视角记述世界历史的经典著作。',
    '中文',
    128.00,
    '2014-09-01',
    3,
    0
  ),
  (
    14,
    '小王子',
    '安托万·德·圣-埃克苏佩里',
    '人民文学出版社',
    '9787020151561',
    '献给长大的孩子们的童话。',
    '中文',
    28.00,
    '2003-08-01',
    1,
    0
  ),
  (
    15,
    'Python基础教程(第3版)',
    'Magnus Lie Hetland',
    '人民邮电出版社',
    '9787115488893',
    '流行的Python入门教程。',
    '中文',
    99.00,
    '2018-06-01',
    2,
    0
  ),
  (
    16,
    '活着',
    '余华',
    '南海出版公司',
    '9787544255988',
    '在大时代背景下的个人史诗。',
    '中文',
    32.00,
    '2012-08-01',
    1,
    0
  ),
  (
    17,
    '算法导论(原书第3版)',
    'Thomas H. Cormen 等',
    '机械工业出版社',
    '9787111407010',
    '算法领域的权威参考书。',
    '英文',
    149.00,
    '2012-12-01',
    2,
    0
  ),
  (
    18,
    '人类简史',
    '尤瓦尔·赫拉利',
    '中信出版社',
    '9787508647357',
    '从动物到上帝的人类发展全貌。',
    '中文',
    68.00,
    '2014-11-01',
    3,
    0
  ),
  (
    19,
    '思考，快与慢',
    '丹尼尔·卡尼曼',
    '中信出版社',
    '9787508633558',
    '诺贝尔经济学奖得主关于决策的经典著作。',
    '中文',
    69.00,
    '2012-07-01',
    4,
    0
  ),
  (
    20,
    '自私的基因',
    '理查德·道金斯',
    '中信出版社',
    '9787508634135',
    '从基因视角解释生命演化的科普名著。',
    '中文',
    58.00,
    '2012-09-01',
    5,
    0
  ),
  (
    21,
    '理想国',
    '柏拉图',
    '商务印书馆',
    '9787100017947',
    '古希腊哲学的代表作之一。',
    '中文',
    32.00,
    '1986-08-01',
    6,
    0
  ),
  (
    22,
    '毛泽东传',
    '罗斯·特里尔',
    '中国人民大学出版社',
    '9787300141221',
    '外国学者撰写的毛泽东传记。',
    '中文',
    98.00,
    '2011-07-01',
    7,
    0
  ),
  (
    23,
    '艺术的故事',
    '贡布里希',
    '广西美术出版社',
    '9787549400809',
    '西方艺术史的经典入门读物。',
    '中文',
    168.00,
    '2008-04-01',
    8,
    0
  ),
  (
    24,
    '梦的解析',
    '西格蒙德·弗洛伊德',
    '国际文化出版公司',
    '9787801735870',
    '精神分析学说的奠基之作。',
    '中文',
    39.80,
    '2004-01-01',
    9,
    0
  ),
  (
    25,
    '牛津高阶英汉双解词典(第9版)',
    '霍恩比',
    '商务印书馆',
    '9787100150187',
    '权威英语学习词典。',
    '双语',
    158.00,
    '2018-01-01',
    10,
    0
  ),
  (
    26,
    '百年孤独',
    '加西亚·马尔克斯',
    '南海出版公司',
    '9787544253991',
    '魔幻现实主义文学的代表作。',
    '中文',
    39.50,
    '2011-06-01',
    1,
    0
  ),
  (
    27,
    '代码整洁之道',
    'Robert C. Martin',
    '人民邮电出版社',
    '9787115216884',
    '提升代码质量的实用建议。',
    '中文',
    59.00,
    '2010-01-01',
    2,
    0
  ),
  (
    28,
    '乡土中国',
    '费孝通',
    '上海人民出版社',
    '9787208069236',
    '中国社会学研究的经典之作。',
    '中文',
    20.00,
    '2006-08-01',
    9,
    0
  ),
  (
    29,
    '围城',
    '钱钟书',
    '人民文学出版社',
    '9787020024759',
    '中国现代文学的经典讽刺小说。',
    '中文',
    19.00,
    '1991-02-01',
    1,
    0
  ),
  (
    30,
    '数据库系统概念(原书第6版)',
    'Abraham Silberschatz 等',
    '机械工业出版社',
    '9787111406082',
    '数据库领域的经典教材。',
    '英文',
    99.00,
    '2012-11-01',
    2,
    0
  );
-- End of regenerated Book Info data
-- ============================================================
--                  Lend List Table
-- ============================================================
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list` (
  `id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `readerId` int(11) NOT NULL,
  `lendDate` datetime(0) NOT NULL,
  `backDate` datetime(0) NULL DEFAULT NULL,
  `backType` int(1) NULL DEFAULT NULL,
  `exceptRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_lend_book` (`bookId`),
  KEY `fk_lend_reader` (`readerId`),
  CONSTRAINT `fk_lend_book` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_lend_reader` FOREIGN KEY (`readerId`) REFERENCES `reader_info` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
-- Reset AUTO_INCREMENT
-- Start of (newly) regenerated Lend List data
DELETE FROM `lend_list`;
ALTER TABLE `lend_list` AUTO_INCREMENT = 1;
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
    1,
    1,
    '2025-03-01 09:00:00',
    '2025-03-20 10:00:00',
    0,
    NULL
  ),
  (
    2,
    11,
    1,
    '2025-03-25 11:00:00',
    '2025-04-15 14:00:00',
    1,
    NULL
  ),
  (
    3,
    21,
    1,
    '2025-04-20 15:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    4,
    2,
    2,
    '2025-03-02 10:00:00',
    '2025-03-22 11:00:00',
    0,
    NULL
  ),
  (
    5,
    12,
    2,
    '2025-03-28 12:00:00',
    '2025-04-20 15:00:00',
    0,
    NULL
  ),
  (
    6,
    22,
    2,
    '2025-04-25 16:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    7,
    3,
    3,
    '2025-03-03 11:00:00',
    '2025-03-24 12:00:00',
    0,
    NULL
  ),
  (
    8,
    13,
    3,
    '2025-04-01 13:00:00',
    '2025-04-25 16:00:00',
    0,
    NULL
  ),
  (
    9,
    23,
    3,
    '2025-05-01 17:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    10,
    4,
    4,
    '2025-03-04 12:00:00',
    '2025-04-10 13:00:00',
    2,
    '逾期6天'
  ),
  (
    11,
    14,
    4,
    '2025-04-15 14:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    12,
    24,
    4,
    '2025-05-02 09:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    13,
    5,
    5,
    '2025-03-05 13:00:00',
    '2025-03-30 14:00:00',
    3,
    '书本封面有污渍'
  ),
  (
    14,
    15,
    5,
    '2025-04-05 15:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    15,
    25,
    5,
    '2025-05-03 10:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    16,
    6,
    6,
    '2025-03-06 14:00:00',
    '2025-04-01 15:00:00',
    0,
    NULL
  ),
  (
    17,
    16,
    6,
    '2025-04-10 16:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    18,
    26,
    6,
    '2025-05-04 11:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    19,
    7,
    7,
    '2025-04-11 09:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    20,
    17,
    7,
    '2025-05-05 10:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    21,
    8,
    8,
    '2025-04-12 10:00:00',
    '2025-05-15 11:00:00',
    2,
    '逾期3天'
  ),
  (
    22,
    18,
    8,
    '2025-05-16 12:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    23,
    9,
    9,
    '2025-04-13 11:00:00',
    '2025-05-10 13:00:00',
    3,
    '少量笔记划线'
  ),
  (
    24,
    19,
    9,
    '2025-05-11 14:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    25,
    10,
    10,
    '2025-04-14 12:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    26,
    20,
    10,
    '2025-05-12 15:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    27,
    27,
    11,
    '2025-04-20 13:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    28,
    28,
    12,
    '2025-04-21 14:00:00',
    '2025-05-18 10:00:00',
    0,
    NULL
  ),
  (
    29,
    29,
    13,
    '2025-04-22 15:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    30,
    30,
    14,
    '2025-04-23 16:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    31,
    1,
    15,
    '2025-04-24 17:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    32,
    2,
    16,
    '2025-04-25 18:00:00',
    '2025-05-19 11:00:00',
    1,
    NULL
  ),
  (
    33,
    3,
    17,
    '2025-04-26 19:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    34,
    4,
    18,
    '2025-04-27 20:00:00',
    '2025-05-20 12:00:00',
    2,
    '逾期2天'
  ),
  (
    35,
    5,
    19,
    '2025-04-28 08:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    36,
    6,
    20,
    '2025-04-29 09:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    37,
    10,
    1,
    '2025-05-06 10:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    38,
    20,
    4,
    '2025-05-07 11:00:00',
    NULL,
    NULL,
    NULL
  ),
  (
    39,
    15,
    5,
    '2025-05-08 12:00:00',
    '2025-05-21 13:00:00',
    3,
    '水渍'
  ),
  (
    40,
    25,
    6,
    '2025-05-09 13:00:00',
    NULL,
    NULL,
    NULL
  );
-- End of (newly) regenerated Lend List data
-- ============================================================
--      Update Book Info Status (based on new Lend List data)
-- ============================================================
UPDATE book_info
SET status = 0;
UPDATE book_info
SET status = 1
WHERE id IN (
    SELECT bookId
    FROM lend_list
    WHERE backDate IS NULL
  );
-- ============================================================
--                  Notice Table
-- ============================================================
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
-- Reset AUTO_INCREMENT
INSERT INTO `notice` (`id`, `topic`, `content`, `author`, `createDate`)
VALUES (
    1,
    '五一劳动节假期开放时间通知',
    '尊敬的读者：根据国家法定节假日安排，本图书馆五一劳动节期间（5月1日至5月5日）开放时间调整为：上午9:00 - 下午17:00。请各位读者合理安排时间。祝大家节日快乐！',
    'admin',
    '2025-04-28 10:00:00'
  ),
  (
    2,
    '新书推荐：《长安的荔枝》',
    '本馆近期采购了一批新书，包括马伯庸新作《长安的荔枝》等热门图书，现已上架，欢迎读者前来借阅。详细书单请见图书馆入口处公告栏或咨询工作人员。',
    'admin',
    '2025-04-25 15:30:00'
  ),
  (
    3,
    '关于延长图书借阅期限的通知',
    '为方便读者阅读，自2025年5月1日起，普通图书借阅期限将由30天延长至45天（不含续借）。请大家相互转告。',
    'yx5411',
    '2025-04-20 09:00:00'
  ),
  (
    4,
    '图书馆WIFI网络升级通知',
    '为提供更优质的网络服务，图书馆将于2025年5月8日（周三）晚上22:00至次日凌晨6:00进行WIFI网络升级维护，期间网络将中断。给您带来的不便敬请谅解。',
    'xy1221',
    '2025-04-29 11:00:00'
  ),
  (
    5,
    '"品读经典，书香致远"读书分享会报名通知',
    '图书馆将于5月15日下午举办"品读经典，书香致远"读书分享会，邀请您一同分享阅读的快乐。名额有限，请于服务台扫码报名。',
    'admin',
    '2025-04-27 14:00:00'
  ),
  (
    6,
    '关于规范使用自习室座位的通知',
    '为维护良好的学习环境，请勿长时间占用座位或放置私人物品占座。离开超过30分钟请自觉带走个人物品。感谢您的配合。',
    'librarian01',
    '2025-05-06 09:00:00'
  ),
  (
    7,
    '图书馆春季读者问卷调查',
    '为更好地了解读者需求、提升服务质量，图书馆现开展春季读者问卷调查，请扫描二维码参与。您的意见对我们非常重要！',
    'yx5411',
    '2025-05-07 11:00:00'
  ),
  (
    8,
    '"世界读书日"系列活动预告',
    '为迎接4月23日世界读书日，图书馆将举办图书漂流、名家讲座、经典电影展映等系列活动，敬请关注后续通知。',
    'admin',
    '2025-04-15 10:00:00'
  ),
  (
    9,
    '电子资源远程访问说明',
    '本校师生可通过VPN或图书馆统一认证平台在校外访问图书馆购买的电子资源。具体操作指南请见图书馆网站"服务"栏目。',
    'xy1221',
    '2025-05-09 14:00:00'
  ),
  (
    10,
    '失物招领：一把蓝色雨伞',
    '昨日在三楼阅览区拾到一把蓝色长柄雨伞，请失主凭有效证件到服务台认领。',
    'staff01',
    '2025-05-10 08:30:00'
  );
-- ============================================================
--                  Feedback Table
-- ============================================================
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submission_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_feedback_reader` (`reader_id`),
  CONSTRAINT `fk_feedback_reader` FOREIGN KEY (`reader_id`) REFERENCES `reader_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;
-- Reset AUTO_INCREMENT
INSERT INTO `feedback` (`id`, `reader_id`, `content`, `submission_time`)
VALUES (
    1,
    1,
    '图书馆三楼靠窗的座位电源插座好像坏了，希望能尽快维修一下，谢谢！',
    '2025-04-28 11:30:00'
  ),
  (
    2,
    2,
    '建议增加一些最新的计算机科学方面的期刊，特别是人工智能和机器学习方向的。',
    '2025-04-27 16:45:00'
  ),
  (
    3,
    3,
    '图书馆的饮水机经常没有热水，希望能够保证热水供应。',
    '2025-04-29 08:15:00'
  ),
  (
    4,
    1,
    '希望延长周末的开放时间，方便上班族和学生周末来自习。',
    '2025-04-26 19:20:00'
  ),
  (
    5,
    2,
    '《三体》这本书太火了，经常借不到，建议多采购几本副本。',
    '2025-04-29 10:05:00'
  ),
  (
    6,
    4,
    '四楼自习区的空调好像不太制冷，夏天快到了，希望能检查一下。',
    '2025-04-28 14:55:00'
  ),
  (
    7,
    5,
    '建议采购一些设计类的杂志，比如《Wallpaper*》或者《Domus》。',
    '2025-05-01 09:30:00'
  ),
  (
    8,
    6,
    '图书馆网站的搜索功能希望能优化一下，有时候搜不太准。',
    '2025-05-02 10:40:00'
  ),
  (
    9,
    7,
    '打印机经常缺纸或者墨水，希望能及时补充。',
    '2025-05-03 11:50:00'
  ),
  (
    10,
    8,
    '二楼卫生间的洗手液没了，麻烦补充一下。',
    '2025-05-04 12:00:00'
  );
SET FOREIGN_KEY_CHECKS = 1;