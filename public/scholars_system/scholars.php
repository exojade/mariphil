<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "acceptScholar"){
			// dump($_POST);
			$status = query("select * from scholars where scholar_id = ?", $_POST["scholar_id"]);
			$current_status = $status[0]["current_status"];
			if($current_status == 'APPLICANT - IN REVIEW'){
				$user = query("select * from users where user_id = ?", $_POST["scholar_id"]);
				$user = $user[0];
				query("update scholars set current_status = 'APPLICANT - TO BE INTERVIEWED'
						where scholar_id = ?", $_POST["scholar_id"]);
				$track_id = create_uuid("TR");
				if (query("insert INTO scholar_tracker (
							track_id, scholar_id, status, user_id, 
							date_created,time_created,timestamp,remarks) 
					VALUES(?,?,?,?,?,?,?,?)",
					$track_id, $_POST["scholar_id"], 'APPLICANT - TO BE INTERVIEWED', $_SESSION["mariphil"]["userid"], 
					date("Y-m-d"), date("H:i:s"),time(), $_POST["remarks"]) === false)
					{
						$res_arr = [
							"result" => "failed",
							"title" => "Failed",
							"message" => "User already Registered",
							// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
							];
							echo json_encode($res_arr); exit();
					}

					$message = "
					Dear ".$user["fullname"].",
					<br><br>
					I hope this email finds you well. This is an automated message to inform you about the current status of your scholarship application.
					<br><br>
					Application Process Status: To be Interviewed
					<br><br>
					Your application has progressed to the next stage, and you are now scheduled for an interview. The interview is a crucial step in our selection process, and it provides us with an opportunity to learn more about you, your aspirations, and your suitability for the scholarship.
					<br><br>
					
					Please make sure to be well-prepared for the interview. Be ready to discuss your academic achievements, extracurricular activities, and your motivation for applying for this scholarship.
					<br><br>
					If you have any concerns or conflicts with the provided interview details, please contact our scholarship office at Mariphil Foundation Inc as soon as possible.
					<br><br>
					We wish you the best of luck in the interview process. We appreciate your interest in our scholarship program.
					<br><br>
					Thank you,<br>
					Mariphil Foundation Inc.<br>
					Scholarship Committee<br>
					";
					$receipient = [];
					$receipient[] = $_POST["scholar_id"];
					start_mail($_SESSION["mariphil"]["userid"], "Application Process Status: To be Interviewed", $message, $receipient ,"NO");
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "scholars?action=details&id=".$_POST["scholar_id"],
					];
					echo json_encode($res_arr); exit();
			}
			else{
				query("update scholars set current_status = 'APPLICANT - INTERVIEWED'
						where scholar_id = ?", $_POST["scholar_id"]);
				$track_id = create_uuid("TR");
				if (query("insert INTO scholar_tracker (
							track_id, scholar_id, status, user_id, 
							date_created,time_created,timestamp,remarks) 
					VALUES(?,?,?,?,?,?,?,?)",
					$track_id, $_POST["scholar_id"], 'APPLICANT - INTERVIEWED', $_SESSION["mariphil"]["userid"], 
					date("Y-m-d"), date("H:i:s"),time(), $_POST["remarks"]) === false)
					{
						$res_arr = [
							"result" => "failed",
							"title" => "Failed",
							"message" => "User already Registered",
							// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
							];
							echo json_encode($res_arr); exit();
					}

					$user = query("select * from users where user_id = ?", $_POST["scholar_id"]);
					$user = $user[0];


					$message = "
					Dear ".$user["fullname"].",
					<br><br>
					I hope this email finds you well. We would like to provide you with an update on the status of your scholarship application.
					<br><br>
					After your successful interview, your application has progressed to the next stage. At this point, it is under the responsibility of the designated facilitator who will guide you through the remaining steps of the process.
					<br><br>
					Current Status: Under Facilitator and Sponsor Review
					<br><br>
					Your application is currently being reviewed by the facilitator assigned to manage the scholarship program. The facilitator will assist you and act as a liaison between you and the sponsoring organization. They will ensure that all necessary documentation is in order and that you are well-prepared for the final steps of the selection process.
					<br><br>
					Next Steps: Please Wait for Further Updates
					<br><br>
					We kindly request your patience as the facilitator conducts a thorough review. Additionally, your application will be presented to the sponsors who support the scholarship program. They will have the final say in the selection process.
					<br><br>
					Please be assured that we understand the importance of timely updates, and we will keep you informed of any developments in your application status. You may expect further communication from the facilitator regarding the next steps and additional requirements.
					<br><br>
					If you have any immediate questions or concerns, feel free to reach out to your assigned facilitator.
					<br><br>
					We appreciate your continued interest in our scholarship program and thank you for your understanding during this process.
					<br><br>
					Best regards,
					<br><br>
					Mariphil Foundation Inc.<br>
					Scholarship Committee<br>
					";
					$receipient = [];
					$receipient[] = $_POST["scholar_id"];
					start_mail($_SESSION["mariphil"]["userid"], "Application Process Status: Interviewed", $message, $receipient ,"NO");
					$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			}
			
		}

		if($_POST["action"] == "addResponsible"){
			// dump($_POST);

			$scholar = query("select s.*, sy.school_year from scholars s
								left join school_year sy
								on sy.school_year_id = s.school_year_id
								 where scholar_id = ?", $_POST["scholar_id"]);
			// dump($scholar);
			$scholar = $scholar[0];


			if (query("insert INTO scholar_status (
				scholar_id, school_year_id, school_name, year_level, 
				course, year_type) 
					VALUES(?,?,?,?,?,?)",
					$scholar["scholar_id"], $scholar["school_year_id"], $scholar["school_name"], $scholar["year_level"], 
					$scholar["course"], $scholar["year_type"]) === false)
					{
						$res_arr = [
							"result" => "failed",
							"title" => "Failed",
							"message" => "User already Registered",
							// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
							];
							echo json_encode($res_arr); exit();
					}

			

			query("update scholars set 
						responsible = '".$_SESSION["mariphil"]["userid"]."',
						current_status = 'SCHOLAR'
						where scholar_id = '".$_POST["scholar_id"]."'
					");

			query("update users set 
					role = 'SCHOLAR'
					where user_id = '".$_POST["scholar_id"]."'
				");
				$user = query("select * from users where user_id = ?", $_POST["scholar_id"]);
				$user = $user[0];

				$faci = query("select * from users where user_id = ?", $_SESSION["mariphil"]["userid"]);
				$faci = $faci[0];
		


					$message = "
					Dear ".$user["fullname"].",
					<br><br>
					We are thrilled to inform you that you have been selected as a recipient of the Mariphil Foundation Scholarship. <br>Congratulations on this significant achievement! Your dedication and accomplishments have truly set you apart, and we are excited to support your academic journey.
					<br><br>
					Key Details:
					<br><br>
					Facilitator: ".$_SESSION["mariphil"]["fullname"]."<br>
					School Year: ".$scholar["school_year"]."<br>
					Duration: 1 Year<br>
					Next Steps:
					<br><br>
					Welcome Package: In the coming days, you will receive a welcome package containing important details about your scholarship, including terms and conditions, expectations, and contact information for your facilitator.
					<br><br>
					Facilitator Introduction: Your assigned facilitator, [Facilitator's Name], will reach out to you to provide guidance and support throughout your scholarship journey. They will be your main point of contact for any questions or concerns.
					<br><br>
					Confirmation from Sponsor: Before the scholarship is officially finalized, we are awaiting confirmation from our sponsors. Once we receive this confirmation, you will be notified promptly.
					<br><br>
					Quarterly Monitoring: As part of the scholarship program, you will be required to complete quarterly monitoring reports. These reports help us ensure that you are progressing well academically and are taking full advantage of the opportunities provided by the scholarship.
					<br><br>
					Important Contacts:
					<br><br>
					Facilitator: ".$faci["fullname"]."<br>
					Email: ".$faci["username"]."<br>
					Please feel free to reach out to your facilitator if you have any immediate questions or require assistance. We are committed to supporting you throughout your academic journey and beyond.
					<br><br>
					Once again, congratulations on becoming a Mariphil Scholarship recipient! We appreciate your patience as we await confirmation from our sponsors and look forward to witnessing your continued success.
					<br><br>
					Best regards,
					<br><br>
					Mariphil Foundation Inc<br>
					Scholarship Committee<br>
					";
					$receipient = [];
					$receipient[] = $_POST["scholar_id"];
					start_mail($_SESSION["mariphil"]["userid"], "You are now a scholar!", $message, $receipient ,"NO");
				


					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "scholars?action=details&id=".$_POST["scholar_id"],
						];
						echo json_encode($res_arr); exit();

			// dump($_POST);
		}




		if($_POST["action"] == "denyScholar"){
			// dump($_POST);
			$status = query("select * from scholars where scholar_id = ?", $_POST["scholar_id"]);
			$current_status = $status[0]["current_status"];
				query("update scholars set current_status = 'APPLICANT - DENIED'
						where scholar_id = ?", $_POST["scholar_id"]);
				$track_id = create_uuid("TR");
				if (query("insert INTO scholar_tracker (
							track_id, scholar_id, status, user_id, 
							date_created,time_created,timestamp,remarks) 
					VALUES(?,?,?,?,?,?,?,?)",
					$track_id, $_POST["scholar_id"], 'APPLICANT - DENIED', $_SESSION["mariphil"]["userid"], 
					date("Y-m-d"), date("H:i:s"),time(), $_POST["remarks"]) === false)
					{
						$res_arr = [
							"result" => "failed",
							"title" => "Failed",
							"message" => "User already Registered",
							// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
							];
							echo json_encode($res_arr); exit();
					}


					$user = query("select * from users where user_id = ?", $_POST["scholar_id"]);
					$user = $user[0];



					$message = "
					Dear ".$user["fullname"].",
					<br><br>
					I trust this email finds you in good health. We appreciate the effort you put into your scholarship application and your interest in our program. This communication is to inform you about the status of your application.
					<br><br>
					Application Process Status: Denied
					<br><br>
					After careful consideration, we regret to inform you that your application for the Mariphil Scholarship has been denied. We understand that this news may be disappointing, and we want to express our gratitude for the time and dedication you invested in your application.
					<br><br>
					Please remember that the selection process is highly competitive, and decisions are made based on various factors. While your application may not have been successful this time, we encourage you to continue pursuing your academic and personal goals.
					<br><br>
					If you have any questions or if you would like feedback on your application, please feel free to reach out to our scholarship office at Mariphil Foundation Inc.
					<br><br>
					We appreciate your understanding and wish you success in all your future endeavors.
					Thank you,<br>
					Mariphil Foundation Inc.<br>
					Scholarship Committee<br>
					";
					start_mail($_SESSION["mariphil"]["user_id"], "Application Process Status: To be Interviewed", $message, $user["user_id"],"NO");





			
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "scholars?action=details&id=".$_POST["scholar_id"],
					];
					echo json_encode($res_arr); exit();
			
		}
		
    }
	else {

		// dump($_GET);


		if($_GET["action"] == "applicants_list"){
			$applicants = query("select * from scholars where current_status not in ('SCHOLAR', 'APPLICANT - DENIED')");
			render("public/scholars_system/applicants_list.php",[
				"applicants" => $applicants,
			]);
		}

		if($_GET["action"] == "denied_list"){
			$applicants = query("select * from scholars where current_status in ('APPLICANT - DENIED')");
			render("public/scholars_system/denied_list.php",[
				"applicants" => $applicants,
			]);
		}

		if($_GET["action"] == "scholars_list"){
			$scholars = query("select s.*, u.fullname, uu.fullname as responsible from scholars s
			left join users u
			on u.user_id = s.sponsor_id
			left join users uu
			on uu.user_id = s.responsible
			where s.current_status = 'SCHOLAR'");
			render("public/scholars_system/scholars_list.php",[
				"scholars" => $scholars,
			]);
		}


		if($_GET["action"] == "my_scholars_list"){
			$scholars = query("select s.*, u.fullname,sy.school_year from scholars s
			left join users u
			on u.user_id = s.sponsor_id
			left join school_year sy
			on sy.school_year_id = s.school_year_id
			where responsible = ?
			order by s.school_year_id desc, lastname ASC, firstname ASC", $_SESSION["mariphil"]["userid"]);
			render("public/scholars_system/my_scholars_list.php",[
				"scholars" => $scholars,
			]);
		}

		if($_GET["action"] == "vacant_applicants"){
			$scholars = query("select * from scholars s
			where responsible is null
			and current_status='APPLICANT - INTERVIEWED'");
			// dump($scholars);
			render("public/scholars_system/vacant_applicants.php",[
				"scholars" => $scholars,
			]);
		}

		if($_GET["action"] == "details"){
			$applicant = query("select s.*, u.fullname as sponsor, uu.fullname as responsible_name, sy.school_year  from scholars s
			left join users u
			on u.user_id = s.sponsor_id
			left join users uu
			on uu.user_id = s.responsible
			left join school_year sy
			on sy.school_year_id = s.school_year_id
			where s.scholar_id = ?", $_GET["id"]);
			$applicant = $applicant[0];
			render("public/scholars_system/details.php",[
				"applicant" => $applicant,
			]);
		}
	}
?>
