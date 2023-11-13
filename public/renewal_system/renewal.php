<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {


		if($_POST["action"] == "returnForm"):
			// dump($_POST);
			$comment = query("select * from renewal where renewal_id = ?", $_POST["renewal_id"]);
			
			$message_comment = $_POST["remarks"] . "<br><br>" . $comment[0]["return_comments"];
			// dump($message_comment);
			query("update renewal set form_status = 'RETURNED', return_comments = ? where renewal_id = ?", $message_comment, $_POST["renewal_id"]);
			
			
			$rform = query("select * from renewal where renewal_id = ?", $_POST["renewal_id"]);
			$rform = $rform[0];
			$form = query("select * from renewal_form where form_id = ?", $rform["form_id"]);
			$form = $form[0];
			$message = "Request for Renewal has been returned to you. Visit the link to view the return comments.";
			$message = $message . "
			<br><br>
			Link: <a href='renewal?action=scholar_details&id=".$_POST["renewal_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			
			";

			$receipient = [];
			$receipient[] = $rform["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "RETURNED RENEWAL FORM", $message,$receipient,"NO");
			
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();

		endif;

		if($_POST["action"] == "approveForm"):
			
			$renewal = query("select * from renewal where renewal_id = ?", $_POST["renewal_id"]);
			$form = query("select * from renewal_form where form_id = ?", $renewal[0]["form_id"]);
			

			$renewal = $renewal[0];
			$form = $form[0];
			// dump($renewal);
			query("update scholars set school_year_id = ?, school_name = ?, year_level = ?, year_type = ?, course = ?, year_level_id = ?
					where scholar_id = ?",$form["for_school_year_id"],$renewal["school_name"],$renewal["year_level"],$renewal["year_type"],
					$renewal["course"],$renewal["year_level_id"],$renewal["scholar_id"]
				);
				

		if (query("insert INTO scholar_status (
			scholar_id, school_year_id, school_name, year_level, year_type, course)
		  VALUES(?,?,?,?,?,?)", 
		  	$renewal["scholar_id"], $form["for_school_year_id"], $renewal["school_name"], $renewal["year_level"], $renewal["year_type"], $renewal["course"]) === false)
			{
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "This Type of Form has been already created!",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			}




			query("update renewal set form_status = 'DONE' where renewal_id = ?", $_POST["renewal_id"]);





			$qform = query("select * from renewal where renewal_id = ?", $_POST["renewal_id"]);
			$qform = $qform[0];
			$form = query("select * from renewal_form where form_id = ?", $qform["form_id"]);
			$form = $form[0];
			$message = "Your request for Renewal has been approved! Congratulations on your renewal!";
			$message = $message . "
			<br><br>
			Link: <a href='renewal?action=scholar_details&id=".$_POST["renewal_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			";
			$receipient = [];
			$receipient[] = $qform["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "REVIEW APPROVED", $message,$receipient,"NO");


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
			// dump($_POST);
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
			query("update renewal set form_status = 'FOR CHECKING' where renewal_id = ?", $_POST["tbl_id"]);


			$rform = query("select * from renewal where renewal_id = ?", $_POST["tbl_id"]);
			$rform = $rform[0];
			$form = query("select * from renewal_form where form_id = ?", $rform["form_id"]);
			$form = $form[0];
			$message = "Done Submitted Renewal Form";
			$message = $message . "
			<br><br>
			Link: <a href='renewal?action=scholar_details&id=".$_POST["tbl_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			
			";

			$receipient = [];
			$receipient[] = $form["facilitator"];
			start_mail($_SESSION["mariphil"]["userid"], "RENEWWAL FORM SUBMITTED", $message,$receipient,"NO");


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
			$year_level = query("select * from year_level where level_id = ?", $_POST["year_level"]);
			$year_level = $year_level[0];
			query("update renewal set school_name = ?, year_level = ?, year_type= ?, 
			course = ?, year_level_id = ? where renewal_id = ?", $_POST["school_name"], 
			$year_level["year_level"], $year_level["type"], $_POST["course"], $year_level["level_id"], $_POST["form_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Successfully submitted",
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


		



	




		if($_POST["action"] == "addRenewalForm"){
			// dump($_POST);
		

			$queryFormat_email = '("%s","%s","%s","%s","%s","%s","%s")';
			$queryFormat_receipients = '("%s","%s","%s","%s")';
			$queryFormat_thread = '("%s","%s")';

			$inserts_email = [];
			$inserts_receipients = [];
			$inserts_thread = [];

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



							$thread_id = create_uuid("THREAD");
							$email_id = create_uuid("MAIL");

							$message = "
							
							Dear ".$s["firstname"] . " " . $s["lastname"] .",
							<br><br>
							We hope this message finds you well. As a valued member of the Mariphil Scholarship program, we are pleased to inform you that the renewal application portal for the upcoming term is now open.
							<br><br>
							Form Link: <a href='renewal?action=scholar_details&id=".$quarter_id."' class='btn btn-primary btn-xs'>Click Here</a><br>
							Why Renew?
Renewing your scholarship allows you to continue benefiting from the scholarship program and its support for your academic endeavors.
<br><br>
We encourage you to take advantage of this opportunity to secure continued assistance in achieving your educational goals.
<br><br>
Thank you for your dedication to your studies, and we look forward to supporting your ongoing success through the scholarship program.
							Best regards,<br>

							".$_SESSION["mariphil"]["fullname"]."<br>
							Facilitator
							
							";
							
							$inserts_mail[] = sprintf( $queryFormat_email, 
													$email_id, $_SESSION["mariphil"]["userid"],
													"RENEWAL PORTAL",$message, time(), "NO",  $_SESSION["mariphil"]["fullname"]
												);
							$inserts_receipients[] = sprintf( $queryFormat_receipients, 
								$email_id, $s["scholar_id"], "unread", $s["firstname"] . " " . $s["lastname"]
							);

							$inserts_thread[] = sprintf( $queryFormat_thread, 
								$thread_id, $email_id
							);




				endforeach;


				$query = implode( ",", $inserts_mail );
				query('insert into email(email_id, sender_id, subject, message, timestamp, threadbool, sender_name) VALUES '.$query);

				$query = implode( ",", $inserts_receipients );
				query('insert into email_receipients(email_id, receipient_id, isread, receipient_name) VALUES '.$query);

				$query = implode( ",", $inserts_thread );
				query('insert into email_thread(thread_id, email_id) VALUES '.$query);


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
