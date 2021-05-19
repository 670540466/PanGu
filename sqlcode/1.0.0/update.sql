-- 运营后台用户模块表
CREATE TABLE mooc_backend_user_t(
   UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
   user_name VARCHAR(50) COMMENT '用户账号',
   user_pwd VARCHAR(50) COMMENT '用户密码',
   user_phone VARCHAR(50) COMMENT '用户手机号'
) COMMENT '后台用户表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- 用户模块相关表结构
DROP TABLE IF EXISTS mooc_user_t;
CREATE TABLE mooc_user_t(
   UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
   user_name VARCHAR(50) COMMENT '用户账号',
   user_pwd VARCHAR(50) COMMENT '用户密码',
   nick_name VARCHAR(50) COMMENT '用户昵称',
   user_sex INT COMMENT '用户性别 0-男，1-女',
   birthday VARCHAR(50) COMMENT '出生日期',
   email VARCHAR(50) COMMENT '用户邮箱',
   user_phone VARCHAR(50) COMMENT '用户手机号',
   address VARCHAR(50) COMMENT '用户住址',
   head_url VARCHAR(50) COMMENT '头像URL',
   biography VARCHAR(200) COMMENT '个人介绍',
   life_state INT COMMENT '生活状态 0-单身，1-热恋中，2-已婚，3-为人父母',
   begin_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) COMMENT '用户表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

INSERT INTO mooc_user_t(user_name,user_pwd,nick_name,user_sex,birthday,email,user_phone,address,head_url,life_state,biography) VALUES('admin','0192023a7bbd73250516f069df18b500','隔壁泰山',0,'2018-07-31','admin@mooc.com','13888888888','北京市海淀区朝阳北路中南海国宾馆','films/img/head-img.jpg',0,'没有合适的伞，我宁可淋着雨');
INSERT INTO mooc_user_t(user_name,user_pwd,nick_name,user_sex,birthday,email,user_phone,address,head_url,life_state,biography) VALUES('jiangzh','5e2de6bd1c9b50f6e27d4e55da43b917','阿里郎',0,'2018-08-20','jiangzh@mooc.com','13866666666','北京市朝阳区大望路万达广场','films/img/head-img.jpg',1,'我喜欢隔壁泰山');



-- 影片模块相关表结构

-- ----------------------------
-- Table structure for mooc_banner_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_banner_t`;
CREATE TABLE mooc_banner_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  banner_address VARCHAR(50) COMMENT 'banner图存放路径',
  banner_url VARCHAR(200) COMMENT 'banner点击跳转url',
  is_valid INT DEFAULT 0 COMMENT '是否弃用 0-失效,1-失效'
) COMMENT 'banner信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_banner_t
-- ----------------------------
INSERT INTO mooc_banner_t(banner_address,banner_url) VALUES('/banners/9d75708ae91d5fc918369b76e9e2edba197666.jpg','www.meetingshop.cn');
INSERT INTO mooc_banner_t(banner_address,banner_url) VALUES('/banners/15b3730838f35d56a76d88a1787aaaa5186414.jpg','www.meetingshop.cn');
INSERT INTO mooc_banner_t(banner_address,banner_url) VALUES('/banners/51afa73f0347e9b98957c53fa971d41491652.jpg','www.meetingshop.cn');
INSERT INTO mooc_banner_t(banner_address,banner_url) VALUES('/banners/6605d3518e2bba10f29a6f9ae32b361987015.jpg','www.meetingshop.cn');
INSERT INTO mooc_banner_t(banner_address,banner_url) VALUES('/banners/c1a713981cabef02c88ae5f42888de70183835.jpg','www.meetingshop.cn');



-- ----------------------------
-- Table structure for mooc_cat_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_cat_dict_t`;
CREATE TABLE mooc_cat_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称'
) COMMENT '类型信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_cat_dict_t
-- ----------------------------
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(1,'爱情');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(2,'喜剧');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(3,'动画');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(4,'剧情');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(5,'恐怖');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(6,'惊悚');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(7,'科幻');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(8,'动作');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(9,'悬疑');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(10,'犯罪');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(11,'冒险');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(12,'战争');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(13,'奇幻');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(14,'运动');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(15,'家庭');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(16,'古装');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(17,'武侠');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(18,'西部');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(19,'历史');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(20,'传记');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(21,'歌舞');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(22,'短片');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(23,'纪录片');
INSERT INTO mooc_cat_dict_t(UUID,show_name) VALUES(24,'黑色电影');





