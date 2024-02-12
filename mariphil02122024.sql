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
('AA-84350465948e5-231223','USR-09b9f4896673f-231223','2023-12-23','sy0003','15:45:07',1703317507,12),
('AA-3bf836e2ff363-231129','USR-28e6ba261cfe0-231129','2023-11-29','sy0001','08:50:46',1701219046,11),
('AA-98e70da4a7646-231129','USR-7636a5b2be468-231120','2023-11-29','sy0002','09:31:42',1701221502,1),
('AA-defb2c9674b57-240114','USR-7636a5b2be468-231120','2024-01-14','sy0002','10:31:07',1705199467,6),
('AA-870633fd37e64-240114','USR-7636a5b2be468-231120','2024-01-14','sy0002','11:37:31',1705203451,8),
('AA-dbe023265801d-240114','USR-7636a5b2be468-231120','2024-01-14','sy0003','04:46:22',1705178782,1),
('AA-30f8760f68ebd-231129','USR-7636a5b2be468-231120','2023-11-29','sy0003','11:31:38',1701228698,11);

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance_scholar` */

insert  into `allowance_scholar`(`tbl_id`,`allowance_id`,`scholar_id`,`amount`,`date_claimed`,`status`,`date_returned`) values 
(31,'AA-3bf836e2ff363-231129','USR-cba27e4938c3b-231128','7000','','FOR RELEASE',NULL),
(32,'AA-98e70da4a7646-231129','USR-22812901fb5c2-231129','7000','2024-01-14','CLAIMED',''),
(33,'AA-98e70da4a7646-231129','USR-8f3a0f454bab2-231129','7000','','RETURNED','2023-01-24'),
(34,'AA-30f8760f68ebd-231129','USR-8cb6c4860e40c-231128','7000','','FOR RELEASE',NULL),
(35,'AA-30f8760f68ebd-231129','USR-59ba09f1015db-231129','7000','2023-11-29','CLAIMED',''),
(36,'AA-84350465948e5-231223','USR-69539ad8082a9-231223','7000','','FOR RELEASE',NULL),
(37,'AA-dbe023265801d-240114','USR-8cb6c4860e40c-231128','7000','','FOR RELEASE',NULL),
(38,'AA-defb2c9674b57-240114','USR-22812901fb5c2-231129','7500','','FOR RELEASE',NULL),
(39,'AA-defb2c9674b57-240114','USR-8f3a0f454bab2-231129','6900','','FOR RELEASE',NULL),
(40,'AA-870633fd37e64-240114','USR-22812901fb5c2-231129','2500','','RETURNED','2024-01-17'),
(41,'AA-870633fd37e64-240114','USR-8f3a0f454bab2-231129','2500','2024-01-16','CLAIMED','');

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
('ANN-04893c0c9ffc6-231110','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-10','13:50:53','1699595453'),
('ANN-59f807b23a5e4-231112','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-9368a80385979-231112','','2023-11-12','23:41:26','1699803686'),
('ANN-b4e55376303a6-231112','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-12','23:41:26','1699803686'),
('ANN-c70161e95af70-231112','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-4048f00b77ba8-231112','','2023-11-12','23:41:31','1699803691'),
('ANN-404a9d4d1d78f-231112','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-12','23:41:31','1699803691'),
('ANN-da8362ba87c7f-231113','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-bd5c7051f45c1-231113','','2023-11-13','14:40:47','1699857647'),
('ANN-c43f7d7a0faff-231113','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-13','14:40:47','1699857647'),
('ANN-2ecd4b669f3a2-231113','YOU HAVE BEEN SPONSORED! CONGRATULATIONS!','USR-99ad7c4b55c0b-231113','','2023-11-13','21:44:44','1699883084'),
('ANN-260681a698044-231113','YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!','USR-ad02710943659-230523','','2023-11-13','21:44:44','1699883084');

/*Table structure for table `applicant_survey` */

DROP TABLE IF EXISTS `applicant_survey`;

CREATE TABLE `applicant_survey` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `validator_id` varchar(100) DEFAULT NULL,
  `scholar_id` varchar(100) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `applicant_survey` */

insert  into `applicant_survey`(`file_id`,`filename`,`file`,`validator_id`,`scholar_id`,`remarks`) values 
(4,'House Info','uploads/USR-372f4fceece53-240112/HouseInfo4.jpg','USR-a088398e8cfe7-231126','USR-372f4fceece53-240112','This is for House info'),
(5,'House Info','uploads/USR-372f4fceece53-240112/HouseInfo5.jpg','USR-a088398e8cfe7-231126','USR-372f4fceece53-240112','This is for House info'),
(6,'House Info','uploads/USR-372f4fceece53-240112/HouseInfo6.png','USR-a088398e8cfe7-231126','USR-372f4fceece53-240112','This is for House info'),
(7,'House Info','uploads/USR-eae671a6bb3fd-240113/HouseInfo1.png','USR-a088398e8cfe7-231126','USR-eae671a6bb3fd-240113','MGA BALAY'),
(8,'House Info','uploads/USR-eae671a6bb3fd-240113/HouseInfo2.png','USR-a088398e8cfe7-231126','USR-eae671a6bb3fd-240113','MGA BALAY'),
(9,'House Info','uploads/USR-eae671a6bb3fd-240113/HouseInfo3.jpg','USR-a088398e8cfe7-231126','USR-eae671a6bb3fd-240113','MGA BALAY'),
(10,'LOTE INFO','uploads/USR-eae671a6bb3fd-240113/LOTEINFO1.jpg','USR-a088398e8cfe7-231126','USR-eae671a6bb3fd-240113','WALA NABAYRAN ILANG YUTA'),
(11,'EVIDENCE FOR CI','uploads/USR-88dadc85ad2c6-240115/EVIDENCEFORCI1.jpg','USR-a088398e8cfe7-231126','USR-88dadc85ad2c6-240115','PASSED\r\n'),
(12,'EVIDENCE FOR CI','uploads/USR-88dadc85ad2c6-240115/EVIDENCEFORCI2.png','USR-a088398e8cfe7-231126','USR-88dadc85ad2c6-240115','PASSED\r\n'),
(13,'EVIDENCE FOR CI','uploads/USR-88dadc85ad2c6-240115/EVIDENCEFORCI3.png','USR-a088398e8cfe7-231126','USR-88dadc85ad2c6-240115','PASSED\r\n'),
(14,'Land','uploads/USR-8f3efaae3ab1a-240212/Land1.png','USR-a088398e8cfe7-231126','USR-8f3efaae3ab1a-240212','Mao ni ilang luna');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `courses` */

insert  into `courses`(`course_name`) values 
('Bachelor of Science in Information Systems'),
('Bachelor of Science in Information Technology'),
('Bachelor of Science in Agro-Forestry '),
('Bachelor of Science in Fisheries and Aquatic Sciences '),
('Bachelor of Science in Food Technology '),
('Bachelor of Science in Marine Biology '),
('Bachelor of Science in Marine Transportation'),
('Bachelor of Public Administration'),
('Bachelor of Science in Accountancy'),
('Bachelor of Science in Accounting Information System'),
('Bachelor of Science in Management Accounting'),
('Bachelor of Science in Business Administration');

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `email_id` varchar(100) DEFAULT NULL,
  `sender_id` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` varchar(100) DEFAULT NULL,
  `threadbool` enum('YES','NO') DEFAULT NULL,
  `sender_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email` */

