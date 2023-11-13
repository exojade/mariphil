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
    }
	else {
		if($_GET["action"] == "no_sponsor"){
			$users = query("select * from users");
			render("public/sponsor_system/no_sponsors_list.php",[
				"users" => $users,
			]);
		}

		if($_GET["action"] == "my_sponsored"){
			$users = query("select * from users");
			render("public/sponsor_system/my_sponsored_list.php",[
				"users" => $users,
			]);
		}
	}
?>
