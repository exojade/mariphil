<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "add_achievement"):
			// dump($_POST);
			$achievement_id = create_uuid("ACH");
			if (query("insert INTO monthly_monitoring_achievements (
				tbl_id, achievement, achievement_id)
				VALUES(?,?,?)", 
				$_POST["tbl_id"], $_POST["achievement"], $achievement_id) === false)
				{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "This Type of Form has been already created!",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
				}

		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Success",
			"link" => "refresh",
			];
			echo json_encode($res_arr); exit();

		endif;

		if($_POST["action"] == "returnForm"):
			// dump($_POST);
			$comment = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			
			$message_comment = $_POST["remarks"] . "<br><br>" . $comment[0]["return_comments"];
			// dump($message_comment);
			query("update monthly_monitoring set form_status = 'RETURNED', return_comments = ? where tbl_id = ?", $message_comment, $_POST["tbl_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();

		endif;

		if($_POST["action"] == "approveForm"):
			
			query("update monthly_monitoring set form_status = 'DONE', remarks = ? where tbl_id = ?", $_POST["remarks"], $_POST["tbl_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();

		endif;

		if($_POST["action"] == "update_grade"):
			// dump($_FILES);

			$target_pdf = "resources/scholar_achievements/" . $_POST["form_id"]."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}
			$target_pdf = $target_pdf.$_FILES["grade_card"]["name"];
			if(!move_uploaded_file($_FILES['grade_card']['tmp_name'], $target_pdf)){
				echo("Do not have upload files");
				exit();
			}

			query("update monthly_monitoring set grades = ?, grade_card_upload = ? where
					tbl_id = ?", $_POST["grade"], $target_pdf, $_POST["form_id"]);

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;

		if($_POST["action"] == "submitForm"):
			$form = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			if($form[0]["grades"] == ""):
				$res_arr = [
					"result" => "failed",
					"title" => "Success",
					"message" => "You have not filled out the form yet! Fill at least the grades!",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			endif;
			query("update monthly_monitoring set form_status = 'FOR CHECKING' where tbl_id = ?", $_POST["tbl_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Successfully submitted",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();
			// dump($_POST);
		endif;

		if($_POST["action"] == "add_photo"):
			// dump($_POST);

			$tbl_id = $_POST["tbl_id"];
			$i = 0;
			foreach($_FILES["upload_file"]["name"] as $image):
				$target_pdf = "resources/scholar_achievements/" . $tbl_id."/";
				if (!file_exists($target_pdf )) {
					mkdir($target_pdf , 0777, true);
				}
				
				$target_pdf = $target_pdf.$_FILES["upload_file"]["name"][$i];
				$image_id = create_uuid("ImgAchv");
				if(!move_uploaded_file($_FILES['upload_file']['tmp_name'][$i], $target_pdf)){
					echo("Do not have upload files");
					exit();
				}
				if (query("insert INTO monthly_monitoring_upload (upload_id,upload_file,tbl_id) 
					VALUES(?,?,?)", 
					$image_id,$target_pdf,$tbl_id) === false)
					{
						apologize("Sorry, that username has already been taken!");
						
					}
				$i++;
			endforeach;



		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Success",
			"link" => "refresh",
			];
			echo json_encode($res_arr); exit();

		endif;

		if($_POST["action"] == "printForm"):
			// dump($_POST);
				$base_url = the_base_url();
				$options = urlencode(serialize($_POST));
                $webpath = $base_url . "/mariphil_system/forms?action=printForm&options=".$options;
                $filename = "QForm";
				$path = "resources/qforms/".$filename.".pdf";
				$exec = '"C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" -O portrait --image-dpi 300 "'.$webpath.'" '.$path.'';
				// dump($webpath);
				exec($exec);

				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => $path,
					"newlink" => "newlink",
					];
					echo json_encode($res_arr); exit();
			
		endif;

		if($_POST["action"] == "delete_achievement"):
			query("delete from monthly_monitoring_achievements where achievement_id = ?", $_POST["achievement_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();
		endif;

		if($_POST["action"] == "resubmitRenewal"){

			
			$scholar = query("select * from scholars where scholar_id = ?", $_POST["scholar_id"]);
			$scholar = $scholar[0];
			$fullname = strtoupper($scholar["lastname"] . "_" . $scholar["firstname"]);
			$fullname = str_replace(' ', '_', $fullname);

			$form = query("select * from forms where form_id = ?", $_POST["form_id"]);
			$form = $form[0];
			$form_name = $form["month"] . "_" .$form["year"];
			// dump($_POST);



			$target_pdf = "uploads/" . $fullname."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}

			if($_FILES["grade_card"]["size"] != 0){

				$path_parts = pathinfo($_FILES["grade_card"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "_grade_" . $form_name . "." . $extension;

                    if(!move_uploaded_file($_FILES['grade_card']['tmp_name'], $target)){
                        echo(" Barangay Do not have upload files");
                        exit();
                    }
					query("update renewal set grades = '".$target."'
					where form_id = '".$_POST["form_id"]."'
					and scholar_id = '".$_POST["scholar_id"]."'
					");
			}
			if($_FILES["tuition"]["size"] != 0){

				$path_parts = pathinfo($_FILES["tuition"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "_tuition_" . $form_name . "." . $extension;

                    if(!move_uploaded_file($_FILES['tuition']['tmp_name'], $target)){
                        echo("Low income Do not have upload files");
                        exit();
                    }
					query("update renewal set tuition_fee_report = '".$target."'
					where form_id = '".$_POST["form_id"]."'
					and scholar_id = '".$_POST["scholar_id"]."'
					");
			}
			if($_FILES["cor"]["size"] != 0){
				$path_parts = pathinfo($_FILES["cor"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "_cor_" . $form_name . "." . $extension;
				
                    if(!move_uploaded_file($_FILES['cor']['tmp_name'], $target)){
                        echo("Birth Do not have upload files");
                        exit();
                    }
					query("update renewal set cor = '".$target."'
					where form_id = '".$_POST["form_id"]."'
					and scholar_id = '".$_POST["scholar_id"]."'
					");
			}

			query("update renewal set status = 'SUBMITTED',
			submitted_date = '".date("Y-m-d")."', submitted_time = '".date("H:i:s")."'
			where form_id = '".$_POST["form_id"]."'
					and scholar_id = '".$_POST["scholar_id"]."'
			");


			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "scholars?action=details&id=".$_POST["scholar_id"],
				];
				echo json_encode($res_arr); exit();
		}



		if($_POST["action"] == "checkForm"){
			// dump($_POST);

			query("update renewal set status = ?, remarks = ?, remarks_by = ?,
					check_date = ?, check_time = ?
					where form_id = ? and scholar_id = ?
					", 
					$_POST["status"], $_POST["remarks"],
					$_POST["checked_by"], date("Y-m-d"), date("H:i:s"),
					$_POST["form_id"],
					$_POST["scholar_id"]
				
				);

			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "scholars?action=details&id=".$_POST["scholar_id"],
				];
				echo json_encode($res_arr); exit();


		}




		if($_POST["action"] == "addQuarterlyMonitoring"){
			// dump($_POST);
		
			$form_id = create_uuid("FORM");
			if (query("insert INTO forms (
						form_id, form_type, 
						date_created, time_created, timestamp,
						form_kind,school_year_id,created_by)
			  VALUES(?,?,?,?,?,?,?,?)", 
				$form_id, "QUARTERLY", date("Y-m-d"), date("H:i:s"), time(),
				$_POST["form_kind"], $_POST["sy"], $_SESSION["mariphil"]["userid"]) === false)
				{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "This Type of Form has been already created!",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
				}

				$scholars = query("select * from scholars where current_status = 'SCHOLAR'
				and responsible = ? and school_year_id = ?", $_SESSION["mariphil"]["userid"], $_POST["sy"]);
				foreach($scholars as $s):
					$quarter_id = create_uuid("QUARTERLY");
					if (query("insert INTO monthly_monitoring (
						tbl_id, form_id, scholar_id,
						form_status)
						VALUES(?,?,?,?)", 
							$quarter_id, $form_id, 
							$s["scholar_id"], "FOR SUBMISSION") === false)
							{
								$res_arr = [
									"result" => "failed",
									"title" => "Failed",
									"message" => "Form Done",
									"link" => "refresh",
									];
									echo json_encode($res_arr); exit();
							}
				endforeach;
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "forms?action=list",
					];
					echo json_encode($res_arr); exit();
		}
		
    }
	else {


		if($_GET["action"] == "list"){

			$forms = query("select * from forms f
							left join school_year sy
							on sy.school_year_id = f.school_year_id where created_by = ?", $_SESSION["mariphil"]["userid"]);
			render("public/forms_system/forms_list.php",[
				"forms" => $forms,
			]);

			
		}

		if($_GET["action"] == "my_list"){

			$forms = query("select sy.school_year, m.*, f.* from monthly_monitoring m
							left join forms f
							on m.form_id = f.form_id
							left join school_year sy
							on sy.school_year_id = f.school_year_id
							 where scholar_id = ?
							 order by f.timestamp desc", $_SESSION["mariphil"]["userid"]);

	
			render("public/forms_system/scholar_monitoring_list.php",[
				"forms" => $forms,
			]);

			
		}


		if($_GET["action"] == "printForm"){


	
			renderview("public/forms_system/printQuarterlyForm.php",[
				// "forms" => $forms,
			]);

			
		}

		if($_GET["action"] == "details"){
			$forms = query("select * from forms where form_id = ?", $_GET["id"]);
			
			$scholars = query("select * from monthly_monitoring m
								left join scholars s on s.scholar_id = m.scholar_id
								where form_id = ?", $_GET["id"]);
			// dump($scholars);

			$forms = $forms[0];
			render("public/forms_system/forms_details.php",[
				"forms" => $forms,
				"scholars" => $scholars,
			]);
		}

		if($_GET["action"] == "scholar_details"){
			$forms = query("select sy.school_year, m.*, f.* from monthly_monitoring m
			left join forms f
			on m.form_id = f.form_id
			left join school_year sy
			on sy.school_year_id = f.school_year_id
			 where m.tbl_id = ?
			 order by f.timestamp desc", $_GET["id"]);

			
// dump($forms);
			$form = $forms[0];
			$scholar = query("select * from scholars where scholar_id = ?", $form["scholar_id"]);
			
			// dump($scholar);

			$form_achievements = query("select * from monthly_monitoring_achievements where tbl_id = ?", $_GET["id"]);
			$form_uploads = query("select * from monthly_monitoring_upload where tbl_id = ?", $_GET["id"]);
			render("public/forms_system/scholar_monitoring_details.php",[
				"form" => $form,
				"form_achievements" => $form_achievements,
				"form_uploads" => $form_uploads,
				"scholar" => $scholar,
			]);
		}
	}
?>
