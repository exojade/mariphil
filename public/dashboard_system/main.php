<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		
    }
	else {
		$role = $_SESSION["mariphil"]["role"];
		if($role == "APPLICANT"){
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
		else if($role == "admin"){
			render("public/dashboard_system/dashboard_admin.php",[]);
		}
	}
?>
