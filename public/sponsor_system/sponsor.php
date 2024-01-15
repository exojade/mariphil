<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "sponsorScholar"){
			// dump($_SESSION["mariphil"]["userid"]);
			
			$query_string = ("update scholars set 
				sponsor_id = '".$_SESSION["mariphil"]["userid"]."'
				where scholar_id = '".$_POST["scholar_id"]."'"); 
				// dump($query_string);
			query($query_string);

			$track_id = create_uuid("TR");
				if (query("insert INTO scholar_tracker (
							track_id, scholar_id, status, user_id, 
							date_created,time_created,timestamp,remarks) 
					VALUES(?,?,?,?,?,?,?,?)",
					$track_id, $_POST["scholar_id"], 'SCHOLAR', $_SESSION["mariphil"]["userid"], 
					date("Y-m-d"), date("H:i:s"),time(), $_SESSION["mariphil"]["fullname"]) === false)
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

					$sponsor = query("select * from users where user_id = ?", $_SESSION["mariphil"]["userid"]);
					$sponsor = $sponsor[0];


					$message = "
					Dear ".$user["fullname"].",
					<br><br>
					On behalf of the ".$sponsor["fullname"].", I extend my heartfelt congratulations on your successful confirmation as a recipient of the scholarship. 
					<br>We are delighted to welcome you into our esteemed scholarship program.
					<br><br>

					".$sponsor["fullname"]."
					";
					$receipient = [];
					$receipient[] = $_POST["scholar_id"];
					start_mail($_SESSION["mariphil"]["userid"], "You now have a sponsor!", $message, $receipient ,"NO");


				// $announcement_id = create_uuid("ANN");
				// 	if (query("insert INTO announcement (
				// 				announcement_id, announcement, send_to, user_id, 
				// 				date_created,time_created,timestamp) 
				// 		VALUES(?,?,?,?,?,?,?)",
				// 		$announcement_id, "YOU HAVE BEEN SPONSORED! CONGRATULATIONS!", $_POST["scholar_id"], "", 
				// 		date("Y-m-d"), date("H:i:s"),time()) === false)
				// 		{
				// 			$res_arr = [
				// 				"result" => "failed",
				// 				"title" => "Failed",
				// 				"message" => "User already Registered",
				// 				// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
				// 				];
				// 				echo json_encode($res_arr); exit();
				// 		}

					// $announcement_id = create_uuid("ANN");
					// 	if (query("insert INTO announcement (
					// 				announcement_id, announcement, send_to, user_id, 
					// 				date_created,time_created,timestamp) 
					// 		VALUES(?,?,?,?,?,?,?)",
					// 		$announcement_id, "YOU SPONSORED A VERY FORTUNATE STUDENT! THANK YOU FOR THE SPONSORSHIP!", $_SESSION["mariphil"]["userid"], "", 
					// 		date("Y-m-d"), date("H:i:s"),time()) === false)
					// 		{
					// 			$res_arr = [
					// 				"result" => "failed",
					// 				"title" => "Failed",
					// 				"message" => "User already Registered",
					// 				// "link" => "scholars?action=details&id=".$_POST["scholar_id"],
					// 				];
					// 				echo json_encode($res_arr); exit();
					// 		}









				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "index",
					];
					echo json_encode($res_arr); exit();

				
			



		}


	else if($_POST["action"] == "sponsorFilterSY"){
		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Filter success",
			"link" => "sponsor?action=my_sponsored&school_year=".$_POST["school_year"],
			];
			echo json_encode($res_arr); exit();
	}

	else if($_POST["action"] == "unsponsor"){
		query("update scholars set sponsor_id = NULL where scholar_id = ?", $_POST["scholar_id"]);
		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Successfully unsponsored the scholar!",
			"link" => "refresh",
			];
			echo json_encode($res_arr); exit();


		dump($_POST);
	}


    }
	else {
		if($_GET["action"] == "no_sponsor"){
			$users = query("select * from users");
			render("public/sponsor_system/no_sponsors_list.php",[
				"users" => $users,
			]);
		}

		if($_GET["action"] == "my_sponsored"){
			// $users = query("select * from users");



			if(!isset($_GET["school_year"])):
				$school_year = query("select school_year_id from school_year where applicant_status = 'active'");
				$school_year = $school_year[0];
				$list = query("select s.*, u.*, sy.school_year from scholars s
					left join users u
					on s.responsible = u.user_id
					left join school_year sy
					on sy.school_year_id = s.school_year_id
					where s.current_status = 'SCHOLAR'
					and sponsor_id = ?
					and s.school_year_id = ?
					order by s.school_year_id desc", 
											$_SESSION["mariphil"]["userid"], $school_year["school_year_id"]);
			else:
				if($_GET["school_year"] == ""):
					$school_year = query("select school_year_id from school_year where applicant_status = 'active'");
					$school_year = $school_year[0];
					$list = query("select s.*, u.*, sy.school_year from scholars s
					left join users u
					on s.responsible = u.user_id
					left join school_year sy
					on sy.school_year_id = s.school_year_id
					where s.current_status = 'SCHOLAR'
					and sponsor_id = ?
					order by s.school_year_id desc", 
											$_SESSION["mariphil"]["userid"]);
				
				else:
					$list = query("select s.*, u.*, sy.school_year from scholars s
					left join users u
					on s.responsible = u.user_id
					left join school_year sy
					on sy.school_year_id = s.school_year_id
					where s.current_status = 'SCHOLAR'
					and sponsor_id = ?
					and s.school_year_id = ?
					order by s.school_year_id desc", 
											$_SESSION["mariphil"]["userid"], $_GET["school_year"]);
				endif;
			endif;

			// render("public/scholars_system/applicants_list.php",[
			// 	"applicants" => $applicants,
			// ]);



			




			render("public/sponsor_system/my_sponsored_list.php",[
				// "users" => $users,
				"list" => $list,
			]);
		}
	}
?>
