/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.3.16-MariaDB : Database - mariphil
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mariphil` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mariphil`;

/*Table structure for table `allowance` */

DROP TABLE IF EXISTS `allowance`;

CREATE TABLE `allowance` (
  `allowance_id` varchar(100) DEFAULT NULL,
  `facilitator` varchar(100) NOT NULL,
  `date_created` varchar(100) DEFAULT NULL,
  `school_year_id` varchar(100) NOT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `timestamp` int(20) DEFAULT NULL,
  `month` int(4) NOT NULL,
  PRIMARY KEY (`facilitator`,`school_year_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance` */

insert  into `allowance`(`allowance_id`,`facilitator`,`date_created`,`school_year_id`,`time_created`,`timestamp`,`month`) values 
('AA-bac785a62b169-231112','USR-3f92b0d251264-230523','2023-11-12','sy0002','14:32:28',1699770748,11),
('AA-5dff569dade41-231112','USR-3f92b0d251264-230523','2023-11-12','sy0003','14:38:33',1699771113,1);

/*Table structure for table `allowance_scholar` */

DROP TABLE IF EXISTS `allowance_scholar`;

CREATE TABLE `allowance_scholar` (
  `tbl_id` int(11) NOT NULL AUTO_INCREMENT,
  `allowance_id` varchar(100) DEFAULT NULL,
  `scholar_id` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date_claimed` varchar(100) DEFAULT NULL,
  `status` enum('FOR RELEASE','CLAIMED','RETURNED') DEFAULT NULL,
  `date_returned` varchar(100) DEFAULT NULL,
  KEY `tbl_id` (`tbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance_scholar` */

insert  into `allowance_scholar`(`tbl_id`,`allowance_id`,`scholar_id`,`amount`,`date_claimed`,`status`,`date_returned`) values 
(4,'AA-bac785a62b169-231112','USR-705589206de8c-231110','7000','','FOR RELEASE',NULL),
(5,'AA-5dff569dade41-231112','USR-60b9c1e44fed9-231110','6000','','CLAIMED',NULL),
(6,'AA-5dff569dade41-231112','USR-5361ad50f3799-231110','6000','','FOR RELEASE',NULL);

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `announcement_id` varchar(100) DEFAULT NULL COMMENT 'primary key',
  `announcement` text DEFAULT NULL,
  `send_to` text DEFAULT NULL COMMENT 'users_table, kung kinsa ang gisendan',
  `user_id` varchar(100) DEFAULT NULL COMMENT 'users_table / kung kinsa ni ang nagsend',
  `date_created` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `announcement` */

insert  into `announcement`(`announcement_id`,`announcement`,`send_to`,`user_id`,`date_created`,`time_created`,`timestamp`) values 
('ANN-9b14238b3308c-230531','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-bbce3a2f9a4d1-230531','','2023-05-31','17:47:37','1685526457'),
('ANN-a12a1c82dc190-230531','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-05-31','17:47:37','1685526457'),
('ANN-fef4681fee345-230720','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-f66e806bc4ac5-230720','','2023-07-20','13:34:35','1689831275'),
('ANN-23b075a60c762-230720','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-07-20','13:34:35','1689831275'),
('ANN-159ac0d962819-231109','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-1f030ef62ed17-231109','','2023-11-09','15:02:38','1699513358'),
('ANN-9f5ac3b891a57-231109','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-09','15:02:38','1699513358'),
('ANN-424b8767ccc44-231109','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-1b4b5b7439500-231108','','2023-11-09','15:02:48','1699513368'),
('ANN-b3f5bb78c6c41-231109','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-09','15:02:48','1699513368'),
('ANN-bca8f5bb1ba4a-231110','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-60b9c1e44fed9-231110','','2023-11-10','10:57:29','1699585049'),
('ANN-744058985ffe3-231110','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-10','10:57:29','1699585049'),
('ANN-411ecda56c7e2-231110','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-5361ad50f3799-231110','','2023-11-10','11:20:33','1699586433'),
('ANN-365a5d81d72b6-231110','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-10','11:20:33','1699586433'),
('ANN-a587908714c99-231110','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-705589206de8c-231110','','2023-11-10','13:50:53','1699595453'),
('ANN-04893c0c9ffc6-231110','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-10','13:50:53','1699595453');

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `email_id` varchar(100) DEFAULT NULL,
  `sender_id` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email` */

/*Table structure for table `email_receipients` */

DROP TABLE IF EXISTS `email_receipients`;

CREATE TABLE `email_receipients` (
  `email_id` varchar(100) DEFAULT NULL,
  `receipient_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_receipients` */

/*Table structure for table `email_thread` */

DROP TABLE IF EXISTS `email_thread`;

CREATE TABLE `email_thread` (
  `thread_id` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_thread` */

/*Table structure for table `forms` */

DROP TABLE IF EXISTS `forms`;

CREATE TABLE `forms` (
  `form_id` varchar(100) DEFAULT NULL,
  `form_type` enum('RENEWAL','MONTHLY','QUARTERLY') NOT NULL,
  `date_created` varchar(100) DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `form_kind` enum('FIRST QUARTER','SECOND QUARTER','THIRD QUARTER','FOURTH QUARTER') NOT NULL,
  `school_year_id` varchar(100) NOT NULL,
  `for_school_year_id` varchar(100) DEFAULT NULL,
  `lock_status` enum('OPEN','LOCK') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `forms` */

insert  into `forms`(`form_id`,`form_type`,`date_created`,`timestamp`,`time_created`,`created_by`,`form_kind`,`school_year_id`,`for_school_year_id`,`lock_status`) values 
('FORM-f1b99411e7038-231110','QUARTERLY','2023-11-10','1699586599','11:23:19','USR-3f92b0d251264-230523','FIRST QUARTER','sy0002',NULL,NULL),
('FORM-ec6b74ef0eb42-231110','QUARTERLY','2023-11-10','1699586603','11:23:23','USR-3f92b0d251264-230523','SECOND QUARTER','sy0002',NULL,NULL);

/*Table structure for table `monthly_monitoring` */

DROP TABLE IF EXISTS `monthly_monitoring`;

CREATE TABLE `monthly_monitoring` (
  `tbl_id` varchar(100) NOT NULL,
  `form_id` varchar(100) NOT NULL,
  `scholar_id` varchar(100) NOT NULL,
  `grades` varchar(100) DEFAULT NULL,
  `grade_card_upload` text DEFAULT NULL,
  `achievements` text DEFAULT NULL COMMENT 'list',
  `remarks` varchar(100) DEFAULT NULL,
  `form_status` enum('DONE','RETURNED','FOR CHECKING','FOR SUBMISSION') DEFAULT NULL,
  `return_comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `monthly_monitoring` */

insert  into `monthly_monitoring`(`tbl_id`,`form_id`,`scholar_id`,`grades`,`grade_card_upload`,`achievements`,`remarks`,`form_status`,`return_comments`) values 
('QUARTERLY-987c459c1aa38-231110','FORM-f1b99411e7038-231110','USR-60b9c1e44fed9-231110','90','resources/scholar_achievements/QUARTERLY-987c459c1aa38-231110/PBD HRIS PB2022-01_sgd.pdf',NULL,'THIS IS DONE','DONE',NULL),
('QUARTERLY-74b4ce243ea64-231110','FORM-f1b99411e7038-231110','USR-5361ad50f3799-231110','96','resources/scholar_achievements/QUARTERLY-74b4ce243ea64-231110/ARAW TARP 4X6.pdf',NULL,'DONE CHECKING. JOB WELL DONE TONY STARK','DONE',NULL),
('QUARTERLY-dd024d706ec18-231110','FORM-ec6b74ef0eb42-231110','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-46d5980e0e2fa-231110','FORM-ec6b74ef0eb42-231110','USR-5361ad50f3799-231110','95','resources/scholar_achievements/QUARTERLY-46d5980e0e2fa-231110/philgeps requirements.pdf',NULL,NULL,'FOR CHECKING',NULL);

/*Table structure for table `monthly_monitoring_achievements` */

DROP TABLE IF EXISTS `monthly_monitoring_achievements`;

CREATE TABLE `monthly_monitoring_achievements` (
  `tbl_id` varchar(100) DEFAULT NULL,
  `achievement` varchar(100) DEFAULT NULL,
  `achievement_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_achievements` */

insert  into `monthly_monitoring_achievements`(`tbl_id`,`achievement`,`achievement_id`) values 
('QUARTERLY-46d5980e0e2fa-231110','HONORABLE MENTION','ACH-9143b936b93bb-231110'),
('QUARTERLY-46d5980e0e2fa-231110','MOST PUNCTUAL','ACH-460dd84316e45-231110'),
('QUARTERLY-46d5980e0e2fa-231110','LEADER OF THE MONTH','ACH-b015c0d24e9d3-231110'),
('QUARTERLY-74b4ce243ea64-231110','2nd Honor','ACH-25a682fe67931-231110'),
('QUARTERLY-74b4ce243ea64-231110','LEADER OF THE MONTH','ACH-2813426885d3e-231110');

/*Table structure for table `monthly_monitoring_upload` */

DROP TABLE IF EXISTS `monthly_monitoring_upload`;

CREATE TABLE `monthly_monitoring_upload` (
  `upload_id` varchar(100) DEFAULT NULL,
  `upload_file` text DEFAULT NULL,
  `tbl_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_upload` */

insert  into `monthly_monitoring_upload`(`upload_id`,`upload_file`,`tbl_id`) values 
('ImgAchv-ac7473b26a756-231110','resources/scholar_achievements/QUARTERLY-46d5980e0e2fa-231110/philgeps requirements.pdf','QUARTERLY-46d5980e0e2fa-231110'),
('ImgAchv-fa6b2099afb7b-231110','resources/scholar_achievements/QUARTERLY-46d5980e0e2fa-231110/Annex B - Omnibus Sworn Statement.pdf','QUARTERLY-46d5980e0e2fa-231110'),
('ImgAchv-0bb64d175ef6d-231110','resources/scholar_achievements/QUARTERLY-46d5980e0e2fa-231110/PHILGEPS.pdf','QUARTERLY-46d5980e0e2fa-231110'),
('ImgAchv-7483f4d1d59fb-231110','resources/scholar_achievements/QUARTERLY-74b4ce243ea64-231110/philgeps requirements.pdf','QUARTERLY-74b4ce243ea64-231110'),
('ImgAchv-7ed794be7bc65-231110','resources/scholar_achievements/QUARTERLY-74b4ce243ea64-231110/Annex B - Omnibus Sworn Statement.pdf','QUARTERLY-74b4ce243ea64-231110'),
('ImgAchv-3900c973bbfce-231110','resources/scholar_achievements/QUARTERLY-74b4ce243ea64-231110/PHILGEPS.pdf','QUARTERLY-74b4ce243ea64-231110');

/*Table structure for table `renewal` */

DROP TABLE IF EXISTS `renewal`;

CREATE TABLE `renewal` (
  `renewal_id` varchar(100) DEFAULT NULL COMMENT 'primary key',
  `form_id` varchar(100) DEFAULT NULL COMMENT 'connected sa forms table, many forms_Table to many renewal table',
  `scholar_id` varchar(100) DEFAULT NULL COMMENT 'connected sa scholar table',
  `grades` text DEFAULT NULL,
  `tuition_fee_report` text DEFAULT NULL,
  `cor` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `remarks_by` varchar(100) DEFAULT NULL,
  `submitted_date` varchar(100) DEFAULT NULL,
  `submitted_time` varchar(100) DEFAULT NULL,
  `check_date` varchar(100) DEFAULT NULL,
  `check_time` varchar(100) DEFAULT NULL,
  `form_status` enum('FOR SUBMISSION','FOR CHECKING','RETURNED','DONE') DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `year_type` varchar(100) DEFAULT NULL,
  `renew_school_year_id` varchar(100) DEFAULT NULL,
  `current_school_year` varchar(100) DEFAULT NULL,
  `return_comments` text DEFAULT NULL,
  `course` text DEFAULT NULL,
  `year_level_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `renewal` */

insert  into `renewal`(`renewal_id`,`form_id`,`scholar_id`,`grades`,`tuition_fee_report`,`cor`,`status`,`remarks`,`remarks_by`,`submitted_date`,`submitted_time`,`check_date`,`check_time`,`form_status`,`school_name`,`year_level`,`year_type`,`renew_school_year_id`,`current_school_year`,`return_comments`,`course`,`year_level_id`) values 
('RENEW-79748465eb31b-231110','RenFORM-63fbc4fa75cb7-231110','USR-60b9c1e44fed9-231110','resources/requirements/RENEW-79748465eb31b-231110/sales_revenue.pdf','resources/requirements/RENEW-79748465eb31b-231110/howtogethere.png','resources/requirements/RENEW-79748465eb31b-231110/philgeps requirements.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','PANABO NATIONAL HIGH SCHOOL','GRADE 8','JUNIOR HIGH SCHOOL',NULL,NULL,NULL,'',8),
('RENEW-b0bacb2e46fcf-231110','RenFORM-63fbc4fa75cb7-231110','USR-5361ad50f3799-231110','resources/requirements/RENEW-b0bacb2e46fcf-231110/download (1).png','resources/requirements/RENEW-b0bacb2e46fcf-231110/HR-LOGO-fin.png','resources/requirements/RENEW-b0bacb2e46fcf-231110/SRE-for-posting-Website.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','SAN VICENTE NATIONAL HIGH SCHOOL PANABO','GRADE 8','JUNIOR HIGH SCHOOL',NULL,NULL,NULL,'',8);

/*Table structure for table `renewal_form` */

DROP TABLE IF EXISTS `renewal_form`;

CREATE TABLE `renewal_form` (
  `form_id` varchar(100) DEFAULT NULL,
  `facilitator` varchar(100) DEFAULT NULL,
  `lock_status` enum('OPEN','LOCK') DEFAULT NULL,
  `date_created` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `timestamp` int(20) DEFAULT NULL,
  `school_year_id` varchar(100) DEFAULT NULL,
  `for_school_year_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `renewal_form` */

insert  into `renewal_form`(`form_id`,`facilitator`,`lock_status`,`date_created`,`time_created`,`timestamp`,`school_year_id`,`for_school_year_id`) values 
('RenFORM-63fbc4fa75cb7-231110','USR-3f92b0d251264-230523','OPEN','2023-11-10','11:29:12',1699586952,'sy0002','sy0003');

/*Table structure for table `scholar_status` */

DROP TABLE IF EXISTS `scholar_status`;

CREATE TABLE `scholar_status` (
  `scholar_id` varchar(100) DEFAULT NULL,
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `course` text DEFAULT NULL,
  `year_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scholar_status` */

insert  into `scholar_status`(`scholar_id`,`school_year_id`,`school_name`,`year_level`,`course`,`year_type`) values 
('USR-60b9c1e44fed9-231110','sy0002','PANABO NATIONAL HIGH SCHOOL','GRADE 7','','JUNIOR HIGH SCHOOL'),
('USR-5361ad50f3799-231110','sy0002','SAN VICENTE NATIONAL HIGH SCHOOL PANABO','GRADE 7','','JUNIOR HIGH SCHOOL'),
('USR-60b9c1e44fed9-231110','sy0003','PANABO NATIONAL HIGH SCHOOL','GRADE 8','','JUNIOR HIGH SCHOOL'),
('USR-5361ad50f3799-231110','sy0003','SAN VICENTE NATIONAL HIGH SCHOOL PANABO','GRADE 8','','JUNIOR HIGH SCHOOL'),
('USR-705589206de8c-231110','sy0002','GABRIEL TABORIN','FIRST YEAR','BS IN INFORMATION TECHNOLOGY','COLLEGE');

/*Table structure for table `scholar_tracker` */

DROP TABLE IF EXISTS `scholar_tracker`;

CREATE TABLE `scholar_tracker` (
  `track_id` varchar(100) NOT NULL COMMENT 'primary key',
  `scholar_id` varchar(100) DEFAULT NULL COMMENT 'connected sa scholars table',
  `status` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL COMMENT 'connected sa users_table',
  `date_created` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholar_tracker` */

insert  into `scholar_tracker`(`track_id`,`scholar_id`,`status`,`user_id`,`date_created`,`time_created`,`timestamp`,`remarks`) values 
('TR-41001dc859613-230530','USR-e1ef1e04ca9b7-230530','APPLICANT - IN REVIEW','USR-e1ef1e04ca9b7-230530','2023-05-30','22:12:50','1685455970',NULL),
('TR-903acbf1143c9-230531','USR-bbce3a2f9a4d1-230531','APPLICANT - IN REVIEW','USR-bbce3a2f9a4d1-230531','2023-05-31','17:34:17','1685525657',NULL),
('TR-d05415776519c-230531','USR-bbce3a2f9a4d1-230531','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-05-31','17:36:20','1685525780','test'),
('TR-e712a79d50e05-230531','USR-bbce3a2f9a4d1-230531','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-05-31','17:38:56','1685525936','test'),
('TR-2e05b71fbb300-230531','USR-bbce3a2f9a4d1-230531','SCHOLAR','USR-ad02710943659-230523','2023-05-31','17:47:37','1685526457','SPONSOR'),
('TR-24c29aea68572-230720','USR-f66e806bc4ac5-230720','APPLICANT - IN REVIEW','USR-f66e806bc4ac5-230720','2023-07-20','12:09:04','1689826144',NULL),
('TR-fffc73cafc84e-230720','USR-f66e806bc4ac5-230720','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-07-20','12:30:42','1689827442','ok'),
('TR-dce34c3dc0b9d-230720','USR-f66e806bc4ac5-230720','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-07-20','12:38:12','1689827892','OK'),
('TR-c32c5f14988c9-230720','USR-f66e806bc4ac5-230720','SCHOLAR','USR-ad02710943659-230523','2023-07-20','13:34:35','1689831275','SPONSOR'),
('TR-1ecd4090bdbd0-230730','USR-e0ba7afea07c1-230730','APPLICANT - IN REVIEW','USR-e0ba7afea07c1-230730','2023-07-30','14:52:39','1690699959',NULL),
('TR-3eeed8e1be17d-230730','USR-e0ba7afea07c1-230730','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-07-30','14:53:55','1690700035','OKAY NI'),
('TR-3d16eabd63758-230730','USR-e0ba7afea07c1-230730','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-07-30','14:54:04','1690700044','AYOS NI '),
('TR-44f462e5012d5-230730','USR-e8017b65c2c02-230730','APPLICANT - IN REVIEW','USR-e8017b65c2c02-230730','2023-07-30','15:20:10','1690701610',NULL),
('TR-e3074ba1655aa-230730','USR-e8017b65c2c02-230730','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-07-30','15:23:20','1690701800','okay ni na tao'),
('TR-e222f37eeecbe-230730','USR-e8017b65c2c02-230730','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-07-30','15:24:20','1690701860','pasar ni'),
('TR-251f578c04b73-231108','USR-1b4b5b7439500-231108','APPLICANT - IN REVIEW','USR-1b4b5b7439500-231108','2023-11-08','16:50:39','1699433439',NULL),
('TR-51a7b3ce3ef2b-231108','USR-1b4b5b7439500-231108','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-08','16:51:11','1699433471','PWEDE NA'),
('TR-335c36b9a82a8-231108','USR-1b4b5b7439500-231108','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-08','16:51:31','1699433491','HUMANAG INTERVIEW'),
('TR-c0ac1b5114ec6-231109','USR-1f030ef62ed17-231109','APPLICANT - IN REVIEW','USR-1f030ef62ed17-231109','2023-11-09','13:25:23','1699507523',NULL),
('TR-33810bc61f6de-231109','USR-1f030ef62ed17-231109','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-09','13:26:16','1699507576','OKAY NI'),
('TR-a54ce938f3940-231109','USR-1f030ef62ed17-231109','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-09','13:26:25','1699507585','HUMANAG INTERVIEW NI'),
('TR-2c1db8fa46c9a-231109','USR-1f030ef62ed17-231109','SCHOLAR','USR-ad02710943659-230523','2023-11-09','15:02:38','1699513358','SPONSOR'),
('TR-a54a29e60f0d0-231109','USR-1b4b5b7439500-231108','SCHOLAR','USR-ad02710943659-230523','2023-11-09','15:02:48','1699513368','SPONSOR'),
('TR-8671e836212bb-231110','USR-60b9c1e44fed9-231110','APPLICANT - IN REVIEW','USR-60b9c1e44fed9-231110','2023-11-10','10:55:34','1699584934',NULL),
('TR-dce4d73648475-231110','USR-60b9c1e44fed9-231110','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-10','10:56:19','1699584979','AYOS NI KUYAW NING BATAA'),
('TR-f11880402df14-231110','USR-60b9c1e44fed9-231110','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-10','10:56:36','1699584996','BUOTAN KAAYONG BATAA BAI. HAWD MUENGLISH NAAY FUTURE'),
('TR-c5bfe66b584ed-231110','USR-60b9c1e44fed9-231110','SCHOLAR','USR-ad02710943659-230523','2023-11-10','10:57:29','1699585049','SPONSOR'),
('TR-3ef80267ba49e-231110','USR-5361ad50f3799-231110','APPLICANT - IN REVIEW','USR-5361ad50f3799-231110','2023-11-10','11:10:08','1699585808',NULL),
('TR-ba6d7760e0fd5-231110','USR-5361ad50f3799-231110','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-10','11:19:35','1699586375','LEGIT NI'),
('TR-e180ab615fa88-231110','USR-5361ad50f3799-231110','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-10','11:19:46','1699586386','BUOTAN NIYA BRIGHT PWEDE MA IRONMAN'),
('TR-0c371e80b445b-231110','USR-5361ad50f3799-231110','SCHOLAR','USR-ad02710943659-230523','2023-11-10','11:20:33','1699586433','SPONSOR'),
('TR-94ab08aaf0fdb-231110','USR-705589206de8c-231110','APPLICANT - IN REVIEW','USR-705589206de8c-231110','2023-11-10','13:48:33','1699595313',NULL),
('TR-b98ab108874ba-231110','USR-705589206de8c-231110','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-10','13:49:29','1699595369','GAHI NI'),
('TR-d781de3a1e8f4-231110','USR-705589206de8c-231110','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-10','13:49:43','1699595383','HUMANAG INTERVIEW CHUY NI BATAA. LAYO NIG MAABTAN'),
('TR-93375ac159eed-231110','USR-705589206de8c-231110','SCHOLAR','USR-ad02710943659-230523','2023-11-10','13:50:53','1699595453','SPONSOR');

/*Table structure for table `scholars` */

DROP TABLE IF EXISTS `scholars`;

CREATE TABLE `scholars` (
  `scholar_id` varchar(100) NOT NULL COMMENT 'primary, ALSO CONNECTED SA USERS na ang role kay applicant/scholar',
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `suffix` varchar(100) DEFAULT NULL,
  `address_home` varchar(100) DEFAULT NULL,
  `address_barangay` varchar(100) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_region` varchar(100) DEFAULT NULL,
  `address_zipcode` varchar(100) DEFAULT NULL,
  `address_province` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `birthdate` varchar(10) DEFAULT NULL,
  `birthplace` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `education_attainment` text DEFAULT NULL,
  `name_school` text DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_birthdate` varchar(10) DEFAULT NULL,
  `father_address` varchar(100) DEFAULT NULL,
  `father_contact` varchar(100) DEFAULT NULL,
  `father_lengthstay` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_occupation_address` varchar(100) DEFAULT NULL,
  `father_income` varchar(100) DEFAULT NULL,
  `father_education_attainment` text DEFAULT NULL,
  `father_school` text DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_birthdate` varchar(10) DEFAULT NULL,
  `mother_address` varchar(100) DEFAULT NULL,
  `mother_contact` varchar(100) DEFAULT NULL,
  `mother_lengthstay` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_occupation_address` varchar(100) DEFAULT NULL,
  `mother_income` varchar(100) DEFAULT NULL,
  `mother_education_attainment` text DEFAULT NULL,
  `mother_school` text DEFAULT NULL,
  `children` text DEFAULT NULL,
  `application_status` enum('applicant','evaluated-accepted','evaluated-denied','interview-accepted','interview-denied') DEFAULT NULL,
  `application_remarks` text DEFAULT NULL,
  `family_picture` text DEFAULT NULL,
  `barangay_clearance` text DEFAULT NULL,
  `low_income` text DEFAULT NULL,
  `birth_certificate` text DEFAULT NULL,
  `grade_card` text DEFAULT NULL,
  `current_status` varchar(100) DEFAULT NULL,
  `sponsor_id` varchar(100) DEFAULT NULL COMMENT 'connected sa user na ang role kay SPONSOR, many SCHOLARS TO ONE SPONSOR',
  `responsible` varchar(100) DEFAULT NULL COMMENT 'connected sa user na ang role kay RESPONSIBLE PERSON, many SCHOLARS TO ONE RESPONSIBLE PERSON',
  `profile_image` text DEFAULT NULL,
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `year_type` varchar(100) DEFAULT NULL,
  `course` text DEFAULT NULL,
  `year_level_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholars` */

insert  into `scholars`(`scholar_id`,`firstname`,`middlename`,`lastname`,`suffix`,`address_home`,`address_barangay`,`address_city`,`address_region`,`address_zipcode`,`address_province`,`address_country`,`birthdate`,`birthplace`,`sex`,`education_attainment`,`name_school`,`father_name`,`father_birthdate`,`father_address`,`father_contact`,`father_lengthstay`,`father_occupation`,`father_occupation_address`,`father_income`,`father_education_attainment`,`father_school`,`mother_name`,`mother_birthdate`,`mother_address`,`mother_contact`,`mother_lengthstay`,`mother_occupation`,`mother_occupation_address`,`mother_income`,`mother_education_attainment`,`mother_school`,`children`,`application_status`,`application_remarks`,`family_picture`,`barangay_clearance`,`low_income`,`birth_certificate`,`grade_card`,`current_status`,`sponsor_id`,`responsible`,`profile_image`,`school_year_id`,`school_name`,`year_level`,`year_type`,`course`,`year_level_id`) values 
('USR-60b9c1e44fed9-231110','STEVE','M','ROGERS',NULL,'PUROK 1','CAGANGOHAN','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-11-10','CARMEN DAVAO DEL NORTE','MALE','ELEMENTARY','RIZAL ELEMENTARY SCHOOL','PAPA ROGERS','1978-08-01','PRK 1 CAGANGOHAN PANABO CITY','09912021590',NULL,'JOB ORDER','LGU PANABO','10000','COLLEGE LEVEL','USEP','MAMA ROGERS','1977-09-29','PRK 1 CAGANGOHAN PANABO CITY','09912021590',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/ROGERS_STEVE/FAMILY_PICTURE.pdf','uploads/ROGERS_STEVE/BARANGAY_CLEARANCE.pdf','uploads/ROGERS_STEVE/LOW_INCOME.png','uploads/ROGERS_STEVE/BIRTH_CERTIFICATE.pdf','uploads/ROGERS_STEVE/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/ROGERS_STEVE/PROFILE.jpg','sy0003','PANABO NATIONAL HIGH SCHOOL','GRADE 8','JUNIOR HIGH SCHOOL','',8),
('USR-5361ad50f3799-231110','TONY','M','STARK',NULL,'PUROK 10','SOUTHERN DAVAO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2001-09-09','CARMEN DAVAO DEL NORTE','MALE','ELEMENTARY','CENTRAL ELEMENTARY SCHOOL','PAPA STARK','1985-10-01','SOUTHERN DAVAO','09928765431',NULL,'LABORER','','9000','VOCATIONAL','TESDA','MAMA STARK','1986-08-05','SOUTHERN DAVAO','09928765431',NULL,'DAYCARE TEACHER','BARANGAY','7000','COLLEGE LEVEL','UMPC',NULL,NULL,NULL,'uploads/STARK_TONY/FAMILY_PICTURE.pdf','uploads/STARK_TONY/BARANGAY_CLEARANCE.jpg','uploads/STARK_TONY/LOW_INCOME.jpg','uploads/STARK_TONY/BIRTH_CERTIFICATE.jpg','uploads/STARK_TONY/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/STARK_TONY/PROFILE.gif','sy0003','SAN VICENTE NATIONAL HIGH SCHOOL PANABO','GRADE 8','JUNIOR HIGH SCHOOL','',8),
('USR-705589206de8c-231110','BRUCE','H','BANNER',NULL,'PUROK UBAS','GREDU','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1999-08-08','DAVAO CITY','MALE','SHS GRADUATE','MARYKNOLL COLLEGE OF PANABO INC','PAPA HULK','1975-10-10','GREDU PANABO CITY','09999999911',NULL,'WELDER','LGU PANABO','70000','COLLEGE LEVEL','TESDA','SHE HULK','1976-09-08','GREDU PANABO CITY','09999999911',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/BANNER_BRUCE/FAMILY_PICTURE.pdf','uploads/BANNER_BRUCE/BARANGAY_CLEARANCE.png','uploads/BANNER_BRUCE/LOW_INCOME.pdf',NULL,'uploads/BANNER_BRUCE/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/BANNER_BRUCE/PROFILE.jpg','sy0002','GABRIEL TABORIN','FIRST YEAR','COLLEGE','BS IN INFORMATION TECHNOLOGY',13),
('USR-bf7f79c72902f-231110','CLINT','HAWKEYE','BARTON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2000-11-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `school_year` */

DROP TABLE IF EXISTS `school_year`;

CREATE TABLE `school_year` (
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_year` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `current_status` varchar(100) DEFAULT NULL,
  `applicant_status` varchar(100) DEFAULT NULL,
  `idd` int(11) NOT NULL AUTO_INCREMENT,
  KEY `idd` (`idd`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `school_year` */

insert  into `school_year`(`school_year_id`,`school_year`,`semester`,`current_status`,`applicant_status`,`idd`) values 
('sy0002','2023-2024',NULL,'inactive','active',2),
('sy0001','2022-2023',NULL,'inactive','inactive',1),
('sy0003','2024-2025',NULL,'active','inactive',3),
('sy0004','2025-2026',NULL,'inactive','inactive',4);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `current_schoolyear` varchar(100) DEFAULT NULL,
  `application_schoolyear` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `settings` */

insert  into `settings`(`current_schoolyear`,`application_schoolyear`) values 
('sy0001','sy0003');

/*Table structure for table `site_options` */

DROP TABLE IF EXISTS `site_options`;

CREATE TABLE `site_options` (
  `google_user` varchar(100) DEFAULT NULL,
  `google_password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `site_options` */

insert  into `site_options`(`google_user`,`google_password`) values 
('mariphilfinc@gmail.com','mnambeyxacbyfjkp');

/*Table structure for table `sponsors` */

DROP TABLE IF EXISTS `sponsors`;

CREATE TABLE `sponsors` (
  `sponsor_id` varchar(100) NOT NULL COMMENT 'primary key, connected sa users table',
  `sponsor_name` varchar(100) DEFAULT NULL,
  `sponsor_address` varchar(100) DEFAULT NULL,
  `sponsor_company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sponsor_id`),
  CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sponsors` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(100) NOT NULL COMMENT 'daghag connection na table',
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `otp` varchar(100) DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`role`,`fullname`,`status`,`otp`,`profile_image`,`gender`,`address`) values 
('USER0001','admin','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','admin','ADMIN ADMIN','active',NULL,NULL,NULL,NULL),
('USR-37512177654f4-230523','validator','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR','active',NULL,NULL,NULL,NULL),
('USR-3f92b0d251264-230523','rperson','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','MR. RENDON LABADOR','active',NULL,NULL,NULL,NULL),
('USR-5361ad50f3799-231110','tonyhowardstark@yopmail.com','$1$eJmC2lCA$wYJ1LNKmr7PEOmlsLflci1','SCHOLAR','TONY STARK','active','','uploads/STARK_TONY/PROFILE.gif',NULL,NULL),
('USR-60b9c1e44fed9-231110','stevemrogers@yopmail.com','$1$8HeTH2ni$gAuJSug97NCUHGAfkCAGN/','SCHOLAR','STEVE ROGERS','active','','uploads/ROGERS_STEVE/PROFILE.jpg',NULL,NULL),
('USR-6eca67c983a60-230524','sponsor_2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR GERMANY','active',NULL,NULL,NULL,NULL),
('USR-705589206de8c-231110','brucehulkbanner@yopmail.com','$1$Zr/XEKjM$Oo8xKLO5ARTiW07bME2X80','SCHOLAR','BRUCE BANNER','active','','uploads/BANNER_BRUCE/PROFILE.jpg',NULL,NULL),
('USR-8d9eb7d621465-230528','validator3','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER THREE','active',NULL,'uploads/users/fullname.png','MALE','PANABO CITY'),
('USR-ab75d56e23ec0-230524','validator2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-ad02710943659-230523','SPONSOR','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR','active',NULL,NULL,NULL,NULL),
('USR-bf7f79c72902f-231110','clintbarton@yopmail.com','$1$suOz5iM4$PvPqVhlLwaLqY25NsUFqt.','APPLICANT','CLINT BARTON','active','',NULL,NULL,NULL),
('USR-e6a5474b79910-230524','rperson2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','RESPONSIBLE NUMBER TWO','active',NULL,NULL,NULL,NULL);

/*Table structure for table `year_level` */

DROP TABLE IF EXISTS `year_level`;

CREATE TABLE `year_level` (
  `level_id` int(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `allowance` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `year_level` */

insert  into `year_level`(`level_id`,`year_level`,`type`,`allowance`) values 
(1,'GRADE 1','ELEMENTARY','5000'),
(3,'GRADE 3','ELEMENTARY','5000'),
(4,'GRADE 4','ELEMENTARY','5000'),
(5,'GRADE 5','ELEMENTARY','5000'),
(6,'GRADE 6','ELEMENTARY','5000'),
(2,'GRADE 2','ELEMENTARY','5000'),
(7,'GRADE 7','JUNIOR HIGH SCHOOL','6000'),
(8,'GRADE 8','JUNIOR HIGH SCHOOL','6000'),
(9,'GRADE 9','JUNIOR HIGH SCHOOL','6000'),
(10,'GRADE 10','JUNIOR HIGH SCHOOL','6000'),
(11,'GRADE 11','SENIOR HIGH SCHOOL','6000'),
(12,'GRADE 12','SENIOR HIGH SCHOOL','6000'),
(13,'FIRST YEAR','COLLEGE','7000'),
(14,'SECOND YEAR','COLLEGE','7000'),
(15,'THIRD YEAR','COLLEGE','7000'),
(16,'FOURTH YEAR','COLLEGE','7000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
