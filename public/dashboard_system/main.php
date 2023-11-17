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
