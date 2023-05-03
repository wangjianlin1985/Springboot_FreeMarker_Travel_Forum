/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : db_mblog

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2021-04-10 16:47:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `flyway_schema_history`
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES ('1', '3.2', 'update', 'SQL', 'V3.2__update.sql', '-53734780', 'root', '2021-03-15 23:29:07', '17', '1');

-- ----------------------------
-- Table structure for `mto_channel`
-- ----------------------------
DROP TABLE IF EXISTS `mto_channel`;
CREATE TABLE `mto_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_channel
-- ----------------------------
INSERT INTO `mto_channel` VALUES ('2', 'blog', '旅游交流', '0', '', '9');
INSERT INTO `mto_channel` VALUES ('5', 'chaxun', '眉山景点', '0', '', '6');
INSERT INTO `mto_channel` VALUES ('6', 'zijia', '自驾旅游', '0', null, '5');
INSERT INTO `mto_channel` VALUES ('7', 'jingdian', '旅游景点', '0', '/storage/thumbnails/_signature/120UQ2LCR3VDTBOF123VLB9PGE.jpg', '4');
INSERT INTO `mto_channel` VALUES ('8', 'yiqing', '特色产品', '0', '', '3');
INSERT INTO `mto_channel` VALUES ('9', 'xinxi', '攻略信息', '0', null, '2');

-- ----------------------------
-- Table structure for `mto_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mto_comment`;
CREATE TABLE `mto_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_POST_ID` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_comment
-- ----------------------------
INSERT INTO `mto_comment` VALUES ('8', '1', '11', '2021-04-10 16:28:05', '0', '6', '0');
INSERT INTO `mto_comment` VALUES ('9', '1', '22', '2021-04-10 16:28:22', '0', '8', '0');
INSERT INTO `mto_comment` VALUES ('10', '2', '11', '2021-04-10 16:33:17', '0', '6', '0');

-- ----------------------------
-- Table structure for `mto_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `mto_favorite`;
CREATE TABLE `mto_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `mto_links`
-- ----------------------------
DROP TABLE IF EXISTS `mto_links`;
CREATE TABLE `mto_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_links
-- ----------------------------

