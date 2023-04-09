/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.32 : Database - rainng_course
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rainng_course` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rainng_course`;

/*Table structure for table `rc_admin` */

DROP TABLE IF EXISTS `rc_admin`;

CREATE TABLE `rc_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) NOT NULL,
  `admin_password` char(32) NOT NULL,
  `admin_privilege` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `idx_admin_username` (`admin_username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `rc_admin` */

insert  into `rc_admin`(`admin_id`,`admin_username`,`admin_password`,`admin_privilege`) values (1,'admin','123456',56);

/*Table structure for table `rc_class` */

DROP TABLE IF EXISTS `rc_class`;

CREATE TABLE `rc_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_major_id` int(10) unsigned NOT NULL,
  `class_grade` int(10) unsigned NOT NULL,
  `class_name` varchar(32) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk_major_id` (`class_major_id`) USING BTREE,
  KEY `idx_class_name` (`class_name`) USING BTREE,
  CONSTRAINT `rc_class_ibfk_1` FOREIGN KEY (`class_major_id`) REFERENCES `rc_major` (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `rc_class` */

insert  into `rc_class`(`class_id`,`class_major_id`,`class_grade`,`class_name`) values (1,1,2017,'计科3班'),(2,1,2019,'计科1班'),(3,4,2017,'哲学1班'),(4,5,2017,'测试班级1'),(5,5,2017,'测试班级2'),(6,5,2017,'测试班级3'),(7,5,2017,'测试班级4'),(8,5,2017,'测试班级5'),(9,5,2017,'测试班级6'),(10,5,2017,'测试班级7'),(11,5,2017,'测试班级8'),(12,5,2017,'测试班级9');

/*Table structure for table `rc_course` */

DROP TABLE IF EXISTS `rc_course`;

CREATE TABLE `rc_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_teacher_id` int(10) unsigned NOT NULL,
  `course_name` varchar(64) NOT NULL,
  `course_grade` int(10) unsigned NOT NULL,
  `course_time` varchar(16) NOT NULL,
  `course_location` varchar(32) NOT NULL,
  `course_credit` int(10) unsigned NOT NULL,
  `course_selected_count` int(10) unsigned NOT NULL DEFAULT '0',
  `course_max_size` int(10) unsigned NOT NULL,
  `course_exam_date` datetime DEFAULT NULL,
  `course_exam_location` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_course_teacher_id` (`course_teacher_id`) USING BTREE,
  KEY `idx_course_name` (`course_name`) USING BTREE,
  CONSTRAINT `rc_course_ibfk_1` FOREIGN KEY (`course_teacher_id`) REFERENCES `rc_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `rc_course` */

insert  into `rc_course`(`course_id`,`course_teacher_id`,`course_name`,`course_grade`,`course_time`,`course_location`,`course_credit`,`course_selected_count`,`course_max_size`,`course_exam_date`,`course_exam_location`) values (1,1,'C语言程序设计',2017,'1-1-2','教二-301',5,17,50,NULL,NULL),(2,1,'Java程序设计',2019,'1-3-2','教三-409',4,0,30,NULL,NULL),(3,1,'数据库实用技术',2017,'2-3-2','教二-210',2,1,50,NULL,NULL),(4,1,'ASP.Net开发',2017,'5-5-3','学科楼-409',2,1,1,NULL,NULL),(5,1,'Spring企业级开发',2017,'3-9-2','学科楼-407',3,0,10,NULL,NULL),(6,3,'数据库概论',2017,'3-1-2','教三-308',5,1,40,NULL,NULL),(7,3,'Photoshop',2017,'2-3-2','教二-502',2,0,20,NULL,NULL),(8,4,'计算机网络',2017,'4-1-3','学科楼-307',5,0,20,NULL,NULL);

/*Table structure for table `rc_department` */

DROP TABLE IF EXISTS `rc_department`;

CREATE TABLE `rc_department` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(32) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `rc_department` */

insert  into `rc_department`(`department_id`,`department_name`) values (1,'计算机'),(2,'数学'),(3,'物理'),(4,'化学'),(5,'测试1'),(6,'测试2');

/*Table structure for table `rc_major` */

DROP TABLE IF EXISTS `rc_major`;

CREATE TABLE `rc_major` (
  `major_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `major_department_id` int(10) unsigned NOT NULL,
  `major_name` varchar(32) NOT NULL,
  PRIMARY KEY (`major_id`),
  KEY `fk_major_department_id` (`major_department_id`) USING BTREE,
  KEY `idx_major_name` (`major_name`) USING BTREE,
  CONSTRAINT `rc_major_ibfk_1` FOREIGN KEY (`major_department_id`) REFERENCES `rc_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `rc_major` */

insert  into `rc_major`(`major_id`,`major_department_id`,`major_name`) values (1,1,'计算机'),(2,1,'数学'),(3,1,'通信'),(4,2,'马克思'),(5,2,'教育学'),(6,5,'test'),(7,5,'test');

/*Table structure for table `rc_student` */

DROP TABLE IF EXISTS `rc_student`;

CREATE TABLE `rc_student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_class_id` int(10) unsigned NOT NULL,
  `student_number` char(12) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `student_password` char(32) NOT NULL,
  `student_email` varchar(64) DEFAULT NULL,
  `student_birthday` datetime DEFAULT NULL,
  `student_sex` tinyint(3) unsigned NOT NULL,
  `student_last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `idx_student_number` (`student_number`) USING BTREE,
  KEY `fk_student_class_id` (`student_class_id`) USING BTREE,
  KEY `idx_student_name` (`student_name`) USING BTREE,
  CONSTRAINT `rc_student_ibfk_1` FOREIGN KEY (`student_class_id`) REFERENCES `rc_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `rc_student` */

insert  into `rc_student`(`student_id`,`student_class_id`,`student_number`,`student_name`,`student_password`,`student_email`,`student_birthday`,`student_sex`,`student_last_login_time`) values (1,1,'811010001','小李','123456','715035273@qq.com','1998-08-18 16:00:00',0,'2023-04-08 07:22:45'),(2,1,'811010002','小宋','123456',NULL,NULL,1,NULL),(3,1,'811010003','李同学1','123456',NULL,NULL,0,NULL),(4,1,'811010004','李同学2','123456',NULL,NULL,0,NULL),(5,1,'811010005','李同学3','123456',NULL,NULL,0,NULL),(6,1,'811010006','李同学4','123456',NULL,NULL,0,NULL),(7,1,'811010007','李同学5','123456',NULL,NULL,0,NULL),(8,1,'811010008','李同学6','123456',NULL,NULL,0,NULL),(9,1,'811010009','李同学7','123456',NULL,NULL,0,NULL),(10,1,'811010010','李同学8','123456',NULL,NULL,0,NULL),(11,1,'811010011','李同学9','123456',NULL,NULL,0,NULL),(12,1,'811010012','张同学1','123456',NULL,NULL,1,NULL),(13,1,'811010013','张同学2','123456',NULL,NULL,1,NULL),(14,1,'811010014','张同学3','123456',NULL,NULL,1,NULL),(15,1,'811010015','张同学4','123456',NULL,NULL,1,NULL),(16,1,'811010016','张同学5','123456',NULL,NULL,1,NULL),(17,1,'811010017','张同学6','123456',NULL,NULL,1,NULL),(18,1,'811010018','张同学7','123456',NULL,NULL,1,NULL),(19,3,'811020001','王同学1','123456',NULL,NULL,1,NULL),(20,3,'811020002','王同学2','123456',NULL,NULL,1,NULL),(21,3,'811020003','王同学3','123456',NULL,NULL,1,NULL),(22,3,'811020004','王同学4','123456',NULL,NULL,1,NULL),(23,3,'811020005','王同学5','123456',NULL,NULL,1,NULL),(24,3,'811020006','王同学6','123456',NULL,NULL,1,NULL),(25,3,'811020007','王同学7','123456',NULL,NULL,1,NULL),(26,3,'811020008','王同学8','123456',NULL,NULL,1,NULL),(27,3,'811020009','王同学9','123456',NULL,NULL,1,NULL),(28,3,'811020010','王同学10','123456',NULL,NULL,1,NULL);

/*Table structure for table `rc_student_course` */

DROP TABLE IF EXISTS `rc_student_course`;

CREATE TABLE `rc_student_course` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sc_student_id` int(10) unsigned NOT NULL,
  `sc_course_id` int(10) unsigned NOT NULL,
  `sc_daily_score` int(10) unsigned DEFAULT NULL,
  `sc_exam_score` int(10) unsigned DEFAULT NULL,
  `sc_score` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `fk_sc_course_id` (`sc_course_id`) USING BTREE,
  KEY `fk_sc_student_id` (`sc_student_id`) USING BTREE,
  CONSTRAINT `rc_student_course_ibfk_1` FOREIGN KEY (`sc_course_id`) REFERENCES `rc_course` (`course_id`),
  CONSTRAINT `rc_student_course_ibfk_2` FOREIGN KEY (`sc_student_id`) REFERENCES `rc_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `rc_student_course` */

insert  into `rc_student_course`(`sc_id`,`sc_student_id`,`sc_course_id`,`sc_daily_score`,`sc_exam_score`,`sc_score`) values (2,2,1,100,50,65),(3,3,1,50,60,57),(4,4,1,50,100,85),(5,5,1,62,90,81),(6,6,1,0,NULL,0),(7,7,1,72,75,74),(8,8,1,78,55,62),(9,9,1,NULL,NULL,NULL),(10,10,1,NULL,NULL,NULL),(11,11,1,NULL,NULL,NULL),(12,12,1,NULL,NULL,NULL),(13,13,1,NULL,NULL,NULL),(14,14,1,NULL,NULL,NULL),(15,15,1,NULL,NULL,NULL),(16,16,1,NULL,NULL,NULL),(17,17,1,NULL,NULL,NULL),(18,18,1,NULL,NULL,NULL),(19,1,3,98,100,99),(21,1,6,NULL,NULL,NULL),(24,1,4,NULL,NULL,NULL);

/*Table structure for table `rc_teacher` */

DROP TABLE IF EXISTS `rc_teacher`;

CREATE TABLE `rc_teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_department_id` int(10) unsigned NOT NULL,
  `teacher_number` char(12) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_password` char(32) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `idx_teacher_number` (`teacher_number`) USING BTREE,
  KEY `fk_teacher_department_id` (`teacher_department_id`) USING BTREE,
  CONSTRAINT `rc_teacher_ibfk_1` FOREIGN KEY (`teacher_department_id`) REFERENCES `rc_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `rc_teacher` */

insert  into `rc_teacher`(`teacher_id`,`teacher_department_id`,`teacher_number`,`teacher_name`,`teacher_password`) values (1,1,'11010001','张三','123456'),(2,3,'11020001','宋老师','123456'),(3,1,'11010002','宋老师','123456'),(4,1,'11010003','张老师','123456'),(5,1,'11010004','吕老师','123456'),(6,1,'11010005','王老师','123456'),(7,1,'11010006','丁老师','123456'),(8,1,'11010007','高老师','123456'),(9,1,'11010008','赵老师','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
