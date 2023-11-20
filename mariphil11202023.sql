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
('AA-bac785a62b169-231112','USR-3f92b0d251264-230523','2023-11-12','sy0002','14:32:28',1699770748,11),
('AA-5dff569dade41-231112','USR-3f92b0d251264-230523','2023-11-12','sy0003','14:38:33',1699771113,1),
('AA-3f57e435e6314-231113','USR-3f92b0d251264-230523','2023-11-13','sy0003','23:46:30',1699890390,2),
('AA-3a46139ce7b44-231116','USR-3f92b0d251264-230523','2023-11-16','sy0003','13:44:23',1700113463,3),
('AA-ca84077e0feeb-231113','USR-3f92b0d251264-230523','2023-11-13','sy0003','23:45:00',1699890300,12);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `allowance_scholar` */

insert  into `allowance_scholar`(`tbl_id`,`allowance_id`,`scholar_id`,`amount`,`date_claimed`,`status`,`date_returned`) values 
(4,'AA-bac785a62b169-231112','USR-705589206de8c-231110','7000','','RETURNED','2023-11-13'),
(5,'AA-5dff569dade41-231112','USR-60b9c1e44fed9-231110','6000','','CLAIMED',NULL),
(6,'AA-5dff569dade41-231112','USR-5361ad50f3799-231110','6000','','FOR RELEASE',NULL),
(7,'AA-ca84077e0feeb-231113','USR-5361ad50f3799-231110','6000','','FOR RELEASE',NULL),
(8,'AA-3f57e435e6314-231113','USR-5361ad50f3799-231110','6000','','FOR RELEASE',NULL),
(9,'AA-3a46139ce7b44-231116','USR-5361ad50f3799-231110','6000','','FOR RELEASE',NULL),
(10,'AA-3a46139ce7b44-231116','USR-98ba34720e171-231116','7000','','FOR RELEASE',NULL);

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
  `timestamp` varchar(100) DEFAULT NULL,
  `threadbool` enum('YES','NO') DEFAULT NULL,
  `sender_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email` */