-- ----------------------------
-- Table structure for `mto_message`
-- ----------------------------
DROP TABLE IF EXISTS `mto_message`;
CREATE TABLE `mto_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `event` int(11) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_message
-- ----------------------------
INSERT INTO `mto_message` VALUES ('11', '2021-04-10 16:28:05', '3', '1', '6', '1', '1');
INSERT INTO `mto_message` VALUES ('12', '2021-04-10 16:28:22', '3', '1', '8', '1', '1');
INSERT INTO `mto_message` VALUES ('13', '2021-04-10 16:33:18', '3', '2', '6', '0', '1');

-- ----------------------------
-- Table structure for `mto_options`
-- ----------------------------
DROP TABLE IF EXISTS `mto_options`;
CREATE TABLE `mto_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `type` int(5) DEFAULT '0',
  `value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_options
-- ----------------------------
INSERT INTO `mto_options` VALUES ('1', 'site_name', '0', 'luntan');
INSERT INTO `mto_options` VALUES ('2', 'site_domain', '0', 'http://luntan.com');
INSERT INTO `mto_options` VALUES ('3', 'site_keywords', '0', 'luntan,论坛,社区');
INSERT INTO `mto_options` VALUES ('4', 'site_description', '0', 'luntan, 做一个有内涵的技术社区');
INSERT INTO `mto_options` VALUES ('5', 'site_metas', '0', '');
INSERT INTO `mto_options` VALUES ('6', 'site_copyright', '0', 'Copyright © Luntan');
INSERT INTO `mto_options` VALUES ('7', 'site_icp', '0', '');
INSERT INTO `mto_options` VALUES ('8', 'qq_callback', '0', '');
INSERT INTO `mto_options` VALUES ('9', 'qq_app_id', '0', '');
INSERT INTO `mto_options` VALUES ('10', 'qq_app_key', '0', '');
INSERT INTO `mto_options` VALUES ('11', 'weibo_callback', '0', '');
INSERT INTO `mto_options` VALUES ('12', 'weibo_client_id', '0', '');
INSERT INTO `mto_options` VALUES ('13', 'weibo_client_sercret', '0', '');
INSERT INTO `mto_options` VALUES ('14', 'github_callback', '0', '');
INSERT INTO `mto_options` VALUES ('15', 'github_client_id', '0', '');
INSERT INTO `mto_options` VALUES ('16', 'github_secret_key', '0', '');
INSERT INTO `mto_options` VALUES ('17', 'site_logo', '0', '/dist/images/logo/logo.png');
INSERT INTO `mto_options` VALUES ('18', 'editor', '0', 'markdown');
INSERT INTO `mto_options` VALUES ('19', 'site_favicon', '0', '/dist/images/logo/m.png');

-- ----------------------------
-- Table structure for `mto_post`
-- ----------------------------
DROP TABLE IF EXISTS `mto_post`;
CREATE TABLE `mto_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `favors` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(140) DEFAULT NULL,
  `tags` varchar(64) DEFAULT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_CHANNEL_ID` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_post
-- ----------------------------
INSERT INTO `mto_post` VALUES ('6', '1', '2', '2', '2021-04-10 16:08:57', '0', '0', '0', '柳江镇位于洪雅县，距成都百余公里，地处通往瓦屋山国家森林公园的途中。古镇历史悠久，最早建于南宋，现在保留着明清时期的景象。在瓦屋山层峦叠翠中，花溪河围绕着具有独特的川南古民居风格古镇吊脚楼，四周青山环抱。解放前，这里是几家大户人家的统辖之地，每户...', '', '', '柳江古镇', '6', '0');
INSERT INTO `mto_post` VALUES ('7', '1', '5', '0', '2021-04-10 16:11:05', '0', '0', '0', '三苏祠位于四川省眉山市城西，是我国著名文学家苏洵、苏轼、苏辙的故居。原为五亩庭院，元代改宅为祠，明末毁于兵火，清康熙四年（1665）在原址模拟重建。三苏祠既保持了苏氏故居的风貌，又体现了祠园建筑的古朴幽深。肃穆中有疏朗之气，典雅中而洋洋大观。庭园...', '', '', '三苏祠博物馆', '2', '0');
INSERT INTO `mto_post` VALUES ('8', '1', '6', '1', '2021-04-10 16:14:35', '0', '0', '0', '国家森林公园瓦屋山，位于四川省眉山市洪雅县柳江镇的洪雅林场境内，距成都180公里，面积104万亩，包括瓦屋山原始森林猎奇探险区、玉屏人工林海度假区、八面山寻古揽胜区等3个景区，她与峨眉山、乐山大佛构成了川西南旅游金三角。 电话 028-36598...', '', '', '瓦屋山风景区', '2', '0');
INSERT INTO `mto_post` VALUES ('9', '1', '8', '0', '2021-04-10 16:16:59', '0', '0', '0', '海螺沟 眉山 肥肠鱼和 平乐古镇 特色饭。上次在 海螺沟 看到 眉山 肥肠鱼饭店，因疫情没开，就记住了，这次有口福了。肥肠鱼也是川菜的经典，过去没有尝过。类似酸菜鱼或者水煮鱼片的做法，但是加了肥肠，有了香气和韧劲，特别好吃。爱肠人的结论是，肥肠是...', '', '', '海螺沟眉山肥肠鱼和平乐古镇特色饭', '3', '0');
INSERT INTO `mto_post` VALUES ('10', '1', '9', '0', '2021-04-10 16:21:11', '0', '0', '0', '小伙伴约着春节前去 成都 周边美食游，最后反复选择决定 眉山 。交通方便，美食多。那就出发吧。 #2020， 眉山 美食二日游# 路线： 成都 出发，第一天在 眉山 吃胡包子，吃春来小食，吃罗白糕，逛古纱縠行，吃 眉山 东坡，逛苏母公园，吃兵哥泡...', '', '', '眉山美食游2021年3月', '1', '0');
INSERT INTO `mto_post` VALUES ('11', '1', '7', '0', '2021-04-10 16:22:23', '0', '0', '0', '柳江镇位于洪雅县，距成都百余公里，地处通往瓦屋山国家森林公园的途中。古镇历史悠久，最早建于南宋，现在保留着明清时期的景象。在瓦屋山层峦叠翠中，花溪河围绕着具有独特的川南古民居风格古镇吊脚楼，四周青山环抱。解放前，这里是几家大户人家的统辖之地，每户...', '', '', '柳江古镇', '1', '0');

-- ----------------------------
-- Table structure for `mto_post_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_attribute`;
CREATE TABLE `mto_post_attribute` (
  `id` bigint(20) NOT NULL,
  `content` longtext,
  `editor` varchar(16) DEFAULT 'tinymce',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_post_attribute
-- ----------------------------
INSERT INTO `mto_post_attribute` VALUES ('6', '柳江镇位于洪雅县，距成都百余公里，地处通往瓦屋山国家森林公园的途中。古镇历史悠久，最早建于南宋，现在保留着明清时期的景象。在瓦屋山层峦叠翠中，花溪河围绕着具有独特的川南古民居风格古镇吊脚楼，四周青山环抱。解放前，这里是几家大户人家的统辖之地，每户人家都有特别之处，当地人还给他们取了好记的名字，如谁家房子、谁家谷子等。几家大户构成了柳江镇的基础，这些单体的豪宅与秀美的山水几近完美地组合在一起，加上临水而建的街市，构成了一幅活脱脱的山水画卷。重要的景点有曾家大院，石板老街等。由于紧靠江边，这里的鱼味道也很鲜美，一定要尝一尝。!![1.jpeg](/storage/thumbnails/_signature/NB8PQHOP2K1UK7MJ0G1RQMPHR.jpeg)\r\n![2.jpg](/storage/thumbnails/_signature/KA82G5JR0QP4GNNDIPBB2CF7H.jpg)', 'markdown');
INSERT INTO `mto_post_attribute` VALUES ('7', '三苏祠位于四川省眉山市城西，是我国著名文学家苏洵、苏轼、苏辙的故居。原为五亩庭院，元代改宅为祠，明末毁于兵火，清康熙四年（1665）在原址模拟重建。三苏祠既保持了苏氏故居的风貌，又体现了祠园建筑的古朴幽深。肃穆中有疏朗之气，典雅中而洋洋大观。庭园红墙环抱，绿水萦绕，古木扶疏，翠竹掩映，形成三分水二分竹的岛居特色。楼台亭榭，庄重典雅；匾额对联，词意隽永。祠内供奉陈列有三苏及子孙、女眷塑像，还供奉有眉山始祖苏味道画像和列代先祖牌位；有木假山堂、古井、洗砚池、荔枝树等苏家遗迹；碑廊陈列石碑150通，其中宋、明、清、民国碑约30通，苏东坡手迹刻石80通。除此而外，馆内还收藏有上万件有关三苏的文献资料和文物，是蜀中最负盛名的人文景观。　　2007年，中共眉山市委、眉山市人民政府投巨资，新建东园碑廊、三苏纪念馆（生平陈列馆）、旅游接待中心等，面积新增20余亩，现占地总面积106亩。生平陈列展厅面积由原300多平方米，增至约3000多平方米。陈列手段采用了更为现代的手法，集多媒体、触摸屏、硅胶蜡像、三维动画等场景一体。2006年被国务院批准为全国重点文物保护单位。2009年被国家文物局评定为国家二级博物馆。2010年被国家旅游局评定为国家AAAA级旅游景区。同时，是四川省爱国主义教育基地、四川省廉政教育基地。\r\n\r\n![3.jpeg](/storage/thumbnails/_signature/3ST4QM5JL9PRG81306T4V7O9P.jpeg)\r\n![4.jpeg](/storage/thumbnails/_signature/FJ574NP0DEPH86PJC6D95A22M.jpeg)', 'markdown');
INSERT INTO `mto_post_attribute` VALUES ('8', '国家森林公园瓦屋山，位于四川省眉山市洪雅县柳江镇的洪雅林场境内，距成都180公里，面积104万亩，包括瓦屋山原始森林猎奇探险区、玉屏人工林海度假区、八面山寻古揽胜区等3个景区，她与峨眉山、乐山大佛构成了川西南旅游金三角。\r\n电话\r\n028-36598888;028-37536368\r\n网址\r\nhttp://www.Chinawws.cn\r\n用时参考\r\n1-3小时\r\n交通\r\n交通：成都－瓦屋山全程200多公里，可在成都的新南门乘到洪雅县的车，然后再转乘到瓦屋山的旅游车，具体如下：新南门汽车站：每天am7：40发车，每1小时一班，票价：38元/人，pm5：40收车。洪雅县汽车站：每天am7：00发车，每30分钟一班，票价：20元/人（到吴庄）和洪雅---金花桥28元/人，pm4:30收车。成都到洪雅一路路况都很好，适合自驾游。车行大约2小时，到达洪雅县城。在车站出门，左转，直行300M左右，过桥，可见另一车站，该处有直达瓦屋山的中巴。票价10元，路途接近2个小时。\r\n展开全部>\r\n门票\r\n普通票:旺季100人民币/淡季70人民币 (1月1日-12月31日 周一-周日)\r\n开放时间\r\n08:30-18:00 (05月01日-07月31日 周一-周日)\r\n08:00-17:00(旺季) (08月01日-10月31日 周一-周日)\r\n09:00-16:00(淡季) (11月01日-次年04月30日 周一-周日)\r\ntips:\r\n如遇特殊情况调整以景区规定为准。\r\n展开全部>\r\n*信息更新时间：2021-04-08     感谢蜂蜂 公园PARK 、小『李』飞刀 、静得秋天 参与了编辑\r\n![6.jpeg](/storage/thumbnails/_signature/3SK7Q9P11G617I8R4INRUAQ597.jpeg)', 'markdown');
INSERT INTO `mto_post_attribute` VALUES ('9', '海螺沟 眉山 肥肠鱼和 平乐古镇 特色饭。上次在 海螺沟 看到 眉山 肥肠鱼饭店，因疫情没开，就记住了，这次有口福了。肥肠鱼也是川菜的经典，过去没有尝过。类似酸菜鱼或者水煮鱼片的做法，但是加了肥肠，有了香气和韧劲，特别好吃。爱肠人的结论是，肥肠是百搭，什么菜都可以做。1店门口。2宣传画。3服务员极力推荐吃钳鱼，说是无刺。没听说过钳鱼，看着像鲶鱼，其实不是。是引进的品种，只有大骨刺，没有小刺，而且鱼肉鲜嫩。4肥肠鱼，看着就是满满的爱。5还点了回锅腊肉。第一次吃，相比回锅肉，油腻更少，更劲道，就是肉皮丝咬不动。很喜欢。6 平乐古镇 排名一二的是奶汤面和钵钵鸡。7奶汤面真的是清汤，有大骨汤味，过瘾。8钵钵鸡，味道入里，麻辣兼备，这个 四川 各地都有。9平乐的肥肠血旺，特别赞，肠好，血旺嫩，味道绝了。\r\n\r\n![8.jpg](/storage/thumbnails/_signature/33E3H27D4CLKANVIJTCCOHU0ST.jpg)\r\n\r\n![9.jpg](/storage/thumbnails/_signature/TRFBH4QO14N4LP9J923N68DGC.jpg)', 'markdown');
INSERT INTO `mto_post_attribute` VALUES ('10', '小伙伴约着春节前去 成都 周边美食游，最后反复选择决定 眉山 。交通方便，美食多。那就出发吧。\r\n#2020， 眉山 美食二日游#\r\n路线：\r\n成都 出发，第一天在 眉山 吃胡包子，吃春来小食，吃罗白糕，逛古纱縠行，吃 眉山 东坡，逛苏母公园，吃兵哥泡椒兔，吃第一家丹棱干拌鸡和第二家丹棱干拌鸡，滨湖路看 眉山 夜景，湿地公园远望远景楼夜灯美景。\r\n第二天，错过邹包子，认真逛东坡湿地公园，吃马旺子，再吃京川，溜达 中国 泡菜城，泡菜博物馆没开门，带了一肚子美食回 成都 ！\r\n眉山东站\r\n\r\n从 成都 东站出发，动车最快半个小时到 眉山 ，价格33元。 眉山 东站是为动车专门修建的火车站，关键词：新，大。出站后旁边就是大型公交车站，无缝对接，不需要提行李走很远，非常方便。\r\n\r\n第二天下午离开 眉山 ，也从这里出发。候车厅非常大，座位很多，个别位置上还有可以手机充电的插座。开水区，卫生间配置齐全。路引指示非常清楚，给乘客带来很多方便。\r\n![10.jpg](/storage/thumbnails/_signature/4TMI32TIITHKI23FS35GSN7HA.jpg)\r\n![11.jpg](/storage/thumbnails/_signature/3ES3N7EOV4DJRIQUO7C6Q0H12G.jpg)\r\n', 'markdown');
INSERT INTO `mto_post_attribute` VALUES ('11', '柳江镇位于洪雅县，距成都百余公里，地处通往瓦屋山国家森林公园的途中。古镇历史悠久，最早建于南宋，现在保留着明清时期的景象。在瓦屋山层峦叠翠中，花溪河围绕着具有独特的川南古民居风格古镇吊脚楼，四周青山环抱。解放前，这里是几家大户人家的统辖之地，每户人家都有特别之处，当地人还给他们取了好记的名字，如谁家房子、谁家谷子等。几家大户构成了柳江镇的基础，这些单体的豪宅与秀美的山水几近完美地组合在一起，加上临水而建的街市，构成了一幅活脱脱的山水画卷。重要的景点有曾家大院，石板老街等。由于紧靠江边，这里的鱼味道也很鲜美，一定要尝一尝。\r\n![1.jpeg](/storage/thumbnails/_signature/NB8PQHOP2K1UK7MJ0G1RQMPHR.jpeg)\r\n![2.jpg](/storage/thumbnails/_signature/KA82G5JR0QP4GNNDIPBB2CF7H.jpg)\r\n这个地方可以', 'markdown');

-- ----------------------------
-- Table structure for `mto_post_resource`
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_resource`;
CREATE TABLE `mto_post_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IK_R_POST_ID` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_post_resource
-- ----------------------------
INSERT INTO `mto_post_resource` VALUES ('3', '/storage/thumbnails/_signature/NB8PQHOP2K1UK7MJ0G1RQMPHR.jpeg', '6', '5', '0');
INSERT INTO `mto_post_resource` VALUES ('4', '/storage/thumbnails/_signature/KA82G5JR0QP4GNNDIPBB2CF7H.jpg', '6', '6', '0');
INSERT INTO `mto_post_resource` VALUES ('5', '/storage/thumbnails/_signature/3ST4QM5JL9PRG81306T4V7O9P.jpeg', '7', '7', '0');
INSERT INTO `mto_post_resource` VALUES ('6', '/storage/thumbnails/_signature/FJ574NP0DEPH86PJC6D95A22M.jpeg', '7', '8', '0');
INSERT INTO `mto_post_resource` VALUES ('7', '/storage/thumbnails/_signature/3SK7Q9P11G617I8R4INRUAQ597.jpeg', '8', '9', '0');
INSERT INTO `mto_post_resource` VALUES ('8', '/storage/thumbnails/_signature/33E3H27D4CLKANVIJTCCOHU0ST.jpg', '9', '10', '0');
INSERT INTO `mto_post_resource` VALUES ('9', '/storage/thumbnails/_signature/TRFBH4QO14N4LP9J923N68DGC.jpg', '9', '11', '0');
INSERT INTO `mto_post_resource` VALUES ('10', '/storage/thumbnails/_signature/3ES3N7EOV4DJRIQUO7C6Q0H12G.jpg', '10', '13', '0');
INSERT INTO `mto_post_resource` VALUES ('11', '/storage/thumbnails/_signature/4TMI32TIITHKI23FS35GSN7HA.jpg', '10', '12', '0');
INSERT INTO `mto_post_resource` VALUES ('12', '/storage/thumbnails/_signature/KA82G5JR0QP4GNNDIPBB2CF7H.jpg', '11', '6', '0');
INSERT INTO `mto_post_resource` VALUES ('13', '/storage/thumbnails/_signature/NB8PQHOP2K1UK7MJ0G1RQMPHR.jpeg', '11', '5', '0');

