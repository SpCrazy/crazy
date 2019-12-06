/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.27-0ubuntu0.16.04.1 : Database - xiaomi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaomi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiaomi`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add address',7,'add_address'),
(20,'Can change address',7,'change_address'),
(21,'Can delete address',7,'delete_address'),
(22,'Can add 用户模型',8,'add_xiaomiuser'),
(23,'Can change 用户模型',8,'change_xiaomiuser'),
(24,'Can delete 用户模型',8,'delete_xiaomiuser'),
(25,'Can add cart',9,'add_cart'),
(26,'Can change cart',9,'change_cart'),
(27,'Can delete cart',9,'delete_cart'),
(28,'Can add advertisement',10,'add_advertisement'),
(29,'Can change advertisement',10,'change_advertisement'),
(30,'Can delete advertisement',10,'delete_advertisement'),
(31,'Can add 商品模型',11,'add_goods'),
(32,'Can change 商品模型',11,'change_goods'),
(33,'Can delete 商品模型',11,'delete_goods'),
(34,'Can add home furnishing',12,'add_homefurnishing'),
(35,'Can change home furnishing',12,'change_homefurnishing'),
(36,'Can delete home furnishing',12,'delete_homefurnishing'),
(37,'Can add new goods',13,'add_newgoods'),
(38,'Can change new goods',13,'change_newgoods'),
(39,'Can delete new goods',13,'delete_newgoods'),
(40,'Can add notebook computer',14,'add_notebookcomputer'),
(41,'Can change notebook computer',14,'change_notebookcomputer'),
(42,'Can delete notebook computer',14,'delete_notebookcomputer'),
(43,'Can add phone',15,'add_phone'),
(44,'Can change phone',15,'change_phone'),
(45,'Can delete phone',15,'delete_phone'),
(46,'Can add product type',16,'add_producttype'),
(47,'Can change product type',16,'change_producttype'),
(48,'Can delete product type',16,'delete_producttype'),
(49,'Can add show',17,'add_show'),
(50,'Can change show',17,'change_show'),
(51,'Can delete show',17,'delete_show'),
(52,'Can add show down',18,'add_showdown'),
(53,'Can change show down',18,'change_showdown'),
(54,'Can delete show down',18,'delete_showdown'),
(55,'Can add user evaluate',19,'add_userevaluate'),
(56,'Can change user evaluate',19,'change_userevaluate'),
(57,'Can delete user evaluate',19,'delete_userevaluate'),
(58,'Can add watch tv',20,'add_watchtv'),
(59,'Can change watch tv',20,'change_watchtv'),
(60,'Can delete watch tv',20,'delete_watchtv'),
(61,'Can add wheel',21,'add_wheel'),
(62,'Can change wheel',21,'change_wheel'),
(63,'Can delete wheel',21,'delete_wheel'),
(64,'Can add show left',22,'add_showleft'),
(65,'Can change show left',22,'change_showleft'),
(66,'Can delete show left',22,'delete_showleft'),
(67,'Can add new model',23,'add_newmodel'),
(68,'Can change new model',23,'change_newmodel'),
(69,'Can delete new model',23,'delete_newmodel'),
(70,'Can add order',24,'add_order'),
(71,'Can change order',24,'change_order'),
(72,'Can delete order',24,'delete_order'),
(73,'Can add order detail',25,'add_orderdetail'),
(74,'Can change order detail',25,'change_orderdetail'),
(75,'Can delete order detail',25,'delete_orderdetail');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(9,'carts','cart'),
(5,'contenttypes','contenttype'),
(10,'goods','advertisement'),
(11,'goods','goods'),
(12,'goods','homefurnishing'),
(13,'goods','newgoods'),
(23,'goods','newmodel'),
(14,'goods','notebookcomputer'),
(15,'goods','phone'),
(16,'goods','producttype'),
(17,'goods','show'),
(18,'goods','showdown'),
(22,'goods','showleft'),
(19,'goods','userevaluate'),
(20,'goods','watchtv'),
(21,'goods','wheel'),
(24,'orders','order'),
(25,'orders','orderdetail'),
(6,'sessions','session'),
(7,'user','address'),
(8,'user','xiaomiuser');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2019-08-22 12:32:33.831298'),
(2,'auth','0001_initial','2019-08-22 12:32:34.148080'),
(3,'admin','0001_initial','2019-08-22 12:32:34.225118'),
(4,'admin','0002_logentry_remove_auto_add','2019-08-22 12:32:34.233280'),
(5,'contenttypes','0002_remove_content_type_name','2019-08-22 12:32:34.283177'),
(6,'auth','0002_alter_permission_name_max_length','2019-08-22 12:32:34.313088'),
(7,'auth','0003_alter_user_email_max_length','2019-08-22 12:32:34.343007'),
(8,'auth','0004_alter_user_username_opts','2019-08-22 12:32:34.351633'),
(9,'auth','0005_alter_user_last_login_null','2019-08-22 12:32:34.378344'),
(10,'auth','0006_require_contenttypes_0002','2019-08-22 12:32:34.379790'),
(11,'auth','0007_alter_validators_add_error_messages','2019-08-22 12:32:34.389842'),
(12,'auth','0008_alter_user_username_max_length','2019-08-22 12:32:34.419387'),
(13,'auth','0009_alter_user_last_name_max_length','2019-08-22 12:32:34.451517'),
(14,'user','0001_initial','2019-08-22 12:32:34.566162'),
(15,'goods','0001_initial','2019-08-22 12:32:34.766603'),
(16,'carts','0001_initial','2019-08-22 12:32:34.851386'),
(17,'goods','0002_showleft','2019-08-22 12:32:34.867031'),
(18,'goods','0003_newmodel','2019-08-22 12:32:34.887123'),
(19,'goods','0004_newmodel_goods_del_price','2019-08-22 12:32:34.909410'),
(20,'orders','0001_initial','2019-08-22 12:32:35.050097'),
(21,'sessions','0001_initial','2019-08-22 12:32:35.075670');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

/*Table structure for table `show_down` */

DROP TABLE IF EXISTS `show_down`;

CREATE TABLE `show_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(20) NOT NULL,
  `goods_src` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

/*Data for the table `show_down` */

insert  into `show_down`(`id`,`parent_id`,`child_id`,`goods_id`,`goods_name`,`goods_src`) values 
(1,871,111114,10085,'平衡车','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/223f9f2c0f9765851adff89e43db65f0.jpg?thumb=1&w=120&h=120'),
(2,871,111114,10003,'平衡轮','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0c65d472682f0679e192dc7b4cd6e64c.jpg?thumb=1&w=120&h=120'),
(3,871,111114,8107,'滑板车','https://i8.mifile.cn/b2c-mimall-media/13434bffc3b94eccc70f29ac2ede378a!120x120.jpg'),
(4,871,111114,8104,'智能后视镜','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/60fe0fc83123c81d4e121782939216b9.jpg?thumb=1&w=120&h=120'),
(5,871,111114,8871,'智能记录仪','https://i8.mifile.cn/b2c-mimall-media/50658c6368c4638b15eb692a9c2e31e5!120x120.jpg'),
(6,871,111114,7627,'车载逆变器','https://i8.mifile.cn/b2c-mimall-media/61472c3fcd181959055551e5c73aafec!120x120.jpg'),
(7,871,111114,4942,'车载空气净化器','https://i8.mifile.cn/b2c-mimall-media/ce8b3a94134ddf69f89fb4fe7ed72e96!120x120.jpg'),
(8,871,111114,9550,'对讲机','https://i8.mifile.cn/b2c-mimall-media/05c5b22c8ae030b6c5de7d36114a32e4!120x120.jpg'),
(9,871,111114,9613,'充气宝','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0294e2f3997bf0cffb7bf48361d03588.jpg?thumb=1&w=120&h=120'),
(10,871,111114,9357,'车充','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a45463351a35af1407381a173b3c9ef9.jpg?thumb=1&w=120&h=120'),
(11,871,111114,9958,'停车牌','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9aedddac324d567acac7640341b180cc.jpg?thumb=1&w=120&h=120'),
(12,871,111114,10491,'儿童自行车','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7aec6695b8d36a0185789f7843ab3855.jpg?thumb=1&w=120&h=120'),
(13,871,111114,9029,'折叠婴儿推车','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/18a82e7cda6ecbc22ecee7ac927d6ff9.jpg?thumb=1&w=120&h=120'),
(14,1062,111115,9828,'小爱老师','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f7627c0014e279da55829cee0b51672c.png?thumb=1&w=120&h=120'),
(15,1062,111115,9957,'文具','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7adf827a4b9ca21b25b5959587b58dbe.jpg?thumb=1&w=120&h=120'),
(16,1062,111115,9836,'签字笔','https://i8.mifile.cn/v1/a1/6819bd3b-561c-123b-94e8-d7f1e5b24063!120x120.jpg'),
(17,1062,111115,4682,'贴纸','https://i8.mifile.cn/b2c-mimall-media/33c52f25da37d7bbd736d018b2bdde8a!120x120.jpg'),
(18,1062,111115,10490,'小米简约记事本','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8a207fb82a5069cdbbb6f019532f5d6e.png?thumb=1&w=120&h=120'),
(19,1062,111115,9124,'红包','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/d93858a742255b46616b80def3869863.jpg?thumb=1&w=120&h=120'),
(20,1047,111116,9860,'烟灶','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/027d129974f4d457e2021cce597feca4.png?thumb=1&w=120&h=120'),
(21,1047,111116,10330,'微波炉','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3b6a47f33993a59ff3a5c1112d484eed.jpg?thumb=1&w=120&h=120'),
(22,1047,111116,9866,'电烤箱','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1612c93ad4756215774a0dbec7a81bb2.jpg?thumb=1&w=120&h=120'),
(23,1047,111116,9408,'料理机','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/634566706d943d710f61debe31ea566b.jpg?thumb=1&w=120&h=120'),
(24,1047,111116,9990,'电饭煲','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/a9370fface3457e13c0db169f650fa05.png?thumb=1&w=120&h=120'),
(25,1047,111116,9270,'电压力锅','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/20defc7ef6c006df51e24ebd792463af.jpg?thumb=1&w=120&h=120'),
(26,1047,111116,10012,'电磁炉','https://i8.mifile.cn/b2c-mimall-media/7382a91d1f2611ce859bd6fd8578c994!120x120.jpg'),
(27,1047,111116,7530,'锅具','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/91b546daa8c9797bb2602c236178c852.jpg?thumb=1&w=120&h=120'),
(28,1047,111116,8324,'滤水壶','https://i8.mifile.cn/b2c-mimall-media/7f7cbcf34813b2317a9f207db024bd35!120x120.jpg'),
(29,1047,111116,3556,'水壶','https://i8.mifile.cn/v1/a1/91cd8c44-11ca-79bd-429f-de882bdeaf3b!120x120.png'),
(30,1047,111116,9529,'电煮壶','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2d33bd50cfea382c8b69ff64e2bc2e2a.jpg?thumb=1&w=120&h=120'),
(31,1047,111116,2387,'水质检测笔','https://i8.mifile.cn/b2c-mimall-media/d4f4540e0c172e629e74474ce6a19c14!120x120.jpg'),
(32,1047,111116,9991,'冰格','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c7380c3c73e87135e795686f8d2e02ff.png?thumb=1&w=120&h=120'),
(33,1047,111116,8016,'净水器滤芯','https://i8.mifile.cn/b2c-mimall-media/d8c9f2fc405ad796c8c987bec0a107da!120x120.jpg'),
(34,1081,111119,10000160,'床','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2ef50a941e56f39ca665945b08a3a41a.jpg?thumb=1&w=120&h=120'),
(35,1081,111119,5729,'床垫','https://i8.mifile.cn/b2c-mimall-media/1454d4d897d954649c051d6628021455!120x120.png'),
(36,1081,111119,7721,'针织件套','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/47940b96cc8e9e385d4f178c8b4249c9.png?thumb=1&w=120&h=120'),
(37,1081,111119,4375,'枕头','https://i8.mifile.cn/b2c-mimall-media/1c27d0d59d56aa38b8518cbf302de0cf!120x120.png'),
(38,1081,111119,6376,'沙发','https://i8.mifile.cn/b2c-mimall-media/a64248bdf432d800166d6e7903f24bcd!120x120.png'),
(40,653,111111,10000163,'小米CC9','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ab6ac57a93749f70bb02023acb8e352c.png?thumb=1&w=120&h=120'),
(41,653,111111,10000164,'小米CC9e','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/23a98a5cf30d9077b3a143344615d6a3.png?thumb=1&w=120&h=120'),
(42,653,111111,10140,'小米CC9 美图版','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1fb429ab16761bf999742d2b0fc302c9.png?thumb=1&w=120&h=120'),
(43,653,111111,10000151,'Redmi K20 Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f189a085784ca8b7f04212ca1bba5b72.png?thumb=1&w=120&h=120'),
(44,653,111111,10000150,'Redmi K20','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/728ffa7ec37de1e6a4badac29fdf3a0f.png?thumb=1&w=120&h=120'),
(45,653,111111,10000152,'Redmi 7A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/20838b39f8bc6bab9eabb519d50cf2dd.png?thumb=1&w=120&h=120'),
(46,653,111111,10000134,'小米9','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/80db44cd6d4334a845b1e2e8335f060b.png?thumb=1&w=120&h=120'),
(47,653,111111,10000135,'小米9 SE','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a1948c1bea112bee09a4a9b2f6bfcbad.png?thumb=1&w=120&h=120'),
(48,653,111111,9455,'Redmi Note 7 Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4ce436f7215e54bff6d8e34b02c6b124.png?thumb=1&w=120&h=120'),
(49,653,111111,10000138,'Redmi 7','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a1e18de387715d69a249f6cb8776b06f.png?thumb=1&w=120&h=120'),
(50,653,111111,10000175,'黑鲨游戏手机2 Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/62081e325114081e9ec7f10a2e58bc35.png?thumb=1&w=120&h=120'),
(51,653,111111,10000139,'黑鲨游戏手机 2','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/96b660666abfc5b37cdea075e63e3ce6.jpg?thumb=1&w=120&h=120'),
(52,653,111112,9668,'全面屏电视E55A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8918bab2e5fbdb1ebe79595ce6716a63.jpg?thumb=1&w=120&h=120'),
(53,653,111112,9689,'壁画电视65英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/43fa2a34581695ada4775976e8c2ca81.jpg?thumb=1&w=120&h=120'),
(54,653,111112,9666,'电视4X65英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/549e083e296bde93f6c15d00f9be8968.jpg?thumb=1&w=120&h=120'),
(55,653,111112,9665,'立式空调C1','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7bdf9ac76bed032d94a638e88aa8aa0d.png?thumb=1&w=120&h=120'),
(56,653,111112,9558,'空调C1（一级能效）','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8ce424d6fe93dfb74733b5838140b7ee.jpg?thumb=1&w=120&h=120'),
(57,653,111112,9960,'洗烘一体机1A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3cf4b7d54b43848dcb5e6aa5590e91ac.jpg?thumb=1&w=120&h=120'),
(58,653,111113,2191700022,'游戏本512GB','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/bb90e130ecf2248e6dcbd239b72696e9.jpg?thumb=1&w=120&h=120'),
(59,653,111113,2191200002,'Air 12.5\" 2019款','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b7de0f5e0d32638ff7524660de209e5b.jpg?thumb=1&w=120&h=120'),
(60,653,111113,2191300015,'笔记本15.6\" 独显','https://i8.mifile.cn/b2c-mimall-media/5c14cc0183352b8d6f4751a84016756c!120x120.png'),
(61,463,111126,10418,'移动电源','https://i8.mifile.cn/v1/a1/3563cadb-795d-2240-c83d-9aeedd67ff4e!120x120.jpg'),
(62,463,111126,2804,'电池','https://i1.mifile.cn/v1/a1/T13LVjBTdT1R4cSCrK!120x120.png'),
(63,463,111126,6271,'随身手电','https://i8.mifile.cn/b2c-mimall-media/79de341c267f445286a356c6e898ea8c!120x120.jpg'),
(64,463,111127,7805,'插线板 含USB','https://i8.mifile.cn/b2c-mimall-media/2f68168635f76716669e70d3b0299b3d!120x120.jpg'),
(65,463,111127,7594,'插线板','https://i8.mifile.cn/b2c-mimall-media/319cc63ce3fdcd15d0c6ca77c30de4b1!120x120.png'),
(66,463,111127,8310,'转换器','https://i8.mifile.cn/b2c-mimall-media/c67b564ee596efda00bfc5ff5b282ad6!120x120.jpg'),
(67,463,111128,9357,'车充','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a45463351a35af1407381a173b3c9ef9.jpg?thumb=1&w=120&h=120'),
(68,463,111128,9893,'充电器','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/77ecb9dc8f01728fca6450f9331b3357.jpg?thumb=1&w=120&h=120'),
(69,459,111120,2191200001,'小米Air 12.5\"','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9da19c26b55c0c22fea23c3b8a31dc28.jpg?thumb=1&w=120&h=120'),
(70,459,111120,2181300023,'小米Air 13.3\"','https://i8.mifile.cn/b2c-mimall-media/3385f8309f3e90669d7ea94ad7d3bab4!120x120.jpg'),
(71,459,111120,2191200012,'笔记本 15.6\" 独显','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cd2aa2dcad6440b469c22e27db9b6236.jpg?thumb=1&w=120&h=120'),
(72,459,111120,2192000005,'RedmiBook 14','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/680bb5c805d29e9ef2f968866124c288.png?thumb=1&w=120&h=120'),
(73,459,111120,2191200013,'笔记本15.6\" 集显','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2336dfe3fa9f1b1deb228745a6ac1fab.jpg?thumb=1&w=120&h=120'),
(74,459,111120,10000144,'小米Pro 15.6\"','https://i8.mifile.cn/b2c-mimall-media/0643559b70964014c1d672cc783121d2!120x120.jpg'),
(75,459,111120,2183100036,'小米Pro 15.6\" GTX','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/0643559b70964014c1d672cc783121d2.jpg?thumb=1&w=120&h=120'),
(76,459,111120,10000113,'小米游戏本','https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13!120x120.jpg'),
(77,459,111120,10000108,'小米平板','https://i8.mifile.cn/b2c-mimall-media/2e24730eb6fb2963b9b59493a6e5a0c7!120x120.jpg'),
(78,459,111121,4679,'鼠标/鼠标垫','https://i8.mifile.cn/v1/a1/2ca61893-68b9-d0a0-5f85-bdc28e655a3e!120x120.jpg'),
(79,459,111121,10018,'机械键盘','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/12925f99d858e3155c4bb3ecd1f37ae7.png?thumb=1&w=120&h=120'),
(80,459,111121,8133,'游戏键盘','https://i8.mifile.cn/b2c-mimall-media/15f82d6626ecb578615a1ae3ec3233f7!120x120.jpg'),
(81,459,111121,8125,'游戏鼠标','https://i8.mifile.cn/b2c-mimall-media/62436f0277f807c9b15062a8fbe1f432!120x120.jpg'),
(82,459,111121,8102,'转接线/电源','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/08cdff9da904a7846813b004bccd6ccd.png?thumb=1&w=120&h=120'),
(83,459,111121,7899,'笔记本双肩包','https://i8.mifile.cn/b2c-mimall-media/970fb11e09beebe33e4c555b1b1d8bed!120x120.jpg'),
(84,459,111121,8132,'适配器','https://i8.mifile.cn/b2c-mimall-media/30ecdbcb5d6f0dce50bfaea4a5c21020!120x120.jpg'),
(85,459,111121,4581,'笔记本贴纸','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f1c1de7b5371f1f19b6fd7121d0c6e1d.png?thumb=1&w=120&h=120'),
(86,458,111122,6222,'32-40英寸','https://i8.mifile.cn/b2c-mimall-media/033cfa4ab48b9d776dcb69e730022561!120x120.png'),
(87,458,111122,8912,'43英寸','https://i8.mifile.cn/b2c-mimall-media/e84d9b98b558bb57632be6dc794455e7!120x120.png'),
(88,458,111122,7795,'49-50英寸','https://i8.mifile.cn/b2c-mimall-media/54fc8e14d50a2abde556a30b74c41a99!120x120.jpg'),
(89,458,111122,9668,'55-58英寸','https://i8.mifile.cn/b2c-mimall-media/90553f751c9eb6bda9a2ae7c4bce012b!120x120.jpg'),
(90,458,111122,5353,'65-75英寸','https://i8.mifile.cn/b2c-mimall-media/bf2dc71cbf6fa8413b7ade09719155a0!120x120.jpg'),
(91,458,111122,9240,'激光投影电视','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/1fcf86a09e362a6a7bc3ded8f9124749.jpg?thumb=1&w=120&h=120'),
(92,458,111123,7599,'盒子4','https://i8.mifile.cn/b2c-mimall-media/6f2896bb755fc5bc90c6d5db716660eb!120x120.jpg'),
(93,458,111123,7598,'盒子4c','https://i8.mifile.cn/b2c-mimall-media/18c9cf8de4d55c5d41fe63028b92f4b2!120x120.jpg'),
(94,458,111123,9233,'盒子4 SE套装版','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/91a6128c0265f662069041083d6559bf.jpg?thumb=1&w=120&h=120'),
(95,458,111123,5990,'盒子3增强版','https://i8.mifile.cn/v1/a1/T16AhgBCVv1RXrhCrK!120x120.jpg'),
(96,458,111124,7808,'小米电视音响','https://i8.mifile.cn/b2c-mimall-media/665274982e2ce86c3fce921127e9dccd!120x120.jpg'),
(97,458,111125,2164900001,'会员卡','https://i8.mifile.cn/b2c-mimall-media/114ee8a84c2080d15a167d1d23f5cf62!120x120.png'),
(98,458,111125,8581,'遥控器','https://i8.mifile.cn/v1/a1/T1gox_BsWT1RXrhCrK!120x120.jpg'),
(99,458,111125,5770,'线材转接器','https://i8.mifile.cn/v1/a1/bc66bce5-6674-2d6f-25b6-0167bbb6affa!120x120.jpg'),
(100,458,111125,4587,'麦克风','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/161b5d9d91ffbb0a47681b36d7ea6e17.png?thumb=1&w=120&h=120'),
(101,874,111117,9997,'手环','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2ed49efd47937690ceec6330ffe9f764.png?thumb=1&w=120&h=120'),
(102,874,111117,10327,'智能手表','https://i8.mifile.cn/b2c-mimall-media/d15b7dc7adbf00177677b22166e66a55!120x120.png'),
(103,874,111117,9871,'VR','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/20dd3bca5a12f85a6b51877926074768.jpg?thumb=1&w=120&h=120'),
(104,874,111118,6526,'照相机','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/1099b7c4bf8ec9650130ac7b801556fd.jpg?thumb=1&w=120&h=120'),
(105,874,111118,9662,'走步机','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a44765d365daa289e7d3d71dd935a381.jpg?thumb=1&w=120&h=120'),
(106,874,111118,9929,'智能积木','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/86e33637fdf94e1eaf3fdfcd86280912.jpg?thumb=1&w=120&h=120'),
(107,874,111118,8790,'小爱智能闹钟','https://i8.mifile.cn/b2c-mimall-media/b9ed4f0f0bc26f45ddc1b72f7fede673!120x120.jpg'),
(108,874,111118,9107,'照片打印机','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/906df61431e627a11c1e784256863cab.jpg?thumb=1&w=120&h=120');

