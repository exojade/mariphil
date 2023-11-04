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
('ANN-b6b8a35329706-230523','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-ef8393383b8d7-230517','','2023-05-23','14:37:14','1684823834'),
('ANN-8d2917eb35589-230523','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-05-23','14:37:14','1684823834'),
('ANN-3d6be7caa48d1-230524','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-ee9defac8a965-230524','','2023-05-24','11:49:06','1684900146'),
('ANN-dd650dec555ff-230524','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-05-24','11:49:06','1684900146'),
('ANN-b7603bcea9e3f-230524','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-ee9defac8a965-230524','','2023-05-24','11:50:24','1684900224'),
('ANN-fc0ce295945be-230524','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-05-24','11:50:24','1684900224'),
('ANN-dd04f69f9dda2-230524','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-ee9defac8a965-230524','','2023-05-24','12:39:53','1684903193'),
('ANN-079d8d9ea0f93-230524','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-05-24','12:39:53','1684903193'),
('ANN-23c10b12fbb55-230524','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-e83ed6ffe9e66-230524','','2023-05-24','13:43:24','1684907004'),
('ANN-1acf308492b51-230524','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-6eca67c983a60-230524','','2023-05-24','13:43:24','1684907004');

/*Table structure for table `forms` */

DROP TABLE IF EXISTS `forms`;

