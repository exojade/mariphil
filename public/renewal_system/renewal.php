<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {


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



		if($_POST["action"] == "upload_grades"):
			// dump($_POST);

			$target_pdf = "resources/requirements/" . $_POST["renewal_id"]."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}
			$target_pdf = $target_pdf.$_FILES["grades"]["name"];
			if(!move_uploaded_file($_FILES['grades']['tmp_name'], $target_pdf)){
				echo("Do not have upload files");
				exit();
			}

			query("update renewal set grades = ? where
					renewal_id = ?", $target_pdf, $_POST["renewal_id"]);

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;


		if($_POST["action"] == "upload_cor"):
			// dump($_POST);

			$target_pdf = "resources/requirements/" . $_POST["renewal_id"]."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}
			$target_pdf = $target_pdf.$_FILES["cor"]["name"];
			if(!move_uploaded_file($_FILES['cor']['tmp_name'], $target_pdf)){
				echo("Do not have upload files");
				exit();
			}

			query("update renewal set cor = ? where
					renewal_id = ?", $target_pdf, $_POST["renewal_id"]);

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;


		if($_POST["action"] == "upload_tuition"):
			// dump($_POST);

			$target_pdf = "resources/requirements/" . $_POST["renewal_id"]."/";
			if (!file_exists($target_pdf )) {
				mkdir($target_pdf , 0777, true);
			}
			$target_pdf = $target_pdf.$_FILES["tuition"]["name"];
			if(!move_uploaded_file($_FILES['tuition']['tmp_name'], $target_pdf)){
				echo("Do not have upload files");
				exit();
			}

			query("update renewal set tuition_fee_report = ? where
					renewal_id = ?", $target_pdf, $_POST["renewal_id"]);

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;

		if($_POST["action"] == "submitForm"):
			$form = query("select * from renewal where renewal_id = ?", $_POST["tbl_id"]);
			if($form[0]["grades"] == "" || $form[0]["tuition_fee_report"] == "" || $form[0]["cor"] == ""
			|| $form[0]["school_name"] == "" || $form[0]["year_level"] == ""
			):
				$res_arr = [
					"result" => "failed",
					"title" => "Success",
					"message" => "You have not filled out the form yet!",
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

		if($_POST["action"] == "updateInfo"):
			dump($_POST);
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


		



	




		if($_POST["action"] == "addRenewalForm"){
			// dump($_POST);
		
			$form_id = create_uuid("RenFORM");
			if (query("insert INTO renewal_form (
						form_id, facilitator, 
						lock_status, date_created, time_created,
						timestamp,school_year_id,for_school_year_id)
			  VALUES(?,?,?,?,?,?,?,?)", 
				$form_id, $_POST["facilitator"], "OPEN", date("Y-m-d"), date("H:i:s"),
				time(), $_POST["sy"], $_POST["renew_sy"]) === false)
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
				and responsible = ? and school_year_id = ?", $_POST["facilitator"], $_POST["sy"]);
				foreach($scholars as $s):
					$quarter_id = create_uuid("RENEW");
					if (query("insert INTO renewal (
						renewal_id, form_id, scholar_id,
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
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
		}
		
    }
	else {


		if($_GET["action"] == "list"){
			// dump($_SESSION);
			$forms = query("select f.*,y.school_year as current_sy,
							y2.school_year as for_sy
							from 
							renewal_form f
							left join school_year y
							on y.school_year_id = f.school_year_id
							left join school_year y2
							on y2.school_year_id = f.for_school_year_id
							
							 where f.facilitator = ?
							 order by f.timestamp desc", $_SESSION["mariphil"]["userid"]);
			// dump($forms);
			render("public/renewal_system/renewal_list.php",[
				"forms" => $forms,
			]);

			
		}

		if($_GET["action"] == "my_list"){

			$forms = query("select sy.school_year as current_sy, sy2.school_year as renew_sy, r.*, f.* from renewal r
							left join renewal_form f
							on r.form_id = f.form_id
							left join school_year sy
							on sy.school_year_id = f.school_year_id
							left join school_year sy2
							on sy2.school_year_id = f.for_school_year_id
							 where scholar_id = ?
							 order by f.timestamp desc", $_SESSION["mariphil"]["userid"]);
			// dump($forms);
	
			render("public/renewal_system/my_renewal_portal.php",[
				"forms" => $forms,
			]);

			
		}


		if($_GET["action"] == "printForm"){


	
			renderview("public/forms_system/printQuarterlyForm.php",[
				// "forms" => $forms,
			]);

			
		}

		if($_GET["action"] == "details"){
			$forms = query("select * from renewal_form where form_id = ?", $_GET["id"]);
			// dump($forms);
			$scholars = query("select * from renewal r
								left join scholars s on s.scholar_id = r.scholar_id
								where form_id = ?", $_GET["id"]);
			// dump($scholars);

			$forms = $forms[0];
			render("public/renewal_system/renewal_details.php",[
				"forms" => $forms,
				"scholars" => $scholars,
			]);
		}

		if($_GET["action"] == "scholar_details"){
			$forms = query("select sy.school_year as current_sy, 
			sy2.school_year as for_sy, r.*, f.* from renewal r
			left join renewal_form f
			on r.form_id = f.form_id
			left join school_year sy
			on sy.school_year_id = f.school_year_id
			left join school_year sy2
			on sy2.school_year_id = f.for_school_year_id
			 where r.renewal_id = ?
			 order by f.timestamp desc", $_GET["id"]);

			
// dump($forms);
			$form = $forms[0];
			$scholar = query("select * from scholars where scholar_id = ?", $form["scholar_id"]);
			
			// dump($scholar);

		
			render("public/renewal_system/scholar_renewal_details.php",[
				"form" => $form,
				"scholar" => $scholar,
			]);
		}
	}
?>