insert  into `email`(`email_id`,`sender_id`,`subject`,`message`,`timestamp`,`threadbool`,`sender_name`) values 
('MAIL-468dd3ad6cc72-231112','USER0001','APPLICANT - IN REVIEW','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n<br><br>\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1699793884','NO',NULL),
('MAIL-2b26b0704f9be-231112','USER0001','APPLICANT - IN REVIEW','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n<br><br>\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1699794156','NO',NULL),
('MAIL-83c30231b64d4-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','<h4 class=\"\"><span style=\"font-family: &quot;Arial Black&quot;;\">Hello World!</span></h4><h4 class=\"\"><span style=\"font-family: &quot;Arial Black&quot;;\"><br></span></h4><p class=\"\"><span style=\"font-family: &quot;Courier New&quot;;\">Hello</span></p><p><span style=\"font-family: &quot;Arial Black&quot;;\"><br></span></p>','1699843629','YES',NULL),
('MAIL-4f3c41430c101-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','Follow up ko sir! please ko kay dugay na kaayo ni','1699845378','YES',NULL),
('MAIL-54e7d4e665afa-231113','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1699851906','NO',NULL),
('MAIL-33e26d8423580-231113','USR-a0fbf0079cc1f-231113','REPLY SUBJECT','can i ask for fast track?','1699852020','YES',NULL),
('MAIL-f8a1ba4db3a63-231113','USR-a0fbf0079cc1f-231113','REPLY SUBJECT','pausab koooooo! i need it faaaast!','1699852067','YES',NULL),
('MAIL-ef4838b6ca71d-231113','USR-37512177654f4-230523','Application Process Status: To be Interviewed','\r\n					Dear NATASHA ROMANOV,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1699855928','NO','VALIDATOR'),
('MAIL-f2cff119babdb-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','awit','1699856127','YES','NATASHA ROMANOV'),
('MAIL-7aff50229281b-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','okay sir just tell me so i can prepare meals for you okay? hehe','1699856215','YES','NATASHA ROMANOV'),
('MAIL-f161dee0aec3c-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','okay sir just tell me so i can prepare meals for you okay? hehe','1699856222','YES','NATASHA ROMANOV'),
('MAIL-1af05870d8000-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','okay day! hahaha','1699856262','YES','NATASHA ROMANOV'),
('MAIL-a7c12679d76ea-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','sige dala ka foods ha!','1699856874','YES','NATASHA ROMANOV'),
('MAIL-fd06e49cf9a25-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','<p>sige daaay! mga ala una sa biyernes day!<br><br></p><p><br></p>','1699856968','YES','NATASHA ROMANOV'),
('MAIL-acdbfad056884-231113','USR-37512177654f4-230523','Application Process Status: Interviewed','\r\n					Dear NATASHA ROMANOV,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1699857435','NO','VALIDATOR'),
('MAIL-84b00c4fa25f0-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','okay sir.&nbsp;','1699857575','YES','NATASHA ROMANOV'),
('MAIL-722485aae2801-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','relax sis','1699857591','YES','NATASHA ROMANOV'),
('MAIL-e078c123bbb78-231113','USR-3f92b0d251264-230523','You are now a scholar!','\r\n					Dear NATASHA ROMANOV,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					School Year: 2023-2024<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					Email: rperson<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1699859900','NO','MR. RENDON LABADOR'),
('MAIL-72f207ce49a88-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','WOW THANK YOU SIR','1699859982','YES','NATASHA ROMANOV'),
('MAIL-1e23c5eae282c-231113','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear NATASHA ROMANOV,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1699861022','NO','SPONSOR'),
('MAIL-1c1c6e0dd2ba7-231113','USR-76eae08224ae2-231112','REPLY SUBJECT','wow thank you so much spnsor','1699861070','YES','NATASHA ROMANOV'),
('MAIL-c7f81ed3905d7-231113','USR-3f92b0d251264-230523','QUARTERLY REPORTS','\r\n							\r\n							Dear STEVE ROGERS,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-cd6fdf71857aa-231113\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699864309','NO','MR. RENDON LABADOR'),
('MAIL-f2f786eae0d0e-231113','USR-3f92b0d251264-230523','QUARTERLY REPORTS','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-06cda175d9a6c-231113\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699864309','NO','MR. RENDON LABADOR'),
('MAIL-93965a5b4b1fd-231113','USR-5361ad50f3799-231110','REPLY SUBJECT','okay chuy','1699864352','YES','TONY STARK'),
('MAIL-1da22fbeb4d47-231113','USR-60b9c1e44fed9-231110','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: THIRD QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699865400','NO','STEVE ROGERS'),
('MAIL-0b206770cb159-231113','USR-60b9c1e44fed9-231110','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: THIRD QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699865595','NO','STEVE ROGERS'),
('MAIL-87de3eec3e802-231113','USR-60b9c1e44fed9-231110','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: THIRD QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699865657','NO','STEVE ROGERS'),
('MAIL-1272c24fbc894-231113','USR-3f92b0d251264-230523','RETURNED QUARTERLY FORM','Quarterly Report : THIRD QUARTER has been returned to you. Visit the link to view the return comments.\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699887674','NO','MR. RENDON LABADOR'),
('MAIL-977dedc7ed05b-231113','USR-60b9c1e44fed9-231110','QUARTERLY FORM SUBMITTED','Done Submitted the Quarterly Monitoring Form: THIRD QUARTER\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699887738','NO','STEVE ROGERS'),
('MAIL-cbbcdfb2c0fd5-231113','USR-3f92b0d251264-230523','QUARTERLY REPORT REVIEW DONE','Quarterly Report : THIRD QUARTER has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!\r\n			<br><br>\r\n			Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-7c683af64f0d9-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1699887849','NO','MR. RENDON LABADOR'),
('MAIL-1803b575d3a08-231113','USR-3f92b0d251264-230523','RENEWAL PORTAL','\r\n							\r\n							Dear STEVE ROGERS,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699888963','NO','MR. RENDON LABADOR'),
('MAIL-511dc639deb56-231113','USR-3f92b0d251264-230523','RENEWAL PORTAL','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.\r\n							<br><br>\r\n							Form Link: <a href=\'renewal?action=scholar_details&id=RENEW-7efa63b2ad37d-231113\' class=\'btn btn-primary btn-xs\'>Click Here</a><br>\r\n							Why Renew?\r\nRenewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.\r\n<br><br>\r\nWe encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.\r\n<br><br>\r\nThank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.\r\n							Best regards,<br>\r\n\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699888963','NO','MR. RENDON LABADOR'),
('MAIL-3d7807232f436-231113','USR-60b9c1e44fed9-231110','RENEWWAL FORM SUBMITTED','Done Submitted Renewal Form: \r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699889353','NO','STEVE ROGERS'),
('MAIL-8229b0031d50a-231113','USR-60b9c1e44fed9-231110','RENEWWAL FORM SUBMITTED','Done Submitted Renewal Form: \r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699889362','NO','STEVE ROGERS'),
('MAIL-7b19d13b680ca-231113','USR-60b9c1e44fed9-231110','RENEWWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699889383','NO','STEVE ROGERS'),
('MAIL-a53205268482b-231113','USR-3f92b0d251264-230523','RETURNED RENEWAL FORM','Request for Renewal has been returned to you. Visit the link to view the return comments.\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699889534','NO','MR. RENDON LABADOR'),
('MAIL-218f7ce4a3abb-231113','USR-60b9c1e44fed9-231110','RENEWWAL FORM SUBMITTED','Done Submitted Renewal Form\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			\r\n			','1699889591','NO','STEVE ROGERS'),
('MAIL-ea0dfd251bf88-231113','USR-3f92b0d251264-230523','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1699889816','NO','MR. RENDON LABADOR'),
('MAIL-014054e3bda2f-231113','USR-3f92b0d251264-230523','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1699889823','NO','MR. RENDON LABADOR'),
('MAIL-72fdd147092fc-231113','USR-3f92b0d251264-230523','REVIEW APPROVED','Your request for Renewal has been approved! Congratulations on your renewal!\r\n			<br><br>\r\n			Link: <a href=\'renewal?action=scholar_details&id=RENEW-4ec066e6eecca-231113\' class=\'btn btn-primary btn-sm\'>Link Here</a>\r\n			<br><br>\r\n			','1699889836','NO','MR. RENDON LABADOR'),
('MAIL-cd76102f47b0c-231113','USR-3f92b0d251264-230523','ALLOWANCE RELEASE','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: December. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699890300','NO','MR. RENDON LABADOR'),
('MAIL-fef2c000d5b72-231113','USR-3f92b0d251264-230523','ALLOWANCE RELEASE','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: February. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 6000. <br><br>\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699890390','NO','MR. RENDON LABADOR'),
('MAIL-acef942db53c9-231114','USR-76eae08224ae2-231112','REPLY SUBJECT','tara sis!!','1699892752','YES','NATASHA ROMANOV'),
('MAIL-7d6b5f22d80a4-231114','USR-76eae08224ae2-231112','REPLY SUBJECT','tara sizt','1699892876','YES','NATASHA ROMANOV'),
('MAIL-f769dd65f8190-231114','USR-37512177654f4-230523','REPLY SUBJECT','lezzgooo','1699893118','YES','VALIDATOR'),
('MAIL-f9d07aa923932-231114','USR-3f92b0d251264-230523','REPLY SUBJECT','kana humana jud na ha','1699893241','YES','MR. RENDON LABADOR'),
('MAIL-74a4449312d2a-231114','USR-5361ad50f3799-231110','REPLY SUBJECT','ui thank you part','1699933645','YES','TONY STARK'),
('MAIL-460b6151f2162-231114','USR-5361ad50f3799-231110','REPLY SUBJECT','payts kaayo part','1699933657','YES','TONY STARK'),
('MAIL-e588ff80d4cd0-231114','USR-3f92b0d251264-230523','REPLY SUBJECT','kuhaa na ni diri kay ako nig panginom ron','1699933812','YES','MR. RENDON LABADOR'),
('MAIL-39b165ff416f5-231114','USR-3f92b0d251264-230523','REPLY SUBJECT','oi ha ugma','1699933819','YES','MR. RENDON LABADOR'),
('MAIL-71b4373a2753f-231114','USR-3f92b0d251264-230523','QUARTERLY REPORTS','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.\r\n							<br><br>\r\n							Quarterly Report Details:\r\n							<br><br>\r\n							Form Link: <a href=\'forms?action=scholar_details&id=QUARTERLY-65fb590f61433-231114\' class=\'btn btn-primary\'>Click Here</a><br>\r\n							Instructions:\r\n							<br><br>\r\n							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>\r\n							Why Your Input Matters:<br>\r\n							<br><br>\r\n							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>\r\n							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>\r\n							Important Notes:<br>\r\n							<br><br>\r\n						\r\n							If you encounter any issues or have questions, please reach out to me.\r\n							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.\r\n							<br><br>\r\n							Best regards,<br>\r\n\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							\r\n							','1699933900','NO','MR. RENDON LABADOR'),
('MAIL-36c65c68c7e17-231116','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1700113250','NO','ADMIN ADMIN'),
('MAIL-b7f1e06ce589b-231116','USR-37512177654f4-230523','Application Process Status: To be Interviewed','\r\n					Dear SCOTT LANG,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1700113270','NO','VALIDATOR'),
('MAIL-6387275b99129-231116','USR-37512177654f4-230523','Application Process Status: Interviewed','\r\n					Dear SCOTT LANG,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1700113275','NO','VALIDATOR'),
('MAIL-a3f5242a32dbb-231116','USR-3f92b0d251264-230523','You are now a scholar!','\r\n					Dear SCOTT LANG,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					Email: rperson<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1700113287','NO','MR. RENDON LABADOR'),
('MAIL-6180d632e7368-231116','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear SCOTT LANG,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1700113410','NO','SPONSOR'),
('MAIL-6310416c1f56b-231116','USR-3f92b0d251264-230523','ALLOWANCE RELEASE','\r\n							\r\n							Dear TONY STARK,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: March. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 6,000.00. <br><br>\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							','1700113463','NO','MR. RENDON LABADOR'),
('MAIL-09ab419394972-231116','USR-3f92b0d251264-230523','ALLOWANCE RELEASE','\r\n							\r\n							Dear SCOTT LANG,\r\n							<br><br>\r\n							You may claim your allowance for school year: 2024-2025 and month: March. \r\n							<br>Kindly visit the office and sign in order to be released.<br><br> \r\n							Amount: 7,000.00. <br><br>\r\n							MR. RENDON LABADOR<br>\r\n							Facilitator\r\n							','1700113463','NO','MR. RENDON LABADOR'),
('MAIL-f95e31d3ba409-231116','USR-3f92b0d251264-230523','TESTING SUBJECT','TEST EMAIL SIR','1700115783','NO','MR. RENDON LABADOR'),
('MAIL-171171c6eb2d0-231116','USR-3f92b0d251264-230523','TESTING SUBJECT','TEST EMAIL SIR','1700115783','NO','MR. RENDON LABADOR'),
('MAIL-afc5786a729eb-231116','USR-5361ad50f3799-231110','REPLY SUBJECT','SIGE SIR NOTED','1700115821','YES','TONY STARK'),
('MAIL-41d763e1acad2-231116','USR-5361ad50f3799-231110','THIS IS TEST SIR','<p>Sample</p>','1700116508','NO','TONY STARK'),
('MAIL-fcc55ee3900d5-231116','USER0001','Scholarship Application Under Review','I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.\r\n\r\n			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.\r\n			  \r\n			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.\r\n			  \r\n			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.\r\n			  \r\n			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].\r\n			  \r\n			  Thank you for your patience and understanding.','1700117412','NO','ADMIN ADMIN'),
('MAIL-02706d2f6a1be-231116','USR-37512177654f4-230523','Application Process Status: To be Interviewed','\r\n					Dear PETER PARKER,\r\n					<br><br>\r\n					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.\r\n					<br><br>\r\n					Application Process Status: To be Interviewed\r\n					<br><br>\r\n					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.\r\n					<br><br>\r\n					\r\n					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.\r\n					<br><br>\r\n					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.\r\n					<br><br>\r\n					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.\r\n					<br><br>\r\n					Thank you,<br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1700117650','NO','VALIDATOR'),
('MAIL-ccf0a2cb88a50-231116','USR-37512177654f4-230523','SCHEDULE OF INTERVIEW','SO YOUR SCHEDULE OF INTERVIEW IS ON 11/16/2023 PLEASE BE PREPARED','1700118803','NO','VALIDATOR'),
('MAIL-98fcd982561ff-231116','USR-7b0396700c697-231116','REPLY SUBJECT','okay po. ill prepare po','1700118844','YES','PETER PARKER'),
('MAIL-82fc78a78b6bb-231116','USR-37512177654f4-230523','Application Process Status: Interviewed','\r\n					Dear PETER PARKER,\r\n					<br><br>\r\n					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.\r\n					<br><br>\r\n					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.\r\n					<br><br>\r\n					Current Status: Under Facilitator and Sponsor Review\r\n					<br><br>\r\n					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.\r\n					<br><br>\r\n					Next Steps: Please Wait for Further Updates\r\n					<br><br>\r\n					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.\r\n					<br><br>\r\n					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.\r\n					<br><br>\r\n					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.\r\n					<br><br>\r\n					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc.<br>\r\n					Scholarship Committee<br>\r\n					','1700118881','NO','VALIDATOR'),
('MAIL-0303eca96c1c3-231116','USR-3f92b0d251264-230523','You are now a scholar!','\r\n					Dear PETER PARKER,\r\n					<br><br>\r\n					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.\r\n					<br><br>\r\n					Key Details:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					School Year: 2024-2025<br>\r\n					Duration: 1 Year<br>\r\n					Next Steps:\r\n					<br><br>\r\n					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.\r\n					<br><br>\r\n					Facilitator Introduction: Your assigned facilitator, [Facilitator\'s Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.\r\n					<br><br>\r\n					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.\r\n					<br><br>\r\n					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.\r\n					<br><br>\r\n					Important Contacts:\r\n					<br><br>\r\n					Facilitator: MR. RENDON LABADOR<br>\r\n					Email: rperson<br>\r\n					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.\r\n					<br><br>\r\n					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.\r\n					<br><br>\r\n					Best regards,\r\n					<br><br>\r\n					Mariphil Foundation Inc<br>\r\n					Scholarship Committee<br>\r\n					','1700118933','NO','MR. RENDON LABADOR'),
('MAIL-a0530f2ba0872-231116','USR-ad02710943659-230523','You now have a sponsor!','\n					Dear PETER PARKER,\n					<br><br>\n					On behalf of the SPONSOR, I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. \n					<br>We are delighted to welcome you into our esteemed scholarship program.\n					<br><br>\n\n					SPONSOR\n					','1700118986','NO','SPONSOR'),
('MAIL-deb7294cf0872-231117','USER0001','REPLY SUBJECT','usab daw ug apply part','1700187784','YES','MARIPHIL ADMINISTRATOR');

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
('MAIL-2b26b0704f9be-231112','USR-76eae08224ae2-231112','read',NULL),
('MAIL-081f4feadd70e-231113','USER0001','read',NULL),
('MAIL-83c30231b64d4-231113','USER0001','read',NULL),
('MAIL-4f3c41430c101-231113','USER0001','read',NULL),
('MAIL-54e7d4e665afa-231113','USR-a0fbf0079cc1f-231113','read',NULL),
('MAIL-33e26d8423580-231113','USER0001','read',NULL),
('MAIL-f8a1ba4db3a63-231113','USER0001','read',NULL),
('MAIL-ef4838b6ca71d-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-f161dee0aec3c-231113','USR-37512177654f4-230523','read','VALIDATOR'),
('MAIL-1af05870d8000-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-a7c12679d76ea-231113','USR-37512177654f4-230523','read','VALIDATOR'),
('MAIL-fd06e49cf9a25-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-acdbfad056884-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-84b00c4fa25f0-231113','USR-37512177654f4-230523','read','VALIDATOR'),
('MAIL-722485aae2801-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-2cadd8d62d1f0-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-ee515a03ddd93-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-e078c123bbb78-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-72f207ce49a88-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-1e23c5eae282c-231113','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-1c1c6e0dd2ba7-231113','USR-ad02710943659-230523','read','SPONSOR'),
('MAIL-850ed15e0746f-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-021295a43a9c3-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-ef1a4aab40c48-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-cdec2f587aa6f-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-79eac90488eff-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-775670f16bb34-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-c7f81ed3905d7-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-f2f786eae0d0e-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-93965a5b4b1fd-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-87de3eec3e802-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-1272c24fbc894-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-977dedc7ed05b-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-cbbcdfb2c0fd5-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-1803b575d3a08-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-511dc639deb56-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-3d7807232f436-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-8229b0031d50a-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-7b19d13b680ca-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-a53205268482b-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-218f7ce4a3abb-231113','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-ea0dfd251bf88-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-014054e3bda2f-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-72fdd147092fc-231113','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-cd76102f47b0c-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-fef2c000d5b72-231113','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-acef942db53c9-231114','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-7d6b5f22d80a4-231114','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-0e4f618938297-231114','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-d7a5c2264c069-231114','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-f769dd65f8190-231114','USR-76eae08224ae2-231112','read','NATASHA ROMANOV'),
('MAIL-f9d07aa923932-231114','USR-60b9c1e44fed9-231110','read','STEVE ROGERS'),
('MAIL-74a4449312d2a-231114','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-460b6151f2162-231114','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-e588ff80d4cd0-231114','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-39b165ff416f5-231114','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-71b4373a2753f-231114','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-36c65c68c7e17-231116','USR-98ba34720e171-231116','read','SCOTT LANG'),
('MAIL-b7f1e06ce589b-231116','USR-98ba34720e171-231116','read','SCOTT LANG'),
('MAIL-6387275b99129-231116','USR-98ba34720e171-231116','read','SCOTT LANG'),
('MAIL-a3f5242a32dbb-231116','USR-98ba34720e171-231116','read','SCOTT LANG'),
('MAIL-6180d632e7368-231116','USR-98ba34720e171-231116','read','SCOTT LANG'),
('MAIL-6310416c1f56b-231116','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-09ab419394972-231116','USR-98ba34720e171-231116','unread','SCOTT LANG'),
('MAIL-f95e31d3ba409-231116','USR-60b9c1e44fed9-231110','unread','STEVE ROGERS'),
('MAIL-171171c6eb2d0-231116','USR-5361ad50f3799-231110','read','TONY STARK'),
('MAIL-afc5786a729eb-231116','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-41d763e1acad2-231116','USR-3f92b0d251264-230523','read','MR. RENDON LABADOR'),
('MAIL-fcc55ee3900d5-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-02706d2f6a1be-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-ccf0a2cb88a50-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-98fcd982561ff-231116','USR-37512177654f4-230523','read','VALIDATOR'),
('MAIL-82fc78a78b6bb-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-0303eca96c1c3-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-a0530f2ba0872-231116','USR-7b0396700c697-231116','read','PETER PARKER'),
('MAIL-deb7294cf0872-231117','USR-a0fbf0079cc1f-231113','read','LOKI ODINSON');