-- ----------------------------
-- Table structure for `mto_post_tag`
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_tag`;
CREATE TABLE `mto_post_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  `weight` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_TAG_ID` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_post_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `mto_resource`
-- ----------------------------
DROP TABLE IF EXISTS `mto_resource`;
CREATE TABLE `mto_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `md5` varchar(100) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_MD5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_resource
-- ----------------------------
INSERT INTO `mto_resource` VALUES ('1', '0', null, '13OJAVJMI8VVS29D6ILNF7NQNE', '/storage/thumbnails/_signature/13OJAVJMI8VVS29D6ILNF7NQNE.png', '2021-03-15 23:38:53');
INSERT INTO `mto_resource` VALUES ('2', '0', null, '120UQ2LCR3VDTBOF123VLB9PGE', '/storage/thumbnails/_signature/120UQ2LCR3VDTBOF123VLB9PGE.jpg', '2021-04-09 20:18:20');
INSERT INTO `mto_resource` VALUES ('3', '0', null, '1IM3KDDOBOMRPIJ0SPHJN43NSU', '/storage/thumbnails/_signature/1IM3KDDOBOMRPIJ0SPHJN43NSU.jpg', '2021-04-09 20:30:38');
INSERT INTO `mto_resource` VALUES ('4', '0', null, '2GFRQ0NO2HEG93DC1UT63LHLJK', '/storage/thumbnails/_signature/2GFRQ0NO2HEG93DC1UT63LHLJK.jpg', '2021-04-09 21:12:21');
INSERT INTO `mto_resource` VALUES ('5', '2', null, 'NB8PQHOP2K1UK7MJ0G1RQMPHR', '/storage/thumbnails/_signature/NB8PQHOP2K1UK7MJ0G1RQMPHR.jpeg', '2021-04-10 16:22:22');
INSERT INTO `mto_resource` VALUES ('6', '2', null, 'KA82G5JR0QP4GNNDIPBB2CF7H', '/storage/thumbnails/_signature/KA82G5JR0QP4GNNDIPBB2CF7H.jpg', '2021-04-10 16:22:22');
INSERT INTO `mto_resource` VALUES ('7', '1', null, '3ST4QM5JL9PRG81306T4V7O9P', '/storage/thumbnails/_signature/3ST4QM5JL9PRG81306T4V7O9P.jpeg', '2021-04-10 16:11:05');
INSERT INTO `mto_resource` VALUES ('8', '1', null, 'FJ574NP0DEPH86PJC6D95A22M', '/storage/thumbnails/_signature/FJ574NP0DEPH86PJC6D95A22M.jpeg', '2021-04-10 16:11:05');
INSERT INTO `mto_resource` VALUES ('9', '1', null, '3SK7Q9P11G617I8R4INRUAQ597', '/storage/thumbnails/_signature/3SK7Q9P11G617I8R4INRUAQ597.jpeg', '2021-04-10 16:14:34');
INSERT INTO `mto_resource` VALUES ('10', '1', null, '33E3H27D4CLKANVIJTCCOHU0ST', '/storage/thumbnails/_signature/33E3H27D4CLKANVIJTCCOHU0ST.jpg', '2021-04-10 16:16:58');
INSERT INTO `mto_resource` VALUES ('11', '1', null, 'TRFBH4QO14N4LP9J923N68DGC', '/storage/thumbnails/_signature/TRFBH4QO14N4LP9J923N68DGC.jpg', '2021-04-10 16:16:58');
INSERT INTO `mto_resource` VALUES ('12', '1', null, '4TMI32TIITHKI23FS35GSN7HA', '/storage/thumbnails/_signature/4TMI32TIITHKI23FS35GSN7HA.jpg', '2021-04-10 16:21:10');
INSERT INTO `mto_resource` VALUES ('13', '1', null, '3ES3N7EOV4DJRIQUO7C6Q0H12G', '/storage/thumbnails/_signature/3ES3N7EOV4DJRIQUO7C6Q0H12G.jpg', '2021-04-10 16:21:10');

