/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.20-MariaDB : Database - mariphil
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mariphil` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `mariphil`;

/*Table structure for table `allowance` */

DROP TABLE IF EXISTS `allowance`;

CREATE TABLE `allowance` (
  `allowance_id` varchar(100) DEFAULT NULL,
  `facilitator` varchar(100) DEFAULT NULL,
  `date_created` varchar(100) DEFAULT NULL,
  `school_year_id` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `timestamp` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance` */

/*Table structure for table `allowance_scholar` */

DROP TABLE IF EXISTS `allowance_scholar`;

CREATE TABLE `allowance_scholar` (
  `tbl_id` varchar(100) DEFAULT NULL,
  `allowance_id` varchar(100) DEFAULT NULL,
  `scholar_id` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date_claimed` varchar(100) DEFAULT NULL,
  `status` enum('FOR RELEASE','CLAIMED','RETURNED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance_scholar` */

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
('ANN-b3f5bb78c6c41-231109','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-09','15:02:48','1699513368');

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
('FORM-d5e834b07deb4-231109','QUARTERLY','2023-11-09','1699508823','13:47:03','USR-3f92b0d251264-230523','FIRST QUARTER','sy0002',NULL,NULL);

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
('QUARTERLY-5c0bf051127e5-231109','FORM-d5e834b07deb4-231109','USR-1b4b5b7439500-231108',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-24c0c5a24cc1d-231109','FORM-d5e834b07deb4-231109','USR-1f030ef62ed17-231109','89','resources/scholar_achievements/QUARTERLY-24c0c5a24cc1d-231109/CHRMO.pdf',NULL,'THIS IS PAYTS','DONE',NULL);

/*Table structure for table `monthly_monitoring_achievements` */

DROP TABLE IF EXISTS `monthly_monitoring_achievements`;

CREATE TABLE `monthly_monitoring_achievements` (
  `tbl_id` varchar(100) DEFAULT NULL,
  `achievement` varchar(100) DEFAULT NULL,
  `achievement_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_achievements` */

insert  into `monthly_monitoring_achievements`(`tbl_id`,`achievement`,`achievement_id`) values 
('QUARTERLY-24c0c5a24cc1d-231109','1ST HONORABLE MENTION','ACH-a0d57d4eedd46-231109');

/*Table structure for table `monthly_monitoring_upload` */

DROP TABLE IF EXISTS `monthly_monitoring_upload`;

CREATE TABLE `monthly_monitoring_upload` (
  `upload_id` varchar(100) DEFAULT NULL,
  `upload_file` text DEFAULT NULL,
  `tbl_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_upload` */

insert  into `monthly_monitoring_upload`(`upload_id`,`upload_file`,`tbl_id`) values 
('ImgAchv-94e2439e81653-231109','resources/scholar_achievements/QUARTERLY-24c0c5a24cc1d-231109/panabo-logo-150x150.png','QUARTERLY-24c0c5a24cc1d-231109'),
('ImgAchv-0a7c261960623-231109','resources/scholar_achievements/QUARTERLY-24c0c5a24cc1d-231109/tablea ni bonita.jpg','QUARTERLY-24c0c5a24cc1d-231109'),
('ImgAchv-0a75218c69d6e-231109','resources/scholar_achievements/QUARTERLY-24c0c5a24cc1d-231109/tableaNiBonita.jpg','QUARTERLY-24c0c5a24cc1d-231109');

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
  `check_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `renewal` */

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
('USR-1f030ef62ed17-231109','sy0003','PANABO NATIONAL HIGH SCHOOL','GRADE 7','','JUNIOR HIGH SCHOOL');

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
('TR-a54a29e60f0d0-231109','USR-1b4b5b7439500-231108','SCHOLAR','USR-ad02710943659-230523','2023-11-09','15:02:48','1699513368','SPONSOR');

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
  `course` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholars` */

insert  into `scholars`(`scholar_id`,`firstname`,`middlename`,`lastname`,`suffix`,`address_home`,`address_barangay`,`address_city`,`address_region`,`address_zipcode`,`address_province`,`address_country`,`birthdate`,`birthplace`,`sex`,`education_attainment`,`name_school`,`father_name`,`father_birthdate`,`father_address`,`father_contact`,`father_lengthstay`,`father_occupation`,`father_occupation_address`,`father_income`,`father_education_attainment`,`father_school`,`mother_name`,`mother_birthdate`,`mother_address`,`mother_contact`,`mother_lengthstay`,`mother_occupation`,`mother_occupation_address`,`mother_income`,`mother_education_attainment`,`mother_school`,`children`,`application_status`,`application_remarks`,`family_picture`,`barangay_clearance`,`low_income`,`birth_certificate`,`grade_card`,`current_status`,`sponsor_id`,`responsible`,`profile_image`,`school_year_id`,`school_name`,`year_level`,`year_type`,`course`) values 
('USR-1b4b5b7439500-231108','TONY','BREE','STARK',NULL,'PUROK 2','CAGANGOHAN','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-11-11','CARMEN','MALE','ELEMENTARY GRADUATE','PNHS','HOWARD STARK','1960-09-01','PUROK 2 CAGANGOHAN','09912021590',NULL,'CARPENTER','','10000','VOCATIONAL','TESDA','BREE LARSON','1966-01-09','PUROK 2 CAGANGOHAN','09912021590',NULL,'HOUSE WIFE','','0','ELEMENTARY GRADUATE','RIZAL',NULL,NULL,NULL,'uploads/STARK_TONY/FAMILY_PICTURE.jpg','uploads/STARK_TONY/BARANGAY_CLEARANCE.jpg','uploads/STARK_TONY/LOW_INCOME.jpg','uploads/STARK_TONY/BIRTH_CERTIFICATE.jpg','uploads/STARK_TONY/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/STARK_TONY/PROFILE.jpg','sy0002',NULL,NULL,NULL,NULL),
('USR-1f030ef62ed17-231109','STEVE','M','ROGERS',NULL,'PUROK 11','SOUTHERN DAVAO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2002-11-09','DAVAO CITY','MALE','ELEMENTARY','SOUTHERN DAVAO ELEMENTARY SCHOOL','PAPA ROGERS','1960-10-10','PUROK 11 SOUTHERN DAVAO','09912021590',NULL,'CARPENTER','','40000','VOCATIONAL','TESDA','MAMA ROGERS','1960-10-10','PUROK 11 SOUTHERN DAVAO','09912021590',NULL,'HOUSEWIFE','','0','COLLEGE LEVEL','USEP',NULL,NULL,NULL,'uploads/ROGERS_STEVE/FAMILY_PICTURE.pdf','uploads/ROGERS_STEVE/BARANGAY_CLEARANCE.pdf','uploads/ROGERS_STEVE/LOW_INCOME.pdf','uploads/ROGERS_STEVE/BIRTH_CERTIFICATE.jpg','uploads/ROGERS_STEVE/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/ROGERS_STEVE/PROFILE.png','sy0002','PANABO NATIONAL HIGH SCHOOL','GRADE 7','JUNIOR HIGH SCHOOL',''),
('USR-7e111757ee0ed-230810','AWIT','AWIT','AWIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-bbce3a2f9a4d1-230531','TEST','TEST','TEST',NULL,'TEST','TEST','TEST','TEST','8105','TEST',NULL,'2022-10-12','TEST','FEMALE','TEST','TEST','TEST','2023-05-19','TEST','09912021598',NULL,'TEST','TEST','1000','COLLEGE LEVEL','TEST','TEST','2023-05-12','TEST','09912021598',NULL,'TEST','TEST','1000','COLLEGE LEVEL','TEST',NULL,NULL,NULL,'uploads/TEST_TEST/FAMILY_PICTURE.jpg','uploads/TEST_TEST/BARANGAY_CLEARANCE.mp4',NULL,NULL,NULL,'SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/TEST_TEST/PROFILE.jpg',NULL,NULL,NULL,NULL,NULL),
('USR-e0ba7afea07c1-230730','CONOR','C','MCGREGOR',NULL,'21','SAN VICENTE','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-07-30','DAVAO CITY','MALE','HIGH SCHOOL','PANABO NATIONAL HIGH SCHOOL','CONOR SR','1961-07-30','PANABO CITY','09912021549',NULL,'ENGINEER','','10000','COLLEGE GRADUATE','MSU-IIT','CONNORA MCGREGOR','1985-06-30','PANABO CITY','09912021549',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO CHRISTIAN HIGH',NULL,NULL,NULL,'uploads/MCGREGOR_CONOR/FAMILY_PICTURE.jpg','uploads/MCGREGOR_CONOR/BARANGAY_CLEARANCE.png','uploads/MCGREGOR_CONOR/LOW_INCOME.png','uploads/MCGREGOR_CONOR/BIRTH_CERTIFICATE.png','uploads/MCGREGOR_CONOR/GRADE_CARD.png','SCHOLAR',NULL,'USR-3f92b0d251264-230523','uploads/MCGREGOR_CONOR/PROFILE.png',NULL,NULL,NULL,NULL,NULL),
('USR-e1ef1e04ca9b7-230530','KRISTINE','PAVILIO','LAUGLAUG',NULL,'MABUHAY','NEW VISAYAS','PANABO CITY','MABUHAY','8101','DAVAO DEL NORTE',NULL,'2023-05-18','DAVAO CITY','FEMALE','SENIOR HIGH SCHOOL','MABUHAY NATIONAL HIGH SCHOOL','FATHER PAVILIO','2023-05-11','PANABO CITY','09912021598',NULL,'SELF EMPLOYED','DF','123','VOCATIONAL','TESDA','MOTHER PAVILIO','2023-05-08','PANABO CITY','09912021598',NULL,'HOUSE WIFE','ADF','234','VOCATIONAL','USEP',NULL,NULL,NULL,'uploads/LAUGLAUG_KRISTINE/FAMILY_PICTURE.jpg','uploads/LAUGLAUG_KRISTINE/BARANGAY_CLEARANCE.jpg','uploads/LAUGLAUG_KRISTINE/LOW_INCOME.jpg','uploads/LAUGLAUG_KRISTINE/BIRTH_CERTIFICATE.jpg','uploads/LAUGLAUG_KRISTINE/GRADE_CARD.jpg','APPLICANT - APPLIED',NULL,NULL,'uploads/LAUGLAUG_KRISTINE/PROFILE.jpg',NULL,NULL,NULL,NULL,NULL),
('USR-e8017b65c2c02-230730','DUSTIN','D','PORIER',NULL,'11','CAGANGOHAN','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2004-07-30','DAVAO CITY','MALE','HIGH SCHOOL LEVEL','PANABO NATIONAL HIGH SCHOOL','DUSTIN SR','1987-07-30','PANABO CITY','09919123934',NULL,'TEACHER','MARYKNOLL','15000','COLLEGE GRADUATE','ATENEO DE DAVAO UNIVERSITY','DUSTINA PORIER','1988-07-30','PANABO CITY','09919123934',NULL,'ACCOUNTANT','DOLE','25000','COLLEGE GRADUATE','UNIVERSITY OF MINDANAO',NULL,NULL,NULL,'uploads/PORIER_DUSTIN/FAMILY_PICTURE.jpg','uploads/PORIER_DUSTIN/BARANGAY_CLEARANCE.png','uploads/PORIER_DUSTIN/LOW_INCOME.png','uploads/PORIER_DUSTIN/BIRTH_CERTIFICATE.jpg','uploads/PORIER_DUSTIN/GRADE_CARD.png','SCHOLAR',NULL,'USR-3f92b0d251264-230523','uploads/PORIER_DUSTIN/PROFILE.png',NULL,NULL,NULL,NULL,NULL),
('USR-ef5558871f4af-230608','a','a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2005-02-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-f66e806bc4ac5-230720','OK','OK','OK',NULL,'OK','OK','OK','OK','1','OK',NULL,'2023-07-18','OK','FEMALE','OK','OK','OK','2023-07-20','OK','1',NULL,'OK','OK','1','ELEMENTARY GRADUATE','OK','OK','2023-07-20','OK','1',NULL,'OK','OK','1','ELEMENTARY GRADUATE','OK',NULL,NULL,NULL,'uploads/OK_OK/FAMILY_PICTURE.jpeg','uploads/OK_OK/BARANGAY_CLEARANCE.jpeg','uploads/OK_OK/LOW_INCOME.jpeg','uploads/OK_OK/BIRTH_CERTIFICATE.jpeg','uploads/OK_OK/GRADE_CARD.jpeg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/OK_OK/PROFILE.jpeg',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `school_year` */

DROP TABLE IF EXISTS `school_year`;

CREATE TABLE `school_year` (
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_year` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `current_status` varchar(100) DEFAULT NULL,
  `applicant_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `school_year` */

insert  into `school_year`(`school_year_id`,`school_year`,`semester`,`current_status`,`applicant_status`) values 
('sy0002','2023-2024',NULL,'active','inactive'),
('sy0001','2022-2023',NULL,'inactive','inactive'),
('sy0003','2024-2025',NULL,'inactive','active');

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
('bosspanabo2020@gmail.com','uxjwfplwregzmccz');

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
('USR-1b4b5b7439500-231108','tonystartavenger@yopmail.com','$1$SNt2uiyq$j6UEvdGfaTVXqB3cRcHAo.','SCHOLAR','TONY STARK','active','','uploads/STARK_TONY/PROFILE.jpg',NULL,NULL),
('USR-1f030ef62ed17-231109','stevemrogers@yopmail.com','$1$HVDQehHH$90V.tO7Cjd8bt0i9sBZzx/','SCHOLAR','STEVE ROGERS','active','','uploads/ROGERS_STEVE/PROFILE.png',NULL,NULL),
('USR-37512177654f4-230523','validator','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR','active',NULL,NULL,NULL,NULL),
('USR-3f92b0d251264-230523','rperson','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','MR. RENDON LABADOR','active',NULL,NULL,NULL,NULL),
('USR-6eca67c983a60-230524','sponsor_2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR GERMANY','active',NULL,NULL,NULL,NULL),
('USR-7e111757ee0ed-230810','awit@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','APPLICANT','AWIT AWIT','active','',NULL,NULL,NULL),
('USR-8d9eb7d621465-230528','validator3','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER THREE','active',NULL,'uploads/users/fullname.png','MALE','PANABO CITY'),
('USR-ab75d56e23ec0-230524','validator2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-ad02710943659-230523','SPONSOR','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR','active',NULL,NULL,NULL,NULL),
('USR-bbce3a2f9a4d1-230531','test@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','test test','active','','uploads/TEST_TEST/PROFILE.jpg',NULL,NULL),
('USR-e0ba7afea07c1-230730','conor@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','CONOR MCGREGOR','active','','uploads/MCGREGOR_CONOR/PROFILE.png',NULL,NULL),
('USR-e6a5474b79910-230524','rperson2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','RESPONSIBLE NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-e8017b65c2c02-230730','dustin@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','DUSTIN PORIER','active','','uploads/PORIER_DUSTIN/PROFILE.png',NULL,NULL),
('USR-ef5558871f4af-230608','a@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','APPLICANT','a a','active','',NULL,NULL,NULL),
('USR-f66e806bc4ac5-230720','ok@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','ok ok','active','','uploads/OK_OK/PROFILE.jpeg',NULL,NULL);

/*Table structure for table `year_level` */

DROP TABLE IF EXISTS `year_level`;

CREATE TABLE `year_level` (
  `level_id` int(100) DEFAULT NULL,
  `year_level` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `year_level` */

insert  into `year_level`(`level_id`,`year_level`,`type`) values 
(1,'GRADE 1','ELEMENTARY'),
(3,'GRADE 3','ELEMENTARY'),
(4,'GRADE 4','ELEMENTARY'),
(5,'GRADE 5','ELEMENTARY'),
(6,'GRADE 6','ELEMENTARY'),
(2,'GRADE 2','ELEMENTARY'),
(7,'GRADE 7','JUNIOR HIGH SCHOOL'),
(8,'GRADE 8','JUNIOR HIGH SCHOOL'),
(9,'GRADE 9','JUNIOR HIGH SCHOOL'),
(10,'GRADE 10','JUNIOR HIGH SCHOOL'),
(11,'GRADE 11','SENIOR HIGH SCHOOL'),
(12,'GRADE 12','SENIOR HIGH SCHOOL'),
(13,'FIRST YEAR','COLLEGE'),
(14,'SECOND YEAR','COLLEGE'),
(15,'THIRD YEAR','COLLEGE'),
(16,'FOURTH YEAR','COLLEGE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