-- ----------------------------
-- Table structure for mooc_source_dict_t
-- ----------------------------
DROP TABLE IF EXISTS mooc_source_dict_t;
CREATE TABLE mooc_source_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称'
) COMMENT '区域信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_source_dict_t
-- ----------------------------
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(1,'大陆');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(2,'美国');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(3,'韩国');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(4,'日本');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(5,'中国香港');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(6,'中国台湾');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(7,'印度');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(8,'法国');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(9,'英国');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(10,'俄罗斯');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(11,'意大利');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(12,'西班牙');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(13,'德国');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(14,'波兰');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(15,'澳大利亚');
INSERT INTO mooc_source_dict_t(UUID,show_name) VALUES(16,'伊朗');


-- ----------------------------
-- Table structure for mooc_year_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_year_dict_t`;
CREATE TABLE mooc_year_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称'
) COMMENT '年代信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_year_dict_t
-- ----------------------------
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(1,'更早');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(2,'70年代');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(3,'80年代');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(4,'90年代');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(5,'2000-2010');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(6,'2011');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(7,'2012');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(8,'2013');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(9,'2014');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(10,'2015');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(11,'2016');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(12,'2017');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(13,'2018');
INSERT INTO mooc_year_dict_t(UUID,show_name) VALUES(14,'2018以后');



-- ----------------------------
-- Table structure for mooc_film_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_film_t`;
CREATE TABLE mooc_film_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  film_name VARCHAR(100) COMMENT '影片名称',
  film_type INT COMMENT '片源类型: 0-2D,1-3D,2-3DIMAX,4-无',
  img_address VARCHAR(200) COMMENT '影片主图地址',
  film_score VARCHAR(20) COMMENT '影片评分',
  film_preSaleNum INT COMMENT '影片预售数量',
  film_box_office INT COMMENT '影片票房：每日更新，以万为单位',
  film_source INT COMMENT '影片片源，参照片源字典表',
  film_cats VARCHAR(50) COMMENT '影片分类，参照分类表,多个分类以#分割',
  film_area INT COMMENT '影片区域，参照区域表',
  film_date INT COMMENT '影片上映年代，参照年代表',
  film_time TIMESTAMP COMMENT '影片上映时间',
  film_status INT COMMENT '影片状态,1-正在热映，2-即将上映，3-经典影片'
) COMMENT '影片主表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for mooc_film_info_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_film_info_t`;
CREATE TABLE mooc_film_info_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  film_id VARCHAR(100) COMMENT '影片编号',
  film_en_name VARCHAR(50) COMMENT '影片英文名称',
  film_score VARCHAR(20) COMMENT '影片评分',
  film_score_num INT COMMENT '评分人数,以万为单位',
  film_length INT COMMENT '播放时长，以分钟为单位，不足取整',
  biography TEXT COMMENT '影片介绍',
  director_id INT COMMENT '导演编号',
  film_imgs TEXT COMMENT '影片图片集地址,多个图片以逗号分隔'
) COMMENT '影片主表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for mooc_actor_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_actor_t`;
CREATE TABLE mooc_actor_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  actor_name VARCHAR(50) COMMENT '演员名称',
  actor_img  VARCHAR(200) COMMENT '演员图片位置'
) COMMENT '演员表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_actor_t
-- ----------------------------
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(1,'徐峥','/actors/2b98c9d2e6d23a7eff25dcac8b584b0136045.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(2,'王传君','/actors/b782d497577baffb5ed14de52841dcb164365.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(3,'谭卓','/actors/acf7db57456cb1aed1a42f7ebffedaa842002.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(4,'黄渤','/actors/c6594ef2705dcaf7d9df857d228b5e1645712.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(5,'舒淇','/actors/6b32a489467283bb739a2bac3b2b929742175.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(6,'张艺兴','/actors/b738d5e78a1f5c3379d9d42a9b18286f32246.jpeg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(7,'强森','/actors/7e3067d066c1e285b0cc17bfd5f1b34e108474.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(8,'杰森·斯坦森','/actors/7ec0c90aec03c7904c1db3af1153162f77864.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(9,'李冰冰','/actors/d2258cd0529950cf5099206519d91d0e51803.jpg');
INSERT INTO mooc_actor_t(UUID,actor_name,actor_img) VALUE(10,'汤姆·克鲁斯','/actors/6afaea1cb4ca2b346e86e265347c78b833970.jpg');

-- ----------------------------
-- Table structure for mooc_film_actor_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_film_actor_t`;
CREATE TABLE mooc_film_actor_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  film_id INT COMMENT '影片编号,对应mooc_film_t',
  actor_id INT COMMENT '演员编号,对应mooc_actor_t',
  role_name VARCHAR(100) COMMENT '角色名称'
) COMMENT '影片与演员映射表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_film_actor_t
-- ----------------------------
INSERT INTO mooc_film_actor_t(UUID,film_id,actor_id,role_name)
	VALUES(1,2,1,'演员1');
INSERT INTO mooc_film_actor_t(UUID,film_id,actor_id,role_name)
	VALUES(2,2,2,'演员2');
INSERT INTO mooc_film_actor_t(UUID,film_id,actor_id,role_name)
	VALUES(3,2,3,'演员3');
INSERT INTO mooc_film_actor_t(UUID,film_id,actor_id,role_name)
	VALUES(4,2,4,'演员4');
	
	
	
-- 影院建表语句

-- ----------------------------
-- Table structure for mooc_brand_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_brand_dict_t`;
CREATE TABLE mooc_brand_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称'
) COMMENT '品牌信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_brand_dict_t
-- ----------------------------
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(1,'大地影院');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(2,'万达影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(3,'耀莱成龙国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(4,'保利国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(5,'博纳国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(6,'金逸影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(7,'中影国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(8,'CGV影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(9,'橙天嘉禾影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(10,'新华国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(11,'星美国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(12,'百老汇影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(13,'UME国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(14,'幸福蓝海国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(15,'首都电影院');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(16,'华谊兄弟影院');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(17,'卢米埃影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(18,'沃美影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(19,'美嘉欢乐影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(20,'嘉华国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(21,'17.5影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(22,'太平洋电影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(23,'SFC上影影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(24,'嘉美国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(25,'东都影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(26,'鲁信影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(27,'华影国际影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(28,'搜秀影城');
INSERT INTO mooc_brand_dict_t(UUID,show_name) VALUES(29,'横店电影城');



-- ----------------------------
-- Table structure for mooc_area_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_area_dict_t`;
CREATE TABLE mooc_area_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称'
) COMMENT '地域信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_area_dict_t
-- ----------------------------
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(1,'朝阳区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(2,'海淀区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(3,'丰台区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(4,'大兴区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(5,'东城区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(6,'西城区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(7,'通州区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(8,'房山区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(9,'昌平区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(10,'顺义区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(11,'怀柔区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(12,'门头沟');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(13,'石景山区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(14,'密云区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(15,'平谷区');
INSERT INTO mooc_area_dict_t(UUID,show_name) VALUES(16,'延庆区');


-- ----------------------------
-- Table structure for mooc_hall_dict_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_hall_dict_t`;
CREATE TABLE mooc_hall_dict_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  show_name VARCHAR(100) COMMENT '显示名称',
  seat_address VARCHAR(200) COMMENT '座位文件存放地址'
) COMMENT '地域信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Records of mooc_hall_dict_t
-- ----------------------------
INSERT INTO mooc_hall_dict_t(UUID,show_name) VALUES(99,'全部');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(1,'IMAX厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(2,'CGS中国巨幕厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(3,'杜比全景声厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(4,'Dolby Cinema厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(5,'RealD厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(6,'RealD 6FL厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(7,'LUXE巨幕厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(8,'4DX厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(9,'DTS:X 临境音厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(10,'儿童厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(11,'4K厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(12,'4D厅','/seats/cgs.json');
INSERT INTO mooc_hall_dict_t(UUID,show_name,seat_address) VALUES(13,'巨幕厅','/seats/cgs.json');



-- ----------------------------
-- Table structure for mooc_cinema_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_cinema_t`;
CREATE TABLE mooc_cinema_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  cinema_name VARCHAR(50) COMMENT '影院名称',
  cinema_phone VARCHAR(50) COMMENT '影院电话',
  brand_id INT COMMENT '品牌编号',  
  area_id INT COMMENT '地域编号',
  hall_ids VARCHAR(200) COMMENT '包含的影厅类型,以#作为分割',
  img_address VARCHAR(500) COMMENT '影院图片地址',
  cinema_address VARCHAR(200) COMMENT '影院地址',
  minimum_price INT DEFAULT 0 COMMENT '最低票价'
) COMMENT '影院信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for mooc_field_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_field_t`;
CREATE TABLE mooc_field_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  cinema_id INT COMMENT '影院编号',
  film_id INT COMMENT '电影编号',
  begin_time VARCHAR(50) COMMENT '开始时间',
  end_time VARCHAR(50) COMMENT '结束时间',  
  hall_id INT COMMENT '放映厅类型编号',
  hall_name VARCHAR(200) COMMENT '放映厅名称',
  price INT COMMENT '票价'
) COMMENT '放映场次表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for mooc_hall_film_info_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_hall_film_info_t`;
CREATE TABLE mooc_hall_film_info_t(
  UUID INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键编号',
  film_id INT COMMENT '电影编号',
  film_name VARCHAR(50) COMMENT '电影名称',
  film_length VARCHAR(50) COMMENT '电影时长',  
  film_cats VARCHAR(200) COMMENT '电影类型',
  film_language VARCHAR(50) DEFAULT '国语2D' COMMENT '电影语言',
  actors VARCHAR(200) COMMENT '演员列表',
  img_address VARCHAR(500) COMMENT '图片地址'
) COMMENT '影厅电影信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


	
-- 订单模块建表语句

-- ----------------------------
-- Table structure for mooc_order_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_order_t`;
CREATE TABLE mooc_order_t(
  UUID VARCHAR(100) COMMENT '主键编号',
  cinema_id INT COMMENT '影院编号',
  field_id INT COMMENT '放映场次编号',
  film_id INT COMMENT '电影编号',
  seats_ids VARCHAR(50) COMMENT '已售座位编号',
  seats_name VARCHAR(200) COMMENT '已售座位名称',
  film_price DOUBLE COMMENT '影片售价',
  order_price DOUBLE COMMENT '订单总金额',
  order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  order_user INT COMMENT '下单人',
  order_status INT DEFAULT 0 COMMENT '0-待支付,1-已支付,2-已关闭'
) COMMENT '订单信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for mooc_order_2017_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_order_2017_t`;
CREATE TABLE mooc_order_2017_t(
  UUID VARCHAR(100) COMMENT '主键编号',
  cinema_id INT COMMENT '影院编号',
  field_id INT COMMENT '放映场次编号',
  film_id INT COMMENT '电影编号',
  seats_ids VARCHAR(50) COMMENT '已售座位编号',
  seats_name VARCHAR(200) COMMENT '已售座位名称',
  film_price DOUBLE COMMENT '影片售价',
  order_price DOUBLE COMMENT '订单总金额',
  order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  order_user INT COMMENT '下单人',
  order_status INT DEFAULT 0 COMMENT '0-待支付,1-已支付,2-已关闭'
) COMMENT '订单信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for mooc_order_2018_t
-- ----------------------------
DROP TABLE IF EXISTS `mooc_order_2018_t`;
CREATE TABLE mooc_order_2018_t(
  UUID VARCHAR(100) COMMENT '主键编号',
  cinema_id INT COMMENT '影院编号',
  field_id INT COMMENT '放映场次编号',
  film_id INT COMMENT '电影编号',
  seats_ids VARCHAR(50) COMMENT '已售座位编号',
  seats_name VARCHAR(200) COMMENT '已售座位名称',
  film_price DOUBLE COMMENT '影片售价',
  order_price DOUBLE COMMENT '订单总金额',
  order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  order_user INT COMMENT '下单人',
  order_status INT DEFAULT 0 COMMENT '0-待支付,1-已支付,2-已关闭'
) COMMENT '订单信息表' ENGINE = INNODB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;
