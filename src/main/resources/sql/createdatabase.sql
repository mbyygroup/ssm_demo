/*
注：win下mysql是没有大小写区分的，而linux下是严格区分大小写的，为了协调
阿里巴巴编程规约中规定sql必须使用小写，如果在win下随便写，它只是阿里内部
协调的结果，具体怎么写看自己吧
*/
create database kitadmin;

DROP TABLE IF EXISTS `kit_admin`;
CREATE TABLE `kit_admin` (
  `kit_admin_id` varchar(111) NOT NULL COMMENT '用户id',
  `kit_admin_username` varchar(30) NOT NULL COMMENT '用户名',
  `kit_admin_password` varchar(32) NOT NULL COMMENT '密码',
  `kit_admin_name` varchar(20) NOT NULL COMMENT '名字',
  `kit_admin_img_url` varchar(100) NOT NULL COMMENT '头像地址',
  `group_id` int(2) NOT NULL COMMENT '用户所属分组',
  PRIMARY KEY (`kit_admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_adv_hello`;
CREATE TABLE `kit_adv_hello` (
  `ah_id` varchar(111) NOT NULL COMMENT '欢迎banner的唯一id',
  `ah_sequence` int(4) NOT NULL COMMENT '序号（数字越大越靠前，1-9999之间，默认是50）',
  `ah_img` varchar(200) NOT NULL COMMENT '图片地址',
  `ah_url` varchar(200) DEFAULT NULL COMMENT '图片需要跳转的地址',
  `ah_time` datetime NOT NULL COMMENT '发布时间',
  `ah_start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `ah_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `ah_type` int(1) NOT NULL COMMENT '是否关闭（关闭将不显示，1：显示，2：关闭）',
  `ah_title` varchar(50) NOT NULL COMMENT '标题',
  `ah_summary` varchar(200) DEFAULT NULL COMMENT '概述（1-100之间）',
  PRIMARY KEY (`ah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='APP首次登录的幻灯片设置';

DROP TABLE IF EXISTS `kit_area`;
CREATE TABLE `kit_area` (
  `district_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '父及关系',
  `district` varchar(120) NOT NULL COMMENT '地区名称',
  `level` int(1) NOT NULL COMMENT '子属关系',
  PRIMARY KEY (`district_id`),
  KEY `parent_id` (`pid`),
  KEY `region_type` (`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3432 DEFAULT CHARSET=utf8 COMMENT='地区表';

DROP TABLE IF EXISTS `kit_file_qiniu`;
CREATE TABLE `kit_file_qiniu` (
  `fq_id` int(1) NOT NULL,
  `fq_accessKey` varchar(255) DEFAULT NULL,
  `fq_secretKey` varchar(255) DEFAULT NULL,
  `fq_bucket` varchar(255) DEFAULT NULL COMMENT '创建的空间名字',
  `fq_key` varchar(255) DEFAULT NULL COMMENT '需要替换的文件名字',
  PRIMARY KEY (`fq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='七牛云配置';

DROP TABLE IF EXISTS `kit_g_group`;
CREATE TABLE `kit_g_group` (
  `group_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `group_name` varchar(50) DEFAULT NULL COMMENT '分组名字',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `kit_g_group_limit`;
CREATE TABLE `kit_g_group_limit` (
  `gl_id` varchar(111) NOT NULL COMMENT '列表ID',
  `group_id` int(4) DEFAULT NULL COMMENT '分组ID',
  `limit_id` int(5) DEFAULT NULL COMMENT '功能id',
  `group_c` int(1) NOT NULL DEFAULT '1' COMMENT '是否有增加按钮，1 为 有，2 为没有',
  `group_r` int(1) NOT NULL DEFAULT '1' COMMENT '是否有删除按钮，1 为 有，2 为没有',
  `group_u` int(1) NOT NULL DEFAULT '1' COMMENT '是否有修改按钮，1 为 有，2 为没有',
  `group_d` int(1) NOT NULL DEFAULT '1' COMMENT '是否有查询按钮，1 为 有，2 为没有',
  PRIMARY KEY (`gl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组和权限关联表';

DROP TABLE IF EXISTS `kit_g_limit`;
CREATE TABLE `kit_g_limit` (
  `limit_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `limit_sequence` int(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `limit_ico` varchar(50) NOT NULL COMMENT '图标',
  `limit_title` varchar(50) NOT NULL COMMENT '标题',
  `limit_action` varchar(100) NOT NULL COMMENT '路径',
  `limit_leaderid` int(5) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `limit_system` int(2) NOT NULL DEFAULT '1' COMMENT '是否允许编辑，1：允许修改，2：不允许修改',
  PRIMARY KEY (`limit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='功能表';

DROP TABLE IF EXISTS `kit_message`;
CREATE TABLE `kit_message` (
  `id` int(1) NOT NULL COMMENT 'id',
  `key_Id` varchar(111) DEFAULT NULL COMMENT '请输入你在阿里大鱼后台的AccessKeyId',
  `ket_secret` varchar(255) DEFAULT NULL COMMENT '请输入你在阿里大鱼后台的AccessKeySecret',
  `sign_name` varchar(111) DEFAULT NULL COMMENT '阿里大鱼认证通过的短信签名',
  `template_dayu` varchar(50) DEFAULT NULL COMMENT '这里是阿里大鱼默认的短信模板',
  `sid` varchar(111) DEFAULT NULL COMMENT '请输入你在云之讯的唯一标识',
  `app_id` varchar(255) DEFAULT NULL COMMENT '云之讯的AppId',
  `token` varchar(255) DEFAULT NULL COMMENT '请输入你在云之讯的token',
  `template_yzx` varchar(50) DEFAULT NULL COMMENT '云之讯的默认短信模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_pay_setting`;
CREATE TABLE `kit_pay_setting` (
  `ps_id` int(1) NOT NULL COMMENT '唯一id',
  `pay_is_alipay` int(1) NOT NULL COMMENT '是否开启支付宝支付',
  `pay_is_weixin` int(1) NOT NULL COMMENT '是否开启微信支付',
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_pay_setting_alipay`;
CREATE TABLE `kit_pay_setting_alipay` (
  `psa_id` int(1) NOT NULL,
  `psa_app_id` varchar(255) DEFAULT NULL COMMENT 'appId',
  `psa_private_key` text COMMENT '密钥',
  `psa_public_key` text COMMENT '支付宝公钥',
  `psa_server_url` varchar(255) DEFAULT NULL COMMENT '支付宝开放安全地址(一半不需要修改)',
  `psa_do_main` varchar(100) DEFAULT NULL COMMENT '支付宝返回回调地址前缀',
  `psa_charset` varchar(30) DEFAULT NULL COMMENT '设置字符集编码',
  `psa_format` varchar(30) DEFAULT 'JSON' COMMENT '仅支持JSON',
  `psa_sign_type` varchar(30) DEFAULT 'RSA2' COMMENT '设置符号类型',
  PRIMARY KEY (`psa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_pay_setting_weixin`;
CREATE TABLE `kit_pay_setting_weixin` (
  `psw_id` int(1) NOT NULL COMMENT '唯一标识',
  `psw_app_id` varchar(255) DEFAULT NULL COMMENT '微信开发平台应用ID',
  `psw_app_secret` varchar(255) DEFAULT NULL COMMENT '应用对应的凭证',
  `psw_app_key` varchar(255) DEFAULT NULL COMMENT '应用对应的密钥',
  `psw_mchId` varchar(255) DEFAULT NULL COMMENT '微信支付商户号',
  `psw_body` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `psw_partner_key` varchar(255) DEFAULT NULL COMMENT '商户号对应的密钥',
  `psw_partner_id` varchar(255) DEFAULT NULL COMMENT '商户id',
  `psw_grant_type` varchar(255) DEFAULT NULL COMMENT '常量固定值',
  `psw_gate_url` varchar(255) DEFAULT NULL COMMENT '获取预支付id的接口url',
  `psw_notify_url` varchar(255) DEFAULT NULL COMMENT '微信服务器回调通知url',
  `psw_spbill_createIp` varchar(30) DEFAULT NULL COMMENT '请求的 IP 地址，其实就是服务器的IP地址',
  PRIMARY KEY (`psw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_push_jpush`;
CREATE TABLE `kit_push_jpush` (
  `pj_id` int(1) NOT NULL,
  `pj_appkey` varchar(255) DEFAULT NULL COMMENT '极光推送的appkey',
  `pj_mastersecret` varchar(255) DEFAULT NULL COMMENT '极光推送的mastersecret',
  PRIMARY KEY (`pj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='极光推送配置文件\n';

DROP TABLE IF EXISTS `kit_sign`;
CREATE TABLE `kit_sign` (
  `sign_id` varchar(64) NOT NULL COMMENT '唯一标识',
  `sign_phone` varchar(11) NOT NULL COMMENT '手机号码',
  `sign_code` varchar(64) NOT NULL COMMENT 'MD5( 验证码+盐）',
  `sign_time` datetime NOT NULL COMMENT '发送时间',
  `sign_type` int(1) NOT NULL COMMENT '状态（1：未使用，2：已经使用）',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_user`;
CREATE TABLE `kit_user` (
  `user_id` varchar(111) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_login_name` varchar(50) DEFAULT NULL COMMENT '登录用户名',
  `user_password` varchar(100) DEFAULT NULL COMMENT 'md5加密的',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `user_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `user_img` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `user_token` varchar(111) DEFAULT NULL COMMENT '用户登录token',
  `user_time` datetime NOT NULL COMMENT '注册时间',
  `user_update_time` datetime DEFAULT NULL COMMENT '用户最后修改的时间',
  `user_type` int(1) DEFAULT '1' COMMENT '用户状态（1：正常，2：锁定）',
  `user_recommend_code` varchar(10) DEFAULT NULL COMMENT '推荐码',
  `user_recommend_person` varchar(10) DEFAULT NULL COMMENT '我的推荐人的推荐码(就是推荐我的那个人)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

DROP TABLE IF EXISTS `kit_user_login_setting`;
CREATE TABLE `kit_user_login_setting` (
  `uls_id` int(1) NOT NULL COMMENT '唯一id',
  `uls_type` int(2) NOT NULL COMMENT '登录方式（1：账号+密码，2：手机号码+密码，3：邮箱+密码，4：手机号码+验证码）',
  `uls_is_weixin` int(1) NOT NULL DEFAULT '2' COMMENT '是否开启微信登录，开启后需要设置微信登录的信息（1：开启，2：登录）',
  `uls_is_qq` int(1) NOT NULL DEFAULT '2' COMMENT '是否开启QQ登录，开启后需要设置QQ登录的信息（1：开启，2：登录）',
  `uls_is_weibo` int(1) NOT NULL DEFAULT '2' COMMENT '是否开启微博登录，开启后需要设置微博登录的信息（1：开启，2：登录）',
  `uls_is_register` int(1) NOT NULL DEFAULT '1' COMMENT '是否允许注册（1：允许，2：不允许）',
  `uls_login_is_registration` int(1) NOT NULL DEFAULT '2' COMMENT '是否开启登录就是注册（1：可以，2：不开启）',
  PRIMARY KEY (`uls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `kit_web_setting`;
CREATE TABLE `kit_web_setting` (
  `kit_web_id` int(11) NOT NULL AUTO_INCREMENT,
  `kit_web_name` varchar(50) NOT NULL COMMENT '网站名称',
  `kit_web_message` int(1) DEFAULT NULL COMMENT '短信设置（1：阿里大鱼，2：云之讯）',
  `kit_web_push` int(1) DEFAULT NULL COMMENT '推送设置（1：极光，2：云之讯）',
  `kit_web_file` int(1) DEFAULT NULL COMMENT '文件存储（1：本地，2：七牛云）',
  `kit_sige_size` int(1) DEFAULT NULL COMMENT '验证码位数',
  `kit_web_hellow_adv_size` int(2) DEFAULT NULL COMMENT '首次登录欢迎界面的显示个数（0-10之间）',
  `kit_sign_active_time` int(2) DEFAULT NULL COMMENT '验证码有效时间（单位分钟）',
  PRIMARY KEY (`kit_web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目配置表，有且仅有一条数据，不要删除';

insert into kit_admin values (1,'admin','123456','管理员','uplodefiles/touxiang.jpg','1'),(2,'ben12','123456','ben12','uplodefiles/touxiang.jpg','1');




