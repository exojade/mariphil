<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "changePassword"){

			$user = query("select * from users where user_id = ?", $_POST["user_id"]);
			$user=$user[0];
			if (crypt($_POST["current_password"], $user["password"]) == $user["password"]){
				
				if($_POST["new_password"] == $_POST["repeat_password"]){

					query("update users set password = ?, temp_password = '' where user_id = ?",
							crypt($_POST["new_password"], ""),
							$_POST["user_id"]
					);

					$_SESSION["mariphil"]["temp_password"] = "";

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Password successfully changed!",
						"link" => "index",
						];
						echo json_encode($res_arr); exit();


				}

				else{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "New and Repeat Password not the same. Try Again",
						// "link" => "index",
						];
						echo json_encode($res_arr); exit();
				}



            }
			else{
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "Wrong Current Password. Try Again.",
					// "link" => "index",
					];
					echo json_encode($res_arr); exit();

			}
			dump($_POST);
		}
	


		if($_POST["action"] == "saveProfile"){
			$prof_id = $_SESSION["mariphil"]["userid"];
			// dump($_POST);

			$year_status = query("select * from year_level where level_id = ?", $_POST["year_level"]);
			$year_level = $year_status[0]["year_level"];
			$year_type = $year_status[0]["type"];
			// $year_level_id = $year_status[0]["type"];

			$scholar = query("select * from scholars where scholar_id = ?", $prof_id);
			$scholar = $scholar[0];
			// dump($scholar);

			if(isset($_POST["same_residence"])):
				if($_POST["same_residence"] == "on"):
					$_POST["mother_region"] = $_POST["father_region"];
					$_POST["mother_province"] = $_POST["father_province"];
					$_POST["mother_city"] = $_POST["father_city"];
					$_POST["mother_barangay"] = $_POST["mother_barangay"];
					$_POST["mother_address"] = $_POST["father_address"];
				endif;
			endif;


			$string_query = ("
			update scholars set 
				firstname = '".strtoupper($_POST["firstname"])."',
				middlename = '".strtoupper($_POST["middlename"])."',
				lastname = '".strtoupper($_POST["lastname"])."',
				address_home = '".strtoupper($_POST["address_home"])."',
				address_barangay = '".strtoupper($_POST["address_barangay"])."',
				address_city = '".strtoupper($_POST["address_city"])."',
				address_region = '".strtoupper($_POST["address_region"])."',
				address_province = '".strtoupper($_POST["address_province"])."',
				birthdate = '".strtoupper($_POST["birthdate"])."',
				birthplace = '".strtoupper($_POST["birthplace"])."',
				sex = '".strtoupper($_POST["gender"])."',
				education_attainment = '".strtoupper($_POST["educational_attainment"])."',
				name_school = '".strtoupper($_POST["name_school"])."',
				father_name = '".strtoupper($_POST["father_name"])."',
				father_birthdate = '".strtoupper($_POST["father_dob"])."',
				father_region = '".strtoupper($_POST["father_region"])."',
				father_province = '".strtoupper($_POST["father_province"])."',
				father_city = '".strtoupper($_POST["father_city"])."',
				father_barangay = '".strtoupper($_POST["father_barangay"])."',
				father_address = '".strtoupper($_POST["father_address"])."',
				father_contact = '".strtoupper($_POST["father_contact"])."',
				father_occupation = '".strtoupper($_POST["father_occupation"])."',
				father_occupation_address = '".strtoupper($_POST["father_office"])."',
				father_income = '".strtoupper($_POST["father_income"])."',
				father_education_attainment = '".strtoupper($_POST["father_educational"])."',
				father_school = '".strtoupper($_POST["father_school"])."',
				school_name = '".strtoupper($_POST["school_name"])."',
				year_level = '".strtoupper($year_level)."',
				year_type = '".strtoupper($year_type)."',
				year_level_id = '".strtoupper($_POST["year_level"])."',
				course = '".strtoupper($_POST["course"])."',
				mother_name = '".strtoupper($_POST["mother_name"])."',
				mother_birthdate = '".strtoupper($_POST["mother_dob"])."',
				mother_region = '".strtoupper($_POST["mother_region"])."',
				mother_province = '".strtoupper($_POST["mother_province"])."',
				mother_city = '".strtoupper($_POST["mother_city"])."',
				mother_barangay = '".strtoupper($_POST["mother_barangay"])."',
				mother_address = '".strtoupper($_POST["mother_address"])."',
				mother_contact = '".strtoupper($_POST["mother_contact"])."',
				mother_occupation = '".strtoupper($_POST["mother_occupation"])."',
				mother_occupation_address = '".strtoupper($_POST["mother_office"])."',
				mother_income = '".strtoupper($_POST["mother_income"])."',
				mother_education_attainment = '".strtoupper($_POST["mother_educational"])."',
				mother_school = '".strtoupper($_POST["mother_school"])."'
				where scholar_id = '".$prof_id."'
			");
			//dump($string_query);
			query($string_query);

			$to_be_status = "";
			
			if($scholar["current_status"] == "APPLICANT"):
				query("update scholars set current_status = 'APPLICANT - IN REVIEW' where scholar_id = ?", $prof_id);
				$to_be_status = "APPLICANT - IN REVIEW";
			elseif($scholar["current_status"] == "APPLICANT - IN REVIEW (FOR UPDATE)"):
				query("update scholars set current_status = 'APPLICANT - IN REVIEW' where scholar_id = ?", $prof_id);
				$to_be_status = "APPLICANT - IN REVIEW";
			elseif($scholar["current_status"] == "APPLICANT - TO BE INTERVIEWED (FOR UPDATE)"):
				$to_be_status = "APPLICANT - TO BE INTERVIEWED'";
				query("update scholars set current_status = 'APPLICANT - TO BE INTERVIEWED' where scholar_id = ?", $prof_id);
			endif;

			$fullname = strtoupper($_POST["lastname"] . "_" . $_POST["firstname"]);
			$fullname = str_replace(' ', '_', $fullname);
			$target_pdf = "uploads/" . $fullname."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}

			//dump($_FILES['family_pic']);

			if($_FILES["family_pic"]["size"] != 0){
				
				$path_parts = pathinfo($_FILES["family_pic"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "FAMILY_PICTURE" . "." . $extension;
				
                    if(!move_uploaded_file($_FILES['family_pic']['tmp_name'], $target)){
                        echo("FAMILY Do not have upload files");
                        exit();
                    }
			query("update scholars set family_picture = '".$target."'
					where scholar_id = '".$prof_id."'");
			}
			if($_FILES["barangay_clearance"]["size"] != 0){

				$path_parts = pathinfo($_FILES["barangay_clearance"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "BARANGAY_CLEARANCE" . "." . $extension;

                    if(!move_uploaded_file($_FILES['barangay_clearance']['tmp_name'], $target)){
                        echo(" Barangay Do not have upload files");
                        exit();
                    }
					query("update scholars set barangay_clearance = '".$target."'
					where scholar_id = '".$prof_id."'");
			}
			if($_FILES["low_income"]["size"] != 0){

				$path_parts = pathinfo($_FILES["low_income"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "LOW_INCOME" . "." . $extension;

                    if(!move_uploaded_file($_FILES['low_income']['tmp_name'], $target)){
                        echo("Low income Do not have upload files");
                        exit();
                    }
					query("update scholars set low_income = '".$target."'
					where scholar_id = '".$prof_id."'");
			}
			if($_FILES["birth_certificate"]["size"] != 0){
				$path_parts = pathinfo($_FILES["birth_certificate"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "BIRTH_CERTIFICATE" . "." . $extension;
				
                    if(!move_uploaded_file($_FILES['birth_certificate']['tmp_name'], $target)){
                        echo("Birth Do not have upload files");
                        exit();
                    }
					query("update scholars set birth_certificate = '".$target."'
					where scholar_id = '".$prof_id."'");
			}
			if($_FILES["grade_card"]["size"] != 0){
				$path_parts = pathinfo($_FILES["grade_card"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "GRADE_CARD" . "." . $extension;

                    if(!move_uploaded_file($_FILES['grade_card']['tmp_name'], $target)){
                        echo("Grade card Do not have upload files");
                        exit();
                    }
					query("update scholars set grade_card = '".$target."'
					where scholar_id = '".$prof_id."'");
			}

			if($_FILES["profile_image"]["size"] != 0){
				$path_parts = pathinfo($_FILES["profile_image"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "PROFILE" . "." . $extension;

                    if(!move_uploaded_file($_FILES['profile_image']['tmp_name'], $target)){
                        echo("Grade card Do not have upload files");
                        exit();
                    }
					query("update scholars set profile_image = '".$target."'
					where scholar_id = '".$prof_id."'");
					query("update users set profile_image = '".$target."'
					where user_id = '".$prof_id."'");
			}


			$track_id = create_uuid("TR");
			if (query("insert INTO scholar_tracker (track_id, scholar_id, status, user_id, 
				date_created,time_created, timestamp) 
                  VALUES(?,?,?,?,?,?,?)", 
              $track_id, $prof_id, $to_be_status, $prof_id, date("Y-m-d"),
			   date("H:i:s"), time()) === false)
              {
                  echo("not_success");
              }
			  

			  $message = "I hope this email finds you well. We appreciate your interest in the Mariphil Scholarship Program and would like to inform you that your application is currently under review.

			  Our scholarship committee is diligently evaluating each application to ensure a fair and thorough assessment. This process may take some time, and we kindly ask for your patience during this period.
			  
			  We understand the importance of your application and the significance of the scholarship to your academic journey. Rest assured that we are committed to providing a comprehensive review to each applicant.
			  
			  Once the review process is complete, you will be notified of the outcome via email. We aim to notify all applicants within 7 days, and we appreciate your understanding in this matter.
			  
			  If you have any questions or need further assistance, please feel free to reply to this email or contact our scholarship office at Mariphil Office [mariphil@gmail.com].
			  
			  Thank you for your patience and understanding.";
			  $receipient = [];
			  $receipient[] = $prof_id;
			  start_mail("USER0001", "Scholarship Application Under Review", $message, $receipient,"NO");




			
		
			



			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Your registration has been completed",
				"link" => "index",
				];
				echo json_encode($res_arr); exit();
	
		}

		
    }
	else {

		if(isset($_GET["action"])){
			if($_GET["action"] == "fill"){
				$scholar = query("select * from scholars where scholar_id = ?", $_SESSION["mariphil"]["userid"]);
				render("public/profile_system/profile_fill.php",[
					"scholar" => $scholar[0],
				]);
			}
		}
		

		
	}
?>
