<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {	
		// dump($_POST);
        if($_POST["action"] == "entered_otp"):
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
                    "link" => "role",
                    ];
                    echo json_encode($res_arr); exit();

                


            }

        elseif($_POST["action"] == "resend_otp"):

            $otp = query("select * from users where user_id = ?", $_POST["user_id"]);
            // dump($otp);
            $otp = $otp[0];


            $ch = curl_init();
            $parameters = array(
                'otp' => $otp["otp"], //Your API KEY
                'username' => $otp["username"],
                'fullname' => $otp["fullname"],
                'user_id' => $_POST["user_id"],
            );
            curl_setopt( $ch, CURLOPT_URL,'http://api.panabocity.gov.ph/mail_action' );
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