insert  into `email`(`email_id`,`sender_id`,`subject`,`message`,`timestamp`,`threadbool`,`sender_name`) values 
('MAIL-d55f2cda2e66d-231128','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701150357','NO','ADMIN ADMIN'),
('MAIL-3d71fa9411793-231128','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701152138','NO','ADMIN ADMIN'),
('MAIL-623686c27588b-231128','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear Karen Milagrosa,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701152617','NO','VALIDATOR'),
('MAIL-68505fc334efe-231128','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear Karen Milagrosa,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701152659','NO','VALIDATOR'),
('MAIL-51b492e16f371-231128','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear Dorren Bermudez,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701152716','NO','VALIDATOR'),
('MAIL-1947793db79d9-231128','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear Dorren Bermudez,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701152766','NO','VALIDATOR'),
('MAIL-88fd9704d37f1-231128','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Dorren Bermudez,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2022-2023<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701152971','NO','MARIA CLARA'),
('MAIL-548ebe68e015a-231128','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b7cdc179a47c0-231128\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701153146','NO','MARIA CLARA'),
('MAIL-e5bded01ef0c0-231128','USR-7636a5b2be468-231120','RENEWAL PORTAL','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-936d2c1b8d609-231128\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701153798','NO','MARIA CLARA'),
('MAIL-3b5c3b4786974-231128','USR-8cb6c4860e40c-231128','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b7cdc179a47c0-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701186731','NO','Dorren Bermudez'),
('MAIL-d361d0d63332e-231128','USR-7636a5b2be468-231120','RETURNED QUARTERLY FORM','Quarterly Report : FIRST QUARTER has been returned to you. Visit the link to view the return comments.\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b7cdc179a47c0-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1701186759','NO','MARIA CLARA'),
('MAIL-4fbde1e00ba65-231128','USR-8cb6c4860e40c-231128','QUARTERLY FORM RESUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b7cdc179a47c0-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701186767','NO','Dorren Bermudez'),
('MAIL-c2f911b6e5dd8-231128','USR-7636a5b2be468-231120','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b7cdc179a47c0-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701186791','NO','MARIA CLARA'),
('MAIL-b31cfa5d75184-231128','USR-8cb6c4860e40c-231128','RENEWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-936d2c1b8d609-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1701186967','NO','Dorren Bermudez'),
('MAIL-e9c10e356e453-231128','USR-7636a5b2be468-231120','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-936d2c1b8d609-231128\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701187077','NO','MARIA CLARA'),
('MAIL-26e79cf18c8fd-231129','USR-28e6ba261cfe0-231129','You are now a scholar!','\r\n					Dear Karen Milagrosa,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					School Year: 2022-2023<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					Email: facilitator2@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701187751','NO','LUDIMAR BLASE'),
('MAIL-a435f52f0fc5c-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear Dorren Bermudez,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701187783','NO','SPONSOR'),
('MAIL-8734206d59fe5-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear Karen Milagrosa,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701187788','NO','SPONSOR'),
('MAIL-6451c7f743036-231129','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701188740','NO','ADMIN ADMIN'),
('MAIL-2f73f51ac2743-231129','USR-28e6ba261cfe0-231129','QUARTERLY REPORTS','\r\n							\r\n							Dear KAREN MILAGROSA,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-6246a30e1c3a5-231129\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							LUDIMAR BLASE<br>\r\n							Facilitator\r\n							\r\n							','1701218748','NO','LUDIMAR BLASE'),
('MAIL-5d134f59c8dc6-231129','USR-28e6ba261cfe0-231129','ALLOWANCE RELEASE','\r\n							\r\n							Dear KAREN MILAGROSA,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2022-2023 and month: November. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							LUDIMAR BLASE<br>\r\n							Facilitator\r\n							','1701219046','NO','LUDIMAR BLASE'),
('MAIL-b6733d3e09897-231129','USR-cba27e4938c3b-231128','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-6246a30e1c3a5-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701219187','NO','Karen Milagrosa'),
('MAIL-4e7bda36a819e-231129','USR-28e6ba261cfe0-231129','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-6246a30e1c3a5-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701219354','NO','LUDIMAR BLASE'),
('MAIL-90480cfccd5ce-231129','USR-28e6ba261cfe0-231129','RENEWAL PORTAL','\r\n							\r\n							Dear KAREN MILAGROSA,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-f4bdd47536fb9-231129\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							LUDIMAR BLASE<br>\r\n							Facilitator\r\n							\r\n							','1701219591','NO','LUDIMAR BLASE'),
('MAIL-75becb7ab3ee2-231129','USR-cba27e4938c3b-231128','RENEWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-f4bdd47536fb9-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1701219796','NO','Karen Milagrosa'),
('MAIL-1d43caecf2668-231129','USR-28e6ba261cfe0-231129','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-f4bdd47536fb9-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701219878','NO','LUDIMAR BLASE'),
('MAIL-18a3ddeb8308f-231129','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701220929','NO','ADMIN ADMIN'),
('MAIL-4105c12999e2e-231129','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701221104','NO','ADMIN ADMIN'),
('MAIL-2ac7de21f5a81-231129','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear Fairylyn Jean Jaictin,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221188','NO','VALIDATOR'),
('MAIL-2a0d0c12c4b41-231129','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear Fairylyn Jean Jaictin,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221226','NO','VALIDATOR'),
('MAIL-06f80dd9f509c-231129','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear Paul Orig,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221268','NO','VALIDATOR'),
('MAIL-18d71b7235caf-231129','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear Paul Orig,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221285','NO','VALIDATOR'),
('MAIL-e103de1255bb6-231129','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Fairylyn Jean Jaictin,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2022-2023<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701221311','NO','MARIA CLARA'),
('MAIL-3ce3bf201a16b-231129','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Paul Orig,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701221318','NO','MARIA CLARA'),
('MAIL-6652b3a0f142b-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear Fairylyn Jean Jaictin,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701221329','NO','SPONSOR'),
('MAIL-1638ba63871c4-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear Paul Orig,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701221337','NO','SPONSOR'),
('MAIL-40b82447ee0aa-231129','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear fernan Pascual,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221453','NO','VALIDATOR'),
('MAIL-a03a8c2d4946e-231129','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear fernan Pascual,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701221461','NO','VALIDATOR'),
('MAIL-9daa46a442164-231129','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear fernan Pascual,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701221470','NO','MARIA CLARA'),
('MAIL-79b70e25becf8-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear fernan Pascual,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701221480','NO','SPONSOR'),
('MAIL-5f2461385c388-231129','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear PAUL ORIG,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: January. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1701221502','NO','MARIA CLARA'),
('MAIL-35e4094fdca8e-231129','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear FERNAN PASCUAL,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: January. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1701221502','NO','MARIA CLARA'),
('MAIL-0cf51fd465858-231129','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of January this school year: 2023-2024 \r\n			with an amount of 7,000.00\r\n			has been recorded as claimed on 2023-01-24. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1701221562','NO','MARIA CLARA'),
('MAIL-5c2157f99b257-231129','USR-7636a5b2be468-231120','RETURNED ALLOWANCE','RETURNED ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that your allowance for the month of January for the current school year, amounting to 7,000.00, has been returned to the designated IN-CHARGE.\r\n			<br><br>\r\n			Regrettably, it appears that you did not claim your allowance and its being returned to the management last 2023-01-24. If there were any unforeseen circumstances or if you have concerns regarding this matter, we kindly request you to reply to this email at your earliest convenience.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1701221605','NO','MARIA CLARA'),
('MAIL-97d4cbfdf01bb-231129','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear PAUL ORIG,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d6573bee97d6f-231129\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701221736','NO','MARIA CLARA'),
('MAIL-79d6426b87544-231129','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear FERNAN PASCUAL,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-020dc560c57f5-231129\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701221736','NO','MARIA CLARA'),
('MAIL-b902a39f9681f-231129','USR-22812901fb5c2-231129','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d6573bee97d6f-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701221802','NO','Paul Orig'),
('MAIL-9ad03124d2f11-231129','USR-7636a5b2be468-231120','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d6573bee97d6f-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701221823','NO','MARIA CLARA'),
('MAIL-459493409dac2-231129','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1701227605','NO','ADMIN ADMIN'),
('MAIL-c367a1a121101-231129','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear Fairylyn  Jaictin,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701227999','NO','VALIDATOR'),
('MAIL-6fd41880c6be4-231129','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear Fairylyn  Jaictin,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1701228101','NO','VALIDATOR'),
('MAIL-45bb64acb5131-231129','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Fairylyn  Jaictin,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1701228185','NO','MARIA CLARA'),
('MAIL-f1aceb8907196-231129','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear Fairylyn  Jaictin,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1701228606','NO','SPONSOR'),
('MAIL-e38055aecc8c4-231129','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: November. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1701228698','NO','MARIA CLARA'),
('MAIL-2819ce936271a-231129','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear FAIRYLYN  JAICTIN,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: November. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1701228698','NO','MARIA CLARA'),
('MAIL-90668f8062085-231129','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of November this school year: 2024-2025 \r\n			with an amount of 7,000.00\r\n			has been recorded as claimed on 2023-11-29. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1701228812','NO','MARIA CLARA'),
('MAIL-4bf444aaa16fa-231129','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for November for school year: 2024-2025\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1701228884','NO','MARIA CLARA'),
('MAIL-dc47fe906e13b-231129','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of November this school year: 2024-2025 \r\n			with an amount of 7,000.00\r\n			has been recorded as claimed on 2023-11-29. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1701228897','NO','MARIA CLARA'),
('MAIL-6ddcd38791034-231129','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-f401af9402c6f-231129\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701229098','NO','MARIA CLARA'),
('MAIL-ef2808cd4342a-231129','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear FAIRYLYN  JAICTIN,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d9c01c2d79338-231129\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701229098','NO','MARIA CLARA'),
('MAIL-fd3dc27773771-231129','USR-59ba09f1015db-231129','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d9c01c2d79338-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701229263','NO','Fairylyn  Jaictin'),
('MAIL-9bd3399ad2881-231129','USR-7636a5b2be468-231120','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-d9c01c2d79338-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701229346','NO','MARIA CLARA'),
('MAIL-5c5f6193de1d0-231129','USR-7636a5b2be468-231120','RENEWAL PORTAL','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-d45c1ef89f862-231129\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701229375','NO','MARIA CLARA'),
('MAIL-ba4eba2e56478-231129','USR-7636a5b2be468-231120','RENEWAL PORTAL','\r\n							\r\n							Dear FAIRYLYN  JAICTIN,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-b51750b9eae71-231129\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1701229375','NO','MARIA CLARA'),
('MAIL-2381438f15a3b-231129','USR-59ba09f1015db-231129','RENEWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-b51750b9eae71-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1701229638','NO','Fairylyn  Jaictin'),
('MAIL-9077466f0c8cd-231129','USR-7636a5b2be468-231120','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-b51750b9eae71-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1701229669','NO','MARIA CLARA'),
('MAIL-79ec0be6b4eca-231223','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1703314169','NO','ADMIN ADMIN'),
('MAIL-6cb246ba02c64-231223','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear try try,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1703315286','NO','VALIDATOR'),
('MAIL-7912b364d9d89-231223','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear try try,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1703315956','NO','VALIDATOR'),
('MAIL-fa08aeda4816d-231223','USR-09b9f4896673f-231223','You are now a scholar!','\r\n					Dear try try,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIAH DB<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIAH DB<br>\r\n					Email: facilitator3@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1703317127','NO','MARIAH DB'),
('MAIL-bcf125495f385-231223','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear try try,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1703317139','NO','SPONSOR'),
('MAIL-a27d155139da6-231223','USR-09b9f4896673f-231223','ALLOWANCE RELEASE','\r\n							\r\n							Dear TRY TRY,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: December. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIAH DB<br>\r\n							Facilitator\r\n							','1703317507','NO','MARIAH DB'),
('MAIL-99d603222b151-231223','USR-09b9f4896673f-231223','QUARTERLY REPORTS','\r\n							\r\n							Dear TRY TRY,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-72beaa38b2a16-231223\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIAH DB<br>\r\n							Facilitator\r\n							\r\n							','1703317756','NO','MARIAH DB'),
('MAIL-132c76db0a684-231223','USR-69539ad8082a9-231223','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-72beaa38b2a16-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703318275','NO','try try'),
('MAIL-eccad0a6e0b0f-231223','USR-09b9f4896673f-231223','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-72beaa38b2a16-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703318667','NO','MARIAH DB'),
('MAIL-f7d3a59c917d7-231223','USR-09b9f4896673f-231223','RENEWAL PORTAL','\r\n							\r\n							Dear TRY TRY,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-e2d54990613ce-231223\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MARIAH DB<br>\r\n							Facilitator\r\n							\r\n							','1703318692','NO','MARIAH DB'),
('MAIL-d5f209b9c9840-231223','USR-69539ad8082a9-231223','RENEWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-e2d54990613ce-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1703319331','NO','try try'),
('MAIL-251a6565e235f-231223','USR-09b9f4896673f-231223','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-e2d54990613ce-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703319362','NO','MARIAH DB'),
('MAIL-33ecccb5fece3-231223','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1703320486','NO','ADMIN ADMIN'),
('MAIL-62efb23ac4326-231223','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear try2 try2,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1703320524','NO','VALIDATOR'),
('MAIL-01528fe575b2b-231223','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear try2 try2,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1703320532','NO','VALIDATOR'),
('MAIL-88955b4c87496-231223','USR-09b9f4896673f-231223','You are now a scholar!','\r\n					Dear try2 try2,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIAH DB<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIAH DB<br>\r\n					Email: facilitator3@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1703320544','NO','MARIAH DB'),
('MAIL-bd9fb2240f7c6-231223','USR-ad02710943659-230523','You now have a sponsor!','\r\n					Dear try2 try2,\r\n					<br><br>\r\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \r\n					<br>We are delighted to welcome you into our esteemed scholarship program.\r\n					<br><br>\r\n\r\n					SPONSOR\r\n					','1703320579','NO','SPONSOR'),
('MAIL-607a01db7e530-231223','USR-09b9f4896673f-231223','QUARTERLY REPORTS','\r\n							\r\n							Dear TRY2 TRY2,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b6cc536ffaa58-231223\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIAH DB<br>\r\n							Facilitator\r\n							\r\n							','1703320868','NO','MARIAH DB'),
('MAIL-c2f28628027ce-231223','USR-f49766a473f7c-231223','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b6cc536ffaa58-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703320945','NO','try2 try2'),
('MAIL-6a65d9f4d4d73-231223','USR-09b9f4896673f-231223','RENEWAL PORTAL','\r\n							\r\n							Dear TRY2 TRY2,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-1d802ef1217f1-231223\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MARIAH DB<br>\r\n							Facilitator\r\n							\r\n							','1703320976','NO','MARIAH DB'),
('MAIL-6a5fb321f1397-231223','USR-f49766a473f7c-231223','RENEWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-1d802ef1217f1-231223\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1703321030','NO','try2 try2'),
('MAIL-459dc02988776-231227','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-b2f92fc012367-231227\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1703644392','NO','MARIA CLARA'),
('MAIL-17d8e4667a057-231227','USR-8cb6c4860e40c-231128','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: FIRST QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-f401af9402c6f-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703644631','NO','Dorren Bermudez'),
('MAIL-5e437a2e914ea-231227','USR-7636a5b2be468-231120','QUARTERLY REPORT REVIEW DONE','Quarterly Report : FIRST QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-f401af9402c6f-231129\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1703644707','NO','MARIA CLARA'),
('MAIL-85df5af3e3272-240113','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705128626','NO','ADMIN ADMIN'),
('MAIL-52c9cd2d7d45d-240113','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear THOR MARIPHIL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>YOU NEED TO UPDATE YOUR PARENTS INFO<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705128719','NO','VALIDATOR'),
('MAIL-72f20bf33ca08-240113','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705128773','NO','ADMIN ADMIN'),
('MAIL-4b210920097f9-240113','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear THOR MARIPHIL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705128828','NO','VALIDATOR'),
('MAIL-ccfe2efa180d3-240113','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear THOR MARIPHIL,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705128863','NO','VALIDATOR'),
('MAIL-29e0da050f992-240114','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for January for school year: 2023-2024\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178741','NO','MARIA CLARA'),
('MAIL-5a31f452ff73c-240114','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of January this school year: 2023-2024 \r\n			with an amount of 7,000.00\r\n			has been recorded as claimed on 2024-01-14. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178751','NO','MARIA CLARA'),
('MAIL-bcf3589c629f1-240114','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for January for school year: 2023-2024\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178754','NO','MARIA CLARA'),
('MAIL-6f8d15669bd91-240114','USR-7636a5b2be468-231120','RETURNED ALLOWANCE','RETURNED ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that your allowance for the month of January for the current school year, amounting to 7,000.00, has been returned to the designated IN-CHARGE.\r\n			<br><br>\r\n			Regrettably, it appears that you did not claim your allowance and its being returned to the management last 2024-01-14. If there were any unforeseen circumstances or if you have concerns regarding this matter, we kindly request you to reply to this email at your earliest convenience.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178760','NO','MARIA CLARA'),
('MAIL-d4a7721ba7e5b-240114','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for January for school year: 2023-2024\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178763','NO','MARIA CLARA'),
('MAIL-eb8c1b25f0d00-240114','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of January this school year: 2023-2024 \r\n			with an amount of 7,000.00\r\n			has been recorded as claimed on 2024-01-14. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705178768','NO','MARIA CLARA'),
('MAIL-970653b2cfb86-240114','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear DORREN BERMUDEZ,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: January. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1705178782','NO','MARIA CLARA'),
('MAIL-39c533cb39c05-240114','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear PAUL ORIG,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: June. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,500.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1705199467','NO','MARIA CLARA'),
('MAIL-c30678e600e6f-240114','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear FERNAN PASCUAL,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: June. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 6,900.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1705199467','NO','MARIA CLARA'),
('MAIL-c8ce025a73bdf-240114','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear PAUL ORIG,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: August. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 2,500.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1705203451','NO','MARIA CLARA'),
('MAIL-30b4f9c22cfe4-240114','USR-7636a5b2be468-231120','ALLOWANCE RELEASE','\r\n							\r\n							Dear FERNAN PASCUAL,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2023-2024 and month: August. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 2,500.00. <br><br>\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							','1705203451','NO','MARIA CLARA'),
('MAIL-4092f5d4e2380-240114','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of August this school year: 2023-2024 \r\n			with an amount of 2,500.00\r\n			has been recorded as claimed on 2024-01-14. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203706','NO','MARIA CLARA'),
('MAIL-38ff036ec4c60-240114','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of August this school year: 2023-2024 \r\n			with an amount of 2,500.00\r\n			has been recorded as claimed on 2024-01-16. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203724','NO','MARIA CLARA'),
('MAIL-04da6a470402d-240114','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for August for school year: 2023-2024\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203738','NO','MARIA CLARA'),
('MAIL-a54909cfe5445-240114','USR-7636a5b2be468-231120','CLAIMED ALLOWANCE','CLAIMED ALLOWANCE\r\n			<br><br>\r\n			Your allowance for the month of August this school year: 2023-2024 \r\n			with an amount of 2,500.00\r\n			has been recorded as claimed on 2024-01-16. <br><br>\r\n			If you did not claim this allowance, you may reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203744','NO','MARIA CLARA'),
('MAIL-df9cb21c49ac0-240114','USR-7636a5b2be468-231120','REVERT ALLOWANCE','REVERT ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that the allowance for August for school year: 2023-2024\r\n			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203747','NO','MARIA CLARA'),
('MAIL-01f504c827576-240114','USR-7636a5b2be468-231120','RETURNED ALLOWANCE','RETURNED ALLOWANCE\r\n			<br><br>\r\n			We would like to inform you that your allowance for the month of August for the current school year, amounting to 2,500.00, has been returned to the designated IN-CHARGE.\r\n			<br><br>\r\n			Regrettably, it appears that you did not claim your allowance and its being returned to the management last 2024-01-17. If there were any unforeseen circumstances or if you have concerns regarding this matter, we kindly request you to reply to this email at your earliest convenience.\r\n			<br><br>\r\n			Regards,<br>\r\n			Mariphil Inc.\r\n			','1705203755','NO','MARIA CLARA'),
('MAIL-80f2f933d623a-240114','USR-28e6ba261cfe0-231129','You are now a scholar!','\r\n					Dear fernan Pascual,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					Email: facilitator2@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1705211058','NO','LUDIMAR BLASE'),
('MAIL-9e4650e741493-240114','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Paul Orig,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1705212311','NO','MARIA CLARA'),
('MAIL-ef2b7cb81b2ec-240115','USR-28e6ba261cfe0-231129','You are now a scholar!','\r\n					Dear Karen Milagrosa,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: LUDIMAR BLASE<br>\r\n					Email: facilitator2@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1705297611','NO','LUDIMAR BLASE'),
('MAIL-60c626c84576f-240115','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705298201','NO','ADMIN ADMIN'),
('MAIL-d795e42dfdfff-240115','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear TOPSON TSAVITSAANEN,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>UPDATE PLEASE<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705298237','NO','VALIDATOR'),
('MAIL-cbffb2fc01b06-240115','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705299486','NO','ADMIN ADMIN'),
('MAIL-5a85baa68d5ee-240115','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705299546','NO','ADMIN ADMIN'),
('MAIL-8715312d7dea5-240115','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear TOPSON TSAVITSAANEN,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>BALIK<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705299693','NO','VALIDATOR'),
('MAIL-3766031444c5b-240115','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1705299832','NO','ADMIN ADMIN'),
('MAIL-4facec3b72a30-240115','USR-a088398e8cfe7-231126','Application Process Status: To be Interviewed','\r\n					Dear TOPSON TSAVITSAANEN,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705299929','NO','VALIDATOR'),
('MAIL-5540727fb49ee-240115','USR-a088398e8cfe7-231126','Application Process Status: Interviewed','\r\n					Dear TOPSON TSAVITSAANEN,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1705299936','NO','VALIDATOR'),
('MAIL-8fb5da60d408d-240115','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear TOPSON TSAVITSAANEN,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1705299990','NO','MARIA CLARA'),
('MAIL-60b7d0b38ecfa-240115','USR-7636a5b2be468-231120','QUARTERLY REPORTS','\r\n							\r\n							Dear TOPSON TSAVITSAANEN,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-44ed09a721a85-240115\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MARIA CLARA<br>\r\n							Facilitator\r\n							\r\n							','1705300049','NO','MARIA CLARA'),
('MAIL-e134f1c0bac1c-240115','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear TOPSON TSAVITSAANEN,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1705303842','NO','SPONSOR'),
('MAIL-78c8c1ea372a3-240115','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear TOPSON TSAVITSAANEN,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1705303869','NO','SPONSOR'),
('MAIL-7b8a57b88459c-240115','USR-7636a5b2be468-231120','You are now a scholar!','\r\n					Dear Dorren Bermudez,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MARIA CLARA<br>\r\n					Email: facilitator@yopmail.com<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1705305257','NO','MARIA CLARA'),
('MAIL-8811e53608b4d-240115','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear Dorren Bermudez,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1705305272','NO','SPONSOR'),
('MAIL-6344d88350f67-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707708137','NO','ADMIN ADMIN'),
('MAIL-4c564fe29cf8a-240212','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear DEAD POOL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>PAUPDATE KO BALIK<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1707708176','NO','VALIDATOR'),
('MAIL-ee0d73e6829bc-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707709550','NO','ADMIN ADMIN'),
('MAIL-dc64809aefef4-240212','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear DEAD POOL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>balik napud<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1707709572','NO','VALIDATOR'),
('MAIL-4816b70a08bde-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707709639','NO','ADMIN ADMIN'),
('MAIL-ef83c839c2597-240212','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear DEAD POOL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>katulong balik<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1707709664','NO','VALIDATOR'),
('MAIL-37acee4acafb2-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707710176','NO','ADMIN ADMIN'),
('MAIL-3925d25e7c646-240212','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear DEAD POOL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>BALIK KAUPAT<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1707710212','NO','VALIDATOR'),
('MAIL-4e3994cb305e5-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707713642','NO','ADMIN ADMIN'),
('MAIL-d13a837b0e394-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707713816','NO','ADMIN ADMIN'),
('MAIL-76ed9ff88be8f-240212','USR-a088398e8cfe7-231126','Application Process Status: For Review (FOR UPDATE)','\r\n					Dear DEAD POOL,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: FOR REVIEW (FOR UPDATE INFORMATION)\r\n					<br><br>\r\n					Validator asked you to review and update your information\r\n					<br><br>\r\n					Remarks:\r\n					<br><br>KALIMANG BALIK<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1707713848','NO','VALIDATOR'),
('MAIL-d978775f957a2-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707713916','NO','ADMIN ADMIN'),
('MAIL-cf4ab3e8d479e-240212','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1707715706','NO','ADMIN ADMIN');