/*Table structure for table `show_left` */

DROP TABLE IF EXISTS `show_left`;

CREATE TABLE `show_left` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `show_left` */

insert  into `show_left`(`id`,`type_id`,`type_name`) values 
(1,653,'新品'),
(2,871,'出行车载'),
(3,1062,'办公用品'),
(4,1047,'厨电'),
(5,874,'穿戴酷玩'),
(6,1081,'床品家具'),
(7,459,'电脑'),
(8,458,'电视'),
(9,463,'电源插座');

/*Table structure for table `xiaomi_address` */

DROP TABLE IF EXISTS `xiaomi_address`;

CREATE TABLE `xiaomi_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) DEFAULT NULL,
  `u_phone` varchar(20) NOT NULL,
  `u_other_phone` varchar(20) DEFAULT NULL,
  `u_address` varchar(50) NOT NULL,
  `u_other_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_address` */

/*Table structure for table `xiaomi_address_xiaomiuser` */

DROP TABLE IF EXISTS `xiaomi_address_xiaomiuser`;

CREATE TABLE `xiaomi_address_xiaomiuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `xiaomiuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xiaomi_address_xiaomiuser_address_id_xiaomiuser_id_354d2cd9_uniq` (`address_id`,`xiaomiuser_id`),
  KEY `xiaomi_address_xiaom_xiaomiuser_id_0b4830b4_fk_xiaomi_us` (`xiaomiuser_id`),
  CONSTRAINT `xiaomi_address_xiaom_address_id_7fa4a266_fk_xiaomi_ad` FOREIGN KEY (`address_id`) REFERENCES `xiaomi_address` (`id`),
  CONSTRAINT `xiaomi_address_xiaom_xiaomiuser_id_0b4830b4_fk_xiaomi_us` FOREIGN KEY (`xiaomiuser_id`) REFERENCES `xiaomi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_address_xiaomiuser` */

/*Table structure for table `xiaomi_advertisement` */

DROP TABLE IF EXISTS `xiaomi_advertisement`;

CREATE TABLE `xiaomi_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_advertisement` */