-- ----------------------------
-- Table structure for `mto_security_code`
-- ----------------------------
DROP TABLE IF EXISTS `mto_security_code`;
CREATE TABLE `mto_security_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `key_` varchar(64) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `target` varchar(64) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_shxjkbkgnpxa80pnv4ts57o19` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_security_code
-- ----------------------------

-- ----------------------------
-- Table structure for `mto_tag`
-- ----------------------------
DROP TABLE IF EXISTS `mto_tag`;
CREATE TABLE `mto_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `latest_post_id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `posts` int(11) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9ki38gg59bw5agwxsc4xtednf` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_tag
-- ----------------------------
INSERT INTO `mto_tag` VALUES ('1', '2021-03-15 23:38:56', null, '1', '花', '0', null, '2021-03-15 23:38:56');
INSERT INTO `mto_tag` VALUES ('2', '2021-03-15 23:39:32', null, '2', '攻略', '0', null, '2021-03-15 23:39:32');
INSERT INTO `mto_tag` VALUES ('3', '2021-03-15 23:40:07', null, '3', '油', '0', null, '2021-03-15 23:40:07');
INSERT INTO `mto_tag` VALUES ('4', '2021-03-23 01:50:43', null, '4', '疫情', '0', null, '2021-03-23 01:50:43');

-- ----------------------------
-- Table structure for `mto_user`
-- ----------------------------
DROP TABLE IF EXISTS `mto_user`;
CREATE TABLE `mto_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT '/dist/images/ava/default.png',
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `gender` int(5) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `signature` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_user
-- ----------------------------
INSERT INTO `mto_user` VALUES ('1', 'admin', '小豆丁', '/storage/avatars/000/000/001_240.jpg', 'example@mtons.com', 'UUKHSDDI5KPA43A8VL06V0TU2', '0', '2017-08-06 17:52:41', '2017-07-26 11:08:36', '2021-04-10 16:31:22', '0', '1', '5', '6', '飒11');
INSERT INTO `mto_user` VALUES ('2', 'xiaoming', '小明', '/storage/avatars/000/000/002_240.jpg', null, '105ISM5B2P0TDPCIO72KMI6IRG', '0', '2021-03-15 23:37:28', null, '2021-04-10 16:33:08', '0', null, '1', '0', '我最帅！！！');