/*Table structure for table `email_thread` */

DROP TABLE IF EXISTS `email_thread`;

CREATE TABLE `email_thread` (
  `thread_id` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_thread` */

insert  into `email_thread`(`thread_id`,`email_id`) values 
('THREAD-dac5ddfd34b88-231112','MAIL-2b26b0704f9be-231112'),
('THREAD-dac5ddfd34b88-231112','MAIL-83c30231b64d4-231113'),
('THREAD-dac5ddfd34b88-231112','MAIL-4f3c41430c101-231113'),
('THREAD-08c90904507ab-231113','MAIL-54e7d4e665afa-231113'),
('THREAD-08c90904507ab-231113','MAIL-33e26d8423580-231113'),
('THREAD-08c90904507ab-231113','MAIL-f8a1ba4db3a63-231113'),
('THREAD-33525352fcdfd-231113','MAIL-ef4838b6ca71d-231113'),
('THREAD-33525352fcdfd-231113','MAIL-5927497487327-231113'),
('THREAD-33525352fcdfd-231113','MAIL-f161dee0aec3c-231113'),
('THREAD-33525352fcdfd-231113','MAIL-1af05870d8000-231113'),
('THREAD-33525352fcdfd-231113','MAIL-a7c12679d76ea-231113'),
('THREAD-33525352fcdfd-231113','MAIL-fd06e49cf9a25-231113'),
('THREAD-9e8a74e296233-231113','MAIL-acdbfad056884-231113'),
('THREAD-9e8a74e296233-231113','MAIL-84b00c4fa25f0-231113'),
('THREAD-9e8a74e296233-231113','MAIL-722485aae2801-231113'),
('THREAD-76a052be483c1-231113','MAIL-2cadd8d62d1f0-231113'),
('THREAD-eacf2991ec267-231113','MAIL-ee515a03ddd93-231113'),
('THREAD-144fc8029d43d-231113','MAIL-e078c123bbb78-231113'),
('THREAD-144fc8029d43d-231113','MAIL-72f207ce49a88-231113'),
('THREAD-462a6330e2d42-231113','MAIL-1e23c5eae282c-231113'),
('THREAD-462a6330e2d42-231113','MAIL-1c1c6e0dd2ba7-231113'),
('THREAD-39ea467781dfd-231113','MAIL-850ed15e0746f-231113'),
('THREAD-29c9794a86615-231113','MAIL-021295a43a9c3-231113'),
('THREAD-76d6c03bec45c-231113','MAIL-ef1a4aab40c48-231113'),
('THREAD-ee5c1bf0c3acc-231113','MAIL-cdec2f587aa6f-231113'),
('THREAD-387addc6288c1-231113','MAIL-79eac90488eff-231113'),
('THREAD-e7906baf48d19-231113','MAIL-775670f16bb34-231113'),
('THREAD-d32b22526b762-231113','MAIL-c7f81ed3905d7-231113'),
('THREAD-7cca7d89236ba-231113','MAIL-f2f786eae0d0e-231113'),
('THREAD-7cca7d89236ba-231113','MAIL-93965a5b4b1fd-231113'),
('THREAD-38459d23a7f46-231113','MAIL-87de3eec3e802-231113'),
('THREAD-eab0f0046c044-231113','MAIL-1272c24fbc894-231113'),
('THREAD-d674cd3928def-231113','MAIL-977dedc7ed05b-231113'),
('THREAD-dc1f3acc876a5-231113','MAIL-cbbcdfb2c0fd5-231113'),
('THREAD-7c41ed0027cbf-231113','MAIL-1803b575d3a08-231113'),
('THREAD-438458a3bba7b-231113','MAIL-511dc639deb56-231113'),
('THREAD-4a182ffd29b84-231113','MAIL-3d7807232f436-231113'),
('THREAD-041daf89eb22f-231113','MAIL-8229b0031d50a-231113'),
('THREAD-96a82542eac88-231113','MAIL-7b19d13b680ca-231113'),
('THREAD-dd04e53234aa8-231113','MAIL-a53205268482b-231113'),
('THREAD-570ee8bd4f8a4-231113','MAIL-218f7ce4a3abb-231113'),
('THREAD-706a0588869af-231113','MAIL-ea0dfd251bf88-231113'),
('THREAD-15106a212e2b9-231113','MAIL-014054e3bda2f-231113'),
('THREAD-44e6934dd2969-231113','MAIL-72fdd147092fc-231113'),
('THREAD-ac68779554f9a-231113','MAIL-cd76102f47b0c-231113'),
('THREAD-8b0aec818379b-231113','MAIL-fef2c000d5b72-231113'),
('THREAD-9e8a74e296233-231113','MAIL-acef942db53c9-231114'),
('THREAD-9e8a74e296233-231113','MAIL-7d6b5f22d80a4-231114'),
('THREAD-9e8a74e296233-231113','MAIL-0e4f618938297-231114'),
('THREAD-9e8a74e296233-231113','MAIL-d7a5c2264c069-231114'),
('THREAD-9e8a74e296233-231113','MAIL-f769dd65f8190-231114'),
('THREAD-041daf89eb22f-231113','MAIL-f9d07aa923932-231114'),
('THREAD-8b0aec818379b-231113','MAIL-74a4449312d2a-231114'),
('THREAD-8b0aec818379b-231113','MAIL-460b6151f2162-231114'),
('THREAD-8b0aec818379b-231113','MAIL-e588ff80d4cd0-231114'),
('THREAD-8b0aec818379b-231113','MAIL-39b165ff416f5-231114'),
('THREAD-ed136cb6e5367-231114','MAIL-71b4373a2753f-231114'),
('THREAD-1f00381fc7f33-231116','MAIL-36c65c68c7e17-231116'),
('THREAD-3644cf0e74345-231116','MAIL-b7f1e06ce589b-231116'),
('THREAD-d782d883bb3c5-231116','MAIL-6387275b99129-231116'),
('THREAD-ee415b8d46638-231116','MAIL-a3f5242a32dbb-231116'),
('THREAD-7fcf903e586c8-231116','MAIL-6180d632e7368-231116'),
('THREAD-01962cdd4f4c1-231116','MAIL-6310416c1f56b-231116'),
('THREAD-e71db20a1d7e2-231116','MAIL-09ab419394972-231116'),
('THREAD-3111dfffe38ad-231116','MAIL-f95e31d3ba409-231116'),
('THREAD-2963acddc45a7-231116','MAIL-171171c6eb2d0-231116'),
('THREAD-2963acddc45a7-231116','MAIL-afc5786a729eb-231116'),
('THREAD-a332a28df18dd-231116','MAIL-41d763e1acad2-231116'),
('THREAD-9b22c56488fa5-231116','MAIL-fcc55ee3900d5-231116'),
('THREAD-7f9515229ad13-231116','MAIL-02706d2f6a1be-231116'),
('THREAD-b84db3c43bff3-231116','MAIL-ccf0a2cb88a50-231116'),
('THREAD-b84db3c43bff3-231116','MAIL-98fcd982561ff-231116'),
('THREAD-2eae3d2deba63-231116','MAIL-82fc78a78b6bb-231116'),
('THREAD-c6da700162150-231116','MAIL-0303eca96c1c3-231116'),
('THREAD-28b7d9636ad9b-231116','MAIL-a0530f2ba0872-231116'),
('THREAD-08c90904507ab-231113','MAIL-deb7294cf0872-231117');

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
('FORM-ec6b74ef0eb42-231110','QUARTERLY','2023-11-10','1699586603','11:23:23','USR-3f92b0d251264-230523','SECOND QUARTER','sy0002',NULL,NULL),
('FORM-9cc27181b97c3-231113','QUARTERLY','2023-11-13','1699861501','15:45:01','USR-3f92b0d251264-230523','THIRD QUARTER','sy0003',NULL,NULL),
('FORM-024d20643ba0a-231113','QUARTERLY','2023-11-13','1699864309','16:31:49','USR-3f92b0d251264-230523','FOURTH QUARTER','sy0003',NULL,NULL),
('FORM-1a442869694eb-231114','QUARTERLY','2023-11-14','1699933900','11:51:40','USR-3f92b0d251264-230523','SECOND QUARTER','sy0003',NULL,NULL);

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
('QUARTERLY-dd024d706ec18-231110','FORM-ec6b74ef0eb42-231110','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR CHECKING',NULL),
('QUARTERLY-46d5980e0e2fa-231110','FORM-ec6b74ef0eb42-231110','USR-5361ad50f3799-231110','95','resources/scholar_achievements/QUARTERLY-46d5980e0e2fa-231110/philgeps requirements.pdf',NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-7c683af64f0d9-231113','FORM-9cc27181b97c3-231113','USR-60b9c1e44fed9-231110','97','resources/scholar_achievements/QUARTERLY-7c683af64f0d9-231113/philgeps requirements.pdf',NULL,'OK NANI PAAART','DONE','Returned! Please review the fields before submitting!<br><br>'),
('QUARTERLY-6bf7cbb796ed1-231113','FORM-9cc27181b97c3-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-a01c41bc50662-231113','FORM-70b13c52b87ef-231113','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-11bb792702abb-231113','FORM-70b13c52b87ef-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-776a0bc29b5b0-231113','FORM-c17d85084c115-231113','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-7112831694d41-231113','FORM-c17d85084c115-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-1df97d064cc19-231113','FORM-2fa832021de88-231113','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-4cee98fce4f83-231113','FORM-2fa832021de88-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-cd6fdf71857aa-231113','FORM-024d20643ba0a-231113','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-06cda175d9a6c-231113','FORM-024d20643ba0a-231113','USR-5361ad50f3799-231110','99','resources/scholar_achievements/QUARTERLY-06cda175d9a6c-231113/Report Sample.pdf',NULL,NULL,'FOR SUBMISSION',NULL),
('QUARTERLY-65fb590f61433-231114','FORM-1a442869694eb-231114','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL);

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
('QUARTERLY-74b4ce243ea64-231110','LEADER OF THE MONTH','ACH-2813426885d3e-231110'),
('QUARTERLY-7c683af64f0d9-231113','HONORABLE MENTION','ACH-13d5f3eb37bfc-231113');

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
('RENEW-e8727646758fa-231113','RenFORM-e3652029652bf-231113','USR-60b9c1e44fed9-231110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('RENEW-6277f89ce2a4e-231113','RenFORM-e3652029652bf-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('RENEW-4ec066e6eecca-231113','RenFORM-174ecac5d071f-231113','USR-60b9c1e44fed9-231110','resources/requirements/RENEW-4ec066e6eecca-231113/update-sa-system (1).pdf','resources/requirements/RENEW-4ec066e6eecca-231113/PANABO - MC3 DVAS Roadshow Follow-up (Region XI).pdf','resources/requirements/RENEW-4ec066e6eecca-231113/esaf.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'DONE','PANABO NATIONAL HIGH SCHOOL','GRADE 9','JUNIOR HIGH SCHOOL',NULL,NULL,'Return lang sa<br><br>','',9),
('RENEW-7efa63b2ad37d-231113','RenFORM-174ecac5d071f-231113','USR-5361ad50f3799-231110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FOR SUBMISSION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
('RenFORM-e3652029652bf-231113','USR-3f92b0d251264-230523','OPEN','2023-11-13','23:05:37',1699887937,'sy0003','sy0004'),
('RenFORM-174ecac5d071f-231113','USR-3f92b0d251264-230523','OPEN','2023-11-13','23:22:43',1699888963,'sy0003','sy0004');

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
('USR-705589206de8c-231110','sy0002','GABRIEL TABORIN','FIRST YEAR','BS IN INFORMATION TECHNOLOGY','COLLEGE'),
('USR-76eae08224ae2-231112','sy0002','UM PANABO COLLEGE','FIRST YEAR','BS IN EDUCATION MAJOR IN ENGLISH','COLLEGE'),
('USR-76eae08224ae2-231112','sy0002','UM PANABO COLLEGE','FIRST YEAR','BS IN EDUCATION MAJOR IN ENGLISH','COLLEGE'),
('USR-76eae08224ae2-231112','sy0002','UM PANABO COLLEGE','FIRST YEAR','BS IN EDUCATION MAJOR IN ENGLISH','COLLEGE'),
('USR-60b9c1e44fed9-231110','sy0004','PANABO NATIONAL HIGH SCHOOL','GRADE 9','','JUNIOR HIGH SCHOOL'),
('USR-60b9c1e44fed9-231110','sy0004','PANABO NATIONAL HIGH SCHOOL','GRADE 9','','JUNIOR HIGH SCHOOL'),
('USR-60b9c1e44fed9-231110','sy0004','PANABO NATIONAL HIGH SCHOOL','GRADE 9','','JUNIOR HIGH SCHOOL'),
('USR-98ba34720e171-231116','sy0003','USEP','FIRST YEAR','BS IN ENTREPRENEURSHIP','COLLEGE'),
('USR-7b0396700c697-231116','sy0003','NORTHLINK TECHNOLOGICAL COLLEGE','FIRST YEAR','BS IN INFORMATION SYSTEMS','COLLEGE');

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
('TR-93375ac159eed-231110','USR-705589206de8c-231110','SCHOLAR','USR-ad02710943659-230523','2023-11-10','13:50:53','1699595453','SPONSOR'),
('TR-4c80200b97558-231112','USR-c6752a1273e71-231112','APPLICANT - IN REVIEW','USR-c6752a1273e71-231112','2023-11-12','20:58:04','1699793884',NULL),
('TR-06ddb4048943c-231112','USR-76eae08224ae2-231112','APPLICANT - IN REVIEW','USR-76eae08224ae2-231112','2023-11-12','21:02:36','1699794156',NULL),
('TR-e14be5c73cd83-231113','USR-a0fbf0079cc1f-231113','APPLICANT - IN REVIEW','USR-a0fbf0079cc1f-231113','2023-11-13','13:05:06','1699851906',NULL),
('TR-8ae626ab5b245-231113','USR-76eae08224ae2-231112','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-13','14:12:08','1699855928','OKAY NI PROMISE'),
('TR-02b6fb20a5f06-231113','USR-76eae08224ae2-231112','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-13','14:37:15','1699857435','Okay nani paaaaart!'),
('TR-464796d67a72c-231113','USR-76eae08224ae2-231112','SCHOLAR','USR-ad02710943659-230523','2023-11-13','15:37:02','1699861022','SPONSOR'),
('TR-47472e04d13ee-231116','USR-98ba34720e171-231116','APPLICANT - IN REVIEW','USR-98ba34720e171-231116','2023-11-16','13:40:50','1700113250',NULL),
('TR-215ce1cdc8308-231116','USR-98ba34720e171-231116','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-16','13:41:10','1700113270','OK'),
('TR-e220d9df94ea8-231116','USR-98ba34720e171-231116','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-16','13:41:15','1700113275','OKAY DIN\r\n'),
('TR-f2b97c3e2d94b-231116','USR-98ba34720e171-231116','SCHOLAR','USR-ad02710943659-230523','2023-11-16','13:43:30','1700113410','SPONSOR'),
('TR-c0875a038a8fb-231116','USR-7b0396700c697-231116','APPLICANT - IN REVIEW','USR-7b0396700c697-231116','2023-11-16','14:50:12','1700117412',NULL),
('TR-cb9539d7ae880-231116','USR-7b0396700c697-231116','APPLICANT - TO BE INTERVIEWED','USR-37512177654f4-230523','2023-11-16','14:54:10','1700117650','THIS IS OKAY SON'),
('TR-ae390e4cd652f-231116','USR-7b0396700c697-231116','APPLICANT - INTERVIEWED','USR-37512177654f4-230523','2023-11-16','15:14:41','1700118881','PAYTS NANI'),
('TR-5c02c9974f296-231116','USR-7b0396700c697-231116','SCHOLAR','USR-ad02710943659-230523','2023-11-16','15:16:26','1700118986','SPONSOR');

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
('USR-60b9c1e44fed9-231110','STEVE','M','ROGERS',NULL,'PUROK 1','CAGANGOHAN','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-11-10','CARMEN DAVAO DEL NORTE','MALE','ELEMENTARY','RIZAL ELEMENTARY SCHOOL','PAPA ROGERS','1978-08-01','PRK 1 CAGANGOHAN PANABO CITY','09912021590',NULL,'JOB ORDER','LGU PANABO','10000','COLLEGE LEVEL','USEP','MAMA ROGERS','1977-09-29','PRK 1 CAGANGOHAN PANABO CITY','09912021590',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/ROGERS_STEVE/FAMILY_PICTURE.pdf','uploads/ROGERS_STEVE/BARANGAY_CLEARANCE.pdf','uploads/ROGERS_STEVE/LOW_INCOME.png','uploads/ROGERS_STEVE/BIRTH_CERTIFICATE.pdf','uploads/ROGERS_STEVE/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/ROGERS_STEVE/PROFILE.jpg','sy0004','PANABO NATIONAL HIGH SCHOOL','GRADE 9','JUNIOR HIGH SCHOOL','',9),
('USR-5361ad50f3799-231110','TONY','M','STARK',NULL,'PUROK 10','SOUTHERN DAVAO','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2001-09-09','CARMEN DAVAO DEL NORTE','MALE','ELEMENTARY','CENTRAL ELEMENTARY SCHOOL','PAPA STARK','1985-10-01','SOUTHERN DAVAO','09928765431',NULL,'LABORER','','9000','VOCATIONAL','TESDA','MAMA STARK','1986-08-05','SOUTHERN DAVAO','09928765431',NULL,'DAYCARE TEACHER','BARANGAY','7000','COLLEGE LEVEL','UMPC',NULL,NULL,NULL,'uploads/STARK_TONY/FAMILY_PICTURE.pdf','uploads/STARK_TONY/BARANGAY_CLEARANCE.jpg','uploads/STARK_TONY/LOW_INCOME.jpg','uploads/STARK_TONY/BIRTH_CERTIFICATE.jpg','uploads/STARK_TONY/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/STARK_TONY/PROFILE.gif','sy0003','SAN VICENTE NATIONAL HIGH SCHOOL PANABO','GRADE 8','JUNIOR HIGH SCHOOL','',8),
('USR-705589206de8c-231110','BRUCE','H','BANNER',NULL,'PUROK UBAS','GREDU','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1999-08-08','DAVAO CITY','MALE','SHS GRADUATE','MARYKNOLL COLLEGE OF PANABO INC','PAPA HULK','1975-10-10','GREDU PANABO CITY','09999999911',NULL,'WELDER','LGU PANABO','70000','COLLEGE LEVEL','TESDA','SHE HULK','1976-09-08','GREDU PANABO CITY','09999999911',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/BANNER_BRUCE/FAMILY_PICTURE.pdf','uploads/BANNER_BRUCE/BARANGAY_CLEARANCE.png','uploads/BANNER_BRUCE/LOW_INCOME.pdf',NULL,'uploads/BANNER_BRUCE/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/BANNER_BRUCE/PROFILE.jpg','sy0002','GABRIEL TABORIN','FIRST YEAR','COLLEGE','BS IN INFORMATION TECHNOLOGY',13),
('USR-bf7f79c72902f-231110','CLINT','HAWKEYE','BARTON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2000-11-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL),
('USR-76eae08224ae2-231112','NATASHA','B','ROMANOV',NULL,'PUROK 2','MANAY','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2000-09-09','DAVAO CITY','FEMALE','HIGH SCHOOL','MCPI','PAPA ROMANOV','1988-08-08','MANAY','09912021590',NULL,'BARANGAY TANOD','MANAY BARANGAY HALL','10000','HIGH SCHOOL LEVEL','PANABO NATIONAL HIGH SCHOOL','MAMA ROMANOV','1988-08-09','MANAY','09912021590',NULL,'HOUSE WIFE','','0','HIGH SCHOOL GRADUATE','PANABO NATIONAL HIGH SCHOOL',NULL,NULL,NULL,'uploads/ROMANOV_NATASHA/FAMILY_PICTURE.pdf','uploads/ROMANOV_NATASHA/BARANGAY_CLEARANCE.pdf','uploads/ROMANOV_NATASHA/LOW_INCOME.pdf','uploads/ROMANOV_NATASHA/BIRTH_CERTIFICATE.pdf','uploads/ROMANOV_NATASHA/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/ROMANOV_NATASHA/PROFILE.png','sy0002','UM PANABO COLLEGE','FIRST YEAR','COLLEGE','BS IN EDUCATION MAJOR IN ENGLISH',13),
('USR-c16ebc004805d-231112','MOBIUS','D','MOBIUS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1990-11-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'APPLICANT',NULL,NULL,NULL,'sy0002',NULL,NULL,NULL,NULL,NULL),
('USR-a0fbf0079cc1f-231113','LOKI','L','ODINSON',NULL,'PUROK 3','SAN VICENTE','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'1990-11-13','DAVAO CITY','MALE','SENIOR HIGH GRADUATE','PANABO CITY SENIOR HIGH SCHOOL','PAPA ODIN','1965-11-13','PANABO CITY','09986578901',NULL,'TANOD','BARANGAY HALL','7000','VOCATIONAL','TESDA','MAMA ODIN','1966-11-13','PANABO CITY','09986578901',NULL,'HOUSEWIFE','','0','VOCATIONAL','TESDA',NULL,NULL,NULL,'uploads/ODINSON_LOKI/FAMILY_PICTURE.jpg','uploads/ODINSON_LOKI/BARANGAY_CLEARANCE.pdf',NULL,'uploads/ODINSON_LOKI/BIRTH_CERTIFICATE.pdf','uploads/ODINSON_LOKI/GRADE_CARD.pdf','APPLICANT - IN REVIEW',NULL,NULL,'uploads/ODINSON_LOKI/PROFILE.jpg','sy0002','DNSC','FIRST YEAR','COLLEGE','BS IN INFORMATION TECHNOLOGY',13),
('USR-98ba34720e171-231116','SCOTT','S','LANG',NULL,'PUROK 4','NEW VISAYAS','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2001-11-01','CARMEN DDO','MALE','HIGH SCHOOL','PNHS','PAPA ANTMAN','1990-01-01','PANABO CITY','099102020202',NULL,'AVENGER','','10000','COLLEGE LEVEL','4TH YEAR','MAMA ANTMAN','1990-09-09','PANABO CITY','099102020202',NULL,'AVENGER','','10000','COLLEGE LEVEL','3RD YEAR',NULL,NULL,NULL,'uploads/LANG_SCOTT/FAMILY_PICTURE.pdf','uploads/LANG_SCOTT/BARANGAY_CLEARANCE.pdf','uploads/LANG_SCOTT/LOW_INCOME.pdf','uploads/LANG_SCOTT/BIRTH_CERTIFICATE.png','uploads/LANG_SCOTT/GRADE_CARD.pdf','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/LANG_SCOTT/PROFILE.jpg','sy0003','USEP','FIRST YEAR','COLLEGE','BS IN ENTREPRENEURSHIP',13),
('USR-7b0396700c697-231116','PETER','P','PARKER',NULL,'PUROK 12','NEW MALITBOG','PANABO CITY','XI','8105','DAVAO DEL NORTE',NULL,'2005-09-07','DAVAO CITY','MALE','HIGH SCHOOL','ADLAON','BEN PARKER','1980-11-16','PANABO CITY','099102020202',NULL,'LABORER','','10000','VOCATIONAL','TESDA','AUNT MAY','1981-11-16','PANABO CITY','099102020202',NULL,'HOUSEWIFE','','0','VOCATIONAL','TESDA',NULL,NULL,NULL,'uploads/PARKER_PETER/FAMILY_PICTURE.jpg','uploads/PARKER_PETER/BARANGAY_CLEARANCE.jpg','uploads/PARKER_PETER/LOW_INCOME.jpg','uploads/PARKER_PETER/BIRTH_CERTIFICATE.png','uploads/PARKER_PETER/GRADE_CARD.jpg','SCHOLAR','USR-ad02710943659-230523','USR-3f92b0d251264-230523','uploads/PARKER_PETER/PROFILE.png','sy0003','NORTHLINK TECHNOLOGICAL COLLEGE','FIRST YEAR','COLLEGE','BS IN INFORMATION SYSTEMS',13);

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
('sy0002','2023-2024',NULL,'inactive','inactive',2),
('sy0001','2022-2023',NULL,'inactive','inactive',1),
('sy0003','2024-2025',NULL,'active','active',3),
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
  `temp_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`role`,`fullname`,`status`,`otp`,`profile_image`,`gender`,`address`,`temp_password`) values 