insert  into `xiaomi_advertisement`(`id`,`img_src`) values 
(1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b230ae9b4bdd0ba08cd93fc1b7173dfa.jpg?f=webp&w=537&h=762&bg=EEEEF0'),
(2,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e656f76da8708ef8f5c363e2f86021c4.jpg?f=webp&w=537&h=378&bg=F4FCFF'),
(3,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8a3dbb4f5c599aa2dbb6de27436cde6f.jpg?f=webp&w=537&h=378&bg=EDFBFC'),
(4,'https://i8.mifile.cn/v1/a1/139eeb1a-95ac-d278-4b1e-e2fb05798908.webp'),
(5,'https://i8.mifile.cn/v1/a1/1074a94c-0594-5ddd-7e53-2667d27e8e36.webp');

/*Table structure for table `xiaomi_cart` */

DROP TABLE IF EXISTS `xiaomi_cart`;

CREATE TABLE `xiaomi_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_goods_num` int(11) NOT NULL,
  `c_is_selected` tinyint(1) NOT NULL,
  `c_goods_id` int(11) NOT NULL,
  `c_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xiaomi_cart_c_goods_id_b670a040_fk_xiaomi_goods_id` (`c_goods_id`),
  KEY `xiaomi_cart_c_user_id_723e122c_fk_xiaomi_user_id` (`c_user_id`),
  CONSTRAINT `xiaomi_cart_c_goods_id_b670a040_fk_xiaomi_goods_id` FOREIGN KEY (`c_goods_id`) REFERENCES `xiaomi_goods` (`id`),
  CONSTRAINT `xiaomi_cart_c_user_id_723e122c_fk_xiaomi_user_id` FOREIGN KEY (`c_user_id`) REFERENCES `xiaomi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_cart` */

/*Table structure for table `xiaomi_goods` */

DROP TABLE IF EXISTS `xiaomi_goods`;

CREATE TABLE `xiaomi_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` longtext,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  `goods_img_info` text,
  `goods_yellow_discount` varchar(100) DEFAULT NULL,
  `goods_black_discount` varchar(100) DEFAULT NULL,
  `goods_info_img_src` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_goods` */

insert  into `xiaomi_goods`(`id`,`img_src`,`goods_id`,`goods_name`,`goods_price`,`goods_del_price`,`goods_img_info`,`goods_yellow_discount`,`goods_black_discount`,`goods_info_img_src`) values 
(1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ce8ea1c32fd8fc7deb69f8960d9b7af0.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ad321f3bff83c5f960115743b66ef083.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ff9b8bbd8b3d7a947728bf60539ba967.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f92c338b3103abfdf7605c813badd558.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5cd85e32891a00234dc8df3a5001b80b.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b8eee98cc8b18ecea5b7849a56a621f3.jpg#',10000152,'Redmi 7A',599,799,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙SDM439八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!高清拍摄!1300万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!中小屏!5.45英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!1440×720#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!流畅!3GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!32GB#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「3GB+32GB，直降200，到手价599元」','骁龙8核高性能处理器，最高主频2.0GHz / 4000mAh超长续航，标配10W充电器 / 大字体，大音量，无线收音机 / AI人脸解锁 / 整机生活防泼溅 / 极简模式，亲情守护','https://i8.mifile.cn/v1/a1/4869da8f-a18e-6714-6964-c9788b0fb03f.webp?w=1080&h=675&bg=D2DFF3#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/eec2e38c06ca4747e5640a4d21332b6b.jpg?w=1080&h=1295&bg=A0ABC1#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/bf8e8e88b858d3ff49436538987d4801.jpg?w=1080&h=976&bg=7990AF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4ab1fa03f3eccd7a94c85838b37ea19d.jpg?w=1080&h=864&bg=5A697B#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/546795e0c2f27dc9c1ab747ebd421a9a.jpg?w=1080&h=998&bg=192127#https://i8.mifile.cn/v1/a1/0eee651a-a208-d286-2c1d-8e241254fbb8.webp?w=1080&h=706&bg=2F3948#https://i8.mifile.cn/v1/a1/25ba5ed9-1275-1f6a-1469-a2670d7ee62e.webp?w=1080&h=1375&bg=D1CFCC#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/19e8e24c4b1b5b65ebb18056f4d4b774.jpg?w=1080&h=1234&bg=BEB8C7#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c965d19e02c5d73f171d9df72ae8e963.jpg?w=1080&h=1625&bg=D0C9D0#https://i8.mifile.cn/v1/a1/c9ff4805-8ee5-f377-8fb6-802787ce87b5.webp?w=1080&h=1366&bg=A4B9C0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f4b78bb87aab6fcc9ee522eafb7cd94c.jpg?w=1080&h=1243&bg=E0E2E5#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d5c84ef864bb47726e17d9f72e829e2a.jpg?w=1080&h=1244&bg=AEADB4#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/656adac28e49bd07c11556593907b95b.jpg?w=1080&h=572&bg=D9DAEF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fe973f1cf4cd9169a5155bf0c58d9dfd.jpg?w=1080&h=931&bg=C9C1D1#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/35a5d9d4a7c60d9ea0b1091fa1fc9a25.jpg?w=1080&h=1128&bg=DADADC#https://i8.mifile.cn/v1/a1/20ea1e2b-1065-a086-9689-cae886479d6f.webp?w=1080&h=1061&bg=D9DBE0#https://i8.mifile.cn/v1/a1/231d0723-e15c-c4fa-c5f7-f6bc6ad95f20.webp?w=1080&h=528&bg=F1F1F1#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1a6f851cfbbab4479d0f596e012212b1.jpg?w=1080&h=671&bg=CBE0EC#https://i8.mifile.cn/v1/a1/53cd54dd-80ba-85dd-cd6a-b837a750c59a.webp?w=1080&h=1292&bg=E8E9E9#https://i8.mifile.cn/v1/a1/b38459ad-eaa6-5f13-6ed8-d5346b8a9e81.webp?w=1080&h=1260&bg=A1A4A9#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/180be3caabf74cc7ea95a8cc897c0c3e.jpg?w=1080&h=1203&bg=929093#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/de2985b7e150ce2f22c7c7ea3aac40cf.jpg?w=1080&h=1164&bg=B7B6B9#https://i8.mifile.cn/v1/a1/40f54883-cc75-b1b5-a1e3-464201158a6d.webp?w=1080&h=1161&bg=F0F0F7#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4848656ab708d09d8bd89be9c014c77d.jpg?f=webp&w=1080&h=1537&bg=FFFFFF#https://i8.mifile.cn/v1/a1/80019869-a0c4-87aa-0577-44f7f43f432e.webp?w=1080&h=992&bg=F4F4F4#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c07771b1e9bdc6bb66504bfd24e2a746.jpg?w=1080&h=1130&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(2,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/28f066964fc36f1715066cbdaf64b540.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6dbdf0739db8c40e7289032f797055de.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a7b58bb7f08303bf61e36c0ca5528a9.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fa3c266a042babb724c297053e9c2876.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/84b810561a16eddc32e244c9fc7f8f04.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/79fdfe982d58b1fc5eca9edca81c658a.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5ec72c5415dcb464b4ba397623c62284.jpg#',10000163,'小米CC9',1799,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png#CPU#骁龙710#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png#三摄像头#4800万+800万+200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa','「816狂欢，6GB+64GB领券减100元，到手价1699，499元星芒奢华水晶壳套餐加价只需299元，再赠贴膜+保护壳，享花呗6期免息」','前置3200万自拍 / 索尼4800万超广角三摄 / 多色炫彩轻薄机身 / 6.39英寸三星 AMOLED水滴屏 /4030mAh大电量 / 骁龙710处理器 / 屏幕指纹 / NFC功能 / 红外遥','https://i8.mifile.cn/v1/a1/5b898b24-4dbc-b14e-cb85-3a547f748c00.webp?w=1080&h=962&bg=C8D5DD#https://i8.mifile.cn/v1/a1/214bcd98-c263-b0f0-6740-22a1fb5e5c78.webp?w=1080&h=962&bg=CCD6DE#https://i8.mifile.cn/v1/a1/833125bf-48cc-9aa9-cbf1-280b275135a1.webp?w=1079&h=930&bg=AD9D9A#https://i8.mifile.cn/v1/a1/674164df-89ca-6a3e-bdba-eeac874cb025.webp?w=1079&h=896&bg=9D9EAA#https://i8.mifile.cn/v1/a1/3da61b94-12af-aadf-dc3d-966d71a83cdf.webp?w=1080&h=619&bg=A3C2F5#https://i8.mifile.cn/v1/a1/556a72ec-7492-0c01-9af6-cc6e4dc7f26d.webp?w=1080&h=173&bg=E3E6F5#https://i8.mifile.cn/v1/a1/e965dbf9-0168-6ab2-0535-0d315efa6f61.webp?w=1080&h=853&bg=E5ECEF#https://i8.mifile.cn/v1/a1/8ed11214-a3cb-41fa-3616-e8d81a110206.webp?w=1080&h=1060&bg=DED3D3#https://i8.mifile.cn/v1/a1/d1f10d01-11f4-4841-6bf1-817c8347c293.webp?w=1080&h=967&bg=292527#https://i8.mifile.cn/v1/a1/e3cdeb1e-acc6-049f-e922-d675e0ed3735.webp?w=1080&h=957&bg=1F1C1C#https://i8.mifile.cn/v1/a1/476bdcc4-fbb1-954f-a8b9-a10f76f75972.webp?w=1080&h=1181&bg=CCCCD9#https://i8.mifile.cn/v1/a1/020c8bda-1737-f601-8c1e-584fb9789f5b.webp?w=1080&h=566&bg=D7B5DB#https://i8.mifile.cn/v1/a1/4eca1f18-1e50-2e34-7df4-74ba047b34b9.webp?w=1080&h=803&bg=E8D4D6#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/54b098ef1749c79ed9a1b268be97760e.jpg?w=1080&h=1300&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/481fd815bd287bfc79956feac29067ec.jpg?w=1080&h=1337&bg=FFFFFF#https://i8.mifile.cn/v1/a1/6867e6d9-3f15-63fa-26eb-d44ecbcc68ef.webp?w=1080&h=590&bg=EBDBDF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1399e72dd8c0024409fc752ff2077e6a.jpg?w=1080&h=980&bg=FFFFFF#https://i8.mifile.cn/v1/a1/319c2047-a152-3be6-68ea-989234a2d41f.webp?w=1080&h=660&bg=E8DAE1#https://i8.mifile.cn/v1/a1/9a569640-9c24-bbe0-6df4-627c8f1123b6.webp?w=1080&h=779&bg=BFA5AA#https://i8.mifile.cn/v1/a1/38f5ed7a-7a31-6ccf-160c-efe177b052cf.webp?w=1080&h=588&bg=EBD9E2#https://i8.mifile.cn/v1/a1/0e388ba6-fb44-e6c6-dc9e-454a20a16955.webp?w=1080&h=806&bg=4E75C1#https://i8.mifile.cn/v1/a1/63073388-9a5d-2615-57cd-8e2227462502.webp?w=1080&h=696&bg=504147#https://i8.mifile.cn/v1/a1/3dc2de49-ad32-43d1-5778-828bfd023d14.webp?w=1080&h=494&bg=F0EDF4#https://i8.mifile.cn/v1/a1/b856e768-fdbe-792e-9db4-dfd14560f756.webp?w=1080&h=571&bg=9BC6F4#https://i8.mifile.cn/v1/a1/25a5019c-435a-ef85-fc88-4f90a4a45c01.webp?w=1080&h=769&bg=CEC6E1#https://i8.mifile.cn/v1/a1/d42ca032-ac4f-993b-9fc6-ec91b9e1a30f.webp?w=1080&h=1182&bg=9BA5C7#https://i8.mifile.cn/v1/a1/584da938-d17d-417f-0e70-80e4687e8f8b.webp?w=1080&h=1126&bg=727070#https://i8.mifile.cn/v1/a1/54b816cf-edab-1675-e3d9-5da7dca09ad8.webp?w=1080&h=1036&bg=B9CFCF#https://i8.mifile.cn/v1/a1/28714ca5-e8be-87a4-9cdf-5628750d49d0.webp?w=1080&h=1161&bg=A2A7B6#https://i8.mifile.cn/v1/a1/d3388ebd-f04a-78ee-95e0-53ace95282f2.webp?w=1080&h=1107&bg=E2B497#https://i8.mifile.cn/v1/a1/f251fd9e-1238-b69c-514f-fab15c354402.webp?w=1080&h=303&bg=E9E9E9#https://i8.mifile.cn/v1/a1/6b10e2ff-3c5d-1ab4-c843-b8689466b190.webp?w=1080&h=914&bg=E14619#https://i8.mifile.cn/v1/a1/00124dab-1103-4b3d-e10d-d7405bc2476e.webp?w=1080&h=1038&bg=E6ECF0#https://i8.mifile.cn/v1/a1/ccb5702b-132d-3213-8e97-75009c157d9a.webp?w=1080&h=1181&bg=E3E4EB#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a0d3ee9c54916d7bf864c57d53ef2e35.jpg?f=webp&w=1080&h=705&bg=F1EDEE#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(3,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/18f36e9bdb975134202179a1355b4680.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9d333ce64cd8596317682ccf3f696905.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4bc41965e7227da1050f142ebb0be01a.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/753ec2a34e36677d682279e0411838a6.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cce59cb9a7d19f98f087414af1b741dc.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/508b18122d3516ba882186add174316b.jpg#',10000164,'小米CC9e',1299,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙665#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!三摄像头!4800万+800万+200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.088英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!1560×720#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!高速!4GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!64GB#https://i8.mifile.cn/b2c-mimall-media/52ad10a73685342e437e44ea3d29cbff.png!普通厚度!8.475mm#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4030mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「816狂欢，4GB+64GB领券减100元，到手价1199，再赠贴膜+保护壳」','前置3200万自拍 / 索尼4800万超广角三摄 / 4030mAh大电量 / 3D全曲面玻璃机身，浪漫满分的全新配色 / 6.088英寸三星 AMOLED水滴屏 /第七代屏幕指纹 / 首发骁龙665','https://i8.mifile.cn/v1/a1/becd91ae-891f-4d85-c4ec-794ef40f8b18.webp?w=1080&h=471&bg=D4E0EF#https://i8.mifile.cn/v1/a1/2b546fac-7a79-a59e-fbea-03ec67662445.webp?w=1080&h=767&bg=A79CC6#https://i8.mifile.cn/v1/a1/92be8115-6b7e-0cf1-e80c-d75d47f58887.webp?w=1080&h=700&bg=B3CCE0#https://i8.mifile.cn/v1/a1/0c1ef49b-e706-e92f-0fc1-dbde4caae8db.webp?w=1080&h=1047&bg=E1E8F0#https://i8.mifile.cn/v1/a1/903aa0f5-9bb4-e728-86ef-e07389041aff.webp?w=1080&h=664&bg=A25DC0#https://i8.mifile.cn/v1/a1/01ea9459-14d2-7951-2962-c7463e76fd7e.webp?w=1080&h=945&bg=B7A4E5#https://i8.mifile.cn/v1/a1/754e7f48-cee0-f24c-49d6-5ec4bcedd7e7.webp?w=1080&h=1306&bg=978FC2#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/223ab7bf6772557d3473751abeef13a5.jpg?f=webp&w=1080&h=1412&bg=F1EDFC#https://i8.mifile.cn/v1/a1/15344e19-d776-1c15-a2e1-1de57f80a74a.webp?w=1080&h=567&bg=ECECEC#https://i8.mifile.cn/v1/a1/0f01ad15-824b-d2ea-c797-02b84c407851.webp?w=1080&h=879&bg=92ABD5#https://i8.mifile.cn/v1/a1/bb4373ed-6ed8-481e-ce81-04219f03ba62.webp?w=1080&h=568&bg=BF6FBD#https://i8.mifile.cn/v1/a1/0da13f91-8d41-e941-ffa0-41c80a395060.webp?w=1080&h=840&bg=EAEAEA#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/64fe271ac08a8612ac473eedabaaa658.jpg?w=1080&h=1291&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fb9405202f04849849c91a0fbf55c71b.jpg?w=1080&h=1405&bg=FFFFFF#https://i8.mifile.cn/v1/a1/fb220f56-cf39-f1cc-9821-f9358959dff5.webp?w=1080&h=419&bg=EFEFEF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/db3cceb4a511447b68505114ecded337.jpg?w=1080&h=1117&bg=FFFFFF#https://i8.mifile.cn/v1/a1/e6b57a0c-27fc-e4e7-843e-161b40976f52.webp?w=1080&h=719&bg=F0F0F0#https://i8.mifile.cn/v1/a1/245660e8-de78-1c08-cb8d-1fd0f0026653.webp?w=1080&h=751&bg=C0AFB1#https://i8.mifile.cn/v1/a1/1582b0a0-7c63-22bb-62e1-e24c07f365b0.webp?w=1080&h=671&bg=E9E9E9#https://i8.mifile.cn/v1/a1/5fe85d9b-b41f-116a-6a4e-3ced02eb8fd1.webp?w=1080&h=628&bg=9CA19F#https://i8.mifile.cn/v1/a1/42ae0521-5829-4b6e-edf0-0bb0eba3b5ed.webp?w=1080&h=646&bg=6B757C#https://i8.mifile.cn/v1/a1/0fd18dd9-5ba3-b95a-cde6-8fe0c037d39d.webp?w=1080&h=558&bg=EFEFEF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/21f19404a01b87473e1ceb4b25a9a554.jpg?w=1080&h=749&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a83f83a46afadec994af0971ce895d67.jpg?w=1080&h=637&bg=FFFFFF#https://i8.mifile.cn/v1/a1/9969d07c-9f5f-7f2e-3054-59bae169621b.webp?w=1080&h=618&bg=994DB8#https://i8.mifile.cn/v1/a1/e181b812-b26c-1c8c-fca7-53a10c89ab38.webp?w=1080&h=962&bg=D8CFED#https://i8.mifile.cn/v1/a1/c8d390d0-d5f7-53c7-7c16-79303f71be67.webp?w=1080&h=890&bg=8598BB#https://i8.mifile.cn/v1/a1/051b51ba-d86a-0ef9-7ab3-eb6c5cf65d89.webp?w=1080&h=1121&bg=B4CDD4#https://i8.mifile.cn/v1/a1/be86357e-1436-f32f-eb9a-b5315c4f673b.webp?w=1080&h=478&bg=F0F0F0#https://i8.mifile.cn/v1/a1/cfc40ce6-7552-bfa8-0ddd-a92d8ab4ab06.webp?w=1080&h=914&bg=E2461A#https://i8.mifile.cn/v1/a1/e832ef85-c9ee-6cf3-36c7-9866159b3950.webp?w=1080&h=1221&bg=43424B#https://i8.mifile.cn/v1/a1/15af0d03-f997-cbf0-e3ae-05503d1b2058.webp?w=1080&h=844&bg=393840#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f571758587fb3d9cee8230a2c73f017a.jpg?f=webp&w=1080&h=720&bg=E0E0E2#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(4,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/95d859c2a4b373a4e9eec49fd3d0c5eb.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9aea5ce06db2638acaec8d07134839b1.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ce91da98b175d8f83cb0b240c99ee0e1.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3ca6084543ddcfa459103605af38a5f5.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/16406c0d63ff262859ba2cdf7a0048b6.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e83e7ad11dfa765e83133f147c4a9dc3.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/af56929ef5847670968b28d284a1cde7.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7a547a707df21f2641ba8060e6962bde.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e9311e58f885c6598569efadd8fbf15b.jpg#',10140,'小米CC9 8GB+256GB 美图定制版',2599,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙710#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!三摄像头!4800万+800万+200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.39英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!8GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!256GB#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4030mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「816狂欢，499元星芒奢华水晶壳套餐加价只需299元；购机赠129元果冻包+49元柔光灯+壳膜」','100%美图相机，前置3200万，自拍美得更自然 / 索尼4800万超广角三摄，拍风景、建筑、多人合影，画面更震撼 / 美图经典人像，不修图也好看 / AI弱光人像，暗光环境也能拍出水光肌 / 全身美','https://i8.mifile.cn/v1/a1/f3c9803d-1246-d2ba-9ae1-1e7956e88c9f.webp?w=1080&h=560&bg=DAEEEF#https://i8.mifile.cn/v1/a1/62749c83-ae86-12a0-fff9-a9ffcaf119fb.webp?w=1080&h=522&bg=B3A6A1#https://i8.mifile.cn/v1/a1/df1a171e-9aa7-2e91-357a-80a40698c1e0.webp?w=1080&h=1081&bg=D1C5BD#https://i8.mifile.cn/v1/a1/49206ef4-9ea9-844c-9d9f-c0d3255876e2.webp?w=1080&h=775&bg=CBC8CC#https://i8.mifile.cn/v1/a1/c640086e-77f9-655c-786b-d003b7d7f501.webp?w=1080&h=813&bg=3BCCCD#https://i8.mifile.cn/v1/a1/8dc36b70-b9d7-bca5-acba-a2ec0e2b745a.webp?w=1080&h=1392&bg=C2DCDD#https://i8.mifile.cn/v1/a1/5739c35f-e5e6-d6f1-1910-23aa4721982c.webp?w=1080&h=757&bg=E2E6E9#https://i8.mifile.cn/v1/a1/4c11cab3-9b66-e999-fab3-82aa9f2eca7b.webp?w=1080&h=1268&bg=C0AFA4#https://i8.mifile.cn/v1/a1/dbafe94e-2ddb-540b-f9f7-56ebde862faf.webp?w=1080&h=829&bg=131113#https://i8.mifile.cn/v1/a1/dcad0063-7371-2b9b-5cb0-88ecda0788a2.webp?w=1142&h=788&bg=EDEDEE#https://i8.mifile.cn/v1/a1/68fcdb91-4928-ed34-ce54-797c8ab23fa5.webp?w=1080&h=723&bg=EDE3E3#https://i8.mifile.cn/v1/a1/15bd9dcc-b108-2f92-0351-7bdf602054fc.webp?w=1080&h=270&bg=F4FCFC#https://i8.mifile.cn/v1/a1/d2fdd3d8-a088-3827-bb7a-e5b85fca8a8f.webp?w=1080&h=872&bg=3ACCCC#https://i8.mifile.cn/v1/a1/19202567-43b3-7e66-4237-bc795334bcb8.webp?w=1080&h=1204&bg=8FA9A1#https://i8.mifile.cn/v1/a1/45ce37eb-71e7-1fdd-2707-5b2e84d453c0.webp?w=1080&h=866&bg=ECECEC#https://i8.mifile.cn/v1/a1/4c59bd04-2d31-ba11-17d2-99138bfec46d.webp?w=1080&h=900&bg=BFB3A4#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3fc09c216f89ba9e14a975cff7537111.jpg?w=1080&h=1740&bg=FFFFFF#https://i8.mifile.cn/v1/a1/60a48f79-8463-2799-0536-6fadb691a741.webp?w=1080&h=728&bg=CAD6D8#https://i8.mifile.cn/v1/a1/4fcc8840-ffb4-c8bd-9886-5344ad95395c.webp?w=1080&h=1372&bg=B4A69F#https://i8.mifile.cn/v1/a1/f8290673-8619-707a-a652-509f7d84f5e8.webp?w=876&h=1080&bg=F3F3F3#https://i8.mifile.cn/v1/a1/d47787b2-8489-3b14-4b4d-ed8b375aa319.webp?w=1080&h=678&bg=DCECED#https://i8.mifile.cn/v1/a1/b5415832-dfc1-6ce2-179b-e579babbf1c6.webp?w=1080&h=1485&bg=DBBAB2#https://i8.mifile.cn/v1/a1/5f30a164-5412-9b10-859e-d88bb485a75e.webp?w=1080&h=1270&bg=F6F6F6#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9538d4188292e758bf42d9739f14bfab.jpg?f=webp&w=1080&h=720&bg=EFF0F4#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(5,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/56e26d8a4d08ee4710dbd7b892420c85.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2cc38dd9ea850f6ebc034eab38ae5536.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c3009bfc669f90a767244a239c6b3ee8.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/81f902831594dd974e6c0c1497ec9910.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ba995e6bb6fb1000c6efb8cb28d79793.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/36a894d2574e90048dfca62284910518.jpg#',10000175,'黑鲨手机2 Pro',2999,NULL,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙855+#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!双摄像头!4800万+1200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.39英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!12GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!128GB#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待','「816狂欢，新品热卖，8月18日00:00再次开售，可选+100元得游戏手柄，享小米3期免息」','骁龙855 Plus旗舰处理器 / UFS 3.0 高速闪存 / 全系标配12GB大运存 / 液冷3.0+，全域液冷升级 / 电竞级屏幕压感，操作快人一步 / 独显DC调光2.0 护眼全新升级','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e958a149634cc0cf9827b2427fa8f90d.jpg?f=webp&w=1080&h=664&bg=15212F#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/aadc95db9b1d09b2530b2192b4eb5609.jpg?f=webp&w=1080&h=514&bg=2C2132#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/da15d182963515b714f9c32986950bb1.jpg?f=webp&w=1080&h=650&bg=371E31#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6dcf50b1d8c269776e9bd276169fe3b7.jpg?f=webp&w=1080&h=888&bg=60606#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/172224c193668e406b7c85ea8e6412fe.jpg?f=webp&w=1080&h=932&bg=A0A0A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9ff641cd9bf7e4532b4f6902503fd662.jpg?f=webp&w=1080&h=637&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/512061faa9c5e1397a017212b59a86c2.jpg?f=webp&w=1080&h=390&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/bd9a270236517458c7b850b95fc7f0e1.jpg?f=webp&w=1080&h=870&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9077a3febfebf705e1ba114ed4d42dfb.jpg?f=webp&w=1080&h=502&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/34087ba330547db7bf8d45dc40f7452a.jpg?f=webp&w=1080&h=853&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4871ca2f59e2c98bd268939a684eac78.jpg?f=webp&w=1080&h=870&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f401a343b0e3bffbefd64e7205328015.jpg?f=webp&w=1080&h=668&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/59ce8a29a6ba9ec0378a453c0f82ba56.jpg?f=webp&w=1080&h=680&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2eb7e2e74bb67d3d022ffd1886cce465.jpg?f=webp&w=1080&h=960&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/71223919ccbcab5e67268f8911ff3f76.jpg?f=webp&w=1080&h=530&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2c2feda6da382981ec9d0ad808463ccc.jpg?f=webp&w=1080&h=695&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/71e971e2d9a0655afb9574dd3c0c87cb.jpg?f=webp&w=1080&h=767&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/03929ca11e648f577fd1826fc70b8146.jpg?f=webp&w=1080&h=688&bg=A030A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc29064b7d1571ed86b07ba9d8d6c4bd.jpg?f=webp&w=1080&h=849&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b739b67e25fb92137c80e95946fe24f6.jpg?f=webp&w=1080&h=715&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0c8bf9eb468a50371f8e765c6cc364e1.jpg?f=webp&w=1080&h=562&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d5d450821f1022c1be1abba56926bc60.jpg?f=webp&w=1080&h=800&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4185bebc73972aaac17fa6b7cd1f2b09.jpg?f=webp&w=1080&h=524&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8eba380cc05bedc81640582b6d14848c.jpg?f=webp&w=1080&h=683&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d3e0c0aec61c6f066b786ce0e1019822.jpg?f=webp&w=1080&h=950&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ec9bd6ffaee83d5ce80ec9703dd0c243.jpg?f=webp&w=1080&h=1084&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1599b9c52ab0744018488a114fa769ad.jpg?f=webp&w=1080&h=843&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1444f82011488be728c56a6f5bf8c4ac.jpg?f=webp&w=1080&h=1104&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ac8f965beaa6053ce75b2fd41522edfe.jpg?f=webp&w=1080&h=1055&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f6424b5ca32e77606f439c6c7fe9d8cd.jpg?f=webp&w=1080&h=861&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/991e02dacab5d3f7adb6d7db455c35e1.jpg?f=webp&w=1080&h=1262&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/64c7d75d815e05d2179a5b2c368411c8.jpg?f=webp&w=1080&h=1359&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c643bbd7c1e5e4ebad5468e3e09950f4.jpg?f=webp&w=1080&h=820&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7930d9268533b05ee496e35814670eb8.jpg?f=webp&w=1080&h=1164&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d7a68af446ca04446ed5e02720527e0a.jpg?f=webp&w=1080&h=861&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6945ce2aca4864e1ca42b9c1d82482b9.jpg?f=webp&w=1080&h=897&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/19bf3c5cb2cf3f79ad577d6e7236dd94.jpg?f=webp&w=1080&h=1144&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/420566326fdb741b7868c8834fef9e9d.jpg?f=webp&w=1080&h=1022&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6cffb10a28b5b17289855e1331b51c03.jpg?f=webp&w=1080&h=752&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f22839d353ba1b5a0ac3deffc621566a.jpg?f=webp&w=1080&h=952&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(6,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ac6916b63ad599dbb14f41d2624f1ccd.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/63603130d0e1d255640fce41ac1444e3.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c5225d49d138a5dad958f764feda4681.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b3044b068a971fa94854f8025cad6f4e.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/93cefe2b7325f80edb3865118bcc309d.jpg#',10000139,'黑鲨游戏手机 2',2699,3499,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙855八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!双摄像头!4800万+1200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.39英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!8GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!128GB#https://i8.mifile.cn/b2c-mimall-media/52ad10a73685342e437e44ea3d29cbff.png!厚实!8.77mm#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「816狂欢，8GB+128GB,到手价2699元，加赠游戏手柄套装」','双材质折面光影机身 / 骁龙855旗舰芯片+最大12G内存 / Magic Press立体操控 / 液冷3.0: 塔式全域液冷系统 / Trueview Display精准显示 / 升级X+2天线 /','https://i8.mifile.cn/v1/a1/26497f00-cc2d-1389-e7b7-f307f05902f8.webp?w=1080&h=475&bg=232822#https://i8.mifile.cn/v1/a1/1f88e76c-d622-55ec-ac8d-72fa650b5962.webp?w=1080&h=1195&bg=232626#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4ce5d2ce61c1c63881478fc4390a56e2.jpg?w=1080&h=756&bg=232124#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/66954b0df2d3047dcc971634fc86ad00.jpg?w=1080&h=945&bg=FFFFFF#https://i8.mifile.cn/v1/a1/eb4a3b45-61fb-5912-d26b-747ae740d2d6.webp?w=1080&h=640&bg=19211A#https://i8.mifile.cn/v1/a1/3775b5c5-e968-7e1c-fade-63516e4913ef.webp?w=1080&h=1253&bg=424644#https://i8.mifile.cn/v1/a1/3bc5cd93-256c-4fa4-b19f-7d87f114e125.webp?w=1080&h=402&bg=0A2121#https://i8.mifile.cn/v1/a1/3b072cbf-3197-e3e0-4ea7-a3ebc23e84d5.webp?w=1080&h=451&bg=29283D#https://i8.mifile.cn/v1/a1/66c8c482-6028-b57b-0d36-31a32b3d6890.webp?w=1080&h=796&bg=211C28#https://i8.mifile.cn/v1/a1/e545317b-f488-9d88-65b6-a1620ec08bfd.webp?w=1080&h=698&bg=0D180D#https://i8.mifile.cn/v1/a1/f6ae88b3-fa49-ea17-b77b-099174fbf2c1.webp?w=1080&h=1075&bg=252D24#https://i8.mifile.cn/v1/a1/42c10a63-ad21-5bc8-4f0b-08f5f0065888.webp?w=1080&h=633&bg=1A251F#https://i8.mifile.cn/v1/a1/a7119fb1-4e3c-1321-46ad-0965dce7805d.webp?w=1080&h=1054&bg=2D2E2E#https://i8.mifile.cn/v1/a1/44b72ac3-aefd-0a7c-3efc-a4d63a099044.webp?w=1080&h=853&bg=4D3B26#https://i8.mifile.cn/v1/a1/0177476c-25f9-64d0-8038-39d620ad7f20.webp?w=1080&h=636&bg=594335#https://i8.mifile.cn/v1/a1/447200ef-6a47-f645-edcd-679c058bb382.webp?w=1080&h=825&bg=182820#https://i8.mifile.cn/v1/a1/b8ce5df9-656d-a8ef-0de6-0a7a411bcd55.webp?w=1080&h=690&bg=4A423D#https://i8.mifile.cn/v1/a1/e04c206d-8ba6-083a-91bc-e17243fe73bc.webp?w=1080&h=733&bg=0C120C#https://i8.mifile.cn/v1/a1/5293ca6f-0b3d-2d5e-f789-bce0d862500a.webp?w=1080&h=1129&bg=162816#https://i8.mifile.cn/v1/a1/ebeba89d-ed6b-4600-f915-495181a74072.webp?w=1080&h=885&bg=2F2D2D#https://i8.mifile.cn/v1/a1/25f6f4fc-f89b-ec57-7c1d-5750dd6389f9.webp?w=1080&h=962&bg=0B0E0B#https://i8.mifile.cn/v1/a1/c103e7c0-b8ae-faa4-8458-3d6dfad00495.webp?w=1080&h=707&bg=1B221B#https://i8.mifile.cn/v1/a1/3afe0b61-6d49-4d79-6010-8b2dcc1c522d.webp?w=1080&h=1172&bg=292725#https://i8.mifile.cn/v1/a1/b6adfe89-0042-9567-389f-ff02d5f7c0fa.webp?w=1080&h=844&bg=0F1E1B#https://i8.mifile.cn/v1/a1/bc44ae0a-675d-c6de-8ced-aec2228813f4.webp?w=1080&h=1078&bg=161D1F#https://i8.mifile.cn/v1/a1/38da8b3d-d590-39ba-8b61-f88f37dcf5f1.webp?w=1080&h=651&bg=131C14#https://i8.mifile.cn/v1/a1/a15d5d98-374b-bac9-c6b0-3e71b14044e8.webp?w=1080&h=494&bg=142215#https://i8.mifile.cn/v1/a1/651678ac-b1a5-9161-4c0a-ce6875ec2e3f.webp?w=1080&h=914&bg=101911#https://i8.mifile.cn/v1/a1/73da2025-097a-6488-de73-382cb341d545.webp?w=1080&h=1478&bg=10120D#https://i8.mifile.cn/v1/a1/8777942b-d506-6322-3126-54547d5b507f.webp?w=1080&h=720&bg=1B241B#https://i8.mifile.cn/v1/a1/49a401e6-9553-974c-559a-7aa281ccaf89.webp?w=1080&h=1356&bg=131515#https://i8.mifile.cn/v1/a1/d4f0421e-958f-c681-b964-e1bb384de801.webp?w=1080&h=318&bg=191919#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(7,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a7bf511b9dd1cdd074e5517cab687706.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9d0a806e1c8d589467cc62020e7087ef.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2c7eb86c04ad88b4a6c3ee7004c740d8.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/62b01feab6366e81d4200b7146a9f130.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1542184dfe073961ab26ea7c890d7ed5.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ef6be2187c369e28be7eb4b820716e22.jpg#',10000150,'Redmi K20',1999,2099,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙730八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!三摄像头!4800万+800万+1300万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.39英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!6GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!128GB#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「6GB+128GB，直降100，到手价1999元，加赠价值99.9元无线蓝牙耳机，享花呗6期免息」','索尼4800万超广角三摄 / 骁龙730处理器 / 前置2000万升降式相机 / 6.39\"AMOLED全面屏 / 4000mAh超长续航 / 第七代屏下指纹解锁 / 多功能NFC','https://i8.mifile.cn/v1/a1/235f1844-60b0-7ed4-b745-b6f5386f8196.webp?w=1080&h=590&bg=141C32#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1545183d7838ffae178f23f7aa763b31.jpg?w=1080&h=663&bg=494675#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b7e0b473539fd1241c93bd3657261bb4.jpg?w=1080&h=724&bg=411E3F#https://i8.mifile.cn/v1/a1/2cf8ca36-ae35-e3fb-3a02-f8cb06a3cd0c.webp?w=1080&h=895&bg=201A23#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8cb5cebf72153b7667c9c3e893a0b864.jpg?w=1080&h=858&bg=222129#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dcce39193fc5e0a968fc6be5de4c6f70.jpg?w=1080&h=887&bg=09080A#https://i8.mifile.cn/v1/a1/6159eee8-2077-b347-86a2-8f287203b968.webp?w=1080&h=826&bg=272526#https://i8.mifile.cn/v1/a1/3f3be110-1eaa-cb94-ff51-a8e913da4da3.webp?w=1080&h=1264&bg=191A2A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a38a7abe95cd439dafb44d2b9b05e721.jpg?w=1080&h=1133&bg=194A72#https://i8.mifile.cn/v1/a1/15d8aed5-4814-c08c-b00b-45201ec85bed.webp?w=1080&h=1098&bg=0C0824#https://i8.mifile.cn/v1/a1/da6c8454-1246-5c12-b0ac-d6421ae1c5ae.webp?w=1080&h=1468&bg=0E072B#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/98b347312214043b69710ae88f39a515.jpg?w=1080&h=1218&bg=100C10#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ad38baef22caec1e1f58d42eb45d472d.jpg?w=1080&h=1100&bg=2E3843#https://i8.mifile.cn/v1/a1/ac681962-51e8-a80d-301b-1f126ca3f532.webp?w=1080&h=428&bg=6B7782#https://i8.mifile.cn/v1/a1/600a54a7-f83f-dfba-2c65-990c55d0b796.webp?w=1080&h=645&bg=070707#https://i8.mifile.cn/v1/a1/e3fad1ee-9832-327a-1b21-9c8d92aa2fb5.webp?w=1080&h=1023&bg=1D2835#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2937a93aaf9ae39ad5b8278b438bbae6.jpg?w=1080&h=536&bg=526C86#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b46f5058047bcef68c06fb84916ad180.jpg?w=1080&h=530&bg=343334#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/59cc7d4910e1e42a3d90347ce67aadd7.jpg?w=1080&h=752&bg=0A0609#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/80fa8614daecd054bc923005272fc092.jpg?w=1080&h=1102&bg=3E2D2C#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9b099bae6b1f36b09bc725280cd1adf2.jpg?w=1080&h=495&bg=08060A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fb852a17da1cead452f79405d1c7f9aa.jpg?w=1080&h=579&bg=0A060A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e538a4319b38d3f955e5e2fa762a0bfb.jpg?w=1080&h=1080&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9285b2625cc38e8690ab1c630386ba4.jpg?w=1080&h=860&bg=16081D#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/465d922c04e2f8b022839e582aec02bc.jpg?w=1080&h=945&bg=1D174E#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/35c6dd80ea2346a303f272c76edb7269.jpg?w=1080&h=1035&bg=110D2D#https://i8.mifile.cn/v1/a1/91ab5481-93d8-c1dd-42b4-ae23efa5da55.webp?w=1080&h=826&bg=8C85C8#https://i8.mifile.cn/v1/a1/0c02dc73-8215-94e0-223b-fe3081e2cbb5.webp?w=1080&h=896&bg=4E3951#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/387a17b2b814e5672a2e887303060323.jpg?w=1080&h=1421&bg=2C0E20#https://i8.mifile.cn/v1/a1/84c1e2e5-b41c-2a53-86f5-51188e7b885e.webp?w=1080&h=1114&bg=0F0406#https://i8.mifile.cn/v1/a1/8479535e-330b-8b76-1d5f-742362211ef8.webp?w=1080&h=867&bg=200A1A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f7eabd8465242894e504e9b6d2ccc8be.jpg?w=1080&h=875&bg=0D0A0C#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/930e37c7fab7dae3263b76c300795a36.jpg?w=1080&h=1363&bg=1E1E22#https://i8.mifile.cn/v1/a1/35ea9120-05e5-c510-6957-e4fdf43a50a0.webp?w=1080&h=1080&bg=0E0D0D#https://i8.mifile.cn/v1/a1/18f072b6-9e36-a85f-2edc-d41184fcf64d.webp?w=1080&h=1480&bg=321E35#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/16f93f8d28623e9aa4ad938dcdd9f71e.jpg?w=1080&h=757&bg=0E0E0E#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(8,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c82f070f7271e712fe6dfd6210966def.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0337032429cc0085ab911ecc823624a0.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/23920653ce71e984d71994c9c7680fce.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ff7c037f8d77f9c7afe9a76fbbc76e05.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b9e6dc89b7d6ae2710ac702e233d3530.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c8470f38c852d7ab252b83c5f858b271.jpg#',10000151,'Redmi K20 Pro',2499,2799,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙855八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!三摄像头!4800万+800万+1300万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.39英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!8GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!128GB#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!#运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「8GB+128GB，直降300，加20元得27w快充头，享花呗6期免息，每期低至417元」','骁龙855旗舰处理器 / 索尼4800万超广角三摄 / 前置2000万升降式相机 / 6.39\"AMOLED全面屏 / 4000mAh超长续航 / 8层石墨立体散热 / 第七代屏下指纹解锁 / 多功能','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/93ca0cd71fd163f23ac33b60a55f23f7.jpg?w=1080&h=910&bg=251D2A#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4fc4a4c9c74366bac42a40e47d39fb52.jpg?w=1080&h=1291&bg=211F24#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6c93954d9d141e38deb2bcbce9a5653c.jpg?w=1080&h=572&bg=612156#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6dff26dbbbeae080b06af16459b506fa.jpg?w=1080&h=832&bg=0E0A0D#https://i8.mifile.cn/v1/a1/8936471c-2134-3524-b53e-c37ef253cfe0.webp?w=1080&h=1001&bg=393448#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fa0f0c79b8ca45109a94f89c347d85a9.jpg?w=1080&h=1297&bg=191A2A#https://i8.mifile.cn/v1/a1/fc9ab041-c1f0-1a7b-0873-577346ecc5ba.webp?w=1080&h=1093&bg=194C74#https://i8.mifile.cn/v1/a1/cc1d3601-9533-7ce5-1818-776fef22076d.webp?w=1080&h=862&bg=1C1429#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/04d0ca96e7e907295b08a41ca38f3eff.jpg?w=1080&h=1194&bg=321920#https://i8.mifile.cn/v1/a1/89a4d5bc-85b8-8473-ed31-19cbb1f5fc3e.webp?w=1080&h=868&bg=0D0A25#https://i8.mifile.cn/v1/a1/82d5894a-c796-3751-28e2-62edaf1df8a9.webp?w=1080&h=1776&bg=0E0729#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/79681260276e0cfb4ac02ff35f808cff.jpg?w=1080&h=572&bg=6F2359#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/81f4fd24fa402d12c20b39d7e11ec203.jpg?w=1080&h=811&bg=111013#https://i8.mifile.cn/v1/a1/008330b9-1f36-0cb4-e45b-d32108185d53.webp?w=1080&h=928&bg=0C070B#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c9d595bfac41464e10972d9a92d9b578.jpg?w=1080&h=684&bg=4E6683#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/108a31549b6a8c22d2fc18dd802bc1fa.jpg?w=1080&h=1028&bg=1F2328#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b51864d36db18685f90a07e9d7794a66.jpg?w=1080&h=1319&bg=425067#https://i8.mifile.cn/v1/a1/a75975c7-6da0-9d59-60fa-d220b8447e3c.webp?w=1080&h=354&bg=3D4D6C#https://i8.mifile.cn/v1/a1/9c77d762-66f0-8755-d216-3cf3562801b2.webp?w=1080&h=431&bg=3B4B62#https://i8.mifile.cn/v1/a1/286cb69d-9895-7806-2600-c71039b18bd2.webp?w=1080&h=735&bg=0A0609#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/10bcb891a077bde21051eb86005ea9e4.jpg?w=1080&h=1114&bg=3F2E2C#https://i8.mifile.cn/v1/a1/ad95e33c-39c6-b3ba-4d5d-2aee114cbdf6.webp?w=1080&h=496&bg=080609#https://i8.mifile.cn/v1/a1/72c6bd15-65e1-be1e-e819-689961960d32.webp?w=1080&h=537&bg=09070B#https://i8.mifile.cn/v1/a1/601943e2-ec8c-6dd9-4cc6-e530fa6e44d3.webp?w=1080&h=572&bg=0A060B#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e538a4319b38d3f955e5e2fa762a0bfb.jpg?w=1080&h=1080&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/56a24a90bf8606061ed662fbf1c2ac67.jpg?w=1080&h=572&bg=3F1654#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ceae109bf8d37914a1ce614832aa430b.jpg?w=1080&h=936&bg=16081D#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ffdb17ca34d0c18f9ee3577cb16e5d3d.jpg?w=1080&h=891&bg=1D1851#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c0985e9e7fc838223c4a270aef9aa82b.jpg?w=1080&h=1254&bg=0F0C2D#https://i8.mifile.cn/v1/a1/a96a9bfd-90e6-9042-4cc3-07f417456d62.webp?w=1080&h=829&bg=8D86C8#https://i8.mifile.cn/v1/a1/45caebb2-0f36-ce06-68b3-be610c7a08be.webp?w=1080&h=907&bg=4C374F#https://i8.mifile.cn/v1/a1/1fd56bdf-d58d-fa8a-5d05-cec6da0532b0.webp?w=1080&h=1344&bg=310D13#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1556a2a65a55c534decc371be251015f.jpg?w=1080&h=1132&bg=0F0406#https://i8.mifile.cn/v1/a1/2b68cdb9-c8d7-35cb-e0f6-aba69d95dbb2.webp?w=1080&h=572&bg=6A1D59#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/68faa4b09f86c929a58ea03eb066e678.jpg?w=1080&h=878&bg=0C090B#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4f257fb27a204477280fb6f1facb45c2.jpg?w=1080&h=1394&bg=1E1E22#https://i8.mifile.cn/v1/a1/a7931f92-da09-a5e9-d7b4-3a7506cc971b.webp?w=1080&h=638&bg=070609#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/164ac336b72e540a496ec39b4fee4ac8.jpg?w=1080&h=1523&bg=1C232A#https://i8.mifile.cn/v1/a1/166c0d0c-07ab-b5bc-6503-ef231d6dae7f.webp?w=1080&h=1080&bg=0E0D0D#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/76f8af214188baf7945af034b859ed45.jpg?f=webp&w=1080&h=1542&bg=0#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cb4f103efc4ba14699534fabeb29591e.jpg?w=1080&h=1311&bg=331E3A#https://i8.mifile.cn/v1/a1/afa22f7b-807f-6089-2810-530423752edf.webp?w=1080&h=782&bg=0E0E0E#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(9,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c8713541c100e651cb3cb0f299f372b6.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6bfc7f28953b13ca6130a93500d05ef3.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b71db4e1e0718740490bf491c8809e78.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/850678f51692e6c55a0b610333383a1e.jpg#',10000134,'小米9',3299,NULL,NULL,NULL,'全曲面轻薄设计，全息幻彩玻璃机身 / 骁龙855旗舰处理器 / 20W无线闪充，标配27W有线快充 / 索尼4800万超广角微距三摄 / 极速屏下指纹解锁 / 多功能NFC','https://i8.mifile.cn/v1/a1/79ea3c1b-569d-9926-5ccb-fbcf2ffc5700.webp?w=1080&h=877&bg=CB362D#https://i8.mifile.cn/v1/a1/76255485-29a2-33e6-4ffc-f126da48e465.webp?w=1080&h=1400&bg=993531#https://i8.mifile.cn/v1/a1/62b89522-edf8-92f9-2dd4-ecc63b824b06.webp?w=1080&h=892&bg=F1F1F1#https://i8.mifile.cn/v1/a1/bc891307-706a-eef3-5540-6af49964571b.webp?w=1080&h=1012&bg=E8E6EA#https://i8.mifile.cn/v1/a1/af5739fb-527f-d111-fbef-a614664b936c.webp?w=1080&h=1168&bg=7F8EBE#https://i8.mifile.cn/v1/a1/747e55a4-7a75-845b-2876-efb72ae0d753.webp?w=1080&h=1443&bg=9187A9#https://i8.mifile.cn/v1/a1/7c1688dc-e370-8271-cd56-7aa41093d1af.webp?w=1080&h=1083&bg=F3F3F3#https://i8.mifile.cn/v1/a1/9fb37c30-0e63-2445-0411-e078ac99700c.webp?w=1080&h=1512&bg=C0B9D4#https://i8.mifile.cn/v1/a1/cabb3a20-32e6-4ff0-03e0-87f14392c98c.webp?w=1080&h=1612&bg=8EB1CE#https://i8.mifile.cn/v1/a1/8d10a919-62ab-554b-47a5-ed0a624a3159.webp?w=2160&h=2126&bg=B1C7A5#https://i8.mifile.cn/v1/a1/7c0bdf74-5bd7-d1dd-dbd7-4be55fe0afee.webp?w=1080&h=1403&bg=AEB9E3#https://i8.mifile.cn/v1/a1/16e23130-01ca-2bb6-3f44-29f22bf1a14e.webp?w=1080&h=894&bg=D9DFE5#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ebe04b1adc81919e8ddd715f4f9276bd.jpg?w=1080&h=152&bg=FAFAFA#https://i8.mifile.cn/v1/a1/e90e0b7d-3493-9e54-fc97-93de6f3cc90c.webp?w=1080&h=849&bg=EAEAEA#https://i8.mifile.cn/v1/a1/2945e766-dd84-0777-0b30-41ff498e35c4.webp?w=1080&h=1277&bg=B0AFAE#https://i8.mifile.cn/v1/a1/ba3ea92f-2bb2-38e6-062a-a86a02b28263.webp?w=1080&h=961&bg=F4F4F4#https://i8.mifile.cn/v1/a1/fcc16398-1e2b-b53c-a08d-1bcf940bfd0e.webp?w=1080&h=314&bg=F3F3F3#https://i8.mifile.cn/v1/a1/69f8a278-c835-76f0-627a-e23e5034fdf1.webp?w=1080&h=157&bg=FDFDFD#https://i8.mifile.cn/v1/a1/1b50f35a-495f-abba-71d3-5d5eb1067384.webp?w=1080&h=363&bg=ECEEEE#https://i8.mifile.cn/v1/a1/80aaad97-1986-d194-f706-5a7308550857.webp?w=1080&h=1271&bg=F0EBEF#https://i8.mifile.cn/v1/a1/462df943-ba8f-0a36-ae2b-6eeb5c70085a.webp?w=1080&h=1193&bg=5F5F62#https://i8.mifile.cn/v1/a1/5a709737-52be-8f2f-7fb0-289e5e6c60f6.webp?w=1080&h=1682&bg=E0D8D7#https://i8.mifile.cn/v1/a1/c6b618a7-8046-ba1b-be3d-2402ee93c987.webp?w=1080&h=994&bg=EFEDED#https://i8.mifile.cn/v1/a1/b88285a2-efe1-011c-fcd3-b62247dd1596.webp?w=1080&h=1254&bg=DAD9DA#https://i8.mifile.cn/v1/a1/597a41d2-f22c-a21d-ffee-59ed32149a75.webp?w=1080&h=1627&bg=9D91A2#https://i8.mifile.cn/v1/a1/cf9f326d-0da6-5f19-0544-3ce7a3f8fabf.webp?w=1080&h=1229&bg=F4F3F3#https://i8.mifile.cn/v1/a1/1b509e0c-229a-de9d-a83f-ca26c130c2d7.webp?w=1080&h=1781&bg=8C8B98#https://i8.mifile.cn/v1/a1/2653a879-90e0-1ccf-ccff-856701828b64.webp?w=1080&h=2117&bg=6E6E71#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d74cdd13a0c9f8b690b991bb8aa5b0d1.jpg?w=1080&h=479&bg=EBE9EE#https://i8.mifile.cn/v1/a1/ba23c84c-ffe6-be83-68e3-437900a00be5.webp?w=1080&h=1300&bg=675FAD#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e0dd6c21b0353698d6daf7f8e9621ab9.jpg?w=1080&h=907&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(10,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0cf850a6110f64c868635b9619b37a88.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e211e074fbe118d3be0e94c956b9876c.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4689b8ea70262a1bc8a8b548ec34f14b.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/304613d7caa65fd01336c10e8a94e77d.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d3d0f7414181e1ba2d3d46fb9255f14.jpg#',10000135,'小米9 SE',1799,1999,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙712八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!三摄像头!4800万+800万+1300万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!中小屏!5.97英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!6GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!64GB#https://i8.mifile.cn/b2c-mimall-media/52ad10a73685342e437e44ea3d29cbff.png!薄!7.45mm#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!持久待机!3070mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「816狂欢，6GB+64GB，优惠200，到手价1799元」','索尼4800万超广角三摄 / 骁龙712全球首发 / 全息幻彩机身 / 三星AMOLED屏幕 / 5.97”水滴屏 / 第五代屏幕指纹识别 / 多功能NFC / 红外遥控','https://i8.mifile.cn/v1/a1/ba16f220-bc44-2891-1091-18f2568fc2ab.webp?w=1080&h=1068&bg=C9D0E3#https://i8.mifile.cn/v1/a1/3d38ba49-393f-34e6-4146-e9944d0b8127.webp?w=1080&h=913&bg=B9B2CA#https://i8.mifile.cn/v1/a1/a88beac9-b380-7b7f-3cde-e2c6d1b2c405.webp?w=1080&h=771&bg=E5E5E5#https://i8.mifile.cn/v1/a1/c3172622-8339-c5ec-6087-d83111893989.webp?w=1080&h=844&bg=F3F3F3#https://i8.mifile.cn/v1/a1/767c42ad-5244-56d8-6642-7b73e7c72898.webp?w=1080&h=1072&bg=F1F1F1#https://i8.mifile.cn/v1/a1/d02225f0-236b-9343-bc35-5d0af7b62e21.webp?w=1080&h=727&bg=5C7CAA#https://i8.mifile.cn/v1/a1/978a7b96-c036-ed19-3127-9ce15c0710a9.webp?w=1080&h=975&bg=E1E2E3#https://i8.mifile.cn/v1/a1/ba8cc0bf-ee9a-8590-9c0e-f24da8011527.webp?w=1080&h=809&bg=8281B1#https://i8.mifile.cn/v1/a1/c75dc912-2766-6709-441a-a97f6f31262e.webp?w=1080&h=659&bg=EFF0F2#https://i8.mifile.cn/v1/a1/03b2383b-e342-063a-668f-033060330133.webp?w=1080&h=720&bg=ECECEC#https://i8.mifile.cn/v1/a1/6824a88c-a604-df51-c740-fb57c53ecad0.webp?w=1080&h=1152&bg=1A181B#https://i8.mifile.cn/v1/a1/fa816059-7094-3230-9c19-ffb21f39b71c.webp?w=1080&h=1042&bg=0E0B0D#https://i8.mifile.cn/v1/a1/f3d2de93-ae99-a6e5-4344-4f42a6fcb1a2.webp?w=1080&h=657&bg=ECEBED#https://i8.mifile.cn/v1/a1/732891dc-10f4-ee1d-ae7c-c2398e99a47c.webp?w=1080&h=960&bg=9374B1#https://i8.mifile.cn/v1/a1/8415625b-588a-20ec-34c8-eedf9a6f6b8e.webp?w=1080&h=649&bg=F1F1F1#https://i8.mifile.cn/v1/a1/f2d8d1e7-a2be-b3d3-4743-72216ec67d7c.webp?w=1080&h=1086&bg=425993#https://i8.mifile.cn/v1/a1/6e828af4-7bac-49c5-3567-4fdd55eb7670.webp?w=1080&h=884&bg=202122#https://i8.mifile.cn/v1/a1/d88c835a-98e7-95b8-84a2-e00bed548d21.webp?w=1080&h=1104&bg=304E85#https://i8.mifile.cn/v1/a1/8fff1467-597e-8d6f-38c2-c4858de90df1.webp?w=1080&h=1423&bg=592D27#https://i8.mifile.cn/v1/a1/2634e14b-ae58-5611-3259-37875eb8e21a.webp?w=1080&h=890&bg=242424#https://i8.mifile.cn/v1/a1/64ea1f16-aab3-53e3-b800-38fed13a7749.webp?w=1080&h=1240&bg=0E0F13#https://i8.mifile.cn/v1/a1/26ef2b38-508d-a015-5cae-14fddeccc05c.webp?w=1080&h=906&bg=0F1826#https://i8.mifile.cn/v1/a1/feef5c6c-1249-547d-5aa0-329772ad7653.webp?w=1080&h=1309&bg=606685#https://i8.mifile.cn/v1/a1/7f483a9f-b803-b793-8b26-9b3d479020d2.webp?w=1080&h=1144&bg=EFF0F1#https://i8.mifile.cn/v1/a1/496d1f26-6ed6-68a1-3203-4b17b48f4a04.webp?w=1080&h=1228&bg=A5A0A0#https://i8.mifile.cn/v1/a1/1882c997-0549-641e-163a-b5ed68832d7a.webp?w=1080&h=879&bg=262526#https://i8.mifile.cn/v1/a1/584d23b8-6d0e-56cc-1e10-38684c0ec3d3.webp?w=1080&h=1320&bg=23242A#https://i8.mifile.cn/v1/a1/2113efbe-c73c-ffc4-0538-9134f4db0b5e.webp?w=1080&h=745&bg=333333#https://i8.mifile.cn/v1/a1/6b356871-016c-4c57-ed86-bda89fddb12b.webp?w=1080&h=861&bg=21201F#https://i8.mifile.cn/v1/a1/6488d260-d4b0-6581-85a8-4736e1d8757b.webp?w=1080&h=1216&bg=151516#https://i8.mifile.cn/v1/a1/794d0910-236e-8358-9b3b-e555acdd07bf.webp?w=1080&h=735&bg=F1F1F1#https://i8.mifile.cn/v1/a1/8629f248-a769-3cc3-a584-afb07a6a7dd0.webp?w=1080&h=810&bg=354659#https://i8.mifile.cn/v1/a1/f50a97f2-1985-cfdb-896e-ab51533be886.webp?w=1080&h=546&bg=F3F3F3#https://i8.mifile.cn/v1/a1/4d66a71f-4561-bfe3-9a67-080f75507371.webp?w=1080&h=962&bg=4C4B4E#https://i8.mifile.cn/v1/a1/0bcf005c-1094-ddc0-bbc5-0cdfe809cba9.webp?w=1080&h=1050&bg=1B2130#https://i8.mifile.cn/v1/a1/25d68ded-876d-5f61-1b35-0b0d333252a9.webp?w=1080&h=1016&bg=283B5B#https://i8.mifile.cn/v1/a1/970a4183-721e-7031-eaf1-6ce60ebb5f1a.webp?w=1080&h=730&bg=0D0A0C#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9607d601a1a527bd9ae4c328c4f20758.jpg?w=1080&h=1735&bg=FFFFFF#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(11,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/66dba400ba173d249535f1ebda687af5.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8356347e0e30b227bcbb8462c4a45b95.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0b930914c55abbbc40c19fa05b923f5f.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/21c9df2716326d3b6daad76b45fd18d7.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5fee30a839dea17971ca95550909e934.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f19d21a52534437f19ba498957a385d8.jpg#',9455,'Redmi Note 7 Pro',1399,1599,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙675八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!双摄像头!4800万+500万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.3英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!2340×1080#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!极速畅玩!6GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!128GB#https://i8.mifile.cn/b2c-mimall-media/52ad10a73685342e437e44ea3d29cbff.png!普通厚度!8.1mm#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「816狂欢，6GB+128GB优惠200元，到手价1399元！镜花水月新配色，现货热卖中」','索尼4800万超清拍照 / 6GB+128GB大存储 / 骁龙675处理器 / 4000mAh大电量 / 18个月超长质保 / 6.3\"水滴屏 / P2i整机防泼溅处理 / 标配18W充电器 / 德国','https://i8.mifile.cn/v1/a1/bbb95485-a458-2c51-abfa-0613db263c8c.webp?w=1080&h=742&bg=F9EEEB#https://i8.mifile.cn/v1/a1/93953fcf-e36a-93c8-f343-913cabca1244.webp?w=1080&h=450&bg=F2EEF0#https://i8.mifile.cn/v1/a1/fee0c0d6-4214-afff-879f-ccd3551af880.webp?w=1080&h=402&bg=A8C6E6#https://i8.mifile.cn/v1/a1/82d7cfed-4e8c-e9f0-3e7d-1b59bb1d4434.webp?w=1080&h=721&bg=B9ACF9#https://i8.mifile.cn/v1/a1/a043428c-218b-2384-3bd9-662defafe86c.webp?w=1080&h=580&bg=B071F7#https://i8.mifile.cn/v1/a1/e8f2fc02-14ad-73bf-f00b-aaabbcf57d9a.webp?w=1080&h=1187&bg=AFA9C6#https://i8.mifile.cn/v1/a1/ddcb3bba-cb4d-f513-571d-674dd1da7d4b.webp?w=1080&h=1002&bg=CEAACD#https://i8.mifile.cn/v1/a1/b1b1808b-22f1-80bc-b0c9-6d01e121d340.webp?w=1080&h=594&bg=CF64A5#https://i8.mifile.cn/v1/a1/772847b8-62a5-7841-f03c-2083e0c8c0bb.webp?w=1080&h=837&bg=D2DCE9#https://i8.mifile.cn/v1/a1/58b83125-818d-d81d-08db-01f68882c940.webp?w=1080&h=363&bg=A2A7B5#https://i8.mifile.cn/v1/a1/38b248aa-a8e7-a0c2-8751-b16604c85d0c.webp?w=1080&h=653&bg=B5B8DD#https://i8.mifile.cn/v1/a1/dbfc45b5-5200-bdbe-ed7c-463ecf024235.webp?w=1080&h=388&bg=79707E#https://i8.mifile.cn/v1/a1/d32e40a5-acca-dd8f-3384-f2111eb2141b.webp?w=1080&h=665&bg=C6DCED#https://i8.mifile.cn/v1/a1/4b07036d-a186-5b9b-8c76-d90a1edd44a9.webp?w=1080&h=681&bg=82959D#https://i8.mifile.cn/v1/a1/e86ea5b4-fbcc-8432-7668-5197440cd1f4.webp?w=1080&h=475&bg=504040#https://i8.mifile.cn/v1/a1/f782f898-2d31-e83e-6067-cb6bf7c850ff.webp?w=1080&h=338&bg=62504B#https://i8.mifile.cn/v1/a1/f9252179-5414-be92-ba90-a43045a63369.webp?w=1080&h=643&bg=DDD3DC#https://i8.mifile.cn/v1/a1/5a06d046-53d6-576e-b9b8-1d9ebecbc27c.webp?w=1080&h=741&bg=DCE9F4#https://i8.mifile.cn/v1/a1/0fe773e1-6937-ca7d-fe9b-72ab9a3ad826.webp?w=1080&h=933&bg=C8C8DE#https://i8.mifile.cn/v1/a1/348fdb10-ccfe-ef83-d747-cf513591a993.webp?w=1080&h=992&bg=C6E2F1#https://i8.mifile.cn/v1/a1/6cadbb65-4665-da34-4d47-1d2f7c59373b.webp?w=1080&h=806&bg=B4BAB9#https://i8.mifile.cn/v1/a1/9fd8f14a-a89d-b090-65da-c232e3089181.webp?w=1080&h=977&bg=D4EFF1#https://i8.mifile.cn/v1/a1/3e314bd6-3257-9041-2f91-6e04106d62c5.webp?w=1080&h=1240&bg=D1B4E2#https://i8.mifile.cn/v1/a1/c5b5cb2c-b077-dbfb-cfe5-0953757c80b5.webp?w=1080&h=540&bg=E5E0E3#https://i8.mifile.cn/v1/a1/1ebcc03a-9b77-2182-b4c1-e0f618204c24.webp?w=1080&h=843&bg=EBECF0#https://i8.mifile.cn/v1/a1/cbb88c42-94ea-1d7f-7c95-5c276682d912.webp?w=1080&h=728&bg=A387D0#https://i8.mifile.cn/v1/a1/12b0f033-aafe-d60d-fc58-5e985b5689d4.webp?w=1080&h=638&bg=DBDFF2#https://i8.mifile.cn/v1/a1/5d65b3db-9f5e-1344-23bf-578a3f7c4d53.webp?w=1080&h=965&bg=D1DDEA#https://i8.mifile.cn/v1/a1/a89688e1-bdc3-2aba-0ace-66bd36520f2d.webp?w=1080&h=613&bg=D6E5EC#https://i8.mifile.cn/v1/a1/f0fb37f7-8c86-a9b0-c4bf-7cf60edc2731.webp?w=1080&h=1209&bg=C2ACD7#https://i8.mifile.cn/v1/a1/af984f29-7b49-4da9-7f38-441ad650c16b.webp?w=1080&h=842&bg=E7EEF3#https://i8.mifile.cn/v1/a1/b280856f-3d05-f1fa-2a36-fe702b4551cc.webp?w=1080&h=546&bg=ECEDEE#https://i8.mifile.cn/v1/a1/99e930b2-0f2a-1e39-ca3d-da253d95f191.webp?w=1080&h=926&bg=E6E5E7#https://i8.mifile.cn/v1/a1/7063297b-4a8f-3c32-3f9e-1e47a61f2a12.webp?w=1080&h=855&bg=F0F0F0#https://i8.mifile.cn/v1/a1/994afaac-0696-3879-2b1c-d72f5a413bbe.webp?w=1080&h=541&bg=BFB8BA#https://i8.mifile.cn/v1/a1/8307e571-aec1-40be-78d1-4d7431c9f9e9.webp?w=1080&h=562&bg=5C5E67#https://i8.mifile.cn/v1/a1/a259bf20-cbe1-d99f-0a78-c09049568357.webp?w=1080&h=805&bg=EEECE8#https://i8.mifile.cn/v1/a1/dfbd632a-89cb-b23f-c856-3cc266e39e88.webp?w=1080&h=1183&bg=485DB2#https://i8.mifile.cn/v1/a1/41b7a218-9ef0-8922-cfe0-adc7d4494ecb.webp?w=1080&h=647&bg=F8EFE5#https://i8.mifile.cn/v1/a1/58123ca7-c6f8-6964-eccc-355b7380578d.webp?w=1080&h=735&bg=F8EEE3#https://i8.mifile.cn/v1/a1/64efb62c-a1be-34b9-76fc-30e40998160b.webp?w=1080&h=488&bg=331D75#https://i8.mifile.cn/v1/a1/db6e96ac-2999-669d-ba00-f987a26a940b.webp?w=1080&h=473&bg=473183#https://i8.mifile.cn/v1/a1/bd6e4efb-75e0-35b5-9cf7-44051ec74fc0.webp?w=1080&h=606&bg=CCC2D0#https://i8.mifile.cn/v1/a1/30bdef0a-be07-ecda-49ac-1e412997ebe1.webp?w=1080&h=762&bg=CFDBE9#https://i8.mifile.cn/v1/a1/1f57736d-6268-9a43-f572-772f5f0aa077.webp?w=1080&h=554&bg=605FBA#https://i8.mifile.cn/v1/a1/feb57081-556d-70da-d9d4-9f8322f6b34f.webp?w=1080&h=518&bg=7F77C8#https://i8.mifile.cn/v1/a1/a3747b0a-7a8d-caf7-5662-2f38435a4813.webp?w=1080&h=819&bg=D3AEF7#https://i8.mifile.cn/v1/a1/e52463f8-10a7-28d9-98a2-67ae5baa7196.webp?w=1080&h=1495&bg=EDE9FA#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1a5a527300fd3f86c22a7aeb67858fe4.jpg?f=webp&w=1080&h=1350&bg=FFFFFF#https://i8.mifile.cn/v1/a1/e12aee35-f807-e212-3d19-4ae695d1d2e7.webp?w=1080&h=592&bg=E8E8E8#https://i8.mifile.cn/v1/a1/8d2e2961-2d62-f1ea-eb16-0efc554b7650.webp?w=1080&h=519&bg=E7E7E7#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#'),
(12,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9bdddda25c2fd78404cffb5dc608f23.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/36df28faaada581e8cdd530eeef817b9.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/22f848793321e402255af4eba8037da5.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c5d7a0341d88c0edebc8269b301161e9.jpg#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8742a9e44d82ef8c8a60483c4e4bacbd.jpg#',10000138,'Redmi 7',699,799,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/f0c04e138bfed2b1ebb589de615236d1.png!CPU!骁龙632八核#https://i8.mifile.cn/b2c-mimall-media/7692726e7a1dd34a3b1b4ede8aca020d.png!双摄像头!1200万+200万像素#https://i8.mifile.cn/b2c-mimall-media/86a3bd46cf4f7f19daa2c3250cf30604.png!超大屏!6.26英寸#https://i8.mifile.cn/b2c-mimall-media/a5ab24dcb527e49f970f13b11e000ab1.png!屏幕分辨率!1520×720#https://i8.mifile.cn/b2c-mimall-media/c8ec0829241324e401744da627482560.png!流畅!3GB#https://i8.mifile.cn/b2c-mimall-media/8941adac25333e785b9cc78ca11f4f27.png!存储容量!32GB#https://i8.mifile.cn/b2c-mimall-media/52ad10a73685342e437e44ea3d29cbff.png!普通厚度!8.47mm#https://i8.mifile.cn/b2c-mimall-media/0b4ea0fb21dde2f29df3c20de73539b9.png!超长待机!4000mAh#https://i8.mifile.cn/b2c-mimall-media/d1b67a407fb2a1ed42c2c0ce15af3318.png!运营商网络!4G全网通#https://i8.mifile.cn/b2c-mimall-media/bfd5ba9ae72c365dee42db14dfae4b0f.png!网络模式!双卡双待\r\n','「3GB+32GB，直降100，到手价699元」','4000mAh大电量 / 骁龙632八核处理器 / 6.26\"水滴全面屏，德国莱茵 T?V 认证护眼屏 / 18个月超长质保，康宁第五代大猩猩玻璃盖板 / 支持大字体、大音量模式，收音机、红外遥控功能','https://i8.mifile.cn/v1/a1/f4102566-3561-1488-f116-e303bbc6e757.webp?w=1080&h=760&bg=F6F5F7#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/019e93007332ceb9707d30934060661b.jpg?w=1080&h=1281&bg=8C82A4#https://i8.mifile.cn/v1/a1/652f7e3e-ee3b-6518-655b-81275642fc45.webp?w=1080&h=971&bg=F8F3FA#https://i8.mifile.cn/v1/a1/4a2c2c74-ed48-25da-4537-aaffdf7f70c3.webp?w=1080&h=197&bg=F8F0F6#https://i8.mifile.cn/v1/a1/1f53ad74-f8ce-18b8-5157-2abc41a5f4f4.webp?w=1080&h=663&bg=212021#https://i8.mifile.cn/v1/a1/1429f04f-eb9d-6e01-79cd-1bd1cdb1c1dc.webp?w=1080&h=608&bg=313438#https://i8.mifile.cn/v1/a1/5be9069c-b795-9e19-b1af-c96be6363a3e.webp?w=1080&h=451&bg=424949#https://i8.mifile.cn/v1/a1/55486dfc-42f4-280d-fa47-9f95c7a8e64d.webp?w=1080&h=1052&bg=E3E3E3#https://i8.mifile.cn/v1/a1/700d7f04-a0d5-3523-2a4c-1a2c507815c3.webp?w=1080&h=620&bg=CBC4D2#https://i8.mifile.cn/v1/a1/34c04315-ba38-08ea-7218-a615adc0e745.webp?w=1080&h=722&bg=8EA2C3#https://i8.mifile.cn/v1/a1/bb985171-0b62-1528-e653-98564ab86e77.webp?w=1080&h=633&bg=617379#https://i8.mifile.cn/v1/a1/73c3c5c6-113a-e486-911e-d009165d87f3.webp?w=1080&h=640&bg=E0E0E0#https://i8.mifile.cn/v1/a1/7ae62c07-dbed-6f06-eb4e-ca044480a9de.webp?w=1080&h=627&bg=E0E0E0#https://i8.mifile.cn/v1/a1/67eda46e-db8c-4dd5-5528-0dbc1385edb7.webp?w=1080&h=301&bg=ECECEC#https://i8.mifile.cn/v1/a1/e36dc61a-a730-7602-c73d-6ceeacfdea99.webp?w=1080&h=650&bg=E1E1E1#https://i8.mifile.cn/v1/a1/2c7957ab-510c-c58c-497d-6a8c1d6158d8.webp?w=1080&h=1309&bg=A49EB4#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/586d14f8e111d2c2eb798f2cd75d8c04.jpg?w=1080&h=1512&bg=221F1E#https://i8.mifile.cn/v1/a1/2a8e286e-4ba3-d711-7a72-d6e5191961ef.webp?w=1080&h=682&bg=E2E2E2#https://i8.mifile.cn/v1/a1/a11fd8af-7f7d-450a-1fc2-11a432e9e9fe.webp?w=1080&h=928&bg=9394C6#https://i8.mifile.cn/v1/a1/a4a182c5-3787-6eab-5911-d0c396fcc65a.webp?w=1080&h=825&bg=2C241F#https://i8.mifile.cn/v1/a1/c3d2077c-e39f-b606-0ec8-c2b91818b69a.webp?w=1080&h=553&bg=473126#https://i8.mifile.cn/v1/a1/2b5f793d-f7e7-542d-e4ac-537c4d4d3a57.webp?w=1080&h=737&bg=323232#https://i8.mifile.cn/v1/a1/eb6a2b15-dac0-8e14-260e-7dc727fdef50.webp?w=1080&h=790&bg=282828#https://i8.mifile.cn/v1/a1/76672fd0-07e2-90a7-8089-198b09222e17.webp?w=1080&h=823&bg=302929#https://i8.mifile.cn/v1/a1/1e63a403-9caf-f2ef-9a9d-dfa135ae947b.webp?w=1080&h=616&bg=DFDFDF#https://i8.mifile.cn/v1/a1/0515909b-0439-07f0-ca5d-de08ca60cdf8.webp?w=1080&h=1148&bg=AAABB6#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/785cea3b7c005af427927942e82a33b7.jpg?w=1080&h=1702&bg=ADB9DB#https://i8.mifile.cn/v1/a1/aeca6be3-28a6-951b-268c-d07ada2565ac.webp?w=1080&h=650&bg=0FAED6#https://i8.mifile.cn/v1/a1/8951095d-417a-43fa-3cb4-f1e8e5a97643.webp?w=1080&h=920&bg=CFBCEE#https://i8.mifile.cn/v1/a1/5098a332-ed07-6256-4653-c9d256129bd5.webp?w=1080&h=1091&bg=DDD7EE#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a25291ffd0de0bee816b64b2c0184c5e.jpg?w=1080&h=1316&bg=8D8EB6#https://i8.mifile.cn/v1/a1/a969d20c-c652-9442-9617-e27bdafe88dd.webp?w=1080&h=263&bg=F9F8F9#https://i8.mifile.cn/v1/a1/eb6db366-79aa-dbbc-d8ca-047bfa914e4e.webp?w=1080&h=720&bg=D1CFD7#https://i8.mifile.cn/v1/a1/2c56047c-c739-9637-f2cd-3c10cf84a333.webp?w=1080&h=425&bg=E9E9E9#https://i8.mifile.cn/v1/a1/6f901bfb-c25b-f291-c0d6-6f78ad3179bb.webp?w=1080&h=468&bg=E7E7E7#https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fc88fd153c1da1138fd621e00137d3e2.png?w=1080&h=427#');

/*Table structure for table `xiaomi_home` */

DROP TABLE IF EXISTS `xiaomi_home`;

CREATE TABLE `xiaomi_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `img_src_info` varchar(256) DEFAULT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  `goods_free` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_home` */

insert  into `xiaomi_home`(`id`,`goods_id`,`goods_name`,`img_src_info`,`goods_price`,`goods_del_price`,`goods_free`) values 
(1,10481,'变频滚筒洗衣机1A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2120e54d550c628550243e457951af5f.jpg?thumb=1&w=304&h=280',1199,NULL,'小身材大容量，洗得净'),
(2,9183,'米家空调','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b69cb2c28639d1716afafe4043e103d2.jpg?thumb=1&w=304&h=280',1499,NULL,'大1匹，静音，快速制冷热'),
(3,9161,'米家洗烘一体机','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4226c27d5063b6e6683c8e503948f35.jpg?thumb=1&w=304&h=280',1899,2299,'智能烘干，高效净衣'),
(4,9558,'互联网空调C1（一级能效）','https://i8.mifile.cn/v1/a1/bd2e8a38-8e71-5968-90a3-029e62b66562.webp',2299,2799,'1.5匹，自清洁，全直流变频'),
(5,9509,'波轮洗衣机1A','https://i8.mifile.cn/v1/a1/87f3c7e9-52e2-9702-2d6e-c3ee69e402bc.webp',699,799,'一键操作，父母都爱用'),
(6,9558,'米家互联网空调C1（一级能效）','https://i8.mifile.cn/v1/a1/ce8d4b39-18b3-5b8e-ea74-5a2c86856e20.webp',2299,2799,'1.5匹 ，自清洁，全直流变频，高效制冷'),
(7,9509,'Redmi波轮洗衣机1A','https://i8.mifile.cn/v1/a1/33c6d391-82a0-0fd2-2d0e-fb59f4679b6c.webp',699,NULL,'8kg大容量，一键操作，父母都爱用'),
(8,9183,'米家空调','https://i8.mifile.cn/v1/a1/adcd547b-ffa1-b9b2-8316-8ac7df801424.webp',1499,NULL,'大1匹，静音，快速制冷热'),
(9,9161,'米家洗烘一体机','https://i8.mifile.cn/v1/a1/994b51d7-4cf7-2a31-d97c-51e9343c9aa9.webp',1899,2299,'智能烘干，高效净衣，省水省电'),
(10,9665,'米家互联网立式空调C1','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fa9c03815ebc16391e0c22caaafd2329.jpg?thumb=1&w=338&h=338',3499,NULL,'2匹，高效制冷热，静音设计，全屋互联'),
(11,10481,'米家变频滚筒洗衣机1A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0cc71cc3aa1dff59d522096b01a618b9.jpg?thumb=1&w=338&h=338',1199,NULL,'8kg大容量，超薄机身，高效净衣'),
(12,9183,'米家空调','https://i8.mifile.cn/v1/a1/adcd547b-ffa1-b9b2-8316-8ac7df801424.webp',1499,NULL,'大1匹，静音，快速制冷热'),
(13,9665,'米家互联网立式空调C1','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fa9c03815ebc16391e0c22caaafd2329.jpg?thumb=1&w=338&h=338',3499,NULL,'2匹，高效制冷热，静音设计，全屋互联'),
(14,9558,'米家互联网空调C1（一级能效）','https://i8.mifile.cn/v1/a1/ce8d4b39-18b3-5b8e-ea74-5a2c86856e20.webp',2299,2799,'1.5匹 ，自清洁，全直流变频，高效制冷'),
(15,9557,'米家互联网空调C1','https://i8.mifile.cn/v1/a1/ccecfbb9-a809-f297-1bde-f283b1fb41c0.webp',1999,2399,'1.5匹，自清洁，变频，高效制冷热，全屋'),
(16,9144,'米家互联网空调（一级能效）','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/37ee50c27517abe7c531374dd0703e0a.jpg?thumb=1&w=338&h=338',2199,2699,'1.5匹，全直流变频，高效制冷热'),
(17,8634,'米家互联网空调','https://i8.mifile.cn/v1/a1/e1ba0221-e01c-0ee1-80ef-5b668f5518d2.webp',1899,2299,'1.5匹变频，高效制冷热，AI远程控制'),
(18,9959,'Redmi波轮洗衣机1S','https://i8.mifile.cn/v1/a1/7c344df9-3cbd-8627-d815-8fbbcbd6d033.webp',799,899,'<div class=\"brief\">小'),
(19,10509,'米家变频滚筒洗衣机1S ','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fd677836285f664503029b22ed6ce695.jpg?thumb=1&w=338&h=338',1299,NULL,'超薄机身大容量，除菌净衣更健康'),
(20,9509,'Redmi波轮洗衣机1A','https://i8.mifile.cn/v1/a1/33c6d391-82a0-0fd2-2d0e-fb59f4679b6c.webp',699,799,'8kg大容量，一键操作，父母都爱用'),
(21,10481,'米家变频滚筒洗衣机1A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0cc71cc3aa1dff59d522096b01a618b9.jpg?thumb=1&w=338&h=338',1199,NULL,'8kg大容量，超薄机身，高效净衣'),
(22,9960,'米家滚筒洗烘一体机1A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d36a58ce2ad7c4372ac8389f1f9ce478.jpg?thumb=1&w=338&h=338',1699,1999,'智能烘干，即洗即穿'),
(23,9963,'米家洗烘一体机Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/552e42b8706ee8d0bd3e048d2a5c4316.jpg?thumb=1&w=338&h=338',2999,NULL,'智能洗烘，高端品质，实用贴心'),
(24,10475,'米家扫拖一体机器人','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/84320cc3316843227870df7dd3950c6c.jpg?thumb=1&w=338&h=338',1999,NULL,'双重清洁 2100Pa大吸力 激光导航'),
(25,2392,'净水器厨上式增强版','https://i8.mifile.cn/v1/a1/8ac5b626-1800-3ded-03ae-b086264958ee.webp',1499,NULL,'400加仑大流量，纯水更多，废水更少'),
(26,9861,'米家互联网烟灶套装（天然气）','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2d1d1956d9edfe72148094163681e185.jpg?thumb=1&w=338&h=338',1999,2298,'烟灶联动，吸得快排得净'),
(27,10476,'米家空气净化器3','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/011b77ca31d21a7b5f5309d503dcafff.jpg?thumb=1&w=338&h=338',899,NULL,'400 m?/h颗粒物CADR 超强净化'),
(28,4738,'米家IH电饭煲 3L','https://i8.mifile.cn/v1/a1/070d67c4-aced-2088-8b64-de02220effbb.webp',369,NULL,'多才多艺的智能电饭煲'),
(29,6419,'米家电水壶 ','https://i8.mifile.cn/v1/a1/7f627650-cfee-cbff-1d24-c1f27e8fdb4c.webp',99,NULL,'1.5L 大容量，满足多人同时饮水'),
(30,10330,'米家微波炉','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e6384fe1e15cabb35c8b3eb2d9a797e4.jpg?thumb=1&w=338&h=338',399,NULL,'微晶平板速热、专项分类解冻'),
(31,9866,'米家电烤箱','https://i8.mifile.cn/v1/a1/2c6b1817-6103-df80-8930-3d97cb1f041b.webp',299,NULL,'化繁为简，献给对美食挑剔的你'),
(32,9144,'米家互联网空调（一级能效）','https://i8.mifile.cn/v1/a1/c585ed38-bee4-2f3c-c413-a1af154a74b3.webp?w=1080&h=1080',2199,2699,'1.5匹，全直流变频'),
(33,9963,'米家洗烘一体机Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/552e42b8706ee8d0bd3e048d2a5c4316.jpg?w=1080&h=1080',2999,2999,'智能洗烘，省心省力'),
(34,9183,'米家空调','https://i8.mifile.cn/v1/a1/75f5a1ad-e2c6-36a9-fd56-66d253cc0469.webp?w=1080&h=1080',1499,1799,'大1匹，静音，快速制冷热'),
(35,9161,'米家洗烘一体机','https://i8.mifile.cn/v1/a1/27721d21-782a-32e8-772b-462652d9acde.webp?w=1080&h=1080',1899,2299,'智能烘干，高效净衣'),
(36,9558,'米家互联网空调C1（一级能效）','https://i8.mifile.cn/v1/a1/ce8d4b39-18b3-5b8e-ea74-5a2c86856e20.webp?w=1080&h=1080',2299,2799,'1.5匹，自清洁，全直流变频'),
(37,9509,'Redmi波轮洗衣机1A','https://i8.mifile.cn/v1/a1/33c6d391-82a0-0fd2-2d0e-fb59f4679b6c.webp?w=1080&h=1080',699,799,'一键操作，父母都爱用');

/*Table structure for table `xiaomi_newgoods` */

DROP TABLE IF EXISTS `xiaomi_newgoods`;

CREATE TABLE `xiaomi_newgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(256) DEFAULT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_info` varchar(50) DEFAULT NULL,
  `goods_price` int(11) DEFAULT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_newgoods` */

insert  into `xiaomi_newgoods`(`id`,`img_src`,`goods_name`,`goods_info`,`goods_price`,`goods_del_price`) values 
(1,'https://i8.mifile.cn/v1/a1/ffb8aca8-9457-b7be-6d93-406d97b29a7f.webp','','',NULL,NULL),
(2,'https://i8.mifile.cn/v1/a1/eab3801c-ed91-c0f8-7f09-4d873c218647.webp','','',NULL,NULL),
(3,'https://i8.mifile.cn/v1/a1/9a4ac5e7-e675-8ac9-716d-95985e70ac28.webp','','',NULL,NULL),
(4,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ba2e3cf34aa9dfd78e51fd72cb26e81f.png?thumb=1&w=360&h=360','小米手环4','大屏彩显，20天超长续航',169,499),
(5,'https://i8.mifile.cn/v1/a1/1e9195dc-469c-2ba6-fd6d-3bcbd4230df1.webp','小米巨能写中性笔10支装','一支顶4支，超长顺滑书写',10,2298),
(6,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d36a58ce2ad7c4372ac8389f1f9ce478.jpg?thumb=1&w=360&h=360','米家滚筒洗烘一体机1A','智能烘干，即洗即穿',1699,1999),
(7,'https://i8.mifile.cn/v1/a1/b67f638e-ae86-f8da-79b6-c1d32d562cb4.webp','小爱音箱万能遥控版','传统家电秒变智能',179,199),
(8,'https://i8.mifile.cn/v1/a1/24bf795a-5518-545b-ead0-9db61c5e492b.webp','米家洗烘一体机1S','智能洗烘，品质生活',2499,899),
(9,'https://i8.mifile.cn/v1/a1/2c6b1817-6103-df80-8930-3d97cb1f041b.webp','米家电烤箱','全能烘焙体验',299,NULL),
(10,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8c8621a88d8a07bd7d45d53c50e90c4d.jpg?thumb=1&w=360&h=360','Redmi K20 Pro','骁龙855， 弹出全面屏',2299,2599),
(11,'https://i8.mifile.cn/v1/a1/b33e229a-f35d-f771-e788-0297e671aa12.webp','Redmi 7A','骁龙8核处理器',579,599),
(12,'https://i8.mifile.cn/v1/a1/5ca48230-4b5e-6b03-8db7-2be9191dfe71.webp','RedmiBook 14 独显版','超轻薄全金属独显笔记本',3999,NULL),
(13,'https://i8.mifile.cn/v1/a1/972a70f2-2752-6ab9-b2fe-44e011889586.webp','米家台灯1S','点亮健康自然光',169,179),
(14,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b1191cc4bf08bb5fe7a1822008a67427.jpg?thumb=1&w=360&h=360','小米米家智能门锁','一体化活体指纹识别',1299,NULL),
(15,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/26d19e55734e5310df09e382f7d16668.jpg?thumb=1&w=360&h=360','米家电动剃须刀 旋转双刀头','浮动双刀头 全身水洗',79,NULL),
(16,'https://i8.mifile.cn/v1/a1/4fa66f30-6d2f-917e-9193-e86b46272bec.webp','米家驱蚊器基础版 3个装','3个装 长效驱蚊',99,129),
(17,'https://i8.mifile.cn/v1/a1/c2ce7c01-24bc-6fcb-e03a-82dd0115f8ff.webp','米家驱蚊器基础版','长效驱蚊，静享整个夏天',39,49),
(18,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/43c93f0eada6fc78968f3dd8083c5774.jpg?thumb=1&w=360&h=360','Hape欢乐戏水套装','让宝宝爱上洗澡',49,599),
(19,'https://i8.mifile.cn/v1/a1/c637bd2a-1bbb-ce7b-0465-a6a89cd868d7.webp','AirDots 真无线蓝牙耳机','自动秒连，拿起就能用',100,NULL),
(20,'https://i8.mifile.cn/v1/a1/cc3b593d-c15c-ddc2-d333-69718ae13f91.webp','米家充气宝','便携电动打气筒',199,1299),
(21,'https://i8.mifile.cn/v1/a1/e4e73ccb-b59c-05fb-2a07-45a3aeb24951.webp','米家飞利浦蓝牙夜灯','感知照亮，多个组合联动',79,NULL),
(22,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a422563d32ae37190aa528cf6b63cede.jpg?thumb=1&w=360&h=360','小米蓝牙耳机（K歌版）','我的私人KTV',199,249),
(23,'https://i8.mifile.cn/v1/a1/2ca34b21-1eef-1826-a208-908c874220bb.webp','小米9','全息幻彩机身，骁龙855',2599,2999),
(24,'https://i8.mifile.cn/v1/a1/23edb4e3-9bcd-bdde-d972-86012b4a14a2.webp','小米小爱触屏音箱','好听，更好看',299,NULL),
(25,'https://i8.mifile.cn/v1/a1/e54b3222-f73c-f5ca-681e-90275a921611.webp','高速无线充套装','快速无线闪充，Qi充电标准',149,NULL),
(26,'https://i8.mifile.cn/v1/a1/e9a718b0-e088-5638-4850-a2cf16acfd60.webp','小米无线车充','电动变形，自动锁紧充电',169,NULL),
(27,'https://i8.mifile.cn/v1/a1/3cfa5e84-a176-540c-9799-94fe684af9b7.webp','米兔婴儿理发器','适合零经验爸妈使用',99,119),
(28,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ad33c1e8cc1ceb6197318118a3d2f16f.jpg?thumb=1&w=360&h=360','Redmi Note 7','4800万拍照 长续航',999,1199),
(29,'https://i8.mifile.cn/v1/a1/3a837402-4bea-a72b-d5fd-19f15de7cc27.webp','Redmi Note 7 贴膜','减少屏幕划伤和磨损',19,NULL),
(30,'https://i8.mifile.cn/v1/a1/9c4961fc-f481-78a8-7764-b566c727c876.webp','故事机 mini 蓝牙版','陪伴宝宝时时刻刻',139,149),
(31,'https://i8.mifile.cn/v1/a1/9cbb8a39-2da6-169d-8977-6a9fb245087f.webp','AMIRO日光镜礼盒','照的清晰，还原自然妆容',219,199),
(32,'https://i8.mifile.cn/v1/a1/0435ff65-2836-ba76-374e-38ae5a55d93f.webp','小米蓝牙耳机Air','真无线 乐享无限自由',369,399),
(33,'https://i8.mifile.cn/v1/a1/90da24e3-b342-ae5a-c6a4-b34a8dd8c2d3.webp','米家台灯Pro','全桌面立体光照',349,199),
(34,'https://i8.mifile.cn/v1/a1/214d8dba-0261-6363-e9fc-22837c720358.webp','米家飞天猪足金吊坠','一飞冲天好寓意',799,NULL),
(35,'https://i8.mifile.cn/v1/a1/27721d21-782a-32e8-772b-462652d9acde.webp','米家洗烘一体机','智能烘干，高效净衣',1899,2299),
(36,'https://i8.mifile.cn/v1/a1/716127f5-194e-6014-4d8b-0c2056ec5786.webp','米家小饭煲','小容量不浪费',199,NULL),
(37,'https://i8.mifile.cn/v1/a1/6c206af7-e862-4850-001a-20f63217f905.webp','小米米家智能插座WiFi版','让普通电器变智能',49,99),
(38,'https://i8.mifile.cn/v1/a1/d8da0f05-7faa-23f0-a2d9-ce33251fefcf.webp','米家水离子吹风机','快速吹干，深度补水',199,NULL),
(39,'https://i8.mifile.cn/v1/a1/6f5eb039-f0a2-e600-cb62-a6e11d829543.webp','米家金元宝足金红包','真心真“金”',99,3699),
(40,'https://i8.mifile.cn/v1/a1/e1c011e7-c195-4d12-57ef-2817782106d5.webp','小米Micro数据线 编织线版 （100cm）','高强度纤维编织线体',17,20),
(41,'https://i8.mifile.cn/v1/a1/274c5b28-51a2-70a0-689f-588fb2bc089a.webp','米兔积木 工程吊车','手中的奇迹',149,169),
(42,'https://i8.mifile.cn/v1/a1/951c2887-535c-7348-b313-9ee8bb58ba96.webp','小米蓝牙项圈耳机 青春版','轻盈随心，乐享不停',159,169),
(43,'https://i8.mifile.cn/v1/a1/0cb61f15-3255-2844-df2c-284d4619d335.webp','米兔折叠婴儿推车','出发去向往的地方',669,699),
(44,'https://i8.mifile.cn/v1/a1/5a9326ba-f2de-3684-8a3a-5419eab7df36.webp','小米小爱蓝牙音箱 随身版','小巧便携，一键唤醒小爱',49,NULL),
(45,'https://i8.mifile.cn/v1/a1/cac5739f-2455-aba6-d0fc-afa30161fd1e.webp','米物蓝牙双模键盘','联结多屏生活',219,249),
(46,'https://i8.mifile.cn/v1/a1/8b810e2b-c974-7786-3cc1-5960e2022c72.webp','米家初心足金手链','不忘初心，方得始终',399,NULL),
(47,'https://i8.mifile.cn/v1/a1/3b8fc4c2-6977-828d-464f-843b8c381c7e.webp','LUCKYME 万福足金祈运珠单颗手链','意随心动，运转自如',329,NULL),
(48,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7d4d94788f8591e5557a4c23c3ba4307.jpg?thumb=1&w=360&h=360','小米电视4A 58英寸','4K HDR，人工智能语音系统',2099,2999),
(49,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/949318d989255f3ac9c04796b7428dc5.jpg?thumb=1&w=360&h=360','小米小背包','小身材大容量， 更精彩！',29,NULL),
(50,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/ef288021164c70da7744f4f23702ed41.jpg?thumb=1&w=360&h=360','小米电视4X 43英寸','FHD全高清屏，人工智能语音',1199,1499),
(51,'https://i8.mifile.cn/v1/a1/8ac11e6d-f69c-d9d6-1200-452a6f2df0af.webp','小米电视4S 65英寸PRO','4K HDR，2GB+16GB大储存',3299,4099),
(52,'https://i8.mifile.cn/v1/a1/adb404a1-377d-0dce-4acb-542763e517f2.webp','90分防皱免烫衬衫男款','彰显儒雅绅士风度',199,NULL),
(53,'https://i8.mifile.cn/v1/a1/28306610-8eb4-a17a-9bf2-8cc6d0d04eab.webp','小米米家小白智能摄像机增强版','智能看护， AI你所爱',399,349),
(54,'https://i8.mifile.cn/v1/a1/42f47ab9-c80e-d146-1822-e7ff3880b015.webp','小米小爱智能闹钟','能听会说的人工智能闹钟',149,99),
(55,'https://i8.mifile.cn/v1/a1/3f0c9aaf-b2b4-e43e-ca44-3d0ba2941d75.webp','贝医生声波电动牙刷','声波净齿，软毛护龈',99,69),
(56,'https://i8.mifile.cn/v1/a1/7e9693cc-8693-d888-8999-dc7bbd02763c.webp','小米蓝牙耳机mini','美妙动听之声',75,79),
(57,'https://i8.mifile.cn/v1/a1/d60cc88b-b88f-752c-0e01-59738fd51dc7.webp','华来小方智能摄像机 1S','1080P清晰画质，安全看家',99,69),
(58,'https://i8.mifile.cn/v1/a1/d689452d-2aed-6904-d506-f70e1dd2e70d.webp','90分旅行箱 1A 26英寸','长途旅行航空托运箱',449,NULL),
(59,'https://i8.mifile.cn/v1/a1/0f5dc643-183c-5bce-8de3-0f0829e9c3d5.webp','游戏本i7 GTX1060','性能怪兽 信仰级游戏体验',8999,6299),
(60,'https://i8.mifile.cn/v1/a1/e4fdb6d2-341f-8757-616f-c7d7c3095a57.webp','TS近视镜 米家定制','极简风尚 超轻体验',299,229),
(61,'https://i8.mifile.cn/v1/a1/cf13e34e-1f5d-9b3d-d793-ea3db41240c7.webp','小米路由器4C','300M单频，高增益4天线',59,99),
(62,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7c90206cd0e0a2605d38e94a9cf82fcd.jpg?thumb=1&w=360&h=360','米家石英表','腕上的科技与美学',349,NULL),
(63,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a5be84661f1b82d1edef18f3a50a1b6f.jpg?thumb=1&w=360&h=360','小米平板4','大屏、长续航、超薄电脑',1099,NULL),
(64,'https://i8.mifile.cn/v1/a1/ba92347f-cba6-bfe9-d340-0696c775b2cb.webp','后视镜行车记录仪','简单语音控制 从此解放双手',399,948),
(65,'https://i8.mifile.cn/v1/a1/e67a4208-d6cd-c12d-4963-e6d1b5870d0a.webp','小默相机','发现新视角 自拍大不同',399,NULL),
(66,'https://i8.mifile.cn/v1/a1/14e547a4-bab2-ca3e-f888-505899f0a785.webp','米家运动鞋2','轻盈灵巧 动静皆宜',199,228),
(67,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b4f51e6bd0aac8873bab825639b6ba08.jpg?thumb=1&w=360&h=360','小米8','相机全新升级，骁龙845',2049,2999),
(68,'https://i8.mifile.cn/v1/a1/f9442cc6-d9c2-368e-3e8f-c82fa5f5fd3b.webp','小米8 SE','小屏旗舰机，AI超感光双摄',1599,1999),
(69,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/b17526d56cbad73cfc88d0be2d131f1c.jpg?thumb=1&w=360&h=360','小米电视4 75英寸','超薄金属机身，4K HDR',8999,3999),
(70,'https://i8.mifile.cn/v1/a1/521a4c1f-adad-f26c-1f83-987937121082.webp','小米头戴式蓝牙耳机','随时随地畅听好声音',279,299),
(71,'https://i8.mifile.cn/v1/a1/c9c2cd57-0baa-edd3-a7fd-db53fb892a03.webp','米家智能摄像机云台版','高清画质，守护家的每一面',189,199),
(72,'https://i8.mifile.cn/v1/a1/e35a387f-3511-423c-b3ae-eef026927f7d.webp','米兔卡片学习机','宝宝学习好 妈妈看得见',279,299),
(73,'https://i8.mifile.cn/v1/a1/c0d2639f-af0d-69c4-1290-a807bc549e48.webp','小米电视4S 55英寸 曲面','4000R 黄金曲率，金属机身',2499,2999),
(74,'https://i8.mifile.cn/v1/a1/9d1994f2-0dac-d9cc-5102-0b0c6752210c.webp','小米电视4C 32英寸','高清液晶屏，人工智能系统',699,799),
(75,'https://i8.mifile.cn/v1/a1/8e2dede7-5a09-38d0-28b7-5c9f03446956.webp','儿童电话手表2C','轻盈机身 高清通话',169,199),
(76,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/fe498de4ca4b5a0f0c51f99877d5032b.jpg?thumb=1&w=360&h=360','时怡每日坚果','科学搭配，每天一包',99,116),
(77,'https://i8.mifile.cn/v1/a1/a20cff3d-2bd4-b98f-4eb5-fb08d8b43a2e.webp','小米6X','前置2000万，后置2000万',999,1799),
(78,'https://i8.mifile.cn/v1/a1/06ae9d40-585e-b9d9-d6b6-2aae9158eb29.webp','悦米机械键盘Pro静音版','天生极简 精致由内到外',579,599),
(79,'https://i8.mifile.cn/v1/a1/4ae7bb1a-7342-2389-8eb8-c375df2ae00c.webp','小米电视4S 55英寸','4K HDR，人工智能语音',2599,NULL),
(80,'https://i8.mifile.cn/v1/a1/fafecf43-0429-eb6d-f986-b28d688d97de.webp','小米净水器1A（厨下式）','小身材节省空间，大流量直出纯净水',1499,NULL),
(81,'https://i8.mifile.cn/v1/a1/73a6a77a-53f3-4d28-6708-4389c1791334.webp','飞利浦智睿筒灯 可调色温版','冷暖随心调',59,999),
(82,'https://i8.mifile.cn/v1/a1/582fa7e8-2af5-cae6-a96a-a9d6b8976790.webp','小米双单元半入耳式耳机','半入耳式舒适佩戴',59,69),
(83,'https://i8.mifile.cn/v1/a1/06142d12-1dc5-7d5f-b44b-29c756d862f8.webp','米家电磁炉','双频火力，精准控温',269,299),
(84,'https://i8.mifile.cn/v1/a1/9a8eed2b-ca21-4718-37af-a49a6a3e4612.webp','小米蓝牙项圈耳机','挂在脖子上的好耳机',249,299),
(85,'https://i8.mifile.cn/v1/a1/79d60d24-ad3c-f883-5c15-0ba82bc4469b.webp','8H记忆绵护椎腰靠','处处体贴，为你撑腰',89,NULL),
(86,'https://i8.mifile.cn/v1/a1/44f2d298-35cc-dac9-fda6-e680c20aeda4.webp','米家便携电动剃须刀','男人必备的第二把剃须刀',179,NULL),
(87,'https://i8.mifile.cn/v1/a1/25975cfa-307d-021a-99c3-9fcd44431c0d.webp','米家蓝牙温湿度计','冷暖干湿，一目了然',69,NULL),
(88,'https://i8.mifile.cn/v1/a1/66e38543-5c71-c593-5634-15b6a043a6c1.webp','米家四位四控插线板（含3口USB 2A快充）','四位分控，随用随开',89,NULL),
(89,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7350c20f278ee91f505cfd9d7ab85a80.jpg?thumb=1&w=360&h=360','小米盒子4c','第4代小米盒子储存，体验双升级',199,NULL);

/*Table structure for table `xiaomi_newmodel` */

DROP TABLE IF EXISTS `xiaomi_newmodel`;

CREATE TABLE `xiaomi_newmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(256) DEFAULT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_info` varchar(50) DEFAULT NULL,
  `goods_price` int(11) DEFAULT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_newmodel` */

insert  into `xiaomi_newmodel`(`id`,`img_src`,`goods_name`,`goods_info`,`goods_price`,`goods_del_price`) values 
(1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ba2e3cf34aa9dfd78e51fd72cb26e81f.png?thumb=1&w=360&h=360','小米手环4','大屏彩显，20天超长续航',169,499),
(2,'https://i8.mifile.cn/v1/a1/1e9195dc-469c-2ba6-fd6d-3bcbd4230df1.webp','小米巨能写中性笔10支装','一支顶4支，超长顺滑书写',10,2298),
(3,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d36a58ce2ad7c4372ac8389f1f9ce478.jpg?thumb=1&w=360&h=360','米家滚筒洗烘一体机1A','智能烘干，即洗即穿',1699,1999),
(4,'https://i8.mifile.cn/v1/a1/b67f638e-ae86-f8da-79b6-c1d32d562cb4.webp','小爱音箱万能遥控版','传统家电秒变智能',179,199),
(5,'https://i8.mifile.cn/v1/a1/24bf795a-5518-545b-ead0-9db61c5e492b.webp','米家洗烘一体机1S','智能洗烘，品质生活',2499,899),
(6,'https://i8.mifile.cn/v1/a1/2c6b1817-6103-df80-8930-3d97cb1f041b.webp','米家电烤箱','全能烘焙体验',299,NULL),
(7,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8c8621a88d8a07bd7d45d53c50e90c4d.jpg?thumb=1&w=360&h=360','Redmi K20 Pro','骁龙855， 弹出全面屏',2299,2599),
(8,'https://i8.mifile.cn/v1/a1/b33e229a-f35d-f771-e788-0297e671aa12.webp','Redmi 7A','骁龙8核处理器',579,599),
(9,'https://i8.mifile.cn/v1/a1/5ca48230-4b5e-6b03-8db7-2be9191dfe71.webp','RedmiBook 14 独显版','超轻薄全金属独显笔记本',3999,NULL),
(10,'https://i8.mifile.cn/v1/a1/972a70f2-2752-6ab9-b2fe-44e011889586.webp','米家台灯1S','点亮健康自然光',169,179),
(11,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b1191cc4bf08bb5fe7a1822008a67427.jpg?thumb=1&w=360&h=360','小米米家智能门锁','一体化活体指纹识别',1299,NULL),
(12,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/26d19e55734e5310df09e382f7d16668.jpg?thumb=1&w=360&h=360','米家电动剃须刀 旋转双刀头','浮动双刀头 全身水洗',79,NULL),
(13,'https://i8.mifile.cn/v1/a1/4fa66f30-6d2f-917e-9193-e86b46272bec.webp','米家驱蚊器基础版 3个装','3个装 长效驱蚊',99,129),
(14,'https://i8.mifile.cn/v1/a1/c2ce7c01-24bc-6fcb-e03a-82dd0115f8ff.webp','米家驱蚊器基础版','长效驱蚊，静享整个夏天',39,49),
(15,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/43c93f0eada6fc78968f3dd8083c5774.jpg?thumb=1&w=360&h=360','Hape欢乐戏水套装','让宝宝爱上洗澡',49,599),
(16,'https://i8.mifile.cn/v1/a1/c637bd2a-1bbb-ce7b-0465-a6a89cd868d7.webp','AirDots 真无线蓝牙耳机','自动秒连，拿起就能用',100,NULL),
(17,'https://i8.mifile.cn/v1/a1/cc3b593d-c15c-ddc2-d333-69718ae13f91.webp','米家充气宝','便携电动打气筒',199,1299),
(18,'https://i8.mifile.cn/v1/a1/e4e73ccb-b59c-05fb-2a07-45a3aeb24951.webp','米家飞利浦蓝牙夜灯','感知照亮，多个组合联动',79,NULL),
(19,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a422563d32ae37190aa528cf6b63cede.jpg?thumb=1&w=360&h=360','小米蓝牙耳机（K歌版）','我的私人KTV',199,249),
(20,'https://i8.mifile.cn/v1/a1/2ca34b21-1eef-1826-a208-908c874220bb.webp','小米9','全息幻彩机身，骁龙855',2599,2999),
(21,'https://i8.mifile.cn/v1/a1/23edb4e3-9bcd-bdde-d972-86012b4a14a2.webp','小米小爱触屏音箱','好听，更好看',299,NULL),
(22,'https://i8.mifile.cn/v1/a1/e54b3222-f73c-f5ca-681e-90275a921611.webp','高速无线充套装','快速无线闪充，Qi充电标准',149,NULL),
(23,'https://i8.mifile.cn/v1/a1/e9a718b0-e088-5638-4850-a2cf16acfd60.webp','小米无线车充','电动变形，自动锁紧充电',169,NULL),
(24,'https://i8.mifile.cn/v1/a1/3cfa5e84-a176-540c-9799-94fe684af9b7.webp','米兔婴儿理发器','适合零经验爸妈使用',99,119),
(25,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ad33c1e8cc1ceb6197318118a3d2f16f.jpg?thumb=1&w=360&h=360','Redmi Note 7','4800万拍照 长续航',999,1199),
(26,'https://i8.mifile.cn/v1/a1/3a837402-4bea-a72b-d5fd-19f15de7cc27.webp','Redmi Note 7 贴膜','减少屏幕划伤和磨损',19,NULL),
(27,'https://i8.mifile.cn/v1/a1/9c4961fc-f481-78a8-7764-b566c727c876.webp','故事机 mini 蓝牙版','陪伴宝宝时时刻刻',139,149),
(28,'https://i8.mifile.cn/v1/a1/9cbb8a39-2da6-169d-8977-6a9fb245087f.webp','AMIRO日光镜礼盒','照的清晰，还原自然妆容',219,199),
(29,'https://i8.mifile.cn/v1/a1/0435ff65-2836-ba76-374e-38ae5a55d93f.webp','小米蓝牙耳机Air','真无线 乐享无限自由',369,399),
(30,'https://i8.mifile.cn/v1/a1/90da24e3-b342-ae5a-c6a4-b34a8dd8c2d3.webp','米家台灯Pro','全桌面立体光照',349,199),
(31,'https://i8.mifile.cn/v1/a1/214d8dba-0261-6363-e9fc-22837c720358.webp','米家飞天猪足金吊坠','一飞冲天好寓意',799,NULL),
(32,'https://i8.mifile.cn/v1/a1/27721d21-782a-32e8-772b-462652d9acde.webp','米家洗烘一体机','智能烘干，高效净衣',1899,2299),
(33,'https://i8.mifile.cn/v1/a1/716127f5-194e-6014-4d8b-0c2056ec5786.webp','米家小饭煲','小容量不浪费',199,NULL),
(34,'https://i8.mifile.cn/v1/a1/6c206af7-e862-4850-001a-20f63217f905.webp','小米米家智能插座WiFi版','让普通电器变智能',49,99),
(35,'https://i8.mifile.cn/v1/a1/d8da0f05-7faa-23f0-a2d9-ce33251fefcf.webp','米家水离子吹风机','快速吹干，深度补水',199,NULL),
(36,'https://i8.mifile.cn/v1/a1/6f5eb039-f0a2-e600-cb62-a6e11d829543.webp','米家金元宝足金红包','真心真“金”',99,3699),
(37,'https://i8.mifile.cn/v1/a1/e1c011e7-c195-4d12-57ef-2817782106d5.webp','小米Micro数据线 编织线版 （100cm）','高强度纤维编织线体',17,20),
(38,'https://i8.mifile.cn/v1/a1/274c5b28-51a2-70a0-689f-588fb2bc089a.webp','米兔积木 工程吊车','手中的奇迹',149,169),
(39,'https://i8.mifile.cn/v1/a1/951c2887-535c-7348-b313-9ee8bb58ba96.webp','小米蓝牙项圈耳机 青春版','轻盈随心，乐享不停',159,169),
(40,'https://i8.mifile.cn/v1/a1/0cb61f15-3255-2844-df2c-284d4619d335.webp','米兔折叠婴儿推车','出发去向往的地方',669,699),
(41,'https://i8.mifile.cn/v1/a1/5a9326ba-f2de-3684-8a3a-5419eab7df36.webp','小米小爱蓝牙音箱 随身版','小巧便携，一键唤醒小爱',49,NULL),
(42,'https://i8.mifile.cn/v1/a1/cac5739f-2455-aba6-d0fc-afa30161fd1e.webp','米物蓝牙双模键盘','联结多屏生活',219,249),
(43,'https://i8.mifile.cn/v1/a1/8b810e2b-c974-7786-3cc1-5960e2022c72.webp','米家初心足金手链','不忘初心，方得始终',399,NULL),
(44,'https://i8.mifile.cn/v1/a1/3b8fc4c2-6977-828d-464f-843b8c381c7e.webp','LUCKYME 万福足金祈运珠单颗手链','意随心动，运转自如',329,NULL),
(45,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7d4d94788f8591e5557a4c23c3ba4307.jpg?thumb=1&w=360&h=360','小米电视4A 58英寸','4K HDR，人工智能语音系统',2099,2999),
(46,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/949318d989255f3ac9c04796b7428dc5.jpg?thumb=1&w=360&h=360','小米小背包','小身材大容量， 更精彩！',29,NULL),
(47,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/ef288021164c70da7744f4f23702ed41.jpg?thumb=1&w=360&h=360','小米电视4X 43英寸','FHD全高清屏，人工智能语音',1199,1499),
(48,'https://i8.mifile.cn/v1/a1/8ac11e6d-f69c-d9d6-1200-452a6f2df0af.webp','小米电视4S 65英寸PRO','4K HDR，2GB+16GB大储存',3299,4099),
(49,'https://i8.mifile.cn/v1/a1/adb404a1-377d-0dce-4acb-542763e517f2.webp','90分防皱免烫衬衫男款','彰显儒雅绅士风度',199,NULL),
(50,'https://i8.mifile.cn/v1/a1/28306610-8eb4-a17a-9bf2-8cc6d0d04eab.webp','小米米家小白智能摄像机增强版','智能看护， AI你所爱',399,349),
(51,'https://i8.mifile.cn/v1/a1/42f47ab9-c80e-d146-1822-e7ff3880b015.webp','小米小爱智能闹钟','能听会说的人工智能闹钟',149,99),
(52,'https://i8.mifile.cn/v1/a1/3f0c9aaf-b2b4-e43e-ca44-3d0ba2941d75.webp','贝医生声波电动牙刷','声波净齿，软毛护龈',99,69),
(53,'https://i8.mifile.cn/v1/a1/7e9693cc-8693-d888-8999-dc7bbd02763c.webp','小米蓝牙耳机mini','美妙动听之声',75,79),
(54,'https://i8.mifile.cn/v1/a1/d60cc88b-b88f-752c-0e01-59738fd51dc7.webp','华来小方智能摄像机 1S','1080P清晰画质，安全看家',99,69),
(55,'https://i8.mifile.cn/v1/a1/d689452d-2aed-6904-d506-f70e1dd2e70d.webp','90分旅行箱 1A 26英寸','长途旅行航空托运箱',449,NULL),
(56,'https://i8.mifile.cn/v1/a1/0f5dc643-183c-5bce-8de3-0f0829e9c3d5.webp','游戏本i7 GTX1060','性能怪兽 信仰级游戏体验',8999,6299),
(57,'https://i8.mifile.cn/v1/a1/e4fdb6d2-341f-8757-616f-c7d7c3095a57.webp','TS近视镜 米家定制','极简风尚 超轻体验',299,229),
(58,'https://i8.mifile.cn/v1/a1/cf13e34e-1f5d-9b3d-d793-ea3db41240c7.webp','小米路由器4C','300M单频，高增益4天线',59,99),
(59,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7c90206cd0e0a2605d38e94a9cf82fcd.jpg?thumb=1&w=360&h=360','米家石英表','腕上的科技与美学',349,NULL),
(60,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a5be84661f1b82d1edef18f3a50a1b6f.jpg?thumb=1&w=360&h=360','小米平板4','大屏、长续航、超薄电脑',1099,NULL),
(61,'https://i8.mifile.cn/v1/a1/ba92347f-cba6-bfe9-d340-0696c775b2cb.webp','后视镜行车记录仪','简单语音控制 从此解放双手',399,948),
(62,'https://i8.mifile.cn/v1/a1/e67a4208-d6cd-c12d-4963-e6d1b5870d0a.webp','小默相机','发现新视角 自拍大不同',399,NULL),
(63,'https://i8.mifile.cn/v1/a1/14e547a4-bab2-ca3e-f888-505899f0a785.webp','米家运动鞋2','轻盈灵巧 动静皆宜',199,228),
(64,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b4f51e6bd0aac8873bab825639b6ba08.jpg?thumb=1&w=360&h=360','小米8','相机全新升级，骁龙845',2049,2999),
(65,'https://i8.mifile.cn/v1/a1/f9442cc6-d9c2-368e-3e8f-c82fa5f5fd3b.webp','小米8 SE','小屏旗舰机，AI超感光双摄',1599,1999),
(66,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/b17526d56cbad73cfc88d0be2d131f1c.jpg?thumb=1&w=360&h=360','小米电视4 75英寸','超薄金属机身，4K HDR',8999,3999),
(67,'https://i8.mifile.cn/v1/a1/521a4c1f-adad-f26c-1f83-987937121082.webp','小米头戴式蓝牙耳机','随时随地畅听好声音',279,299),
(68,'https://i8.mifile.cn/v1/a1/c9c2cd57-0baa-edd3-a7fd-db53fb892a03.webp','米家智能摄像机云台版','高清画质，守护家的每一面',189,199),
(69,'https://i8.mifile.cn/v1/a1/e35a387f-3511-423c-b3ae-eef026927f7d.webp','米兔卡片学习机','宝宝学习好 妈妈看得见',279,299),
(70,'https://i8.mifile.cn/v1/a1/c0d2639f-af0d-69c4-1290-a807bc549e48.webp','小米电视4S 55英寸 曲面','4000R 黄金曲率，金属机身',2499,2999),
(71,'https://i8.mifile.cn/v1/a1/9d1994f2-0dac-d9cc-5102-0b0c6752210c.webp','小米电视4C 32英寸','高清液晶屏，人工智能系统',699,799),
(72,'https://i8.mifile.cn/v1/a1/8e2dede7-5a09-38d0-28b7-5c9f03446956.webp','儿童电话手表2C','轻盈机身 高清通话',169,199),
(73,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/fe498de4ca4b5a0f0c51f99877d5032b.jpg?thumb=1&w=360&h=360','时怡每日坚果','科学搭配，每天一包',99,116),
(74,'https://i8.mifile.cn/v1/a1/a20cff3d-2bd4-b98f-4eb5-fb08d8b43a2e.webp','小米6X','前置2000万，后置2000万',999,1799),
(75,'https://i8.mifile.cn/v1/a1/06ae9d40-585e-b9d9-d6b6-2aae9158eb29.webp','悦米机械键盘Pro静音版','天生极简 精致由内到外',579,599),
(76,'https://i8.mifile.cn/v1/a1/4ae7bb1a-7342-2389-8eb8-c375df2ae00c.webp','小米电视4S 55英寸','4K HDR，人工智能语音',2599,NULL),
(77,'https://i8.mifile.cn/v1/a1/fafecf43-0429-eb6d-f986-b28d688d97de.webp','小米净水器1A（厨下式）','小身材节省空间，大流量直出纯净水',1499,NULL),
(78,'https://i8.mifile.cn/v1/a1/73a6a77a-53f3-4d28-6708-4389c1791334.webp','飞利浦智睿筒灯 可调色温版','冷暖随心调',59,999),
(79,'https://i8.mifile.cn/v1/a1/582fa7e8-2af5-cae6-a96a-a9d6b8976790.webp','小米双单元半入耳式耳机','半入耳式舒适佩戴',59,69),
(80,'https://i8.mifile.cn/v1/a1/06142d12-1dc5-7d5f-b44b-29c756d862f8.webp','米家电磁炉','双频火力，精准控温',269,299),
(81,'https://i8.mifile.cn/v1/a1/9a8eed2b-ca21-4718-37af-a49a6a3e4612.webp','小米蓝牙项圈耳机','挂在脖子上的好耳机',249,299),
(82,'https://i8.mifile.cn/v1/a1/79d60d24-ad3c-f883-5c15-0ba82bc4469b.webp','8H记忆绵护椎腰靠','处处体贴，为你撑腰',89,NULL),
(83,'https://i8.mifile.cn/v1/a1/44f2d298-35cc-dac9-fda6-e680c20aeda4.webp','米家便携电动剃须刀','男人必备的第二把剃须刀',179,NULL),
(84,'https://i8.mifile.cn/v1/a1/25975cfa-307d-021a-99c3-9fcd44431c0d.webp','米家蓝牙温湿度计','冷暖干湿，一目了然',69,NULL),
(85,'https://i8.mifile.cn/v1/a1/66e38543-5c71-c593-5634-15b6a043a6c1.webp','米家四位四控插线板（含3口USB 2A快充）','四位分控，随用随开',89,NULL),
(86,'https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/7350c20f278ee91f505cfd9d7ab85a80.jpg?thumb=1&w=360&h=360','小米盒子4c','第4代小米盒子储存，体验双升级',199,NULL);

/*Table structure for table `xiaomi_notebookcomputer` */

DROP TABLE IF EXISTS `xiaomi_notebookcomputer`;

CREATE TABLE `xiaomi_notebookcomputer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `img_src_info` varchar(256) DEFAULT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  `goods_free` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_notebookcomputer` */

insert  into `xiaomi_notebookcomputer`(`id`,`goods_id`,`goods_name`,`img_src_info`,`goods_price`,`goods_del_price`,`goods_free`) values 
(1,10000170,'RedmiBook 14','https://i8.mifile.cn/v1/a1/5ca48230-4b5e-6b03-8db7-2be9191dfe71.webp',3199,NULL,'增强版酷睿? 轻薄便携长续航'),
(2,10000171,'小米笔记本15.6\"','https://i8.mifile.cn/v1/a1/3e9c8e72-8d07-e0e9-1ef5-66d7a08b17f4.webp',3399,NULL,'全面均衡的国民轻薄本'),
(3,10000113,'小米游戏本','https://i8.mifile.cn/v1/a1/0f5dc643-183c-5bce-8de3-0f0829e9c3d5.webp',5999,NULL,'小米游戏本 电竞级性能怪兽'),
(4,10000114,'Pro 15.6\" GTX版','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/cd919151c6f7340c19fabc5c8e5f884d.jpg',5999,NULL,'更强悍的专业笔记本'),
(5,10000144,'Pro 15.6\" 2019款','https://i8.mifile.cn/v1/a1/b186443c-f56b-4c72-030a-b56e43466ab1.webp',5599,NULL,'MX250独立显卡 全金属强化机身'),
(6,10000142,'Air 13.3\" 2019款','https://i8.mifile.cn/v1/a1/835f93ff-2b4e-89ae-64ee-230656e2fc87.webp',4999,NULL,'独立显卡 指纹解锁'),
(7,10000145,'Air 12.5\" 2019款','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d3480d56fd89dc2f80e2ec1653e718d1.jpg',3599,NULL,'全金属机身，极简设计，像杂志般便携'),
(8,9061,'米物蓝牙双模键盘','https://i8.mifile.cn/v1/a1/cac5739f-2455-aba6-d0fc-afa30161fd1e.webp',199,249,'联结多屏生活 沟通如此简单'),
(9,8125,'小米游戏鼠标','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2fab3b3231427353dd585afeabaef351.jpg?thumb=1&w=338&h=338',199,249,'掌中游戏利器，为真玩家而生'),
(10,4679,'小米便携鼠标','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/529291c1154d6c914195da353150804a.jpg?thumb=1&w=338&h=338',79,99,'轻薄便携，含电池仅重77.5g'),
(11,10018,'红轴机械键盘 CHERRY版','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e0db9c8bbb1a3e968f5b13f048e03ce2.jpg?thumb=1&w=338&h=338',299,349,'甄选CHERRY轴体，具有电竞性能的机械'),
(12,9511,'Air 12.5\" 2019款','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d241596004d7cafafcad0b9a17638e8.jpg',3599,3599,'像杂志一样随身携带'),
(13,10000142,'Air 13.3\" 2019款','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/399cfcaa4aae2766733e46704935bdd4.jpg',4999,4999,'新一代独立显卡'),
(14,10000144,'Pro 15.6\" 2019款','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/43f9a118c5f742b9a29360beda770dcd.jpg',4999,5599,'强悍的专业笔记本'),
(15,10000141,'笔记本15.6\"  独显版','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ff646eb3db372e455a7154331fa58d53.jpg',3799,3999,'全面均衡的国民轻薄本'),
(16,10000113,'小米游戏本','https://i8.mifile.cn/v1/a1/1ed6a607-21e5-8d85-e0e9-dfb07571fc6a.webp',5999,7499,'冷酷的性能怪兽'),
(17,10000114,'Pro 15.6\" GTX版','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4f09569618c64e3f6f36d1be6922e3cc.jpg',5999,6299,'更强悍的专业笔记本');

/*Table structure for table `xiaomi_order` */

DROP TABLE IF EXISTS `xiaomi_order`;

CREATE TABLE `xiaomi_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_no` varchar(20) DEFAULT NULL,
  `o_price` double NOT NULL,
  `o_state` int(11) NOT NULL,
  `o_qita` varchar(50) NOT NULL,
  `o_qita2` varchar(50) NOT NULL,
  `o_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xiaomi_order_o_user_id_9648c6c3_fk_xiaomi_user_id` (`o_user_id`),
  CONSTRAINT `xiaomi_order_o_user_id_9648c6c3_fk_xiaomi_user_id` FOREIGN KEY (`o_user_id`) REFERENCES `xiaomi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_order` */

/*Table structure for table `xiaomi_orderdetail` */

DROP TABLE IF EXISTS `xiaomi_orderdetail`;

CREATE TABLE `xiaomi_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_goods_num` int(11) NOT NULL,
  `o_goods_id` int(11) NOT NULL,
  `o_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xiaomi_orderdetail_o_goods_id_401c2ce0_fk_xiaomi_goods_id` (`o_goods_id`),
  KEY `xiaomi_orderdetail_o_order_id_c213ccf7_fk_xiaomi_order_id` (`o_order_id`),
  CONSTRAINT `xiaomi_orderdetail_o_goods_id_401c2ce0_fk_xiaomi_goods_id` FOREIGN KEY (`o_goods_id`) REFERENCES `xiaomi_goods` (`id`),
  CONSTRAINT `xiaomi_orderdetail_o_order_id_c213ccf7_fk_xiaomi_order_id` FOREIGN KEY (`o_order_id`) REFERENCES `xiaomi_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_orderdetail` */

/*Table structure for table `xiaomi_phone` */

DROP TABLE IF EXISTS `xiaomi_phone`;

CREATE TABLE `xiaomi_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `img_src_info` varchar(256) DEFAULT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  `goods_free` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_phone` */

insert  into `xiaomi_phone`(`id`,`goods_id`,`goods_name`,`img_src_info`,`goods_price`,`goods_del_price`,`goods_free`) values 
(1,10000134,'小米9','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/90a5b4bd85d91913c2fdba6abdaed291.jpg',2599,NULL,'全曲面轻薄机身，骁龙855处理器 '),
(2,10000131,'Redmi Note 7','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/905c13a84d8b70c9b9f4e3dee10a9515.jpg',999,NULL,'4800万拍照 长续航'),
(3,10000152,'Redmi 7A','https://i8.mifile.cn/v1/a1/22f203ab-44f4-6b89-06b4-e01e6f00c7f8.webp',599,NULL,'骁龙8核处理器'),
(4,10000138,'Redmi 7 ','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f5e8faabd72ee160e245447357f1708e.jpg',699,NULL,'4000mAh超长续航'),
(5,10000151,'Redmi K20 Pro ','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dc1255fd3e70b6cdd6409627ca59d3f7.jpg',2299,NULL,'骁龙855， 弹出全面屏'),
(6,10000123,'小米MIX 3','https://i8.mifile.cn/v1/a1/b7ad9e53-bc1e-dcc9-3175-3221cc043d64.webp',2599,NULL,'DxO百分拍照手机'),
(7,9455,'Redmi Note 7 Pro','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/905c13a84d8b70c9b9f4e3dee10a9515.jpg',1399,NULL,'索尼4800万超清拍照 '),
(8,10000150,'Redmi K20','https://i8.mifile.cn/v1/a1/86143982-11ca-5249-e90c-eecfdb9b98a0.webp',1999,NULL,'弹出全面屏，4800万三摄'),
(9,10000135,'小米9 SE','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f60a62681716e39153315efce0ef308a.jpg',1799,NULL,'索尼4800万三摄，骁龙712'),
(10,10000111,'小米Max 3','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c423f95037aba13b7c7fa5c583fe3dda.jpg',1299,NULL,'超大屏，超大电量');

/*Table structure for table `xiaomi_producttype` */

DROP TABLE IF EXISTS `xiaomi_producttype`;

CREATE TABLE `xiaomi_producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL,
  `typename` varchar(50) NOT NULL,
  `childtypenames` varchar(200) NOT NULL,
  `typesort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_producttype` */

insert  into `xiaomi_producttype`(`id`,`typeid`,`typename`,`childtypenames`,`typesort`) values 
(1,653,'新品','手机:111111#家电:111112#电脑:111113',0),
(2,871,'出行车载','出行:111114',0),
(3,1062,'办公用品','办公用品:111115',0),
(4,1047,'厨电','厨房家电:111116',0),
(5,874,'穿戴酷玩','穿戴:111117#智能酷玩:111118',0),
(6,1081,'床品家具','床品家具:111119',0),
(7,459,'电脑','电脑:111120#电脑配件:111121',0),
(8,458,'电视','电视:111122#盒子:111123#音箱:111124#电视配件与会员:111125',0),
(9,463,'电源插座','电源:111126#插线板:111127#充电器:111128',0);

/*Table structure for table `xiaomi_show` */

DROP TABLE IF EXISTS `xiaomi_show`;

CREATE TABLE `xiaomi_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src_info` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_show` */

/*Table structure for table `xiaomi_user` */

DROP TABLE IF EXISTS `xiaomi_user`;

CREATE TABLE `xiaomi_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_phone` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_password` varchar(256) NOT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_pic` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_phone` (`u_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_user` */

/*Table structure for table `xiaomi_userevaluate` */

DROP TABLE IF EXISTS `xiaomi_userevaluate`;

CREATE TABLE `xiaomi_userevaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `user_star` int(11) NOT NULL,
  `user_time` datetime(6) NOT NULL,
  `user_text` longtext NOT NULL,
  `user_pic` longtext NOT NULL,
  `user_good` int(11) NOT NULL,
  `user_official` longtext NOT NULL,
  `user_official_good` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xiaomi_userevaluate_user_name_id_08a5b328_fk_xiaomi_user_id` (`user_name_id`),
  CONSTRAINT `xiaomi_userevaluate_user_name_id_08a5b328_fk_xiaomi_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `xiaomi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_userevaluate` */

/*Table structure for table `xiaomi_watchTV` */

DROP TABLE IF EXISTS `xiaomi_watchTV`;

CREATE TABLE `xiaomi_watchTV` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `img_src_info` varchar(256) DEFAULT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_del_price` int(11) DEFAULT NULL,
  `goods_free` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_watchTV` */

insert  into `xiaomi_watchTV`(`id`,`goods_id`,`goods_name`,`img_src_info`,`goods_price`,`goods_del_price`,`goods_free`) values 
(1,9681,'全面屏电视E32A','https://i8.mifile.cn/v1/a1/a15a521f-d31b-4808-5e5b-6341e1c22586.webp',699,1099,'全面屏设计，人工智能语音，内置小爱同学'),
(2,9668,'全面屏电视E55A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/405b6af5950d950264ad8b1510866f22.jpg',1999,2099,'全面屏设计，人工智能语音，内置小爱同学'),
(3,8909,'小米电视4C 40英寸','https://i8.mifile.cn/v1/a1/31c15dbe-00a7-6a95-803c-141280a0bf6a.webp',1099,1299,'FHD全高清屏，钢琴烤漆，人工智能系统'),
(4,9668,'全面屏电视E55A','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/405b6af5950d950264ad8b1510866f22.jpg',1999,2099,'全面屏设计，人工智能语音，内置小爱同学'),
(5,9680,'全面屏电视E43A','https://i8.mifile.cn/v1/a1/2d984320-7223-f612-3f88-f4bdc1f4a94a.webp',1299,1999,'全面屏设计，人工智能语音，内置小爱同学'),
(6,5353,'小米电视4A 65英寸','https://i8.mifile.cn/v1/a1/b509d62f-a10a-6559-94f4-852b401815fb.webp',2699,2999,'4K HDR，人工智能语音系统，超窄边设'),
(7,7911,'电视4A 43\" 青春版','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7eb30cb1b05392fc23fa93656a8f0c9d.jpg',1199,1499,'人工智能语音，FHD全高清屏'),
(8,8912,'小米电视4X 43英寸','https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/ef288021164c70da7744f4f23702ed41.jpg',1199,1499,'FHD全高清屏，人工智能语音，钢琴烤漆'),
(9,10125,'全面屏电视E40A','https://i8.mifile.cn/v1/a1/98142356-5e5c-0476-5083-b4d94b77ec42.webp',1299,1399,'全面屏设计，人工智能语音，内置小爱同学'),
(10,8993,'小米电视4S 75英寸','https://i8.mifile.cn/v1/a1/6de225b3-9729-513b-6fa1-077e78fe99ad.webp',5199,6999,'4K HDR，人工智能语音，金属机身'),
(11,5353,'小米电视4A 65英寸','https://i8.mifile.cn/v1/a1/82003442-c6b7-3258-cc7a-2a851216ce8a.webp?w=516&h=420',2699,2999,'4K HDR，人工智能语音系统'),
(12,8912,'小米电视4X 43英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7cd59729b9a02407979848839c0e5343.jpg',1199,1499,'FHD全高清屏，人工智能语音'),
(13,7795,'小米电视4C 50英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/896d989bcdae584906c36f4a4e5fa89b.jpg?w=516&h=420',1599,1699,'4K HDR，钢琴烤漆'),
(14,6628,'小米电视4C 55英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4b624a157d24822509e1f54316c8417a.jpg',1799,1999,'4K HDR，人工智能系统'),
(15,6222,'小米电视4A 32英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3d20e4c39b6967319e89b1f779332b0e.jpg?w=516&h=420',699,799,'人工智能系统，高清液晶屏'),
(16,7575,'小米电视4A 50英寸','https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/06bd0cdc9a6d3cc76850633a8ffb9d74.png?w=516&h=420',1599,1699,'4K HDR，人工智能语音系统');

/*Table structure for table `xiaomi_wheel` */

DROP TABLE IF EXISTS `xiaomi_wheel`;

CREATE TABLE `xiaomi_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `xiaomi_wheel` */

insert  into `xiaomi_wheel`(`id`,`img_src`) values 
(1,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1b60985ab85ea08749ab1341128d6ff2.jpg?f=webp&w=1080&h=540&bg=2'),
(2,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/daa1a7865f25d2483f2dc487de0dcaad.jpg?f=webp&w=1080&h=540&bg=BD5395'),
(3,'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ba7f5e6aa4dd945bce436a9f1301b8ab.jpg?f=webp&w=1080&h=540&bg=4A0F');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
