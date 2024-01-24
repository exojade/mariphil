<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
		if($_POST["action"] == "forgot_password"):
			// dump($_POST);


			$users = query("select * from users where username = ?", $_POST["username"]);
			if(!empty($users)):

			$site_options = query("select * from site_options");
			$google_user = $site_options[0]["google_user"];
			$google_password = $site_options[0]["google_password"];

			$password = generate_otp();
			query("update users set password = ?, temp_password = 'YES' where username = ?", crypt($password, ''),$_POST["username"]);
			
			$the_message = "Dear Mr./Ms. " . $users[0]["fullname"] . ",<br><br>";
			$the_message = "
			You are receiving this email as part of the Mariphil Scholarship Information System. <br>
			This is your username: ".$users[0]["username"]." <br>
			This is your temporary password: ".$password."
		
			<br><br>
			Best regards,
			admin@mariphil.com (no-reply) System Generated
			";

            $ch = curl_init();
            $parameters = array(
                'google_user' => $google_user, //Your API KEY
                'google_password' => $google_password,
                'message' => $the_message,
                'subject' => "FORGOT PASSWORD",
                'SetFrom' => "no-reply@mariphil.com",
                'AddAddress' => $users[0]["username"],
            );
            curl_setopt( $ch, CURLOPT_URL,'http://api.panabocity.gov.ph/avail_schedules' );
            curl_setopt( $ch, CURLOPT_POST, 1 );

            //Send the parameters set above with the request
            curl_setopt( $ch, CURLOPT_POSTFIELDS, http_build_query( $parameters ) );

            // Receive response from server
            curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
            $output = curl_exec( $ch );
            curl_close ($ch);

            //Show the server response
            // echo $output;
            // dump($output);
            echo $output; exit();
			endif;

           






		else:
		// dump($_POST);
		if($_POST["login_type"] == "not_admin" && ($_POST["role"] == "admin" || $_POST["role"] == "ADMIN")):
			echo("wrong_password");
			exit();
		endif;


        $rows = query("select * FROM users WHERE username = ? and status = 'active' and role = ?", $_POST["username"], $_POST["role"]);
        // dump($rows);
		if (count($rows) == 1)
        {
            $row = $rows[0];
			if (crypt($_POST["password"], $row["password"]) == $row["password"]){
				$_SESSION["mariphil"] = [
					"userid" => $row["user_id"],
					"uname" => $row["username"],
					"role" => $row["role"],
					"fullname" => $row["fullname"],
					"profile_image" => $row["profile_image"],
					"temp_password" => $row["temp_password"],
					"application" => "mariphil"
				];

				$activity = $row["fullname"] . " successfully logged in into the system";
				echo("proceed");
            }
			else {
				$activity = $row["fullname"] . " entered " . $_POST["password"];
				echo("wrong_password");
			}
		}
		else {
			echo("wrong_password");
		}  
	endif;
    }
    else
    {
		if(!isset($_GET["action"])):
			renderview("public/login_system/loginform.php", ["title" => "Log In"]);
		endif;

		if(isset($_GET["action"])):
			if($_GET["action"] == "forgot_password"):
				renderview("public/login_system/forgot_password.php", ["title" => "Log In"]);
			endif;
		endif;
	
        
    }
?>