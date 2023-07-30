<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
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
    }
    else
    {
	
        renderview("public/login_system/loginform.php", ["title" => "Log In"]);
    }
?>