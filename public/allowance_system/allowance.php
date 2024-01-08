<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {



		if($_POST["action"] == "claimAllowance"):
			// dump($_POST);
			$allowance = query("select aas.*,a.*,sy.school_year from allowance_scholar aas 
									left join allowance a
									on a.allowance_id = aas.allowance_id
									left join school_year sy
									on sy.school_year_id = a.school_year_id
									where aas.tbl_id = ?", $_POST["tbl_id"]);
			// dump($allowance);
			$allowance = $allowance[0];

			$fullMonthName = date("F", mktime(0, 0, 0, $allowance["month"], 1, date("Y")));
			query("update allowance_scholar set status = 'CLAIMED', date_claimed = ? where
					tbl_id = ?", $_POST["dateClaimed"], $_POST["tbl_id"]);

			$message = "CLAIMED ALLOWANCE";
			$message = $message . "
			<br><br>
			Your allowance for the month of ".$fullMonthName." this school year: ".$allowance["school_year"]." 
			with an amount of ".to_peso($allowance["amount"])."
			has been recorded as claimed on ".$_POST["dateClaimed"].". <br><br>
			If you did not claim this allowance, you may reply to this email.
			<br><br>
			Regards,<br>
			Mariphil Inc.
			";
			$receipient = [];
			$receipient[] = $allowance["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "CLAIMED ALLOWANCE", $message,$receipient,"NO");





					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;

		if($_POST["action"] == "revertAllowance"):
			// dump($_POST);

			

			$allowance = query("select aas.*,a.*,sy.school_year from allowance_scholar aas 
									left join allowance a
									on a.allowance_id = aas.allowance_id
									left join school_year sy
									on sy.school_year_id = a.school_year_id
									where aas.tbl_id = ?", $_POST["tbl_id"]);
			$allowance = $allowance[0];
			$fullMonthName = date("F", mktime(0, 0, 0, $allowance["month"], 1, date("Y")));

			query("update allowance_scholar set status = 'FOR RELEASE', date_claimed = '', date_returned = '' where
					tbl_id = ?", $_POST["tbl_id"]);

			$message = "REVERT ALLOWANCE";
			$message = $message . "
			<br><br>
			We would like to inform you that the allowance for ".$fullMonthName." for school year: ".$allowance["school_year"]."
			has been reverted in the system. It may cause of system error. If you have concerns, please reply to this email.
			<br><br>
			Regards,<br>
			Mariphil Inc.
			";
			$receipient = [];
			$receipient[] = $allowance["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "REVERT ALLOWANCE", $message,$receipient,"NO");
					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;


		if($_POST["action"] == "returnAllowance"):
			// dump($_POST);
			$allowance = query("select aas.*,a.*,sy.school_year from allowance_scholar aas 
									left join allowance a
									on a.allowance_id = aas.allowance_id
									left join school_year sy
									on sy.school_year_id = a.school_year_id
									where aas.tbl_id = ?", $_POST["tbl_id"]);
		
			// dump($allowance);
			$allowance = $allowance[0];
			$fullMonthName = date("F", mktime(0, 0, 0, $allowance["month"], 1, date("Y")));


			

			query("update allowance_scholar set status = 'RETURNED', date_returned = ? where
					tbl_id = ?", $_POST["dateReturned"], $_POST["tbl_id"]);

			$message = "RETURNED ALLOWANCE";
			$message = $message . "
			<br><br>
			We would like to inform you that your allowance for the month of ".$fullMonthName." for the current school year, amounting to ".to_peso($allowance["amount"]).", has been returned to the designated IN-CHARGE.
			<br><br>
			Regrettably, it appears that you did not claim your allowance and its being returned to the management last ".$_POST["dateReturned"].". If there were any unforeseen circumstances or if you have concerns regarding this matter, we kindly request you to reply to this email at your earliest convenience.
			<br><br>
			Regards,<br>
			Mariphil Inc.
			";
			$receipient = [];
			$receipient[] = $allowance["scholar_id"];
			start_mail($_SESSION["mariphil"]["userid"], "RETURNED ALLOWANCE", $message,$receipient,"NO");
					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Success",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
		endif;
	

		

		if($_POST["action"] == "printAllowance"):
			// dump($_POST);
				// $base_url = the_base_url();
				// $options = urlencode(serialize($_POST));
                // $webpath = $base_url . "/mariphil_system/allowance?action=printAllowance&options=".$options;
              


				



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




				$scholars = query("select aa.*, CONCAT(firstname, ' ', middlename, ' ', lastname) AS fullname from allowance_scholar aa
                  left join scholars s
                  on s.scholar_id = aa.scholar_id
                  where aa.allowance_id = ?", $_POST["allowance_id"]);
				$allowance = query("select aa.*, sy.school_year from allowance aa
									left join school_year sy
									on sy.school_year_id = aa.school_year_id
									where allowance_id = ?", $_POST["allowance_id"]);
				$allowance = $allowance[0];
				$faci = query("select * from users where user_id = ?", $allowance["facilitator"]);
				$faci = $faci[0];

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
					body{
					border: 4px solid black;
					padding:10px;
				
					}
					.tabular, .tabular th, .tabular td {
					border: 2px solid black !important;
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
						<body>
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
			
				<h3 class="text-center" style="font-weight:700;font-size:180%; color:#000;">Allowance Report</h3>
				<h3 class="text-center" style="font-size:180%; color:#000;font-weight:700;">for '.date("F", mktime(0, 0, 0, $allowance["month"], 1)).' '. $allowance["school_year"].'</h3>
				
				
				<table width="100%" class="tabular" style="border: 2px solid black;">
				<thead>
				<tr>
					<td></td>
					<td><b>Scholar\'s Name</b></td>
					<td><b>Status</b></td>
					<td><b>Amount</b></td>
					<td><b>Date CLAIMED / RETURNED</b></td>
				</tr>
				</thead>
				<tbody>
				
				
				
				';
				$i=1; 
				foreach($scholars as $row):
					$html .= '
					<tr>
						<td>'.$i.'</td>
						<td>'.$row["fullname"].'</td>
						<td>'.$row["status"].'</td>
						<td>'.to_peso($row["amount"]).'</td>';
						$date = "";
						if($row["status"] == "CLAIMED"):
						$date  = new DateTime($row["date_claimed"]);
						$date = $date->format("F d, Y");
						elseif($row["status"] == "RETURNED"):
						$date  = new DateTime($row["date_returned"]);
						$date = $date->format("F d, Y");
						endif;
					
						$html.='<td>'.$date.'</td>
					</tr>';
					$i++; endforeach;


					$html.='
				</tbody>
				</table>

				<div style="position:absolute; bottom:0; margin-bottom:30px; width: 100%">
					<p style="border-bottom: 4px solid black;">'.$faci["fullname"].'</p>
					<p>FACILITATOR</p>
			</div>
			</body>
				';


				$filename = "AForm";
				$path = "resources/aForms/".$filename.".pdf";
				$mpdf->WriteHTML($html);
				$mpdf->Output($path, \Mpdf\Output\Destination::FILE);

				




				// $exec = '"C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" -O portrait --image-dpi 300 "'.$webpath.'" '.$path.'';
				// dump($webpath);
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


		



	




		if($_POST["action"] == "addAllowance"){
			// dump($_POST);


			$queryFormat_email = '("%s","%s","%s","%s","%s","%s","%s")';
			$queryFormat_receipients = '("%s","%s","%s","%s")';
			$queryFormat_thread = '("%s","%s")';

			$inserts_email = [];
			$inserts_receipients = [];
			$inserts_thread = [];

			$year_level = query("select * from year_level");
			$YearLevel = [];
			foreach($year_level as $row):
				$YearLevel[$row["level_id"]] = $row;
			endforeach;

			$school_year = query("select * from school_year where school_year_id = ?", $_POST["sy"]);
			$school_year = $school_year[0];

			$timestamp = mktime(0, 0, 0, $_POST["month"], 1, date("Y"));
			$monthName = date("F", $timestamp);
		
			$allowance = create_uuid("AA");

			$scholars = query("select * from scholars where current_status = 'SCHOLAR'
				and responsible = ? and school_year_id = ?", $_POST["facilitator"], $_POST["sy"]);
			if(empty($scholars)):
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "No Scholars Enrolled on this School Year",
					// "link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			endif;


			if (query("insert INTO allowance (
						allowance_id, facilitator, 
						school_year_id, date_created, time_created, timestamp,
						month)
			  VALUES(?,?,?,?,?,?,?)", 
				$allowance, $_POST["facilitator"], $_POST["sy"], date("Y-m-d"), date("H:i:s"),
				time(), $_POST["month"]) === false)
				{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "Allowance for this month has already been created!",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();
				}

				$scholars = query("select * from scholars where current_status = 'SCHOLAR'
				and responsible = ? and school_year_id = ?", $_POST["facilitator"], $_POST["sy"]);
				foreach($scholars as $s):
					// dump($YearLevel[$s["year_level_id"]]);
					$amount = $YearLevel[$s["year_level_id"]]["allowance"];

					if (query("insert INTO allowance_scholar (
						allowance_id, scholar_id, amount,
						date_claimed, status)
						VALUES(?,?,?,?,?)", 
							$allowance, $s["scholar_id"], $amount,"","FOR RELEASE") === false)
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
							You may claim your allowance for school year: ".$school_year["school_year"]." and month: ".$monthName.". 
							<br>Kindly visit the office and sign in order to be released.<br><br> 
							Amount: ".to_peso($amount).". <br><br>
							".$_SESSION["mariphil"]["fullname"]."<br>
							Facilitator
							";
							
							$inserts_mail[] = sprintf( $queryFormat_email, 
													$email_id, $_SESSION["mariphil"]["userid"],
													"ALLOWANCE RELEASE",$message, time(), "NO",  $_SESSION["mariphil"]["fullname"]
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

			$List=[];
			$list = query("SELECT allowance_id, status, COUNT(*) as status_count
			FROM allowance_scholar
			GROUP BY status, allowance_id");
			foreach($list as $row):
				$List[$row["allowance_id"]][$row["status"]] = $row["status_count"];
			endforeach;
			// dump($List);




			// dump($_SESSION);
			$allowance = query("select u.fullname, a.*, sy.school_year from allowance a
								left join school_year sy
								on sy.school_year_id = a.school_year_id
								left join users u 
								on u.user_id = a.facilitator
								where a.facilitator = ?", $_SESSION["mariphil"]["userid"]);

			render("public/allowance_system/allowance_list.php",[
				"allowance" => $allowance,
				"List" => $List,
			]);
		}

	


		if($_GET["action"] == "printAllowance"){


	
			renderview("public/allowance_system/printAllowanceForm.php",[
				// "forms" => $forms,
			]);

			
		}

		if($_GET["action"] == "details"){
			$allowance = query("select u.fullname, a.*, sy.school_year from allowance a
								left join school_year sy
								on sy.school_year_id = a.school_year_id 
								left join users u
								on u.user_id = a.facilitator
								where allowance_id = ?", $_GET["id"]);
			$allowance = $allowance[0];
			// dump($allowance);
			$scholars = query("SELECT a.*, CONCAT(firstname, ' ', middlename, ' ', lastname) AS fullname,
			year_type, year_level, course FROM allowance_scholar a
			LEFT JOIN scholars s
			ON s.scholar_id = a.scholar_id
								where allowance_id = ?
								", $_GET["id"]);
			// dump($scholars);

			render("public/allowance_system/allowance_details.php",[
				"allowance" => $allowance,
				"scholars" => $scholars,
			]);
		}
	}
?>
