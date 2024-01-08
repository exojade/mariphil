<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
		if($_POST["action"] == "forgot_password"):
			// dump($_POST);


			$users = query("select * from users where username = ?", $_POST["username"]);
			if(!empty($users)):

				$password = generate_otp();
				query("update users set password = ?, temp_password = 'YES' where username = ?", crypt($password, ''),$_POST["username"]);
				$site_options = query("select * from site_options");
				$google_user = $site_options[0]["google_user"];
				$google_password = $site_options[0]["google_password"];
				$mail = new PHPMailer();
	
				$the_message = "Dear Mr./Ms. " . $users[0]["fullname"] . ",<br><br>";
				$the_message = "
				You are receiving this email as part of the Mariphil Scholarship Information System. <br>
				This is your username: ".$users[0]["username"]." <br>
				This is your temporary password: ".$password."
			
				<br><br>
				Best regards,
				admin@mariphil.com (no-reply) System Generated
				";
				$message = "<html>
					<body>
						".$the_message."
					</body>
				</html>";
				// dump($message);
	
				try {
					$mail->isSMTP();
					$mail->SMTPAuth = true;
					$mail->SMTPSecure = "ssl";
					$mail->Host = "smtp.gmail.com";
					$mail->Port = "465";
					$mail->isHTML();
					$mail->Username = $google_user;
					$mail->Password = $google_password;
					$mail->SetFrom("no-reply@mariphil.com");
					$mail->Subject = "Forgot Password";
					$mail->Body = $message;
					$mail->AddAddress($users[0]["username"]);
					$mail->Send();
					$mail->SMTPDebug = 2; // Enables SMTP debug information
					$mail->Debugoutput = 'html'; // HTML output for debugging
	
					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "The temporary password is sent to your email! Kindly view and enter to the login box",
						"link" => "logout",
						];
						echo json_encode($res_arr); exit();
				  } catch (phpmailerException $e) {
					
					$res_arr = [
						"result" => "failed",
						"title" => "Failed Mail",
						"message" => $e->errorMessage(),
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();	
					
				  } catch (Exception $e) {
					$res_arr = [
						"result" => "failed",
						"title" => "Failed Mail",
						"message" => $e->getMessage(),
						"link" => "refresh",
						];
						echo json_encode($res_arr); exit();	
				  }
				else:
					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "The temporary password is sent to your email! Kindly view and enter to the login box",
						"link" => "logout",
						];
						echo json_encode($res_arr); exit();

			endif;

           






		else:
		// dump($_POST);
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