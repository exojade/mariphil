<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		
    }
	else {


		if($_GET["action"] == "list"){
			render("public/email_system/email_form.php",[
			]);
		}

		if($_GET["action"] == "new"){
			render("public/email_system/email_new.php",[
			]);
		}

		if($_GET["action"] == "details"){
			render("public/email_system/email_details.php",[
			]);
		}
	}
?>