CREATE TABLE `forms` (
  `form_id` varchar(100) NOT NULL,
  `form_type` enum('RENEWAL','MONTHLY','QUARTERLY') DEFAULT NULL,
  `date_created` varchar(100) DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `time_created` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `forms` */

insert  into `forms`(`form_id`,`form_type`,`date_created`,`timestamp`,`year`,`month`,`time_created`,`created_by`) values 
('FORM-80dfb7bc55963-230523','RENEWAL','2023-05-23','1684856140','2023','01','23:35:40','USR-3f92b0d251264-230523'),
('FORM-61d11d8dc4b87-230524','RENEWAL','2023-05-24','1684911345','2023','02','14:55:45','USR-e6a5474b79910-230524'),
('FORM-b2608fbe1418d-230528','RENEWAL','2023-05-28','1685256791','2023','06','14:53:11','USR-3f92b0d251264-230523'),
('FORM-910403e123fa7-231018','MONTHLY','2023-10-18','1697614179','2023','01','15:29:39','USER0001');

/*Table structure for table `monthly_monitoring` */

DROP TABLE IF EXISTS `monthly_monitoring`;

CREATE TABLE `monthly_monitoring` (
  `tbl_id` varchar(100) NOT NULL,
  `form_id` varchar(100) DEFAULT NULL,
  `scholar_id` varchar(100) DEFAULT NULL,
  `activities` text DEFAULT NULL,
  `picture_documentation` text DEFAULT NULL,
  `suggestion` text DEFAULT NULL,
  `problem` text DEFAULT NULL,
  `solution` text DEFAULT NULL,
  PRIMARY KEY (`tbl_id`),
  UNIQUE KEY `form_id` (`form_id`),
  UNIQUE KEY `scholar_id` (`scholar_id`),
  CONSTRAINT `monthly_monitoring_ibfk_1` FOREIGN KEY (`scholar_id`) REFERENCES `scholars` (`scholar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `monthly_monitoring` */

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

insert  into `renewal`(`renewal_id`,`form_id`,`scholar_id`,`grades`,`tuition_fee_report`,`cor`,`status`,`remarks`,`remarks_by`,`submitted_date`,`submitted_time`,`check_date`,`check_time`) values 
('REN-707839e545ad1-230523','FORM-80dfb7bc55963-230523','USR-ef8393383b8d7-230517','uploads/GARCIA_BRIAN_JADE/_grade_01_2023.jpg','uploads/GARCIA_BRIAN_JADE/_tuition_01_2023.png','uploads/GARCIA_BRIAN_JADE/_cor_01_2023.png','CHECKED','ALL REQUIREMENTS PASSED','USR-3f92b0d251264-230523',NULL,NULL,NULL,NULL),
('REN-c8ca7d728b52e-230524','FORM-61d11d8dc4b87-230524','USR-e83ed6ffe9e66-230524','uploads/AVENIDO_ARWIN/_grade_02_2023.jpg','uploads/AVENIDO_ARWIN/_tuition_02_2023.jpg','uploads/AVENIDO_ARWIN/_cor_02_2023.jpg','CHECKED','All forms are checked and correct','USR-e6a5474b79910-230524',NULL,NULL,NULL,NULL),
('REN-692840a545f47-230528','FORM-b2608fbe1418d-230528','USR-ee9defac8a965-230524',NULL,NULL,NULL,'FOR CHECKING',NULL,NULL,NULL,NULL,NULL,NULL),
('REN-db31e8ce9ce52-230528','FORM-b2608fbe1418d-230528','USR-ef8393383b8d7-230517',NULL,NULL,NULL,'FOR CHECKING',NULL,NULL,NULL,NULL,NULL,NULL);

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
('TR-ca82497e92628-230522','USR-ef8393383b8d7-230517','APPLICANT - APPLIED','USR-ef8393383b8d7-230517','2023-05-22','08:33:39','1684715619',NULL),
('TR-292200c7b56da-230523','USR-ef8393383b8d7-230517','APPLICANT - VERIFIED','USER0001','2023-05-23','13:09:05','1684818545','All requirements complied'),
('TR-b3ea370dc59e4-230523','USR-ef8393383b8d7-230517','APPLICANT - INTERVIEWED','USER0001','2023-05-23','13:28:00','1684819680','The scholar has been interviewed and passed all the requirements.'),
('TR-3d9750d4a22b3-230523','USR-ef8393383b8d7-230517','SCHOLAR','USR-ad02710943659-230523','2023-05-23','14:37:14','1684823834','SPONSOR'),
('TR-a21888cf23572-230523','USR-3966e8d9b2433-230523','APPLICANT - APPLIED','USR-3966e8d9b2433-230523','2023-05-23','20:29:24','1684844964',NULL),
('TR-faeec6059b551-230523','USR-3966e8d9b2433-230523','APPLICANT - VERIFIED','USR-37512177654f4-230523','2023-05-23','20:47:44','1684846064','ALL REQUIREMENTS ARE MET. Passed the preliminary requirements'),
('TR-ff22f3abcee07-230523','USR-3966e8d9b2433-230523','APPLICANT - DENIED','USR-37512177654f4-230523','2023-05-23','23:02:29','1684854149','No appearance on their home'),
('TR-36afd6f329a19-230524','USR-ee9defac8a965-230524','APPLICANT - APPLIED','USR-ee9defac8a965-230524','2023-05-24','11:32:00','1684899120',NULL),
('TR-8da8de1aecef9-230524','USR-ee9defac8a965-230524','APPLICANT - VERIFIED','USR-37512177654f4-230523','2023-05-24','11:33:39','1684899219','All requirements complied'),
('TR-cd3070ee3d2e8-230524','USR-ee9defac8a965-230524','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-05-24','11:33:53','1684899233','Passed the Interview'),
('TR-80591692d8167-230524','USR-ee9defac8a965-230524','SCHOLAR','USR-ad02710943659-230523','2023-05-24','11:49:06','1684900146','SPONSOR'),
('TR-ccec6a2b14dc2-230524','USR-e83ed6ffe9e66-230524','APPLICANT - APPLIED','USR-e83ed6ffe9e66-230524','2023-05-24','13:10:04','1684905004',NULL),
('TR-f9a322d9d44d7-230524','USR-e83ed6ffe9e66-230524','APPLICANT - VERIFIED','USR-ab75d56e23ec0-230524','2023-05-24','13:40:59','1684906859','The applicant has been verified and passed the preliminary stage.'),
('TR-8f143c01d2326-230524','USR-e83ed6ffe9e66-230524','APPLICANT - INTERVIEWED','USR-ab75d56e23ec0-230524','2023-05-24','13:41:56','1684906916','The applicant has already been interviewed and passed the second stage.'),
('TR-33c37f8e43a5c-230524','USR-e83ed6ffe9e66-230524','SCHOLAR','USR-6eca67c983a60-230524','2023-05-24','13:43:24','1684907004','SPONSOR GERMANY'),
('TR-9f793cc6b76d1-230528','USR-0c915ffd96df3-230528','APPLICANT - APPLIED','USR-0c915ffd96df3-230528','2023-05-28','14:43:15','1685256195',NULL),
('TR-90aa5eba628f2-230528','USR-0c915ffd96df3-230528','APPLICANT - VERIFIED','USR-8d9eb7d621465-230528','2023-05-28','14:43:57','1685256237','accepted'),
('TR-18332dda1b4df-230528','USR-0c915ffd96df3-230528','APPLICANT - INTERVIEWED','USR-8d9eb7d621465-230528','2023-05-28','14:44:11','1685256251','interview pass'),
('TR-4f070e9331a1b-230529','USR-10db5e49f9cc7-230529','APPLICANT - APPLIED','USR-10db5e49f9cc7-230529','2023-05-29','21:37:46','1685367466',NULL);

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
  PRIMARY KEY (`scholar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholars` */

insert  into `scholars`(`scholar_id`,`firstname`,`middlename`,`lastname`,`suffix`,`address_home`,`address_barangay`,`address_city`,`address_region`,`address_zipcode`,`address_province`,`address_country`,`birthdate`,`birthplace`,`sex`,`education_attainment`,`name_school`,`father_name`,`father_birthdate`,`father_address`,`father_contact`,`father_lengthstay`,`father_occupation`,`father_occupation_address`,`father_income`,`father_education_attainment`,`father_school`,`mother_name`,`mother_birthdate`,`mother_address`,`mother_contact`,`mother_lengthstay`,`mother_occupation`,`mother_occupation_address`,`mother_income`,`mother_education_attainment`,`mother_school`,`children`,`application_status`,`application_remarks`,`family_picture`,`barangay_clearance`,`low_income`,`birth_certificate`,`grade_card`,`current_status`,`sponsor_id`,`responsible`,`profile_image`) values 
('USR-0c915ffd96df3-230528','JOSE','PROTACIO','RIZAL',NULL,'8','SAN VICENTE','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-05-28','DAVAO CITY','MALE','HIGH SCHOOL','PANABO NATIONAL HIGH SCHOOL','FATHER JRIZAL','1980-01-01','DAVAO CITY','09918192300',NULL,'WELDER','LGU DAVAO','4000','VOCATIONAL','TESDA','MOTHER JRIZAL','1985-01-01','DAVAO CITY','09920202022',NULL,'HOUSE WIFE','','','ELEMENTARY LEVEL','RIZAL',NULL,NULL,NULL,'uploads/RIZAL_JOSE/FAMILY_PICTURE.jpg','uploads/RIZAL_JOSE/BARANGAY_CLEARANCE.jpg','uploads/RIZAL_JOSE/LOW_INCOME.jpg','uploads/RIZAL_JOSE/BIRTH_CERTIFICATE.jpg','uploads/RIZAL_JOSE/GRADE_CARD.png','SCHOLAR',NULL,'USR-e6a5474b79910-230524','uploads/RIZAL_JOSE/PROFILE.png'),
('USR-10db5e49f9cc7-230529','TIWA','AWIT','AWIT',NULL,'ASD','ASD','ASD','ASD','8104','ASD',NULL,'1994-09-09','ASDASD','MALE','ASDASD','ASDASD','ASDASD','1111-12-12','ASD','09111',NULL,'ASD','ASD','10000','ELEMENTARY LEVEL','ASDASDASD','WWWW','1990-01-01','ASDASD','0191911',NULL,'ASD','ASD','123123','COLLEGE GRADUATE','ASDASDASD',NULL,NULL,NULL,'uploads/AWIT_TIWA/FAMILY_PICTURE.png','uploads/AWIT_TIWA/BARANGAY_CLEARANCE.png','uploads/AWIT_TIWA/LOW_INCOME.png','uploads/AWIT_TIWA/BIRTH_CERTIFICATE.png','uploads/AWIT_TIWA/GRADE_CARD.png','APPLICANT - APPLIED',NULL,NULL,'uploads/AWIT_TIWA/PROFILE.png'),
('USR-3966e8d9b2433-230523','JUAN','QUIAPO','DELA CRUZ',NULL,'LILIA HOMES','NEW VISAYAS','PANABO','XI','8105','DAVAO DEL NORTE',NULL,'1994-12-12','DAVAO CITY','MALE','HIGH SCHOOL','PANABO NATIONAL HIGH SCHOOL','CARDO DALISAY','1990-01-01','LILIA SUBD PANABO CITY','09912021547',NULL,'PANDAY','','3000','HIGH SCHOOL GRADUATE','PNHS','MAJA SALVADOR','1990-11-01','LILIA SUBD PANABO CITY','09912021547',NULL,'HOUSEWIFE','','','HIGH SCHOOL LEVEL','PNHS',NULL,NULL,NULL,'uploads/DELA_CRUZ_JUAN/FAMILY_PICTURE.png','uploads/DELA_CRUZ_JUAN/BARANGAY_CLEARANCE.png','uploads/DELA_CRUZ_JUAN/LOW_INCOME.jpg','uploads/DELA_CRUZ_JUAN/BIRTH_CERTIFICATE.jpg','uploads/DELA_CRUZ_JUAN/GRADE_CARD.png','APPLICANT - DENIED',NULL,NULL,NULL),
('USR-569e45cd8b76b-230529','DEYM','DEYM','DEYM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL),
('USR-97e2a40c3979c-230530','awit','awit','awittt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1990-12-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL),
('USR-e83ed6ffe9e66-230524','ARWIN','DACER','AVENIDO',NULL,'NEAR ADLAON','SAN VICENTE','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-01-01','DAVAO CITY','MALE','HIGH SCHOOL','ADLAON SCHOOL','FATHER AVENIDO','1990-01-01','NEAR ADLAON','09912021578',NULL,'BUSINESS MAN','','35000','COLLEGE GRADUATE','COMMERCE','MOTHER AVENIDO','1990-01-01','NEAR ADLAON','09912021599',NULL,'GOVERNMENT EMPLOYEE','LGU DAVAO','40000','COLLEGE GRADUATE','LAW',NULL,NULL,NULL,'uploads/AVENIDO_ARWIN/FAMILY_PICTURE.jpg','uploads/AVENIDO_ARWIN/BARANGAY_CLEARANCE.jpg','uploads/AVENIDO_ARWIN/LOW_INCOME.jpg','uploads/AVENIDO_ARWIN/BIRTH_CERTIFICATE.jpg','uploads/AVENIDO_ARWIN/GRADE_CARD.jpg','SCHOLAR','USR-6eca67c983a60-230524','USR-e6a5474b79910-230524','uploads/AVENIDO_ARWIN/PROFILE.png'),
('USR-ee9defac8a965-230524','CLARK','SINGSON','DACER',NULL,'BANGOY','SAN FRANCISCO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1997-05-25','DAVAO CITY','MALE','HIGH SCHOOL','ADLAON','FATHER CLARK','1981-01-01','BANGOY','09912021549',NULL,'SELF EMPLOYED','','1000','COLLEGE LEVEL','MIT','ROSANNA DACER','1981-01-01','BANGOY','09912021549',NULL,'GOVERNMENT EMPLOYEE','LGU PANABO','35000','COLLEGE GRADUATE','USEP',NULL,NULL,NULL,'uploads/DACER_CLARK/FAMILY_PICTURE.jpg','uploads/DACER_CLARK/BARANGAY_CLEARANCE.png','uploads/DACER_CLARK/LOW_INCOME.jpg','uploads/DACER_CLARK/BIRTH_CERTIFICATE.png','uploads/DACER_CLARK/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523',NULL),
('USR-ef8393383b8d7-230517','BRIAN JADE','ANADON','GARCIA',NULL,'SAHARAVILLE','SOUTHERN DAVAO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1994-12-12','DAVAO CITY','MALE','HIGH SCHOOL','MHSP','LEO GARCIA','1965-01-09','PANABO CITY','09912021547',NULL,'SELF EMPLOYED','','1000','COLLEGE GRADUATE','MIT','FE GARCIA','1961-10-22','PANABO CITY','09912021547',NULL,'ACCOUNTANT','LGU PANABO','30000','COLLEGE GRADUATE','ADDU',NULL,NULL,NULL,'uploads/GARCIA_BRIAN_JADE/FAMILY_PICTURE.jpg','uploads/GARCIA_BRIAN_JADE/BARANGAY_CLEARANCE.png',NULL,NULL,NULL,'SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523',NULL);

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
('USER0001','admin','$1$O7L8IeDZ$ESRGc0EWTvJbC2Xm5VEjI1','admin','ADMIN ADMIN','active',NULL,NULL,NULL,NULL),
('USR-0c915ffd96df3-230528','jrizal@gmail.com','$1$FC9eQgcA$su71WPvbr.BhRAe22Eo85.','APPLICANT','JOSE RIZAL','active','','uploads/RIZAL_JOSE/PROFILE.png',NULL,NULL),
('USR-10db5e49f9cc7-230529','awit@gmail.com','$1$91C2twGH$5VEcjPTu1DrwgO0Bd6SLI0','APPLICANT','TIWA AWIT','active','','uploads/AWIT_TIWA/PROFILE.png',NULL,NULL),
('USR-37512177654f4-230523','validator','$1$R.PZLIEU$M/tF2RMo87OlN3mQ.CCfN0','VALIDATOR','VALIDATOR','active',NULL,NULL,NULL,NULL),
('USR-3966e8d9b2433-230523','quiapo@gmail.com','$1$.Y0rMtmv$JjFLk9ByVetSLf23vJ5PS/','APPLICANT','JUAN DELA CRUZ','active','',NULL,NULL,NULL),
('USR-3f92b0d251264-230523','rperson','$1$wuIoOytK$nHSQyGGLTw0yrIT53FgVS0','FACILITATOR','RESPONSIBLE PERSON','active',NULL,NULL,NULL,NULL),
('USR-569e45cd8b76b-230529','deym@gmail.com','$1$tvE8V6EK$u67hSfRevl7jNJ6SiSMFT/','APPLICANT','DEYM DEYM','active','',NULL,NULL,NULL),
('USR-6eca67c983a60-230524','sponsor_2','$1$p5CtQQI7$1HxqhAKW9T8rx1SLUzPxk1','SPONSOR','SPONSOR GERMANY','active',NULL,NULL,NULL,NULL),
('USR-8d9eb7d621465-230528','validator3','$1$zpI94Ck6$I7RbQHOfL5OKJv29csc4I1','VALIDATOR','VALIDATOR NUMBER THREE','active',NULL,'uploads/users/fullname.png','MALE','PANABO CITY'),
('USR-97e2a40c3979c-230530','awiiiittt@gmail.com','$1$m7.pwrts$cvSQYemvhQMdoo.8.FANH/','APPLICANT','awit awittt','active','',NULL,NULL,NULL),
('USR-ab75d56e23ec0-230524','validator2','$1$.hzKCllL$RiTtGCBRX2UtYZKXzXGd2/','VALIDATOR','VALIDATOR NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-ad02710943659-230523','SPONSOR','$1$inEtvcr9$ZsBDSQ7tpel9YG99owoow/','SPONSOR','SPONSOR','active',NULL,NULL,NULL,NULL),
('USR-e6a5474b79910-230524','rperson2','$1$fHB7E06n$ZAOKhHrjSDSo11Y0ZKgrV.','FACILITATOR','RESPONSIBLE NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-e83ed6ffe9e66-230524','arwin@gmail.com','$1$Q0txAa3P$LNKAB8INGJmkB9m0HveVI/','APPLICANT','ARWIN AVENIDO','active','','uploads/AVENIDO_ARWIN/PROFILE.png',NULL,NULL),
('USR-ee9defac8a965-230524','clark@gmail.com','$1$jcxpRlEt$ff3bH72..VCXxqgXTYkQr0','APPLICANT','CLARK DACER','active','',NULL,NULL,NULL),
('USR-ef8393383b8d7-230517','asd@gmail.com','$1$iNBxhNVP$x0bzfXS0.olWcOc98IGpZ/','APPLICANT','BRIAN JADE GARCIA','active','',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
