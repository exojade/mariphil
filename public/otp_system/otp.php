<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {	
		// dump($_POST);
        if($_POST["action"] == "entered_otp"){
            $user = query("select * from users where user_id = ?", $_POST["user_id"]);
            $user = $user[0];
            if($user["otp"] != $_POST["otp"]){
                $res_arr = [
					"result" => "failed",
					"title" => "Success",
					"message" => "Wrong OTP",
					// "link" => "otp?id=".$row["user_id"],
					];
					echo json_encode($res_arr); exit();
            }
            else{
                query("update users set otp = '', status = 'active' where user_id = ?", $_POST["user_id"]);
                $res_arr = [
                    "result" => "success",
                    "title" => "Success",
                    "message" => "Success",
                    "link" => "login",
                    ];
                    echo json_encode($res_arr); exit();

                


            }
        }
    }
    else
    {
        $user = query("select * from users where user_id = ?", $_GET["id"]);
        $user = $user[0];
        // dump($user);
        renderview("public/otp_system/otp_form.php", 
        ["user" => $user]);
    }
?>