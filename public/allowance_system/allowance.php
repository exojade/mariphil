<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {



		if($_POST["action"] == "claimAllowance"):
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


		



	




		if($_POST["action"] == "addAllowance"){
			// dump($_POST);

			$year_level = query("select * from year_level");
			$YearLevel = [];
			foreach($year_level as $row):
				$YearLevel[$row["level_id"]] = $row;
			endforeach;
		
			$allowance = create_uuid("AA");
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

	


		if($_GET["action"] == "printForm"){


	
			renderview("public/forms_system/printQuarterlyForm.php",[
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