('USER0001','admin_mariphil@yopmail.com','$1$vc3qs/BX$/QWZRd2fLiQvxX2GOBpG.0','ADMIN','MARIPHIL ADMINISTRATOR','active',NULL,'uploads/users/fullname.png','MALE',NULL,''),
('USR-37512177654f4-230523','validator','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','ADMIN','VALIDATOR','active',NULL,'uploads/users/fullname.jpg','MALE',NULL,NULL),
('USR-3f92b0d251264-230523','rperson','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','MR. RENDON LABADOR','active',NULL,NULL,NULL,NULL,NULL),
('USR-5361ad50f3799-231110','tonyhowardstark@yopmail.com','$1$eJmC2lCA$wYJ1LNKmr7PEOmlsLflci1','SCHOLAR','TONY STARK','active','','uploads/STARK_TONY/PROFILE.gif',NULL,NULL,NULL),
('USR-60b9c1e44fed9-231110','stevemrogers@yopmail.com','$1$8HeTH2ni$gAuJSug97NCUHGAfkCAGN/','SCHOLAR','STEVE ROGERS','active','','uploads/ROGERS_STEVE/PROFILE.jpg',NULL,NULL,NULL),
('USR-6eca67c983a60-230524','sponsor_2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR GERMANY','active',NULL,NULL,NULL,NULL,NULL),
('USR-705589206de8c-231110','brucehulkbanner@yopmail.com','$1$Zr/XEKjM$Oo8xKLO5ARTiW07bME2X80','SCHOLAR','BRUCE BANNER','active','','uploads/BANNER_BRUCE/PROFILE.jpg',NULL,NULL,NULL),
('USR-76eae08224ae2-231112','natasharomanov@yopmail.com','$1$aGdeDRUt$1qFOcNDloHHXIwi5P9Hgf/','SCHOLAR','NATASHA ROMANOV','active','','uploads/ROMANOV_NATASHA/PROFILE.png',NULL,NULL,NULL),
('USR-7b0396700c697-231116','peterparker@yopmail.com','$1$3o1TWnpD$mvcftR4C0g4yqBp4xBPTJ1','SCHOLAR','PETER PARKER','active','','uploads/PARKER_PETER/PROFILE.png',NULL,NULL,NULL),
('USR-8d9eb7d621465-230528','validator3','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER THREE','active',NULL,'uploads/users/fullname.png','MALE','PANABO CITY',NULL),
('USR-98ba34720e171-231116','antmanavenger@yopmail.com','$1$dpeHUrx.$04hVj99LT1CfxVXH8mTFG/','SCHOLAR','SCOTT LANG','active','','uploads/LANG_SCOTT/PROFILE.jpg',NULL,NULL,NULL),
('USR-a0fbf0079cc1f-231113','lokiodinson@yopmail.com','$1$G9Yn3X3s$OBVkjcqOgCc25mPUM1wvi.','APPLICANT','LOKI ODINSON','active','','uploads/ODINSON_LOKI/PROFILE.jpg',NULL,NULL,NULL),
('USR-ab75d56e23ec0-230524','validator2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','VALIDATOR','VALIDATOR NUMBER TWO','active',NULL,NULL,NULL,NULL,NULL),
('USR-ad02710943659-230523','SPONSOR','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','SPONSOR','SPONSOR','active',NULL,NULL,NULL,NULL,NULL),
('USR-bf7f79c72902f-231110','clintbarton@yopmail.com','$1$suOz5iM4$PvPqVhlLwaLqY25NsUFqt.','APPLICANT','CLINT BARTON','active','',NULL,NULL,NULL,NULL),
('USR-c16ebc004805d-231112','mobiusdmobius@yopmail.com','$1$rXbVRyff$AwcmsgzvBUm1SqFkfDO/./','APPLICANT','MOBIUS MOBIUS','fill_otp','9DKK5URGC7',NULL,NULL,NULL,NULL),
('USR-e6a5474b79910-230524','rperson2','$1$rlllLkoP$MRPo.Sn9e0SEX9faCNQ2A1','FACILITATOR','RESPONSIBLE NUMBER TWO','active',NULL,NULL,NULL,NULL,NULL);

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
