<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "acceptScholar"){
			// dump($_POST);
			$status = query("select * from scholars where scholar_id = ?", $_POST["scholar_id"]);
			$current_status = $status[0]["current_status"];
			if($current_status == 'APPLICANT - IN REVIEW'){
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
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "scholars?action=details&id=".$_POST["scholar_id"],
					];
					echo json_encode($res_arr); exit();
			}
			
		}

		if($_POST["action"] == "addResponsible"){
			// dump($_POST);

			query("update scholars set 
						responsible = '".$_SESSION["mariphil"]["userid"]."',
						current_status = 'SCHOLAR'
						where scholar_id = '".$_POST["scholar_id"]."'
					");

			query("update users set 
					role = 'SCHOLAR'
					where user_id = '".$_POST["scholar_id"]."'
				");


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
			$scholars = query("select s.*, u.fullname from scholars s
			left join users u
			on u.user_id = s.sponsor_id
			where responsible = ?", $_SESSION["mariphil"]["userid"]);
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
			$applicant = query("select s.*, u.fullname as sponsor, uu.fullname as responsible_name  from scholars s
			left join users u
			on u.user_id = s.sponsor_id
			left join users uu
			on uu.user_id = s.responsible
			where s.scholar_id = ?", $_GET["id"]);
			$applicant = $applicant[0];
			render("public/scholars_system/details.php",[
				"applicant" => $applicant,
			]);
		}
	}
?>
