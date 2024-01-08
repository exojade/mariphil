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
			
			$message_comment = $_POST["remarks"] . $comment[0]["return_comments"];
			// dump($message_comment);
			query("update monthly_monitoring set form_status = 'RETURNED', return_comments = ? where tbl_id = ?", $message_comment, $_POST["tbl_id"]);
			
			
			$qform = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			$qform = $qform[0];
			$form = query("select * from forms where form_id = ?", $qform["form_id"]);
			$form = $form[0];
			$message = "Quarterly Report : " . $form["form_kind"] . " has been returned to you. Visit the link to view the return comments.";
			$message = $message . "
			<br><br>
			Link: <a href='forms?action=scholar_details&id=".$_POST["tbl_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			
			";

			$receipient = [];
			$receipient[] = $qform["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "RETURNED QUARTERLY FORM", $message,$receipient,"NO");
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
			
			$qform = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			$qform = $qform[0];
			$form = query("select * from forms where form_id = ?", $qform["form_id"]);
			$form = $form[0];
			$message = "Quarterly Report : " . $form["form_kind"] . " has been reviewed and marked as DONE! Thank you for submitting your quarterly report to us!";
			$message = $message . "
			<br><br>
			Link: <a href='forms?action=scholar_details&id=".$_POST["tbl_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			";
			$receipient = [];
			$receipient[] = $qform["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "QUARTERLY REPORT REVIEW DONE", $message,$receipient,"NO");
			
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

			$statuss = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			$statuss = $statuss[0];

			query("update monthly_monitoring set form_status = 'FOR CHECKING' where tbl_id = ?", $_POST["tbl_id"]);
			$qform = query("select * from monthly_monitoring where tbl_id = ?", $_POST["tbl_id"]);
			$qform = $qform[0];
			$form = query("select * from forms where form_id = ?", $qform["form_id"]);
			$form = $form[0];
			$message = "Done Submitted the Quarterly Monitoring Form: " . $form["form_kind"];
			$message = $message . "
			<br><br>
			Link: <a href='forms?action=scholar_details&id=".$_POST["tbl_id"]."' class='btn btn-primary btn-sm'>Link Here</a>
			<br><br>
			";

			$receipient = [];
			$receipient[] = $form["created_by"];
			if($statuss["form_status"] == "RETURNED"):
				start_mail($_SESSION["mariphil"]["userid"], "QUARTERLY FORM RESUBMITTED", $message,$receipient,"NO");
			else:
				start_mail($_SESSION["mariphil"]["userid"], "QUARTERLY FORM SUBMITTED", $message,$receipient,"NO");
			endif;
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Successfully submitted",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();



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
			

			$defaultConfig = (new Mpdf\Config\ConfigVariables())->getDefaults();
			$fontDirs = $defaultConfig['fontDir'];      
			$defaultFontConfig = (new Mpdf\Config\FontVariables())->getDefaults();
			$fontData = $defaultFontConfig['fontdata'];
			// dump($fontData);
				// $base_url = the_base_url();
				// $options = urlencode(serialize($_POST));
                // $webpath = $base_url . "/mariphil_system/forms?action=printForm&options=".$options;

				$mpdf = new \Mpdf\Mpdf([
					'mode' => 'utf-8',
					'format' => 'FOLIO-P',
					'margin_top' => 15,
					'margin_left' => 5,
					'margin_right' => 5,
					'margin_bottom' => 5,
					'margin_footer' => 1,
					'fontDir' => array_merge($fontDirs, [
						$_SERVER['DOCUMENT_ROOT'] . '/mariphil_system/resources/fonts',
					]),
					'fontdata' => $fontData + [
						'barlow' => [
							'R' => 'Barlow-Regular.ttf',
							'B' => 'Barlow-Bold.ttf',
						],
						
					],
					'default_font' => 'barlow' // Use the font name without the file extension
				]);
			
			
				$mpdf->SetFont('barlow');
				// $font = __DIR__ . '/../../resources/fonts/Barlow-Regular.ttf';
				// dump($font);
				// dump($mpdf->SetFont('Barlow'));

				$html = "";
				
				$html.='

				<style>

			

					hr{
					margin-bottom: 2px;
					margin-top: 2px;
					}

					html *
					{
						font-family: "Times New Roman";
					
					}
					section{
					border: 4px solid black;
					padding:10px;
					height:1600px;
					}
					.tabular, .tabular th, .tabular td {
					border: 1px solid black !important;
					}
					.table td{
						font-size: 11.3px !important;
					}

					.table{
					margin-bottom:1px !important;
					}

					#fordtr{font-size:20px;}
					#fordtr td{padding: 1px !important;}
					#fordtr th{padding: 7px !important;}

					p{
					
					font-size: 150%;
					
					}

					ul li{
					font-size: 150%;
					}

					hr{
					height:2px;border-width:6;color:#254C0B !important;background-color:#254C0B !important;
					border-top: 1px solid #254C0B;
					}
						</style>
				
				';

				$forms = query("select sy.school_year, m.*, f.* from monthly_monitoring m
				left join forms f
				on m.form_id = f.form_id
				left join school_year sy
				on sy.school_year_id = f.school_year_id
				where m.tbl_id = ?
				order by f.timestamp desc", $_POST["tbl_id"]);

				$form = $forms[0];
				$scholar = query("select * from scholars where scholar_id = ?", $form["scholar_id"]);
				$scholar = $scholar[0];

				$faci = query("select * from users where user_id = ?", $form["created_by"]);
				$faci = $faci[0];

				$sponsor = query("select * from users where user_id = ?", $scholar["sponsor_id"]);
				$sponsor = $sponsor[0];
				// dump($scholar);
			
				$form_achievements = query("select * from monthly_monitoring_achievements where tbl_id = ?", $_POST["tbl_id"]);
				$form_uploads = query("select * from monthly_monitoring_upload where tbl_id = ?", $_POST["tbl_id"]);

				$html .='
				<section>


				<table width="100%" style="border-collapse: collapse;">
					<tr>
						<td width="35%" style="vertical-align: top; text-align:right; padding: 5px;">
							<img style="float:right;" src="resources/mariphil.png" width="110">
						</td>
						<td width="50%" style="vertical-align: top; padding: 5px;">
							<h3 style="font-size:300%;line-height:0.7; color:#254C0B;padding-top:15px;"><b>MARIPHIL<br>FOUNDATION</b></h3>
						</td>
					</tr>
				</table>
				<p style="text-align:center;background-color:#254C0B; color:#fff; padding:10px; auto 10px auto;font-weight:700;font-size:180%;"><b>Project MARIPHIL Foundation Inc.</b></p>
				<br>

				<table width="100%" style="border-collapse: collapse;">
        <tr>
            <td width="45%" style="vertical-align: top; padding: 5px;">
			<p><b>SCHOLAR:</b> '.$scholar["firstname"] . ' ' . $scholar["lastname"].'</p> 
			<p><b>FACILITATOR:</b> '.$faci["fullname"].'</p> 
			<p><b>SPONSOR:</b> '.$sponsor["fullname"].'</p> 
            </td>
            <td width="55%" style="vertical-align: top; padding: 5px;">
			<p><b>SCHOOL YEAR:</b> '.$form["school_year"].'</p> 
			<p><b>FORM TYPE:</b> QUARTERLY MONITORING</p> 
			<p><b>QUARTER:</b> '.$form["form_kind"].'</p> 
            </td>
        </tr>
    </table>
			
<br>
<br>

				
<p><b>LATEST GENERAL WEIGHT AVERAGE (GWA):</b> '.$form["grades"].'</p> 
<p><b>AWARDS AND ACHIEVEMENTS:</b></p> 
<ul>';


  foreach($form_achievements as $row):
    $html.='<li>'.$row["achievement"].'</li>';
  endforeach;

  $html.='
              </ul>
<br>
<br>
              <p><b>FACILITATOR REMARKS:</b></p> 
              <p style="margin-left: 20px;">'.$form["remarks"].'</p> 


      <div style="position:absolute; bottom:0; margin-bottom:30px; width: 100%">


	  <table width="100%" style="border-collapse: collapse; position:absolute; bottom:0; margin-bottom:30px; width: 100%">
        <tr>
            <td width="10%" style="vertical-align: top; padding: 5px;">
		
            </td>
            <td width="40%" style="vertical-align: top; padding: 5px;">
			<p style="border-bottom: 4px solid black;text-align:center;">'.$faci["fullname"].'</p>
			<p>FACILITATOR</p>
            </td>
        </tr>
    </table>



			
			</div>
			</section>
				';

				// $html = '<p style="font-weight: bold;">This text is in Arial Bold.</p>';

		


				$filename = "QForm";
				// dump($filename);
				$path = "resources/qforms/".$filename.".pdf";

				
				$mpdf->WriteHTML($html);
				$mpdf->Output($path, \Mpdf\Output\Destination::FILE);
				// $filename = "CASKET_REPORT";
				// $path = "reports/".$filename.".pdf";
			
				// $exec = '"C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" -O portrait  "'.$webpath.'" '.$path.'';
				// dump($exec);
				// exec($exec);
				// $load[] = array('path'=>$path, 'filename' => $filename, 'result' => 'success');
				// $json = array('info' => $load);
				// echo json_encode($json);


		

                // $filename = "QForm";
				// $path = "resources/qforms/".$filename.".pdf";
				// $exec = '"C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" -O portrait --image-dpi 300 "'.$webpath.'" '.$path.'';
				// // dump($webpath);
				// exec($exec);

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

		if($_POST["action"] == "delete_photo"):
			// dump($_POST);
			query("delete from monthly_monitoring_upload where upload_id = ?", $_POST["upload_id"]);
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
			







			$queryFormat_email = '("%s","%s","%s","%s","%s","%s","%s")';
			$queryFormat_receipients = '("%s","%s","%s","%s")';
			$queryFormat_thread = '("%s","%s")';

			$inserts_email = [];
			$inserts_receipients = [];
			$inserts_thread = [];



		
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
				if(empty($scholars)):
					query("delete from forms where form_id = ?", $form_id);
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "NO SCHOLARS ENROLLED IN THIS SCHOOL YEAR",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
				endif;
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

							$thread_id = create_uuid("THREAD");
							$email_id = create_uuid("MAIL");

							$message = "
							
							Dear ".$s["firstname"] . " " . $s["lastname"] .",
							<br><br>
							I hope this message finds you well. As part of our ongoing commitment to your academic success, we kindly request your participation in the Scholarship Quarterly Report. Your insights and feedback are invaluable to us as we aim to provide the best support and resources for your educational journey.
							<br><br>
							Quarterly Report Details:
							<br><br>
							Form Link: <a href='forms?action=scholar_details&id=".$quarter_id."' class='btn btn-primary'>Click Here</a><br>
							Instructions:
							<br><br>
							Complete the form thoughtfully, providing details about your academic progress, challenges faced, and any achievements or milestones.<br>
							Why Your Input Matters:<br>
							<br><br>
							Individual Progress: Your feedback helps us understand your unique experiences and tailor our support accordingly.<br>
							Program Enhancement: Insights from all scholars contribute to the continuous improvement of our scholarship program.<br>
							Important Notes:<br>
							<br><br>
						
							If you encounter any issues or have questions, please reach out to me.
							Thank you for your time and dedication to the scholarship. We appreciate your contribution to the success of the program. Your achievements are important to us, and we look forward to hearing about your progress.
							<br><br>
							Best regards,<br>

							".$_SESSION["mariphil"]["fullname"]."<br>
							Facilitator
							
							";
							
							$inserts_mail[] = sprintf( $queryFormat_email, 
													$email_id, $_SESSION["mariphil"]["userid"],
													"QUARTERLY REPORTS",$message, time(), "NO",  $_SESSION["mariphil"]["fullname"]
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
			$forms = query("select f.*, sy.school_year from forms f
							left join school_year sy
							on sy.school_year_id = f.school_year_id
							where form_id = ?", $_GET["id"]);
			
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
