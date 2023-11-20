<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "addUser"){

			// dump($_FILES);
			$fullname = $_POST["username"];
			$fullname = str_replace(' ', '_', $fullname);
			$target_pdf = "uploads/users/";

			if($_FILES["profile_image"]["size"] != 0){
				
				$path_parts = pathinfo($_FILES["profile_image"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "fullname" . "." . $extension;
				
                    if(!move_uploaded_file($_FILES['profile_image']['tmp_name'], $target)){
                        echo("FAMILY Do not have upload files");
                        exit();
                    }
			
			}


			$user_id = create_uuid("USR");
			if (query("insert INTO users (user_id, username, password, role, 
						fullname,status, gender,address) 
			  VALUES(?,?,?,?,?,?,?,?)", 
				$user_id, $_POST["username"], crypt('!1234#',''), $_POST["role"], strtoupper($_POST["fullname"]),
				"active",$_POST["gender"], $_POST["address"],) === false)
				{
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "User already Registered",
						"link" => "users?action=users_list",
						];
						echo json_encode($res_arr); exit();
				}

			query("update users set profile_image = '".$target."'
				where user_id = '".$user_id."'");	

		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Success",
			"link" => "users?action=users_list",
			];
			echo json_encode($res_arr); exit();

			
		}

		else if($_POST["action"] == "updateUSer"){
			// dump($_POST);


			$fullname = $_POST["fullname"];
			$fullname = str_replace(' ', '_', $fullname);
			$target_pdf = "uploads/users/";

			if($_FILES["profile_image"]["size"] != 0){
				$path_parts = pathinfo($_FILES["profile_image"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target_pdf . "fullname" . "." . $extension;
                    if(!move_uploaded_file($_FILES['profile_image']['tmp_name'], $target)){
                        echo("FAMILY Do not have upload files");
                        exit();
                    }
			}

			query("update users set profile_image = '".$target."', username = '".$_POST["username"]."',
					role = '".$_POST["role"]."', fullname = '".$_POST["fullname"]."',gender = '".$_POST["gender"]."'
				where user_id = '".$_POST["user_id"]."'");	

		$res_arr = [
			"result" => "success",
			"title" => "Success",
			"message" => "Success",
			"link" => "refresh",
			];
			echo json_encode($res_arr); exit();
		}
		
    }
	else {


		if($_GET["action"] == "users_list"){
			$users = query("select * from users");
			render("public/users_system/users_list.php",[
				"users" => $users,
			]);
		}
	}
?>