/*Table structure for table `email_attachments` */

DROP TABLE IF EXISTS `email_attachments`;

CREATE TABLE `email_attachments` (
  `tbl_id` varchar(100) DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `email_attachments` */

/*Table structure for table `email_receipients` */

DROP TABLE IF EXISTS `email_receipients`;

CREATE TABLE `email_receipients` (
  `email_id` varchar(100) DEFAULT NULL,
  `receipient_id` varchar(100) DEFAULT NULL,
  `isread` enum('read','unread') DEFAULT NULL,
  `receipient_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_receipients` */

insert  into `email_receipients`(`email_id`,`receipient_id`,`isread`,`receipient_name`) values 
('MAIL-d55f2cda2e66d-231128','USR-cba27e4938c3b-231128','read','Karen Milagrosa'),
('MAIL-3d71fa9411793-231128','USR-8cb6c4860e40c-231128','read','Dorren Bermudez'),
('MAIL-623686c27588b-231128','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-68505fc334efe-231128','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-51b492e16f371-231128','USR-8cb6c4860e40c-231128','read','Dorren Bermudez'),
('MAIL-1947793db79d9-231128','USR-8cb6c4860e40c-231128','read','Dorren Bermudez'),
('MAIL-88fd9704d37f1-231128','USR-8cb6c4860e40c-231128','read','Dorren Bermudez'),
('MAIL-548ebe68e015a-231128','USR-8cb6c4860e40c-231128','read','DORREN BERMUDEZ'),
('MAIL-e5bded01ef0c0-231128','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-3b5c3b4786974-231128','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-d361d0d63332e-231128','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-4fbde1e00ba65-231128','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-c2f911b6e5dd8-231128','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-b31cfa5d75184-231128','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-e9c10e356e453-231128','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-26e79cf18c8fd-231129','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-a435f52f0fc5c-231129','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-8734206d59fe5-231129','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-6451c7f743036-231129','USR-1d20b5b2f7663-231128','unread','Fairylyn Jean Jaictin'),
('MAIL-2f73f51ac2743-231129','USR-cba27e4938c3b-231128','unread','KAREN MILAGROSA'),
('MAIL-5d134f59c8dc6-231129','USR-cba27e4938c3b-231128','read','KAREN MILAGROSA'),
('MAIL-b6733d3e09897-231129','USR-28e6ba261cfe0-231129','read','LUDIMAR BLASE'),
('MAIL-4e7bda36a819e-231129','USR-cba27e4938c3b-231128','read','Karen Milagrosa'),
('MAIL-90480cfccd5ce-231129','USR-cba27e4938c3b-231128','unread','KAREN MILAGROSA'),
('MAIL-75becb7ab3ee2-231129','USR-28e6ba261cfe0-231129','read','LUDIMAR BLASE'),
('MAIL-1d43caecf2668-231129','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-18a3ddeb8308f-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-4105c12999e2e-231129','USR-22812901fb5c2-231129','read','Paul Orig'),
('MAIL-2ac7de21f5a81-231129','USR-1d20b5b2f7663-231128','unread','Fairylyn Jean Jaictin'),
('MAIL-2a0d0c12c4b41-231129','USR-1d20b5b2f7663-231128','unread','Fairylyn Jean Jaictin'),
('MAIL-06f80dd9f509c-231129','USR-22812901fb5c2-231129','read','Paul Orig'),
('MAIL-18d71b7235caf-231129','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-e103de1255bb6-231129','USR-1d20b5b2f7663-231128','unread','Fairylyn Jean Jaictin'),
('MAIL-3ce3bf201a16b-231129','USR-22812901fb5c2-231129','read','Paul Orig'),
('MAIL-6652b3a0f142b-231129','USR-1d20b5b2f7663-231128','unread','Fairylyn Jean Jaictin'),
('MAIL-1638ba63871c4-231129','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-40b82447ee0aa-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-a03a8c2d4946e-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-9daa46a442164-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-79b70e25becf8-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-5f2461385c388-231129','USR-22812901fb5c2-231129','unread','PAUL ORIG'),
('MAIL-35e4094fdca8e-231129','USR-8f3a0f454bab2-231129','unread','FERNAN PASCUAL'),
('MAIL-0cf51fd465858-231129','USR-22812901fb5c2-231129','read','Paul Orig'),
('MAIL-5c2157f99b257-231129','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-97d4cbfdf01bb-231129','USR-22812901fb5c2-231129','unread','PAUL ORIG'),
('MAIL-79d6426b87544-231129','USR-8f3a0f454bab2-231129','unread','FERNAN PASCUAL'),
('MAIL-b902a39f9681f-231129','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-9ad03124d2f11-231129','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-459493409dac2-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-c367a1a121101-231129','USR-59ba09f1015db-231129','read','Fairylyn  Jaictin'),
('MAIL-6fd41880c6be4-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-45bb64acb5131-231129','USR-59ba09f1015db-231129','read','Fairylyn  Jaictin'),
('MAIL-f1aceb8907196-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-e38055aecc8c4-231129','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-2819ce936271a-231129','USR-59ba09f1015db-231129','read','FAIRYLYN  JAICTIN'),
('MAIL-90668f8062085-231129','USR-59ba09f1015db-231129','read','Fairylyn  Jaictin'),
('MAIL-4bf444aaa16fa-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-dc47fe906e13b-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-6ddcd38791034-231129','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-ef2808cd4342a-231129','USR-59ba09f1015db-231129','read','FAIRYLYN  JAICTIN'),
('MAIL-fd3dc27773771-231129','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-9bd3399ad2881-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-5c5f6193de1d0-231129','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-ba4eba2e56478-231129','USR-59ba09f1015db-231129','unread','FAIRYLYN  JAICTIN'),
('MAIL-2381438f15a3b-231129','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-9077466f0c8cd-231129','USR-59ba09f1015db-231129','unread','Fairylyn  Jaictin'),
('MAIL-79ec0be6b4eca-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-6cb246ba02c64-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-7912b364d9d89-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-fa08aeda4816d-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-bcf125495f385-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-a27d155139da6-231223','USR-69539ad8082a9-231223','unread','TRY TRY'),
('MAIL-99d603222b151-231223','USR-69539ad8082a9-231223','unread','TRY TRY'),
('MAIL-132c76db0a684-231223','USR-09b9f4896673f-231223','unread','MARIAH DB'),
('MAIL-eccad0a6e0b0f-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-f7d3a59c917d7-231223','USR-69539ad8082a9-231223','unread','TRY TRY'),
('MAIL-d5f209b9c9840-231223','USR-09b9f4896673f-231223','unread','MARIAH DB'),
('MAIL-251a6565e235f-231223','USR-69539ad8082a9-231223','unread','try try'),
('MAIL-33ecccb5fece3-231223','USR-f49766a473f7c-231223','unread','try2 try2'),
('MAIL-62efb23ac4326-231223','USR-f49766a473f7c-231223','unread','try2 try2'),
('MAIL-01528fe575b2b-231223','USR-f49766a473f7c-231223','unread','try2 try2'),
('MAIL-88955b4c87496-231223','USR-f49766a473f7c-231223','unread','try2 try2'),
('MAIL-bd9fb2240f7c6-231223','USR-f49766a473f7c-231223','unread','try2 try2'),
('MAIL-607a01db7e530-231223','USR-f49766a473f7c-231223','unread','TRY2 TRY2'),
('MAIL-c2f28628027ce-231223','USR-09b9f4896673f-231223','unread','MARIAH DB'),
('MAIL-6a65d9f4d4d73-231223','USR-f49766a473f7c-231223','unread','TRY2 TRY2'),
('MAIL-6a5fb321f1397-231223','USR-09b9f4896673f-231223','unread','MARIAH DB'),
('MAIL-459dc02988776-231227','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-17d8e4667a057-231227','USR-7636a5b2be468-231120','unread','MARIA CLARA'),
('MAIL-5e437a2e914ea-231227','USR-8cb6c4860e40c-231128','read','Dorren Bermudez'),
('MAIL-85df5af3e3272-240113','USR-eae671a6bb3fd-240113','unread','THOR MARIPHIL'),
('MAIL-52c9cd2d7d45d-240113','USR-eae671a6bb3fd-240113','read','THOR MARIPHIL'),
('MAIL-72f20bf33ca08-240113','USR-eae671a6bb3fd-240113','unread','THOR MARIPHIL'),
('MAIL-4b210920097f9-240113','USR-eae671a6bb3fd-240113','unread','THOR MARIPHIL'),
('MAIL-ccfe2efa180d3-240113','USR-eae671a6bb3fd-240113','unread','THOR MARIPHIL'),
('MAIL-29e0da050f992-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-5a31f452ff73c-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-bcf3589c629f1-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-6f8d15669bd91-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-d4a7721ba7e5b-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-eb8c1b25f0d00-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-970653b2cfb86-240114','USR-8cb6c4860e40c-231128','unread','DORREN BERMUDEZ'),
('MAIL-39c533cb39c05-240114','USR-22812901fb5c2-231129','unread','PAUL ORIG'),
('MAIL-c30678e600e6f-240114','USR-8f3a0f454bab2-231129','unread','FERNAN PASCUAL'),
('MAIL-c8ce025a73bdf-240114','USR-22812901fb5c2-231129','unread','PAUL ORIG'),
('MAIL-30b4f9c22cfe4-240114','USR-8f3a0f454bab2-231129','unread','FERNAN PASCUAL'),
('MAIL-4092f5d4e2380-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-38ff036ec4c60-240114','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-04da6a470402d-240114','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-a54909cfe5445-240114','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-df9cb21c49ac0-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-01f504c827576-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-80f2f933d623a-240114','USR-8f3a0f454bab2-231129','unread','fernan Pascual'),
('MAIL-9e4650e741493-240114','USR-22812901fb5c2-231129','unread','Paul Orig'),
('MAIL-ef2b7cb81b2ec-240115','USR-cba27e4938c3b-231128','unread','Karen Milagrosa'),
('MAIL-60c626c84576f-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-d795e42dfdfff-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-cbffb2fc01b06-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-5a85baa68d5ee-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-8715312d7dea5-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-3766031444c5b-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-4facec3b72a30-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-5540727fb49ee-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-8fb5da60d408d-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-60b7d0b38ecfa-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-e134f1c0bac1c-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-78c8c1ea372a3-240115','USR-88dadc85ad2c6-240115','unread','TOPSON TSAVITSAANEN'),
('MAIL-7b8a57b88459c-240115','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-8811e53608b4d-240115','USR-8cb6c4860e40c-231128','unread','Dorren Bermudez'),
('MAIL-6344d88350f67-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-4c564fe29cf8a-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-ee0d73e6829bc-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-dc64809aefef4-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-4816b70a08bde-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-ef83c839c2597-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-37acee4acafb2-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-3925d25e7c646-240212','USR-4ffe620725cfc-240212','read','DEAD POOL'),
('MAIL-4e3994cb305e5-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-d13a837b0e394-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-76ed9ff88be8f-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-d978775f957a2-240212','USR-4ffe620725cfc-240212','unread','DEAD POOL'),
('MAIL-cf4ab3e8d479e-240212','USR-8f3efaae3ab1a-240212','read','PERCY JACKSON');

/*Table structure for table `email_thread` */

DROP TABLE IF EXISTS `email_thread`;

CREATE TABLE `email_thread` (
  `thread_id` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_thread` */

insert  into `email_thread`(`thread_id`,`email_id`) values 
('THREAD-ec1638b74d489-231128','MAIL-d55f2cda2e66d-231128'),
('THREAD-8c97262964fb7-231128','MAIL-3d71fa9411793-231128'),
('THREAD-a26f6efd33ac5-231128','MAIL-623686c27588b-231128'),
('THREAD-5c2e3515cea12-231128','MAIL-68505fc334efe-231128'),
('THREAD-c1a0fcc4d9584-231128','MAIL-51b492e16f371-231128'),
('THREAD-1f16be3a42aae-231128','MAIL-1947793db79d9-231128'),
('THREAD-b45a8f86d31df-231128','MAIL-88fd9704d37f1-231128'),
('THREAD-b0403670418de-231128','MAIL-548ebe68e015a-231128'),
('THREAD-96f3e1b08f838-231128','MAIL-e5bded01ef0c0-231128'),
('THREAD-53f38b7055dd5-231128','MAIL-3b5c3b4786974-231128'),
('THREAD-0144da4a6224e-231128','MAIL-d361d0d63332e-231128'),
('THREAD-750596e654b3d-231128','MAIL-4fbde1e00ba65-231128'),
('THREAD-9c21ef7ccad38-231128','MAIL-c2f911b6e5dd8-231128'),
('THREAD-941fc82d56c63-231128','MAIL-b31cfa5d75184-231128'),
('THREAD-64faf55853b33-231128','MAIL-e9c10e356e453-231128'),
('THREAD-ce95b82936326-231129','MAIL-26e79cf18c8fd-231129'),
('THREAD-144d4049d471a-231129','MAIL-a435f52f0fc5c-231129'),
('THREAD-814824bc66332-231129','MAIL-8734206d59fe5-231129'),
('THREAD-8fa26dc34116f-231129','MAIL-6451c7f743036-231129'),
('THREAD-23829e3adb55d-231129','MAIL-2f73f51ac2743-231129'),
('THREAD-c3c53cce9f832-231129','MAIL-5d134f59c8dc6-231129'),
('THREAD-76f583a2fc521-231129','MAIL-b6733d3e09897-231129'),
('THREAD-841eef4a6672e-231129','MAIL-4e7bda36a819e-231129'),
('THREAD-4064977fdfc5f-231129','MAIL-90480cfccd5ce-231129'),
('THREAD-6126f17b9b663-231129','MAIL-75becb7ab3ee2-231129'),
('THREAD-8bbe14e76abe8-231129','MAIL-1d43caecf2668-231129'),
('THREAD-f724cab9f26bf-231129','MAIL-18a3ddeb8308f-231129'),
('THREAD-0a874230fcf56-231129','MAIL-4105c12999e2e-231129'),
('THREAD-c12604080135b-231129','MAIL-2ac7de21f5a81-231129'),
('THREAD-56ea2c5a6393b-231129','MAIL-2a0d0c12c4b41-231129'),
('THREAD-109d949e042de-231129','MAIL-06f80dd9f509c-231129'),
('THREAD-bdecb85c587a4-231129','MAIL-18d71b7235caf-231129'),
('THREAD-49f5b3bef1ab5-231129','MAIL-e103de1255bb6-231129'),
('THREAD-3d9759b470038-231129','MAIL-3ce3bf201a16b-231129'),
('THREAD-4c952c3b19596-231129','MAIL-6652b3a0f142b-231129'),
('THREAD-aff760abf967a-231129','MAIL-1638ba63871c4-231129'),
('THREAD-6412997b3af2e-231129','MAIL-40b82447ee0aa-231129'),
('THREAD-357e11b55adeb-231129','MAIL-a03a8c2d4946e-231129'),
('THREAD-8a99ce71a285b-231129','MAIL-9daa46a442164-231129'),
('THREAD-c0e51cb7b2269-231129','MAIL-79b70e25becf8-231129'),
('THREAD-7a488f485e850-231129','MAIL-5f2461385c388-231129'),
('THREAD-34d3bee72a71a-231129','MAIL-35e4094fdca8e-231129'),
('THREAD-3363aeccc37db-231129','MAIL-0cf51fd465858-231129'),
('THREAD-1ec85fb875116-231129','MAIL-5c2157f99b257-231129'),
('THREAD-a44dfafe0f774-231129','MAIL-97d4cbfdf01bb-231129'),
('THREAD-31b5ddab32cbc-231129','MAIL-79d6426b87544-231129'),
('THREAD-a5ca0b88f039f-231129','MAIL-b902a39f9681f-231129'),
('THREAD-be1e624384338-231129','MAIL-9ad03124d2f11-231129'),
('THREAD-100ea3cf1e88d-231129','MAIL-459493409dac2-231129'),
('THREAD-027dcc2abc23d-231129','MAIL-c367a1a121101-231129'),
('THREAD-596c5386f47eb-231129','MAIL-6fd41880c6be4-231129'),
('THREAD-161336f80d81a-231129','MAIL-45bb64acb5131-231129'),
('THREAD-9be2c44dfaff7-231129','MAIL-f1aceb8907196-231129'),
('THREAD-887680457e16d-231129','MAIL-e38055aecc8c4-231129'),
('THREAD-7cd9762d73a8c-231129','MAIL-2819ce936271a-231129'),
('THREAD-bc643a038dadd-231129','MAIL-90668f8062085-231129'),
('THREAD-64c146878fbea-231129','MAIL-4bf444aaa16fa-231129'),
('THREAD-a824a0b7000f7-231129','MAIL-dc47fe906e13b-231129'),
('THREAD-3b8b524de6ae4-231129','MAIL-6ddcd38791034-231129'),
('THREAD-3358549d7fb5b-231129','MAIL-ef2808cd4342a-231129'),
('THREAD-380310400d9e8-231129','MAIL-fd3dc27773771-231129'),
('THREAD-56b5684308d2f-231129','MAIL-9bd3399ad2881-231129'),
('THREAD-8cee1bdd9e56e-231129','MAIL-5c5f6193de1d0-231129'),
('THREAD-9711cb6aa3ae0-231129','MAIL-ba4eba2e56478-231129'),
('THREAD-da33cf0d19e6d-231129','MAIL-2381438f15a3b-231129'),
('THREAD-743b707b78ee7-231129','MAIL-9077466f0c8cd-231129'),
('THREAD-1846a63791f22-231223','MAIL-79ec0be6b4eca-231223'),
('THREAD-39bac822679f6-231223','MAIL-6cb246ba02c64-231223'),
('THREAD-54d03467dfe09-231223','MAIL-7912b364d9d89-231223'),
('THREAD-632e744739b10-231223','MAIL-fa08aeda4816d-231223'),
('THREAD-2dc3f95f31bdc-231223','MAIL-bcf125495f385-231223'),
('THREAD-7b4c3f5c0b477-231223','MAIL-a27d155139da6-231223'),
('THREAD-e72be5b2d459d-231223','MAIL-99d603222b151-231223'),
('THREAD-305185a692ab1-231223','MAIL-132c76db0a684-231223'),
('THREAD-edc9834654a78-231223','MAIL-eccad0a6e0b0f-231223'),
('THREAD-53a69f326747f-231223','MAIL-f7d3a59c917d7-231223'),
('THREAD-5853d182355b6-231223','MAIL-d5f209b9c9840-231223'),
('THREAD-4e9cc754f3197-231223','MAIL-251a6565e235f-231223'),
('THREAD-6e5dc95c3a95f-231223','MAIL-33ecccb5fece3-231223'),
('THREAD-19c441c571404-231223','MAIL-62efb23ac4326-231223'),
('THREAD-9182178c9882b-231223','MAIL-01528fe575b2b-231223'),
('THREAD-3f99ecf58f069-231223','MAIL-88955b4c87496-231223'),
('THREAD-c3134d7b70231-231223','MAIL-bd9fb2240f7c6-231223'),
('THREAD-2f779a2b105bd-231223','MAIL-607a01db7e530-231223'),
('THREAD-242ce016eed3b-231223','MAIL-c2f28628027ce-231223'),
('THREAD-cf51d0699eb58-231223','MAIL-6a65d9f4d4d73-231223'),
('THREAD-0cfc99cc78b5d-231223','MAIL-6a5fb321f1397-231223'),
('THREAD-4be3da6d8bfb7-231227','MAIL-459dc02988776-231227'),
('THREAD-2e514927d99e5-231227','MAIL-17d8e4667a057-231227'),
('THREAD-ee5f9e9de64d0-231227','MAIL-5e437a2e914ea-231227'),
('THREAD-85c132ffe1b1d-240113','MAIL-85df5af3e3272-240113'),
('THREAD-3631ec4f3c9fd-240113','MAIL-52c9cd2d7d45d-240113'),
('THREAD-9208416fdc863-240113','MAIL-72f20bf33ca08-240113'),
('THREAD-2085c6878f096-240113','MAIL-4b210920097f9-240113'),
('THREAD-b54fc3d57b871-240113','MAIL-ccfe2efa180d3-240113'),
('THREAD-bc73c1345405b-240114','MAIL-29e0da050f992-240114'),
('THREAD-96c8f5224c312-240114','MAIL-5a31f452ff73c-240114'),
('THREAD-8a28414720c15-240114','MAIL-bcf3589c629f1-240114'),
('THREAD-5b41b65089a74-240114','MAIL-6f8d15669bd91-240114'),
('THREAD-b9a7dcd00d957-240114','MAIL-d4a7721ba7e5b-240114'),
('THREAD-d564b316acf23-240114','MAIL-eb8c1b25f0d00-240114'),
('THREAD-fb68e555725e7-240114','MAIL-970653b2cfb86-240114'),
('THREAD-b863d48c58e0f-240114','MAIL-39c533cb39c05-240114'),
('THREAD-932e6fd011d5b-240114','MAIL-c30678e600e6f-240114'),
('THREAD-74056ab901187-240114','MAIL-c8ce025a73bdf-240114'),
('THREAD-ec30dfbbd19b0-240114','MAIL-30b4f9c22cfe4-240114'),
('THREAD-eeb3186dc6277-240114','MAIL-4092f5d4e2380-240114'),
('THREAD-22120f425da41-240114','MAIL-38ff036ec4c60-240114'),
('THREAD-2a179dcedac9e-240114','MAIL-04da6a470402d-240114'),
('THREAD-a79f946b4c53b-240114','MAIL-a54909cfe5445-240114'),
('THREAD-cf07e22a251da-240114','MAIL-df9cb21c49ac0-240114'),
('THREAD-5688b296ede63-240114','MAIL-01f504c827576-240114'),
('THREAD-dc748f714a954-240114','MAIL-80f2f933d623a-240114'),
('THREAD-99298dd0f4d76-240114','MAIL-9e4650e741493-240114'),
('THREAD-edd7c9505bd13-240115','MAIL-ef2b7cb81b2ec-240115'),
('THREAD-8631f329807f7-240115','MAIL-60c626c84576f-240115'),
('THREAD-085c3ba4589d8-240115','MAIL-d795e42dfdfff-240115'),
('THREAD-97da44ecf03a2-240115','MAIL-cbffb2fc01b06-240115'),
('THREAD-4e6886a58c433-240115','MAIL-5a85baa68d5ee-240115'),
('THREAD-b6166488039c0-240115','MAIL-8715312d7dea5-240115'),
('THREAD-d598f485bb06a-240115','MAIL-3766031444c5b-240115'),
('THREAD-a0d7a125dd349-240115','MAIL-4facec3b72a30-240115'),
('THREAD-1a9241fb36b46-240115','MAIL-5540727fb49ee-240115'),
('THREAD-f81bc5e45d30a-240115','MAIL-8fb5da60d408d-240115'),
('THREAD-c7f64436719f3-240115','MAIL-60b7d0b38ecfa-240115'),
('THREAD-1b24dfa6b2a29-240115','MAIL-e134f1c0bac1c-240115'),
('THREAD-6afc6feec3981-240115','MAIL-78c8c1ea372a3-240115'),
('THREAD-56fdb241d6be9-240115','MAIL-7b8a57b88459c-240115'),
('THREAD-2f216608293b8-240115','MAIL-8811e53608b4d-240115'),
('THREAD-6c641781e136d-240212','MAIL-6344d88350f67-240212'),
('THREAD-cc768770c993a-240212','MAIL-4c564fe29cf8a-240212'),
('THREAD-4658ced44ce95-240212','MAIL-ee0d73e6829bc-240212'),
('THREAD-90e8f6d716976-240212','MAIL-dc64809aefef4-240212'),
('THREAD-34aab8e478294-240212','MAIL-4816b70a08bde-240212'),
('THREAD-d2e55f567fbd6-240212','MAIL-ef83c839c2597-240212'),
('THREAD-67ecb80e37fb8-240212','MAIL-37acee4acafb2-240212'),
('THREAD-51f9c3b5c548b-240212','MAIL-3925d25e7c646-240212'),
('THREAD-e81c6c534a928-240212','MAIL-4e3994cb305e5-240212'),
('THREAD-d0dde4d60fec8-240212','MAIL-d13a837b0e394-240212'),
('THREAD-6cf9d0ab6c041-240212','MAIL-76ed9ff88be8f-240212'),
('THREAD-59c7fa403de58-240212','MAIL-d978775f957a2-240212'),
('THREAD-1a6529712ddcf-240212','MAIL-cf4ab3e8d479e-240212');

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
('FORM-b80884ee07854-231128','QUARTERLY','2023-11-28','1701153146','14:32:26','USR-7636a5b2be468-231120','FIRST QUARTER','sy0001',NULL,NULL),
('FORM-be8829e386057-231129','QUARTERLY','2023-11-29','1701218748','08:45:48','USR-28e6ba261cfe0-231129','FIRST QUARTER','sy0001',NULL,NULL),
('FORM-49bfc8472059a-231129','QUARTERLY','2023-11-29','1701221736','09:35:36','USR-7636a5b2be468-231120','FIRST QUARTER','sy0002',NULL,NULL),
('FORM-2d9db7269c758-231129','QUARTERLY','2023-11-29','1701229098','11:38:18','USR-7636a5b2be468-231120','FIRST QUARTER','sy0003',NULL,NULL),
('FORM-8154202e8cb93-231223','QUARTERLY','2023-12-23','1703317756','15:49:16','USR-09b9f4896673f-231223','FIRST QUARTER','sy0003',NULL,NULL),
('FORM-581923e230020-231223','QUARTERLY','2023-12-23','1703320868','16:41:08','USR-09b9f4896673f-231223','FIRST QUARTER','sy0003',NULL,NULL),
('FORM-66a897d5dd87b-231227','QUARTERLY','2023-12-27','1703644392','10:33:12','USR-7636a5b2be468-231120','FIRST QUARTER','sy0003',NULL,NULL),
('FORM-9c07569ed4a77-240115','QUARTERLY','2024-01-15','1705300049','14:27:29','USR-7636a5b2be468-231120','SECOND QUARTER','sy0003',NULL,NULL);

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
('QUARTERLY-b7cdc179a47c0-231128','FORM-b80884ee07854-231128','USR-8cb6c4860e40c-231128','90','resources/scholar_achievements/QUARTERLY-b7cdc179a47c0-231128/Grades.pdf',NULL,'done checking\r\n','DONE','usaba'),
('QUARTERLY-6246a30e1c3a5-231129','FORM-be8829e386057-231129','USR-cba27e4938c3b-231128','98','resources/scholar_achievements/QUARTERLY-6246a30e1c3a5-231129/Birth Certificate.pdf',NULL,'THIS REPORT HAS BEEN APPROVED','DONE',NULL),
('QUARTERLY-d6573bee97d6f-231129','FORM-49bfc8472059a-231129','USR-22812901fb5c2-231129','90','resources/scholar_achievements/QUARTERLY-d6573bee97d6f-231129/4855443.jpg',NULL,'ok','DONE',NULL),
('QUARTERLY-020dc560c57f5-231129','FORM-49bfc8472059a-231129','USR-8f3a0f454bab2-231129',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-f401af9402c6f-231129','FORM-2d9db7269c758-231129','USR-8cb6c4860e40c-231128','90','resources/scholar_achievements/QUARTERLY-f401af9402c6f-231129/Birth Certificate.pdf',NULL,'ohnktt','DONE',NULL),
('QUARTERLY-d9c01c2d79338-231129','FORM-2d9db7269c758-231129','USR-59ba09f1015db-231129','90','resources/scholar_achievements/QUARTERLY-d9c01c2d79338-231129/Grades.pdf',NULL,'test','DONE',NULL),
('QUARTERLY-72beaa38b2a16-231223','FORM-8154202e8cb93-231223','USR-69539ad8082a9-231223','90','resources/scholar_achievements/QUARTERLY-72beaa38b2a16-231223/Grades.pdf',NULL,'ok\r\n','DONE',NULL),
('QUARTERLY-b6cc536ffaa58-231223','FORM-581923e230020-231223','USR-f49766a473f7c-231223','80','resources/scholar_achievements/QUARTERLY-b6cc536ffaa58-231223/documents.pdf',NULL,NULL,'FOR CHECKING',NULL),
('QUARTERLY-b2f92fc012367-231227','FORM-66a897d5dd87b-231227','USR-8cb6c4860e40c-231128',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-44ed09a721a85-240115','FORM-9c07569ed4a77-240115','USR-88dadc85ad2c6-240115',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL);

/*Table structure for table `monthly_monitoring_achievements` */

DROP TABLE IF EXISTS `monthly_monitoring_achievements`;

CREATE TABLE `monthly_monitoring_achievements` (
  `tbl_id` varchar(100) DEFAULT NULL,
  `achievement` varchar(100) DEFAULT NULL,
  `achievement_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_achievements` */

insert  into `monthly_monitoring_achievements`(`tbl_id`,`achievement`,`achievement_id`) values 
('QUARTERLY-df80cfb1fec5d-231121','First Honor','ACH-c5005ef555eb0-231121'),
('QUARTERLY-114f27c2085dd-231121','Academic Award','ACH-24bea6cf7c902-231121'),
('QUARTERLY-114f27c2085dd-231121','Second Honor','ACH-7d00af302c1cf-231121'),
('QUARTERLY-c94d259dc8629-231123','With Honor','ACH-37a33e43042d6-231123'),
('QUARTERLY-e728a9a7d311d-231126','With Honor','ACH-49314270dbd97-231126'),
('QUARTERLY-b7cdc179a47c0-231128','With Honor','ACH-a5adf7d83dc10-231128'),
('QUARTERLY-6246a30e1c3a5-231129','DEANS LISTER','ACH-fb8338d254445-231129'),
('QUARTERLY-d6573bee97d6f-231129','With Honor','ACH-34600a756f2e0-231129'),
('QUARTERLY-d9c01c2d79338-231129','With Honor','ACH-10771215e8ea2-231129'),
('QUARTERLY-72beaa38b2a16-231223','With Honor','ACH-41416ad7b79f5-231223'),
('QUARTERLY-b6cc536ffaa58-231223','With Honor','ACH-e2b8b77e5867d-231223'),
('QUARTERLY-f401af9402c6f-231129','FIrst Honor','ACH-40e9d634e2e4a-231227');

/*Table structure for table `monthly_monitoring_upload` */

DROP TABLE IF EXISTS `monthly_monitoring_upload`;

CREATE TABLE `monthly_monitoring_upload` (
  `upload_id` varchar(100) DEFAULT NULL,
  `upload_file` text DEFAULT NULL,
  `tbl_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_monitoring_upload` */

insert  into `monthly_monitoring_upload`(`upload_id`,`upload_file`,`tbl_id`) values 
('ImgAchv-41f8f77a53e54-231121','resources/scholar_achievements/QUARTERLY-df80cfb1fec5d-231121/ERD.png','QUARTERLY-df80cfb1fec5d-231121'),
('ImgAchv-3ce365729e2fc-231121','resources/scholar_achievements/QUARTERLY-114f27c2085dd-231121/ERD.png','QUARTERLY-114f27c2085dd-231121'),
('ImgAchv-2ccf84c83f6df-231121','resources/scholar_achievements/QUARTERLY-114f27c2085dd-231121/UPDATE4.pdf','QUARTERLY-114f27c2085dd-231121'),
('ImgAchv-aa9debca6e823-231123','resources/scholar_achievements/QUARTERLY-c94d259dc8629-231123/Untitled.png','QUARTERLY-c94d259dc8629-231123'),
('ImgAchv-3131ceca536e4-231126','resources/scholar_achievements/QUARTERLY-e728a9a7d311d-231126/Defense-Minutes-Format.docx.pdf','QUARTERLY-e728a9a7d311d-231126'),
('ImgAchv-c6eec60a04854-231126','resources/scholar_achievements/QUARTERLY-e728a9a7d311d-231126/Untitled.png','QUARTERLY-e728a9a7d311d-231126'),
('ImgAchv-e12252d4d334e-231128','resources/scholar_achievements/QUARTERLY-b7cdc179a47c0-231128/mini-star-achievement-medal-trophy-1675-800x800.png','QUARTERLY-b7cdc179a47c0-231128'),
('ImgAchv-47cb24256753e-231129','resources/scholar_achievements/QUARTERLY-6246a30e1c3a5-231129/boy.jpg','QUARTERLY-6246a30e1c3a5-231129'),
('ImgAchv-31aa01b7b5859-231129','resources/scholar_achievements/QUARTERLY-6246a30e1c3a5-231129/family picture.jpg','QUARTERLY-6246a30e1c3a5-231129'),
('ImgAchv-3a6b0dfb7c40a-231129','resources/scholar_achievements/QUARTERLY-6246a30e1c3a5-231129/girl.jpg','QUARTERLY-6246a30e1c3a5-231129'),
('ImgAchv-415e5098634c7-231129','resources/scholar_achievements/QUARTERLY-d6573bee97d6f-231129/280307397_141664815102203_6102495851884624070_n.jpg','QUARTERLY-d6573bee97d6f-231129'),
('ImgAchv-57b15d3c3d43d-231129','resources/scholar_achievements/QUARTERLY-d9c01c2d79338-231129/family picture.jpg','QUARTERLY-d9c01c2d79338-231129'),
('ImgAchv-5fecb4e6b37de-231223','resources/scholar_achievements/QUARTERLY-72beaa38b2a16-231223/boy.jpg','QUARTERLY-72beaa38b2a16-231223'),
('ImgAchv-5d80ee9f16ba1-231223','resources/scholar_achievements/QUARTERLY-72beaa38b2a16-231223/family picture.jpg','QUARTERLY-72beaa38b2a16-231223'),
('ImgAchv-47393411a3a8e-231223','resources/scholar_achievements/QUARTERLY-b6cc536ffaa58-231223/boy.jpg','QUARTERLY-b6cc536ffaa58-231223'),
('ImgAchv-4fcf07a938ea8-231223','resources/scholar_achievements/QUARTERLY-b6cc536ffaa58-231223/family picture.jpg','QUARTERLY-b6cc536ffaa58-231223'),
('ImgAchv-dfe9764c13522-231227','resources/scholar_achievements/QUARTERLY-f401af9402c6f-231129/documents.pdf','QUARTERLY-f401af9402c6f-231129');

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
('RENEW-936d2c1b8d609-231128','RenFORM-f9c4555e43938-231128','USR-8cb6c4860e40c-231128','resources/requirements/RENEW-936d2c1b8d609-231128/Grades.pdf','resources/requirements/RENEW-936d2c1b8d609-231128/Tuition Fee Report.pdf','resources/requirements/RENEW-936d2c1b8d609-231128/Certificate of registration.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE',NULL,NULL,NULL,'BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14),
('RENEW-f4bdd47536fb9-231129','RenFORM-fe83ac11cb5bf-231129','USR-cba27e4938c3b-231128','resources/requirements/RENEW-f4bdd47536fb9-231129/documents.pdf','resources/requirements/RENEW-f4bdd47536fb9-231129/Tuition Fee Report.pdf','resources/requirements/RENEW-f4bdd47536fb9-231129/Certificate of registration.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE',NULL,NULL,NULL,'BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14),
('RENEW-d45c1ef89f862-231129','RenFORM-ecd216f120f81-231129','USR-8cb6c4860e40c-231128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('RENEW-b51750b9eae71-231129','RenFORM-ecd216f120f81-231129','USR-59ba09f1015db-231129','resources/requirements/RENEW-b51750b9eae71-231129/Grades.pdf','resources/requirements/RENEW-b51750b9eae71-231129/girl.jpg','resources/requirements/RENEW-b51750b9eae71-231129/girl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE',NULL,NULL,NULL,'BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14),
('RENEW-e2d54990613ce-231223','RenFORM-1d246259eae36-231223','USR-69539ad8082a9-231223','resources/requirements/RENEW-e2d54990613ce-231223/Grades.pdf','resources/requirements/RENEW-e2d54990613ce-231223/documents.pdf','resources/requirements/RENEW-e2d54990613ce-231223/family picture.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE',NULL,NULL,NULL,'BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14),
('RENEW-1d802ef1217f1-231223','RenFORM-9a3d2d59233f2-231223','USR-f49766a473f7c-231223','resources/requirements/RENEW-1d802ef1217f1-231223/boy.jpg','resources/requirements/RENEW-1d802ef1217f1-231223/girl.jpg','resources/requirements/RENEW-1d802ef1217f1-231223/family picture.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FOR CHECKING','DNSC','SECOND YEAR','COLLEGE',NULL,NULL,NULL,'BSIS',14);

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
('RenFORM-f9c4555e43938-231128','USR-7636a5b2be468-231120','OPEN','2023-11-28','14:43:18',1701153798,'sy0001','sy0003'),
('RenFORM-fe83ac11cb5bf-231129','USR-28e6ba261cfe0-231129','OPEN','2023-11-29','08:59:51',1701219591,'sy0001','sy0002'),
('RenFORM-ecd216f120f81-231129','USR-7636a5b2be468-231120','OPEN','2023-11-29','11:42:55',1701229375,'sy0003','sy0004'),
('RenFORM-1d246259eae36-231223','USR-09b9f4896673f-231223','OPEN','2023-12-23','16:04:52',1703318692,'sy0003','sy0004'),
('RenFORM-385e3f068ea02-231223','USR-09b9f4896673f-231223','OPEN','2023-12-23','16:21:55',1703319715,'sy0003','sy0004'),
('RenFORM-fdeb58b848bea-231223','USR-09b9f4896673f-231223','OPEN','2023-12-23','16:22:28',1703319748,'sy0003','sy0005'),
('RenFORM-b8b188a2bae81-231223','USR-09b9f4896673f-231223','OPEN','2023-12-23','16:22:58',1703319778,'sy0003','sy0004'),
('RenFORM-9a3d2d59233f2-231223','USR-09b9f4896673f-231223','OPEN','2023-12-23','16:42:56',1703320976,'sy0003','sy0004');

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
('USR-8cb6c4860e40c-231128','sy0001','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-8cb6c4860e40c-231128','sy0003','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-cba27e4938c3b-231128','sy0001','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-cba27e4938c3b-231128','sy0002','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-1d20b5b2f7663-231128','sy0001','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-22812901fb5c2-231129','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-8f3a0f454bab2-231129','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-59ba09f1015db-231129','sy0003','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-59ba09f1015db-231129','sy0004','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-69539ad8082a9-231223','sy0003','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-69539ad8082a9-231223','sy0004','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-f49766a473f7c-231223','sy0003','DNSC','FIRST YEAR','BSIS','COLLEGE'),
('USR-8f3a0f454bab2-231129','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-22812901fb5c2-231129','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-cba27e4938c3b-231128','sy0002','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE'),
('USR-88dadc85ad2c6-240115','sy0003','AWIT','SECOND YEAR','BACHELOR OF SCIENCE IN FOREX TRADING','COLLEGE'),
('USR-8cb6c4860e40c-231128','sy0003','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','BACHELOR OF SCIENCE IN INFORMATION SYSTEM','COLLEGE');

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
('TR-88b1f1606e411-231128','USR-cba27e4938c3b-231128','APPLICANT - IN REVIEW','USR-cba27e4938c3b-231128','2023-11-28','13:45:57','1701150357',NULL),
('TR-fb2c3d014d275-231128','USR-8cb6c4860e40c-231128','APPLICANT - IN REVIEW','USR-8cb6c4860e40c-231128','2023-11-28','14:15:38','1701152138',NULL),
('TR-5bb10a080b1b0-231128','USR-cba27e4938c3b-231128','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-28','14:23:37','1701152617','PASSED.'),
('TR-635639aaa35f2-231128','USR-cba27e4938c3b-231128','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-28','14:24:19','1701152659','PASSED.'),
('TR-da18dbd00ab64-231128','USR-8cb6c4860e40c-231128','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-28','14:25:16','1701152716','PASSED'),
('TR-5cd2f527c6947-231128','USR-8cb6c4860e40c-231128','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-28','14:26:06','1701152766','PASSED'),
('TR-f0c54498aa00c-231129','USR-8cb6c4860e40c-231128','SCHOLAR','USR-ad02710943659-230523','2023-11-29','00:09:43','1701187783','SPONSOR'),
('TR-db2b383bbb5d6-231129','USR-cba27e4938c3b-231128','SCHOLAR','USR-ad02710943659-230523','2023-11-29','00:09:48','1701187788','SPONSOR'),
('TR-56f9f1f7aa7d9-231129','USR-1d20b5b2f7663-231128','APPLICANT - IN REVIEW','USR-1d20b5b2f7663-231128','2023-11-29','00:25:40','1701188740',NULL),
('TR-ddac082580ba9-231129','USR-8f3a0f454bab2-231129','APPLICANT - IN REVIEW','USR-8f3a0f454bab2-231129','2023-11-29','09:22:09','1701220929',NULL),
('TR-4ef16679cba64-231129','USR-22812901fb5c2-231129','APPLICANT - IN REVIEW','USR-22812901fb5c2-231129','2023-11-29','09:25:04','1701221104',NULL),
('TR-e98d8d06dc559-231129','USR-1d20b5b2f7663-231128','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:26:28','1701221188','Your applications passed! you may proceed to interview'),
('TR-9c56cd7dcd428-231129','USR-1d20b5b2f7663-231128','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:27:06','1701221226','Congratulations! You passed the interview!\r\n'),
('TR-edbf10bc1434a-231129','USR-22812901fb5c2-231129','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:27:48','1701221268','You passed the application\r\n'),
('TR-1d0fb74fcaecc-231129','USR-22812901fb5c2-231129','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:28:05','1701221285','You passed the interview'),
('TR-6b4d36841b5bc-231129','USR-1d20b5b2f7663-231128','SCHOLAR','USR-ad02710943659-230523','2023-11-29','09:28:49','1701221329','SPONSOR'),
('TR-81c4368ad18a1-231129','USR-22812901fb5c2-231129','SCHOLAR','USR-ad02710943659-230523','2023-11-29','09:28:57','1701221337','SPONSOR'),
('TR-f10fe2d13c4ea-231129','USR-8f3a0f454bab2-231129','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:30:53','1701221453','passed'),
('TR-d4d888f60b560-231129','USR-8f3a0f454bab2-231129','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','09:31:01','1701221461','passed'),
('TR-89d44f3589fd5-231129','USR-8f3a0f454bab2-231129','SCHOLAR','USR-ad02710943659-230523','2023-11-29','09:31:20','1701221480','SPONSOR'),
('TR-88e3af3f02fa0-231129','USR-59ba09f1015db-231129','APPLICANT - IN REVIEW','USR-59ba09f1015db-231129','2023-11-29','11:13:25','1701227605',NULL),
('TR-af3a0a1c7a7ec-231129','USR-59ba09f1015db-231129','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','11:19:59','1701227999','test'),
('TR-ea4f9d55a1bae-231129','USR-59ba09f1015db-231129','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-11-29','11:21:41','1701228101','test'),
('TR-66757dbff563b-231129','USR-59ba09f1015db-231129','SCHOLAR','USR-ad02710943659-230523','2023-11-29','11:30:06','1701228606','SPONSOR'),
('TR-a9aafdc96ff57-231223','USR-69539ad8082a9-231223','APPLICANT - IN REVIEW','USR-69539ad8082a9-231223','2023-12-23','14:49:29','1703314169',NULL),
('TR-c55282005e8c9-231223','USR-69539ad8082a9-231223','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-12-23','15:08:06','1703315286','ok'),
('TR-ce444fbe4cdd6-231223','USR-69539ad8082a9-231223','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-12-23','15:19:16','1703315956','ok'),
('TR-60eeed588677f-231223','USR-69539ad8082a9-231223','SCHOLAR','USR-ad02710943659-230523','2023-12-23','15:38:59','1703317139','SPONSOR'),
('TR-c8df82ed67e02-231223','USR-f49766a473f7c-231223','APPLICANT - IN REVIEW','USR-f49766a473f7c-231223','2023-12-23','16:34:46','1703320486',NULL),
('TR-515ab3c9bca44-231223','USR-f49766a473f7c-231223','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2023-12-23','16:35:24','1703320524','h\r\n'),
('TR-6b680ba0e1759-231223','USR-f49766a473f7c-231223','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2023-12-23','16:35:32','1703320532','ok'),
('TR-4de721bc35770-231223','USR-f49766a473f7c-231223','SCHOLAR','USR-ad02710943659-230523','2023-12-23','16:36:19','1703320579','SPONSOR'),
('TR-9ac29b8f9cce9-240113','USR-eae671a6bb3fd-240113','APPLICANT - IN REVIEW','USR-eae671a6bb3fd-240113','2024-01-13','14:50:26','1705128626',NULL),
('TR-6d604ac01c1fa-240113','USR-eae671a6bb3fd-240113','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-01-13','14:51:59','1705128719','YOU NEED TO UPDATE YOUR PARENTS INFO'),
('TR-e4f20b4f21732-240113','USR-eae671a6bb3fd-240113','APPLICANT - IN REVIEW','USR-eae671a6bb3fd-240113','2024-01-13','14:52:53','1705128773',NULL),
('TR-e33a838e810f5-240113','USR-eae671a6bb3fd-240113','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2024-01-13','14:53:48','1705128828','OKAY NANI ERPS'),
('TR-389790211baa7-240113','USR-eae671a6bb3fd-240113','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2024-01-13','14:54:23','1705128863','THIS IS GOODS'),
('TR-7bfa9ba25e083-240115','USR-88dadc85ad2c6-240115','APPLICANT - IN REVIEW','USR-88dadc85ad2c6-240115','2024-01-15','13:56:41','1705298201',NULL),
('TR-e03162704c342-240115','USR-88dadc85ad2c6-240115','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-01-15','13:57:17','1705298237','UPDATE PLEASE'),
('TR-2967361e6e921-240115','USR-88dadc85ad2c6-240115','APPLICANT - IN REVIEW','USR-88dadc85ad2c6-240115','2024-01-15','14:18:06','1705299486',NULL),
('TR-86bf6b4c2b60a-240115','USR-88dadc85ad2c6-240115',NULL,'USR-88dadc85ad2c6-240115','2024-01-15','14:19:06','1705299546',NULL),
('TR-e6e9d82bddd12-240115','USR-88dadc85ad2c6-240115','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-01-15','14:21:33','1705299693','BALIK'),
('TR-386e26f4a767f-240115','USR-88dadc85ad2c6-240115','APPLICANT - IN REVIEW','USR-88dadc85ad2c6-240115','2024-01-15','14:23:52','1705299832',NULL),
('TR-e8f25ae5e5a41-240115','USR-88dadc85ad2c6-240115','APPLICANT - TO BE INTERVIEWED','USR-a088398e8cfe7-231126','2024-01-15','14:25:29','1705299929','PASSED\r\n'),
('TR-66e74246754b5-240115','USR-88dadc85ad2c6-240115','APPLICANT - INTERVIEWED','USR-a088398e8cfe7-231126','2024-01-15','14:25:36','1705299936','PASSEDSSS'),
('TR-bec41c2bd35e3-240115','USR-88dadc85ad2c6-240115','SCHOLAR','USR-ad02710943659-230523','2024-01-15','15:30:42','1705303842','SPONSOR'),
('TR-4756df42564a2-240115','USR-88dadc85ad2c6-240115','SCHOLAR','USR-ad02710943659-230523','2024-01-15','15:31:09','1705303869','SPONSOR'),
('TR-82db3da2cfdf7-240115','USR-8cb6c4860e40c-231128','SCHOLAR','USR-ad02710943659-230523','2024-01-15','15:54:32','1705305272','SPONSOR'),
('TR-a59e0a4133fc0-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','11:22:17','1707708137',NULL),
('TR-558b0306fa0ce-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-02-12','11:22:56','1707708176','PAUPDATE KO BALIK'),
('TR-c0711d6d02261-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','11:45:50','1707709550',NULL),
('TR-a641a93ee21fe-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-02-12','11:46:12','1707709572','balik napud'),
('TR-0bc7b3d84a579-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','11:47:19','1707709639',NULL),
('TR-54023e4b8304d-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-02-12','11:47:44','1707709664','katulong balik'),
('TR-06f0964a1ad0f-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','11:56:16','1707710176',NULL),
('TR-b862b899f1a6f-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-02-12','11:56:52','1707710212','BALIK KAUPAT'),
('TR-83daeda0baf88-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','12:54:02','1707713642',NULL),
('TR-f542cab63c443-240212','USR-4ffe620725cfc-240212','','USR-4ffe620725cfc-240212','2024-02-12','12:56:56','1707713816',NULL),
('TR-5156d17b64b67-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW (FOR UPDATE)','USR-a088398e8cfe7-231126','2024-02-12','12:57:28','1707713848','KALIMANG BALIK'),
('TR-c27dabf08e686-240212','USR-4ffe620725cfc-240212','APPLICANT - IN REVIEW','USR-4ffe620725cfc-240212','2024-02-12','12:58:36','1707713916',NULL),
('TR-73accf7b2b509-240212','USR-8f3efaae3ab1a-240212','APPLICANT - IN REVIEW','USR-8f3efaae3ab1a-240212','2024-02-12','13:28:26','1707715706',NULL);

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
  `year_level_id` int(10) DEFAULT NULL,
  `father_region` varchar(100) DEFAULT NULL,
  `father_province` varchar(100) DEFAULT NULL,
  `father_city` varchar(100) DEFAULT NULL,
  `father_barangay` varchar(100) DEFAULT NULL,
  `mother_region` varchar(100) DEFAULT NULL,
  `mother_province` varchar(100) DEFAULT NULL,
  `mother_city` varchar(100) DEFAULT NULL,
  `mother_barangay` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `scholars` */

insert  into `scholars`(`scholar_id`,`firstname`,`middlename`,`lastname`,`suffix`,`address_home`,`address_barangay`,`address_city`,`address_region`,`address_zipcode`,`address_province`,`address_country`,`birthdate`,`birthplace`,`sex`,`education_attainment`,`name_school`,`father_name`,`father_birthdate`,`father_address`,`father_contact`,`father_lengthstay`,`father_occupation`,`father_occupation_address`,`father_income`,`father_education_attainment`,`father_school`,`mother_name`,`mother_birthdate`,`mother_address`,`mother_contact`,`mother_lengthstay`,`mother_occupation`,`mother_occupation_address`,`mother_income`,`mother_education_attainment`,`mother_school`,`children`,`application_status`,`application_remarks`,`family_picture`,`barangay_clearance`,`low_income`,`birth_certificate`,`grade_card`,`current_status`,`sponsor_id`,`responsible`,`profile_image`,`school_year_id`,`school_name`,`year_level`,`year_type`,`course`,`year_level_id`,`father_region`,`father_province`,`father_city`,`father_barangay`,`mother_region`,`mother_province`,`mother_city`,`mother_barangay`) values 
('USR-cba27e4938c3b-231128','KAREN','N/A','MILAGROSA',NULL,'PANABO CITY','SALVACION','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2001-12-30','PANABO CITY','FEMALE','UNDERGRADUATE','DAVAO DEL NORTE STATE COLLEGE','ARMANDO LANIOHAN','1970-07-15','PRK.4 SALVACIO PANABO CITY','09912021598',NULL,'SELF EMPLOYED','N/A','10000','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL','GLORNITA MILAGROSA','1976-11-30','PRK.4 SALVACIO PANABO CITY','09912021598',NULL,'HOUSE WIFE','N/A','5000','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/MILAGROSA_KAREN/FAMILY_PICTURE.jpg','uploads/MILAGROSA_KAREN/BARANGAY_CLEARANCE.jpg','uploads/MILAGROSA_KAREN/LOW_INCOME.pdf','uploads/MILAGROSA_KAREN/BIRTH_CERTIFICATE.jpg','uploads/MILAGROSA_KAREN/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-28e6ba261cfe0-231129','uploads/MILAGROSA_KAREN/PROFILE.jpg','sy0002','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-8cb6c4860e40c-231128','DORREN','A','BERMUDEZ',NULL,'PRK 1 ','BUSAON','TAGUM CITY','X1','8100','DAVAO DEL NORTE',NULL,'2000-10-09','TAGUM CITY','FEMALE','UNDERGRAD','DAVAO DEL NORTE STATE COLLEGE','EFREN BERMUDEZ  JR.','1976-11-05','PRK. 1 BRGY BUSAON TAGUM CITY','09353924697',NULL,'SECURITY GUARD','N/A','15000','COLLEGE LEVEL','SULTAN KUDARAT STATE UNIVERSITY','RHODORA BERMUDEZ','1974-08-26','PRK. 1 BRGY BUSAON TAGUM CITY','09353924697',NULL,'BOOKKEEPER','N/A','15000','COLLEGE GRADUATE','SULTAN KUDARAT STATE COLLEGE',NULL,NULL,NULL,'uploads/BERMUDEZ_DORREN/FAMILY_PICTURE.jpg','uploads/BERMUDEZ_DORREN/BARANGAY_CLEARANCE.pdf','uploads/BERMUDEZ_DORREN/LOW_INCOME.pdf','uploads/BERMUDEZ_DORREN/BIRTH_CERTIFICATE.jpg','uploads/BERMUDEZ_DORREN/GRADE_CARD.png','SCHOLAR','USR-ad02710943659-230523','USR-7636a5b2be468-231120','uploads/BERMUDEZ_DORREN/PROFILE.png','sy0003','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-1d20b5b2f7663-231128','FAIRYLYN JEAN','ORIEL','JAICTIN',NULL,'PRK. 5-B','TUBOD','TUBOD, CARMEN, DAVAO DEL NORTE','XI','8101','DAVAO DEL NORTE',NULL,'2001-02-24','APOKON, TAGUM CITY','FEMALE','SENIOR HIGH SCHOOL GRADUATE','DAVAO DEL NORTE STATE COLLEGE','ALLAN JACITIN','1979-12-21','TUBOD, CARMEN','09262883694',NULL,'LABORER','TADECO','5000','HIGH SCHOOL GRADUATE','TUBOD NATIONAL HIGH SCHOOL','MARILYN JAICTIN','1997-11-16','TUBOD, CARMEN','09262883696',NULL,'SELLER','SOUTHERN','1500','HIGH SCHOOL GRADUATE','TUBOD NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/JAICTIN_FAIRYLYN_JEAN/FAMILY_PICTURE.jpg','uploads/JAICTIN_FAIRYLYN_JEAN/BARANGAY_CLEARANCE.pdf','uploads/JAICTIN_FAIRYLYN_JEAN/LOW_INCOME.pdf','uploads/JAICTIN_FAIRYLYN_JEAN/BIRTH_CERTIFICATE.pdf','uploads/JAICTIN_FAIRYLYN_JEAN/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523',NULL,'uploads/JAICTIN_FAIRYLYN_JEAN/PROFILE.jpg','sy0001','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-60f0ecda17c39-231128','Kristine','Pavlio','Lauglaug',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-09-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-5a1e0afbaf52d-231128','Joy','N/A','Milagrosa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-11-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-593450f98a1f6-231128','Jean','Oriel','Jaictin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-02-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-dbe142108c4c5-231129','Fernandez','N/A','Mercedez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-02-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-c14c000fd9979-231129','Marshall','N/A','Fernando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-02-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-22812901fb5c2-231129','PAUL','ARTIAGA','ORIG',NULL,'PUROK 1','BUSAON','TAGUM CITY','XI','8100','DAVAO DEL NORTE',NULL,'2000-11-05','TAGUM CITY','MALE','UNDERGRADUATE','DAVAO DEL NORTE STATE COLLEGE','ROMEO ORIG JR.','1975-10-09','PRK. 1 BUSAON TAGUM CITY','09353924697',NULL,'SECURITY GUARD','N/A','15000','COLLEGE LEVEL','SULTAN KUDARAT STATE UNIVERSITY','RUFA MAE ORIG','1974-02-08','PRK. 1 BUSAON TAGUM CITY','09353924697',NULL,'HOUSE WIFE','N/A','5000','COLLEGE LEVEL','SULTAN KUDARAT STATE UNIVERSITY',NULL,NULL,NULL,'uploads/ORIG_PAUL/FAMILY_PICTURE.jpg','uploads/ORIG_PAUL/BARANGAY_CLEARANCE.jpg','uploads/ORIG_PAUL/LOW_INCOME.jpg','uploads/ORIG_PAUL/BIRTH_CERTIFICATE.jpg','uploads/ORIG_PAUL/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-7636a5b2be468-231120','uploads/ORIG_PAUL/PROFILE.jpg','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-8f3a0f454bab2-231129','FERNAN','N/A','PASCUAL',NULL,'PRK. 5-B','TUBOD','PANABO CITY','XI','8101','DAVAO DEL NORTE',NULL,'2001-02-24','PANABO CITY','MALE','SENIOR HIGH SCHOOL GRADUATE','TUBOD NATIONAL SCHOOL','TEST','2001-02-24','TEST','09262883695',NULL,'TEST','TEST','1000','VOCATIONAL','TUBOD NATIONAL HIGH SCHOOL','TEST','2001-02-24','TEST','09262883695',NULL,'TEST','TEST','1000','VOCATIONAL','TUBOD NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/PASCUAL_FERNAN/FAMILY_PICTURE.jpg','uploads/PASCUAL_FERNAN/BARANGAY_CLEARANCE.pdf','uploads/PASCUAL_FERNAN/LOW_INCOME.pdf','uploads/PASCUAL_FERNAN/BIRTH_CERTIFICATE.pdf','uploads/PASCUAL_FERNAN/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-7636a5b2be468-231120','uploads/PASCUAL_FERNAN/PROFILE.jpg','sy0002','DAVAO DEL NORTE STATE COLLEGE','FIRST YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-e56d13e5e5dc7-231129','Mae','N/A','Mondez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-02-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-4d92f7238e908-231129','Roy','N/A','Legitimas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2001-02-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-59ba09f1015db-231129','FAIRYLYN ','ORIEL','JAICTIN',NULL,'TEST','TEST','TEST','TEST','8105','TEST',NULL,'2001-02-24','TEST','FEMALE','TEST','TEST','TEST','2001-02-24','TEST','09912021598',NULL,'TEST','TEST','1000','VOCATIONAL','TEST','TEST','2001-02-24','TEST','09912021598',NULL,'TEST','TEST','1000','COLLEGE LEVEL','TEST',NULL,NULL,NULL,'uploads/JAICTIN_FAIRYLYN_/FAMILY_PICTURE.pdf','uploads/JAICTIN_FAIRYLYN_/BARANGAY_CLEARANCE.pdf','uploads/JAICTIN_FAIRYLYN_/LOW_INCOME.pdf','uploads/JAICTIN_FAIRYLYN_/BIRTH_CERTIFICATE.pdf','uploads/JAICTIN_FAIRYLYN_/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523',NULL,'uploads/JAICTIN_FAIRYLYN_/PROFILE.jpg','sy0004','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-69539ad8082a9-231223','TRY','T','TRY',NULL,'TRY','TRY','TRY','TRY','8101','TRY',NULL,'2001-02-24','TRY','FEMALE','TRY','TRY','TRY','2023-02-24','TRY','09262883695',NULL,'TRY','TRY','1000','COLLEGE LEVEL','TRY','','2001-02-24','TRY','09262883695',NULL,'TRY','TRY','1000','COLLEGE LEVEL','TRY',NULL,NULL,NULL,'uploads/TRY_TRY/FAMILY_PICTURE.jpg','uploads/TRY_TRY/BARANGAY_CLEARANCE.pdf','uploads/TRY_TRY/LOW_INCOME.pdf','uploads/TRY_TRY/BIRTH_CERTIFICATE.pdf','uploads/TRY_TRY/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-09b9f4896673f-231223','uploads/TRY_TRY/PROFILE.png','sy0004','DAVAO DEL NORTE STATE COLLEGE','SECOND YEAR','COLLEGE','BACHELOR OF SCIENCE IN INFORMATION SYSTEM',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-f49766a473f7c-231223','TRY2','T2','TRY2',NULL,'TRY','TRY','TRY','TRY','8101','DAVAO DEL NORTE',NULL,'2001-02-24','MABUHAY','FEMALE','COLLEGE','TRY2','TRY','2001-02-24','TRY','09262883695',NULL,'TRY','TRY','1000','VOCATIONAL','TRY','TRY','2001-02-24','TRY','09262883695',NULL,'TRY','TRY','1000','VOCATIONAL','TRY',NULL,NULL,NULL,'uploads/TRY2_TRY2/FAMILY_PICTURE.pdf','uploads/TRY2_TRY2/BARANGAY_CLEARANCE.pdf','uploads/TRY2_TRY2/LOW_INCOME.pdf','uploads/TRY2_TRY2/BIRTH_CERTIFICATE.pdf','uploads/TRY2_TRY2/GRADE_CARD.pdf','SCHOLAR',NULL,'USR-09b9f4896673f-231223','uploads/TRY2_TRY2/PROFILE.jpg','sy0003','DNSC','FIRST YEAR','COLLEGE','BSIS',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-eae671a6bb3fd-240113','THOR','THROW','MARIPHIL',NULL,'PUROK 13','SOUTHERN DAVAO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-01-13','DAVAO CITY','MALE','SHS','NEW VISAYAS SHS','AWIT MARIPHIL JR','1960-01-01','SAME','09912021547',NULL,'MASON','','10000','VOCATIONAL','TESDA','AWITING ITO','1970-01-01','SAME','09912021548',NULL,'HOUSEWIFE','','0','HIGH SCHOOL LEVEL','NATIONAL',NULL,NULL,NULL,'uploads/MARIPHIL_THOR/FAMILY_PICTURE.png','uploads/MARIPHIL_THOR/BARANGAY_CLEARANCE.png','uploads/MARIPHIL_THOR/LOW_INCOME.jpg','uploads/MARIPHIL_THOR/BIRTH_CERTIFICATE.jpg','uploads/MARIPHIL_THOR/GRADE_CARD.jpg','APPLICANT - INTERVIEWED',NULL,NULL,'uploads/MARIPHIL_THOR/PROFILE.png','sy0003','DNSC','FIRST YEAR','COLLEGE','BSIT',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-88dadc85ad2c6-240115','TOPSON','T','TSAVITSAANEN',NULL,'PUROK 1','MANAY','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-09-15','DAVAO CITY','MALE','HIGH SCHOOL GRADUATE','MARYKNOLL','TOPSSSS','1950-01-01','SAME','099210202020',NULL,'MASON','','10000','COLLEGE GRADUATE','UMPC','TAPPPPS','1960-01-01','SAME','099210202020',NULL,'TEACHER','DEPED','25000','COLLEGE GRADUATE','RMC',NULL,NULL,NULL,'uploads/TSAVITSAANEN_TOPSON/FAMILY_PICTURE.jpg','uploads/TSAVITSAANEN_TOPSON/BARANGAY_CLEARANCE.png','uploads/TSAVITSAANEN_TOPSON/LOW_INCOME.png','uploads/TSAVITSAANEN_TOPSON/BIRTH_CERTIFICATE.jpg','uploads/TSAVITSAANEN_TOPSON/GRADE_CARD.jpg','GRADUATE','USR-ad02710943659-230523','USR-7636a5b2be468-231120','uploads/TSAVITSAANEN_TOPSON/PROFILE.jpg','sy0003','AWIT','SECOND YEAR','COLLEGE','BACHELOR OF SCIENCE IN FOREX TRADING',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-5e7b3b5f660b8-240116','CARMELO','GG','ANTHONY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2002-10-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('USR-4ffe620725cfc-240212','DEAD','DUMB','POOL',NULL,'SAHARAVILLE BLOCK 1 LOT 26','CAGANGOHAN','CITY OF PANABO','REGION XI (DAVAO REGION)',NULL,'DAVAO DEL NORTE',NULL,'1990-02-12','DAVAO CITY','MALE','HIGH SCHOOL','ATENEO DE DAVAO UNIVERSITY','LEO M. GARCIA','1990-12-12','SOAAAA','09920102022',NULL,'ASDASD','','12121','COLLEGE GRADUATE','ASDASD','ASDASDASD','1990-01-01','SOAAAA','123123123',NULL,'ASDASD','ASDASD','11211','COLLEGE GRADUATE','ASDASDASD',NULL,NULL,NULL,'uploads/POOL_DEAD/FAMILY_PICTURE.pdf','uploads/POOL_DEAD/BARANGAY_CLEARANCE.jpg','uploads/POOL_DEAD/LOW_INCOME.pdf','uploads/POOL_DEAD/BIRTH_CERTIFICATE.pdf','uploads/POOL_DEAD/GRADE_CARD.pdf','APPLICANT - IN REVIEW',NULL,NULL,'uploads/POOL_DEAD/PROFILE.jpg','sy0003','ASDASD','FIRST YEAR','COLLEGE','BACHELOR OF SCIENCE IN CRIMINOLOGY',13,'AUTONOMOUS REGION IN MUSLIM MINDANAO (ARMM)','BASILAN','CITY OF LAMITAN','ARCO','AUTONOMOUS REGION IN MUSLIM MINDANAO (ARMM)','BASILAN','CITY OF LAMITAN','BATUAN'),
('USR-8f3efaae3ab1a-240212','PERCY','SEUS','JACKSON',NULL,'EPARK','APOKON','CITY OF TAGUM (CAPITAL)','REGION XI (DAVAO REGION)',NULL,'DAVAO DEL NORTE',NULL,'1990-12-12','TAGUM CITY','MALE','HIGH SCHOOL','TAGUM COMPREHENSIVE','POSEIDON','1970-12-12','PUROK 2','09912021547',NULL,'GOD','OLYMPUS','999999','COLLEGE GRADUATE','CAMP HALFBLOOD','SALLY JACKSON','1988-10-01','PUROK 2','09921010101',NULL,'ACCOUNTANT','LGU PANABO','6000','COLLEGE LEVEL','ADDU',NULL,NULL,NULL,'uploads/JACKSON_PERCY/FAMILY_PICTURE.pdf','uploads/JACKSON_PERCY/BARANGAY_CLEARANCE.pdf','uploads/JACKSON_PERCY/LOW_INCOME.jpg','uploads/JACKSON_PERCY/BIRTH_CERTIFICATE.pdf','uploads/JACKSON_PERCY/GRADE_CARD.jpg','APPLICANT - IN REVIEW',NULL,NULL,'uploads/JACKSON_PERCY/PROFILE.jpg','sy0003','DNSC','FIRST YEAR','COLLEGE','BACHELOR OF SCIENCE IN TOURIMS MANAGEMENT',13,'REGION XI (DAVAO REGION)','DAVAO DEL NORTE','CITY OF PANABO','CONSOLACION','REGION XI (DAVAO REGION)','DAVAO DEL NORTE','CITY OF PANABO','');

/*Table structure for table `school_year` */

DROP TABLE IF EXISTS `school_year`;

CREATE TABLE `school_year` (
  `school_year_id` varchar(100) DEFAULT NULL,
  `school_year` varchar(100) NOT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `current_status` varchar(100) DEFAULT NULL,
  `applicant_status` varchar(100) DEFAULT NULL,
  `idd` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`school_year`),
  KEY `idd` (`idd`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `school_year` */

insert  into `school_year`(`school_year_id`,`school_year`,`semester`,`current_status`,`applicant_status`,`idd`) values 
('sy0001','2022-2023',NULL,'inactive','inactive',1),
('sy0002','2023-2024',NULL,'inactive','inactive',2),
('sy0003','2024-2025',NULL,'active','active',3),
('sy0004','2025-2026',NULL,'inactive','inactive',4),
('sy0005','2026-2027',NULL,'inactive','inactive',5),
('sy0006','2027-2028',NULL,'inactive','inactive',6),
('SY-dd52b81e4c31d-240114','2028-2029',NULL,'inactive','inactive',7),
('SY-c93e2d23e3226-240114','2030-2031',NULL,'inactive','inactive',9);

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
  `temp_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`role`,`fullname`,`status`,`otp`,`profile_image`,`gender`,`address`,`temp_password`) values 
('USER0001','admin_mariphil@yopmail.com','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','ADMIN','ADMIN ADMIN','active',NULL,'uploads/users/USER0001.png','FEMALE',NULL,NULL),
('USR-09b9f4896673f-231223','facilitator3@yopmail.com','$1$0fIhTP57$Xda1piXEJUIq.tfyrx/l81','FACILITATOR','MARIAH DB','active',NULL,'uploads/users/fullname.png','FEMALE','Panabo City',NULL),
('USR-1d20b5b2f7663-231128','fairylyn@yopmail.com','$1$ZdiuXUNP$TBcA4A8RTEQ.lI/eERQEr0','SCHOLAR','Fairylyn Jean Jaictin','active','','uploads/JAICTIN_FAIRYLYN_JEAN/PROFILE.jpg',NULL,NULL,NULL),
('USR-22812901fb5c2-231129','paul@yopmail.com','$1$TkOw6QI8$ojyHxTujYZUp/OKz2qys0.','SCHOLAR','Paul Orig','active','','uploads/ORIG_PAUL/PROFILE.jpg',NULL,NULL,NULL),
('USR-28e6ba261cfe0-231129','facilitator2@yopmail.com','$1$lnoibDYw$QyULdVf7pWa9TjXICt1LQ0','FACILITATOR','LUDIMAR BLASE','inactive',NULL,'uploads/users/USR-28e6ba261cfe0-231129.png','FEMALE','Panabo City',NULL),
('USR-4d92f7238e908-231129','roy@yopmail.com','$1$d4bWSnn3$ADrmUO30nVarTDbOpEY3y0','APPLICANT','Roy Legitimas','active','',NULL,NULL,NULL,NULL),
('USR-4ffe620725cfc-240212','deadpool@yopmail.com','$1$Jiitpbyt$93tXbqYv.QmmdZ0WeSSOI1','APPLICANT','DEAD POOL','active','','uploads/POOL_DEAD/PROFILE.jpg',NULL,NULL,NULL),
('USR-593450f98a1f6-231128','jean@yopmail.com','$1$MMFkf9ca$wxUeBKzJaeXbd1M0/difZ0','APPLICANT','Jean Jaictin','active','',NULL,NULL,NULL,NULL),
('USR-59ba09f1015db-231129','fairy@yopmail.com','$1$B7V0eBHz$GLRumj7i57y..3Wf6NbQj/','SCHOLAR','Fairylyn  Jaictin','active','','uploads/JAICTIN_FAIRYLYN_/PROFILE.jpg',NULL,NULL,NULL),
('USR-5a1e0afbaf52d-231128','joy@yopmail.com','$1$T.wfEKqn$jbgzJciGFv3PTjZ2o9djq1','APPLICANT','Joy Milagrosa','active','',NULL,NULL,NULL,NULL),
('USR-5e7b3b5f660b8-240116','carmelo_anthony@yopmail.com','$1$LlavbxiR$Q6JRu6rFfVNyBVLz1q0aK0','APPLICANT','CARMELO ANTHONY','active','',NULL,NULL,NULL,NULL),
('USR-60f0ecda17c39-231128','kristine@yopmail.com','$1$Ss2DAMVo$uu4qSYkn59ne6/5Y9Dm8s.','APPLICANT','Kristine Lauglaug','active','',NULL,NULL,NULL,NULL),
('USR-69539ad8082a9-231223','try@yopmail.com','$1$YXeFoqWO$kZXSsMrTOkq7WJtt8FLHk/','SCHOLAR','try try','active','','uploads/TRY_TRY/PROFILE.png',NULL,NULL,NULL),
('USR-7636a5b2be468-231120','facilitator@yopmail.com','$1$6gKrUDVm$ELLuCG7bgckwyy70uuhT61','FACILITATOR','MARIA CLARA','active',NULL,'uploads/users/USR-7636a5b2be468-231120.png','FEMALE','Panabo City',''),
('USR-88dadc85ad2c6-240115','topson_tundra@yopmail.com','$1$3/quwn47$z2UcJ3OMxRUvo9EHI.mUO.','SCHOLAR','TOPSON TSAVITSAANEN','active','','uploads/TSAVITSAANEN_TOPSON/PROFILE.jpg',NULL,NULL,NULL),
('USR-8cb6c4860e40c-231128','dorren@yopmail.com','$1$iddONjua$n0N4RGBvSOaPxCgO3GJI8.','SCHOLAR','Dorren Bermudez','active','','uploads/BERMUDEZ_DORREN/PROFILE.png',NULL,NULL,NULL),
('USR-8f3a0f454bab2-231129','fernan@yopmail.com','$1$ejycgYMy$apINIm2naIUdYZtwqWZFk0','SCHOLAR','fernan Pascual','active','','uploads/PASCUAL_FERNAN/PROFILE.jpg',NULL,NULL,NULL),
('USR-8f3efaae3ab1a-240212','perseusjackson@yopmail.com','$1$SUa0M70h$XJ0R16YI5mxzc7blR1SS8/','APPLICANT','PERCY JACKSON','active','','uploads/JACKSON_PERCY/PROFILE.jpg',NULL,NULL,NULL),
('USR-a088398e8cfe7-231126','validator@yopmail.com','$1$gNoilyU3$qsaqq4nWmN85b2bhvdBS50','VALIDATOR','VALIDATOR','active',NULL,'uploads/users/USR-a088398e8cfe7-231126.png','FEMALE','Panabo City',NULL),
('USR-ad02710943659-230523','sponsor@yopmail.com','$1$3a6au3YG$tHxmc/eFju//2hPgipy8Q1','SPONSOR','SPONSOR','active',NULL,'uploads/users/USR-ad02710943659-230523.png','MALE',NULL,''),
('USR-c14c000fd9979-231129','fernando@yopmal.com','$1$d5mPT3Gg$8C3Q3E237twJCJjkMBllg.','APPLICANT','Marshall Fernando','fill_otp','MK5FW4PHPC',NULL,NULL,NULL,NULL),
('USR-cba27e4938c3b-231128','karen@yopmail.com','$1$fXtOGLnL$fHGDtmwxhZ6X8Q.G6fDky0','SCHOLAR','Karen Milagrosa','active','','uploads/MILAGROSA_KAREN/PROFILE.jpg',NULL,NULL,NULL),
('USR-dbe142108c4c5-231129','fernandez@yopmal.com','$1$y4EreQC/$n.QS4tgs.dRMwmX3Npmet0','APPLICANT','Fernandez Mercedez','fill_otp','EGZ4TJJNU2',NULL,NULL,NULL,NULL),
('USR-e56d13e5e5dc7-231129','mae@yopmail.com','$1$dR9vQaGJ$Os5ThrCfKobaiQa7tZOq01','APPLICANT','Mae Mondez','active','',NULL,NULL,NULL,NULL),
('USR-eae671a6bb3fd-240113','thor_mariphil@yopmail.com','$1$P5pkEqE1$MjEWew7/BMq42PFg9L.Mb0','APPLICANT','THOR MARIPHIL','active','','uploads/MARIPHIL_THOR/PROFILE.png',NULL,NULL,NULL),
('USR-f49766a473f7c-231223','try2@yopmail.com','$1$uKWDAmTD$/HQ11vQ0kXev6ZdJFBKRw/','SCHOLAR','try2 try2','active','','uploads/TRY2_TRY2/PROFILE.jpg',NULL,NULL,NULL);

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
(16,'FOURTH YEAR','COLLEGE','7000'),
(17,'FIFTH YEAR','COLLEGE','7000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