-- ----------------------------
-- Table structure for `mto_user_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `mto_user_oauth`;
CREATE TABLE `mto_user_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `expire_in` varchar(128) DEFAULT NULL,
  `oauth_code` varchar(128) DEFAULT NULL,
  `oauth_type` int(11) DEFAULT NULL,
  `oauth_user_id` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_user_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for `shiro_permission`
-- ----------------------------
DROP TABLE IF EXISTS `shiro_permission`;
CREATE TABLE `shiro_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_permission
-- ----------------------------
INSERT INTO `shiro_permission` VALUES ('1', '进入后台', 'admin', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('2', '栏目管理', 'channel:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('3', '编辑栏目', 'channel:update', '2', '0', '0');
INSERT INTO `shiro_permission` VALUES ('4', '删除栏目', 'channel:delete', '2', '0', '0');
INSERT INTO `shiro_permission` VALUES ('5', '文章管理', 'post:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('6', '编辑文章', 'post:update', '5', '0', '0');
INSERT INTO `shiro_permission` VALUES ('7', '删除文章', 'post:delete', '5', '0', '0');
INSERT INTO `shiro_permission` VALUES ('8', '评论管理', 'comment:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('9', '删除评论', 'comment:delete', '8', '0', '0');
INSERT INTO `shiro_permission` VALUES ('10', '用户管理', 'user:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('11', '用户授权', 'user:role', '10', '0', '0');
INSERT INTO `shiro_permission` VALUES ('12', '修改密码', 'user:pwd', '10', '0', '0');
INSERT INTO `shiro_permission` VALUES ('13', '激活用户', 'user:open', '10', '0', '0');
INSERT INTO `shiro_permission` VALUES ('14', '关闭用户', 'user:close', '10', '0', '0');
INSERT INTO `shiro_permission` VALUES ('15', '角色管理', 'role:list', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('16', '修改角色', 'role:update', '15', '0', '0');
INSERT INTO `shiro_permission` VALUES ('17', '删除角色', 'role:delete', '15', '0', '0');
INSERT INTO `shiro_permission` VALUES ('18', '主题管理', 'theme:index', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('19', '系统配置', 'options:index', '0', '0', '0');
INSERT INTO `shiro_permission` VALUES ('20', '修改配置', 'options:update', '19', '0', '0');

-- ----------------------------
-- Table structure for `shiro_role`
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role`;
CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role
-- ----------------------------
INSERT INTO `shiro_role` VALUES ('1', null, 'admin', '0');

