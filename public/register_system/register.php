<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {	
		// dump($_POST);
        $rows = query("SELECT * FROM users WHERE username = ?", $_POST["email_address"]);
        if (count($rows) == 1)
        {
            $row = $rows[0];
			if($row["status"] == "fill_otp"){
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Success",
					"link" => "otp?id=".$row["user_id"],
					];
					echo json_encode($res_arr); exit();
			}
			else{
				$res_arr = [
					"result" => "failed",
					"title" => "Success",
					"message" => "This user has been already registered! Please login",
					// "link" => "otp?id=".$row["user_id"],
					];
					echo json_encode($res_arr); exit();
			}
		}
		else {
			$user_id = create_uuid("USR");

            $this_otp = generate_otp();
			if (query("insert INTO users 
            (user_id, username, password, role, fullname, status, otp) 
            VALUES(?,?,?,?,?,?,?)", 
            $user_id, $_POST["email_address"], crypt('!1234#', '') , 'APPLICANT',
            $_POST["firstname"] . " " . $_POST["lastname"],
            "fill_otp", $this_otp) === false)
            {
                $res_arr = [
                    "result" => "failed",
                    "title" => "Failed",
                    "message" => "Failed on saving deduction table",
                    "link" => "loans_management?action=list",
                    ];
                    echo json_encode($res_arr); exit();
            }

            $sy = query("select * from school_year where applicant_status = 'active'");
            $sy = $sy[0];

        if (query("insert INTO scholars 
                (scholar_id, firstname, middlename, lastname, birthdate, current_status,school_year_id) 
            VALUES(?,?,?,?,?,'APPLICANT',?)", 
            $user_id, $_POST["firstname"], $_POST["middlename"] , $_POST["lastname"],
            $_POST["birthdate"], $sy["school_year_id"]) === false)
            {
                $res_arr = [
                    "result" => "failed",
                    "title" => "Failed",
                    "message" => "Failed on saving deduction table",
                    "link" => "loans_management?action=list",
                    ];
                    echo json_encode($res_arr); exit();
            }


            $site_options = query("select * from site_options");
            $google_user = $site_options[0]["google_user"];
			$google_password = $site_options[0]["google_password"];
			$mail = new PHPMailer();

			$full_name = $_POST["firstname"] . " " . $_POST["lastname"];
			$the_message = "Dear Mr./Ms. " . $full_name . ",<br><br>";
            $the_message = "
            You are receiving this email as part of the Mariphil Scholarship Information System. 
            To verify your identity and access your scholarship account, please use the following one-time password (OTP):<br><br>
            OTP: ".$this_otp." <br><br>

            Please do not share this OTP with anyone for security reasons. If you didn't request this OTP, please ignore this email.
            <br><br>Thank you for using the Mariphil Scholarship Information System.
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
				$mail->Subject = "OTP Request";
				$mail->Body = $message;
				$mail->AddAddress($_POST["email_address"]);
				$mail->Send();



                $res_arr = [
                    "result" => "success",
                    "title" => "Success",
                    "message" => "Success",
                    "link" => "otp?id=".$user_id,
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





		}  
    }
    else
    {
	
        renderview("public/register_system/register_form.php", ["title" => "Log In"]);
    }
?>