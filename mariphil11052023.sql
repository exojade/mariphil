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
('ANN-23b075a60c762-230720','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-07-20','13:34:35','1689831275');

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
('FORM-7ad5290b8b23c-230531','RENEWAL','2023-05-31','1685526356','2023','05','17:45:56','USR-3f92b0d251264-230523'),
('FORM-a280a10d47f0f-230608','RENEWAL','2023-06-08','1686218916','2023','06','18:08:36','USER0001'),
('FORM-3d27b46bafda2-230608','MONTHLY','2023-06-08','1686218937','2023','06','18:08:57','USER0001'),
('FORM-853e58ceb942d-230720','MONTHLY','2023-07-20','1689831130','2023','08','13:32:10','USR-3f92b0d251264-230523');

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
('REN-00107f4dd2482-230531','FORM-7ad5290b8b23c-230531','USR-bbce3a2f9a4d1-230531',NULL,NULL,NULL,'FOR CHECKING',NULL,NULL,NULL,NULL,NULL,NULL),
('REN-54c3e0a5a3998-230720','FORM-853e58ceb942d-230720','USR-bbce3a2f9a4d1-230531',NULL,NULL,NULL,'FOR CHECKING',NULL,NULL,NULL,NULL,NULL,NULL),
('REN-38a006ac7bd93-230720','FORM-853e58ceb942d-230720','USR-f66e806bc4ac5-230720',NULL,NULL,NULL,'FOR CHECKING',NULL,NULL,NULL,NULL,NULL,NULL);

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
('TR-e222f37eeecbe-230730','USR-e8017b65c2c02-230730','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-07-30','15:24:20','1690701860','pasar ni');

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
  PRIMARY KEY (`scholar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholars` */

insert  into `scholars`(`scholar_id`,`firstname`,`middlename`,`lastname`,`suffix`,`address_home`,`address_barangay`,`address_city`,`address_region`,`address_zipcode`,`address_province`,`address_country`,`birthdate`,`birthplace`,`sex`,`education_attainment`,`name_school`,`father_name`,`father_birthdate`,`father_address`,`father_contact`,`father_lengthstay`,`father_occupation`,`father_occupation_address`,`father_income`,`father_education_attainment`,`father_school`,`mother_name`,`mother_birthdate`,`mother_address`,`mother_contact`,`mother_lengthstay`,`mother_occupation`,`mother_occupation_address`,`mother_income`,`mother_education_attainment`,`mother_school`,`children`,`application_status`,`application_remarks`,`family_picture`,`barangay_clearance`,`low_income`,`birth_certificate`,`grade_card`,`current_status`,`sponsor_id`,`responsible`,`profile_image`,`school_year_id`) values 
('USR-7e111757ee0ed-230810','AWIT','AWIT','AWIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,NULL),
('USR-bbce3a2f9a4d1-230531','TEST','TEST','TEST',NULL,'TEST','TEST','TEST','TEST','8105','TEST',NULL,'2022-10-12','TEST','FEMALE','TEST','TEST','TEST','2023-05-19','TEST','09912021598',NULL,'TEST','TEST','1000','COLLEGE LEVEL','TEST','TEST','2023-05-12','TEST','09912021598',NULL,'TEST','TEST','1000','COLLEGE LEVEL','TEST',NULL,NULL,NULL,'uploads/TEST_TEST/FAMILY_PICTURE.jpg','uploads/TEST_TEST/BARANGAY_CLEARANCE.mp4',NULL,NULL,NULL,'SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/TEST_TEST/PROFILE.jpg',NULL),
('USR-e0ba7afea07c1-230730','CONOR','C','MCGREGOR',NULL,'21','SAN VICENTE','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-07-30','DAVAO CITY','MALE','HIGH SCHOOL','PANABO NATIONAL HIGH SCHOOL','CONOR SR','1961-07-30','PANABO CITY','09912021549',NULL,'ENGINEER','','10000','COLLEGE GRADUATE','MSU-IIT','CONNORA MCGREGOR','1985-06-30','PANABO CITY','09912021549',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO CHRISTIAN HIGH',NULL,NULL,NULL,'uploads/MCGREGOR_CONOR/FAMILY_PICTURE.jpg','uploads/MCGREGOR_CONOR/BARANGAY_CLEARANCE.png','uploads/MCGREGOR_CONOR/LOW_INCOME.png','uploads/MCGREGOR_CONOR/BIRTH_CERTIFICATE.png','uploads/MCGREGOR_CONOR/GRADE_CARD.png','SCHOLAR',NULL,'USR-3f92b0d251264-230523','uploads/MCGREGOR_CONOR/PROFILE.png',NULL),
('USR-e1ef1e04ca9b7-230530','KRISTINE','PAVILIO','LAUGLAUG',NULL,'MABUHAY','NEW VISAYAS','PANABO CITY','MABUHAY','8101','DAVAO DEL NORTE',NULL,'2023-05-18','DAVAO CITY','FEMALE','SENIOR HIGH SCHOOL','MABUHAY NATIONAL HIGH SCHOOL','FATHER PAVILIO','2023-05-11','PANABO CITY','09912021598',NULL,'SELF EMPLOYED','DF','123','VOCATIONAL','TESDA','MOTHER PAVILIO','2023-05-08','PANABO CITY','09912021598',NULL,'HOUSE WIFE','ADF','234','VOCATIONAL','USEP',NULL,NULL,NULL,'uploads/LAUGLAUG_KRISTINE/FAMILY_PICTURE.jpg','uploads/LAUGLAUG_KRISTINE/BARANGAY_CLEARANCE.jpg','uploads/LAUGLAUG_KRISTINE/LOW_INCOME.jpg','uploads/LAUGLAUG_KRISTINE/BIRTH_CERTIFICATE.jpg','uploads/LAUGLAUG_KRISTINE/GRADE_CARD.jpg','APPLICANT - APPLIED',NULL,NULL,'uploads/LAUGLAUG_KRISTINE/PROFILE.jpg',NULL),
('USR-e8017b65c2c02-230730','DUSTIN','D','PORIER',NULL,'11','CAGANGOHAN','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2004-07-30','DAVAO CITY','MALE','HIGH SCHOOL LEVEL','PANABO NATIONAL HIGH SCHOOL','DUSTIN SR','1987-07-30','PANABO CITY','09919123934',NULL,'TEACHER','MARYKNOLL','15000','COLLEGE GRADUATE','ATENEO DE DAVAO UNIVERSITY','DUSTINA PORIER','1988-07-30','PANABO CITY','09919123934',NULL,'ACCOUNTANT','DOLE','25000','COLLEGE GRADUATE','UNIVERSITY OF MINDANAO',NULL,NULL,NULL,'uploads/PORIER_DUSTIN/FAMILY_PICTURE.jpg','uploads/PORIER_DUSTIN/BARANGAY_CLEARANCE.png','uploads/PORIER_DUSTIN/LOW_INCOME.png','uploads/PORIER_DUSTIN/BIRTH_CERTIFICATE.jpg','uploads/PORIER_DUSTIN/GRADE_CARD.png','SCHOLAR',NULL,'USR-3f92b0d251264-230523','uploads/PORIER_DUSTIN/PROFILE.png',NULL),
('USR-ef5558871f4af-230608','a','a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2005-02-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,NULL),
('USR-f66e806bc4ac5-230720','OK','OK','OK',NULL,'OK','OK','OK','OK','1','OK',NULL,'2023-07-18','OK','FEMALE','OK','OK','OK','2023-07-20','OK','1',NULL,'OK','OK','1','ELEMENTARY GRADUATE','OK','OK','2023-07-20','OK','1',NULL,'OK','OK','1','ELEMENTARY GRADUATE','OK',NULL,NULL,NULL,'uploads/OK_OK/FAMILY_PICTURE.jpeg','uploads/OK_OK/BARANGAY_CLEARANCE.jpeg','uploads/OK_OK/LOW_INCOME.jpeg','uploads/OK_OK/BIRTH_CERTIFICATE.jpeg','uploads/OK_OK/GRADE_CARD.jpeg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/OK_OK/PROFILE.jpeg',NULL);

/*Table structure for table `school_year` */

DROP TABLE IF EXISTS `school_year`;

CREATE TABLE `school_year` (
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_year` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `active_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `school_year` */

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
('USR-3f92b0d251264-230523','rperson','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','FACILITATOR','active',NULL,NULL,NULL,NULL),
('USR-6eca67c983a60-230524','sponsor_2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR GERMANY','active',NULL,NULL,NULL,NULL),
('USR-7e111757ee0ed-230810','awit@gmail.com','$1$KwaVwEYS$h1uIpo8mZfqkEPuILofRA/','APPLICANT','AWIT AWIT','active','',NULL,NULL,NULL),
('USR-8d9eb7d621465-230528','validator3','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER THREE','active',NULL,'uploads/users/fullname.png','MALE','PANABO CITY'),
('USR-ab75d56e23ec0-230524','validator2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-ad02710943659-230523','SPONSOR','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR','active',NULL,NULL,NULL,NULL),
('USR-bbce3a2f9a4d1-230531','test@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','test test','active','','uploads/TEST_TEST/PROFILE.jpg',NULL,NULL),
('USR-e0ba7afea07c1-230730','conor@gmail.com','$1$k9T14k5s$76NC9xnmwOKHvGiS0yy9i1','SCHOLAR','CONOR MCGREGOR','active','','uploads/MCGREGOR_CONOR/PROFILE.png',NULL,NULL),
('USR-e6a5474b79910-230524','rperson2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','RESPONSIBLE NUMBER TWO','active',NULL,NULL,NULL,NULL),
('USR-e8017b65c2c02-230730','dustin@gmail.com','$1$jgKjAm.J$ETw2pFvCuYfBc78DbFVfm1','SCHOLAR','DUSTIN PORIER','active','','uploads/PORIER_DUSTIN/PROFILE.png',NULL,NULL),
('USR-ef5558871f4af-230608','a@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','APPLICANT','a a','active','',NULL,NULL,NULL),
('USR-f66e806bc4ac5-230720','ok@gmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SCHOLAR','ok ok','active','','uploads/OK_OK/PROFILE.jpeg',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