-- ----------------------------
-- Table structure for `shiro_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role_permission`;
CREATE TABLE `shiro_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role_permission
-- ----------------------------
INSERT INTO `shiro_role_permission` VALUES ('1', '1', '1');
INSERT INTO `shiro_role_permission` VALUES ('2', '2', '1');
INSERT INTO `shiro_role_permission` VALUES ('3', '3', '1');
INSERT INTO `shiro_role_permission` VALUES ('4', '4', '1');
INSERT INTO `shiro_role_permission` VALUES ('5', '5', '1');
INSERT INTO `shiro_role_permission` VALUES ('6', '6', '1');
INSERT INTO `shiro_role_permission` VALUES ('7', '7', '1');
INSERT INTO `shiro_role_permission` VALUES ('8', '8', '1');
INSERT INTO `shiro_role_permission` VALUES ('9', '9', '1');
INSERT INTO `shiro_role_permission` VALUES ('10', '10', '1');
INSERT INTO `shiro_role_permission` VALUES ('11', '11', '1');
INSERT INTO `shiro_role_permission` VALUES ('12', '12', '1');
INSERT INTO `shiro_role_permission` VALUES ('13', '13', '1');
INSERT INTO `shiro_role_permission` VALUES ('14', '14', '1');
INSERT INTO `shiro_role_permission` VALUES ('15', '15', '1');
INSERT INTO `shiro_role_permission` VALUES ('16', '16', '1');
INSERT INTO `shiro_role_permission` VALUES ('17', '17', '1');
INSERT INTO `shiro_role_permission` VALUES ('18', '18', '1');
INSERT INTO `shiro_role_permission` VALUES ('19', '19', '1');
INSERT INTO `shiro_role_permission` VALUES ('20', '20', '1');

-- ----------------------------
-- Table structure for `shiro_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `shiro_user_role`;
CREATE TABLE `shiro_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_user_role
-- ----------------------------
INSERT INTO `shiro_user_role` VALUES ('1', '1', '1');
