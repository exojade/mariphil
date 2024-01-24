<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "datatable"){
		

			$draw = isset($_POST["draw"]) ? $_POST["draw"] : 1;
            $offset = $_POST["start"];
            $limit = $_POST["length"];
            $search = $_POST["search"]["value"];

			$where = " where 1=1";

            if(isset($_REQUEST["role"])):
				if($_REQUEST["role"] != ""):
					$where = $where . " and role = '".$_REQUEST["role"]."'";
				endif;
            endif;

				if($search == ""){
					$query_string = "select * from users
									".$where."
									limit ".$limit." offset ".$offset." ";
					// dump($query_string);
					$data = query($query_string);
					$query_string = "select * from users
									".$where."";
					$allData = query($query_string);
				}
				else{
	
				  $where = $where . "
				  and (fullname like '%".$search."%' or
				  username like '%".$search."%')
				  ";
	
	
					$query_string = "
						select * from users
						".$where."
						limit ".$limit." offset ".$offset."
					";
					// dump($query_string);
					$data = query($query_string);
					$query_string = "
							select * from users
							".$where."
					";
					$allData = query($query_string);
				}

				$i=0;
				foreach($data as $row):

					if($row["status"] == 'active'):
					$data[$i]["action"] = '
						  <form class="generic_form_trigger" data-url="users">
                            <input type="hidden" name="action" value="deactivateUser">
                            <input type="hidden" name="user_id" value="'.$row["user_id"].'">
                            <button type="submit" class="btn btn-danger btn-sm btn-block">Deactivate</button>
                          </form>
					';
					else:
						$data[$i]["action"] = '
						  <form class="generic_form_trigger" data-url="users">
                            <input type="hidden" name="action" value="activateUser">
                            <input type="hidden" name="user_id" value="'.$row["user_id"].'">
                            <button type="submit" class="btn btn-success btn-sm btn-block">Activate</button>
                          </form>
					';
					endif;

					$data[$i]["update"] = '
					<a href="#" title="Update User" data-toggle="modal" data-target="#updateUser'.$row["user_id"].'" class="btn btn-sm btn-block btn-warning">Update</a>
					';
					$i++;
				endforeach;
	   
				$json_data = array(
					"draw" => $draw + 1,
					"iTotalRecords" => count($allData),
					"iTotalDisplayRecords" => count($allData),
					"aaData" => $data
				);
				echo json_encode($json_data);



		}


		else if($_POST["action"] == "addUser"){

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
			$target = "uploads/users/";

			if($_FILES["profile_image"]["size"] != 0){
				$path_parts = pathinfo($_FILES["profile_image"]["name"]);
				$extension = $path_parts['extension'];
				$target = $target . $_POST["user_id"] . "." . $extension;
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



		else if($_POST["action"] == "deactivateUser"){
			$user = query("select * from users where user_id = ?", $_POST["user_id"]);
			$user = $user[0];
			if($user["role"] == "FACILITATOR"):
				$current_sy = query("select * from school_year where current_status = 'active'");
				$current_sy = $current_sy[0];
				$forms = query("select * from forms f
							left join monthly_monitoring mm
							on mm.form_id = f.form_id
							where f.created_by = ?
							and mm.form_status != 'DONE'
							", $_POST["user_id"]);
				// dump($forms);
				if(!empty($forms)):
					$res_arr = [
						"result" => "failed",
						"title" => "Failed",
						"message" => "Cannot deactivate User! Incomplete Quarterly or Renewal Forms for his/her scholars!",
						"link" => "refresh",
						// "link" => "scholars?action=details&id=USR-372f4fceece53-240112",
						];
						echo json_encode($res_arr); exit();
				else:

					query("update scholars set responsible = NULL where
								responsible = ? and school_year_id = ?", $_POST["user_id"], $current_sy["school_year_id"]);

					query("update users set status = 'inactive' where user_id = ?", $_POST["user_id"]);

					// $scholars = query("select * from scholars where responsible = ? and school_year_id = ?", $_POST["user_id"],
					// 					$current_sy["school_year_id"]);
					// dump($scholars);

					$res_arr = [
						"result" => "success",
						"title" => "Success",
						"message" => "Deactivating User Success",
						"link" => "refresh",
						// "link" => "scholars?action=details&id=USR-372f4fceece53-240112",
						];
						echo json_encode($res_arr); exit();


				endif;
			elseif($user["role"] == "SPONSOR"):
				query("update scholars set sponsor_id = NULL where
						sponsor_id = ? and school_year_id = ?", $_POST["user_id"], $current_sy["school_year_id"]);
				query("update users set status = 'inactive' where user_id = ?", $_POST["user_id"]);

				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Deactivating User Success",
					"link" => "refresh",
					// "link" => "scholars?action=details&id=USR-372f4fceece53-240112",
					];
					echo json_encode($res_arr); exit();
			else:
				query("update users set status = 'inactive' where user_id = ?", $_POST["user_id"]);
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Deactivating User Success",
					"link" => "refresh",
					// "link" => "scholars?action=details&id=USR-372f4fceece53-240112",
					];
					echo json_encode($res_arr); exit();
			endif;
			// dump($user);
		}

		else if($_POST["action"] == "activateUser"){
			// dump($_POST);

			query("update users set status = 'active' where user_id = ?", $_POST["user_id"]);
				$res_arr = [
					"result" => "success",
					"title" => "Success",
					"message" => "Activating User Success",
					"link" => "refresh",
					// "link" => "scholars?action=details&id=USR-372f4fceece53-240112",
					];
					echo json_encode($res_arr); exit();
	
		}
    }


	
	else {


		if($_GET["action"] == "users_list"){
			$users = query("select * from users order by role ASC");
			render("public/users_system/users_list.php",[
				"users" => $users,
			]);
		}
	}
?>
