<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

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




		if($_POST["action"] == "addForm"){
			// dump($_POST);
			$form_id = create_uuid("FORM");
			if (query("insert INTO forms (
						form_id, form_type, 
						date_created, time_created, timestamp,
						year,month,created_by)
			  VALUES(?,?,?,?,?,?,?,?)", 
				$form_id, $_POST["form_type"], date("Y-m-d"), date("H:i:s"), time(),
				$_POST["year"], $_POST["month"], $_SESSION["mariphil"]["userid"]) === false)
				{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "User already Registered",
						"link" => "users?action=users_list",
						];
						echo json_encode($res_arr); exit();
				}

				$scholars = query("select * from scholars where current_status = 'SCHOLAR'
				and responsible = ?", $_SESSION["mariphil"]["userid"]);
				foreach($scholars as $s):
					$renewal_id = create_uuid("REN");
					if (query("insert INTO renewal (
						renewal_id, form_id, 
						scholar_id, status)
						VALUES(?,?,?,?)", 
							$renewal_id, $form_id, 
							$s["scholar_id"], "FOR CHECKING") === false)
							{
								$res_arr = [
									"result" => "failed",
									"title" => "Failed",
									"message" => "User already Registered",
									"link" => "users?action=users_list",
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
			$forms = query("select * from forms where created_by = ?", $_SESSION["mariphil"]["userid"]);
			render("public/forms_system/forms_list.php",[
				"forms" => $forms,
			]);
		}

		if($_GET["action"] == "details"){
			$forms = query("select * from forms where form_id = ?", $_GET["id"]);
			if($forms[0]["form_type"] == "RENEWAL"){
				$docs = query("select * from renewal r
							left join scholars s
							on s.scholar_id = r.scholar_id
							where form_id = ? 
				", $_GET["id"]);
			}

			$forms = $forms[0];
			render("public/forms_system/forms_details.php",[
				"forms" => $forms,
				"docs" => $docs,
			]);
		}
	}
?>
