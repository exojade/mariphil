<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {



		if($_POST["action"] == "change_sy"):
			// dump($_POST);
			query("update school_year set current_status = 'inactive', applicant_status = 'inactive'");
			query("update school_year set current_status = 'active' where school_year_id = ?", $_POST["current_sy"]);
			query("update school_year set applicant_status = 'active' where school_year_id = ?", $_POST["applicant_sy"]);


			

			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();

		elseif($_POST["action"] == "addSY"):
			// dump($_POST);

			$startYear = filter_input(INPUT_POST, 'start_year', FILTER_VALIDATE_INT);
   			$endYear = filter_input(INPUT_POST, 'end_year', FILTER_VALIDATE_INT);
			   if ($startYear === false || $endYear === false) {
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "Invalid year format. Please enter valid 4-digit years.",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			}

			if ($startYear + 1 !== $endYear) {
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "Years should be 1 year apart.",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			}

			if ($startYear > $endYear) {
				// Redirect back to the form with an error message
				$res_arr = [
					"result" => "failed",
					"title" => "Failed",
					"message" => "Start year should not be greater than end year.",
					"link" => "refresh",
					];
					echo json_encode($res_arr); exit();
			}
			$sy_id = create_uuid("SY");

			$school_year = $startYear."-". $endYear;

			if (query("insert INTO school_year (
                school_year_id, school_year, current_status,
                applicant_status)
                VALUES(?,?,?,?)", 
                    $sy_id, $school_year, "inactive","inactive") === false)
                    {
                        $res_arr = [
                            "result" => "failed",
                            "title" => "Failed",
                            "message" => "School Year Added Already!",
                            "link" => "refresh",
                            ];
                            echo json_encode($res_arr); exit();
                    }


					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "School Year Added Done!",
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();

			// $res_arr = [
			// 	"result" => "failed",
			// 	"title" => "Failed",
			// 	"message" => "OK",
			// 	"link" => "refresh",
			// 	];
			// 	echo json_encode($res_arr); exit();





		endif;
		
    }
	else {
		$role = $_SESSION["mariphil"]["role"];
		if($role == "APPLICANT" || $role == "SCHOLAR"){
			$scholar = query("select * from scholars where scholar_id = ?",
				$_SESSION["mariphil"]["userid"]);

			if($scholar[0]["current_status"] != "SCHOLAR"){
				render("public/dashboard_system/dashboard_applicant.php",[]);
			}
			else{
				render("public/dashboard_system/dashboard_scholar.php",[]);
			}
		}
		if($role == "SPONSOR"){
			render("public/dashboard_system/dashboard_sponsor.php",[]);
		}
		if($role == "FACILITATOR"){
			render("public/dashboard_system/dashboard_responsible.php",[]);
		}
		if($role == "VALIDATOR"){
			render("public/dashboard_system/dashboard_validator.php",[]);
		}
		else if($role == "ADMIN"){
			render("public/dashboard_system/dashboard_admin.php",[]);
		}
	}
?>
