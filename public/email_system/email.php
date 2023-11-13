<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "inbox-datatable"):
			
			$draw = isset($_POST["draw"]) ? $_POST["draw"] : 1;
			$offset = $_POST["start"];
			$limit = $_POST["length"];
			$search = $_POST["search"]["value"];

		

			$Users = [];
			$users = query("select * from users");
			foreach($users as $row):
				$Users[$row["user_id"]] = $row;
			endforeach;

			

			$where = " where er.receipient_id = '".$_SESSION["mariphil"]["userid"]."'";
			$string_query = "WITH RankedEmails AS (
				SELECT
					e.*,
					er.receipient_id,
					et.thread_id,
					ROW_NUMBER() OVER (PARTITION BY et.thread_id ORDER BY e.timestamp DESC) AS RowRank
				FROM
					email e
					LEFT JOIN email_receipients er ON e.email_id = er.email_id
					LEFT JOIN email_thread et ON et.email_id = e.email_id
				".$where."
			)
			SELECT
				*
			FROM
				RankedEmails
			WHERE
				RowRank = 1
				ORDER BY TIMESTAMP DESC  
				";
			$data = query($string_query);
			$all_data = $data;
			// dump($string_query);

			if($search == ""){
			$query_string = "WITH RankedEmails AS (
				SELECT
					e.*,
					er.receipient_id,
					et.thread_id,
					er.isread,
					ROW_NUMBER() OVER (PARTITION BY et.thread_id ORDER BY e.timestamp DESC) AS RowRank
				FROM
					email e
					LEFT JOIN email_receipients er ON e.email_id = er.email_id
					LEFT JOIN email_thread et ON et.email_id = e.email_id
				".$where."
			)
			SELECT
				*
			FROM
				RankedEmails
			WHERE
				RowRank = 1
				ORDER BY TIMESTAMP DESC  
				limit ".$limit." offset ".$offset." ";
			// dump($query_string);

			$data = query($query_string);
			}
			else{
			$query_string = "
			WITH RankedEmails AS (
				SELECT
					e.*,
					er.receipient_id,
					et.thread_id,
					er.isread,
					ROW_NUMBER() OVER (PARTITION BY et.thread_id ORDER BY e.timestamp DESC) AS RowRank
				FROM
					email e
					LEFT JOIN email_receipients er ON e.email_id = er.email_id
					LEFT JOIN email_thread et ON et.email_id = e.email_id
				".$where." AND (e.subject LIKE '%" . $search . "%' OR e.message LIKE '%" . $search . "%')
			)
			SELECT
				*
			FROM
				RankedEmails
			WHERE
				RowRank = 1
				ORDER BY TIMESTAMP DESC  
			limit ".$limit." offset ".$offset."
			";
			$data = query($query_string);
			$query_string = "
			WITH RankedEmails AS (
				SELECT
					e.*,
					er.receipient_id,
					et.thread_id,
					er.isread,
					ROW_NUMBER() OVER (PARTITION BY et.thread_id ORDER BY e.timestamp DESC) AS RowRank
				FROM
					email e
					LEFT JOIN email_receipients er ON e.email_id = er.email_id
					LEFT JOIN email_thread et ON et.email_id = e.email_id
				".$where." AND (e.subject LIKE '%" . $search . "%' OR e.message LIKE '%" . $search . "%')
			)
			SELECT
				*
			FROM
				RankedEmails
			WHERE
				RowRank = 1
				ORDER BY TIMESTAMP DESC  
			";
			$all_data = query($query_string);
			}
			$i=0;
			
			foreach($data as $row):
				if($row["isread"] == "unread"):
					$data[$i]["read"] = "🔵";
				else:
					$data[$i]["read"] = "⚪️";
				endif;
				$data[$i]["sender"] = $Users[$row["sender_id"]]["fullname"];
				$data[$i]["date"] = formatTimestamp($row["timestamp"]);
				$data[$i]["excerpt"] = "<b>".$row["subject"]."</b> - " . strip_tags($row["message"]);
				$data[$i]["excerpt"] = mb_strimwidth($data[$i]["excerpt"], 0, 100, '...');
				// $excerpt = strip_tags($row["message"]);
				// $excerpt = mb_strimwidth($excerpt, 0, 100, '...');


				// dump();	
				$i++;
			endforeach;
			$json_data = array(
				"draw" => $draw + 1,
				"iTotalRecords" => count($all_data),
				"iTotalDisplayRecords" => count($all_data),
				"aaData" => $data
			);
			echo json_encode($json_data);
		endif;




		if($_POST["action"] == "sent-datatable"):
			
			$draw = isset($_POST["draw"]) ? $_POST["draw"] : 1;
			$offset = $_POST["start"];
			$limit = $_POST["length"];
			$search = $_POST["search"]["value"];

		

			$Users = [];
			$users = query("select * from users");
			foreach($users as $row):
				$Users[$row["user_id"]] = $row;
			endforeach;

			

			$where = " where e.sender_id = '".$_SESSION["mariphil"]["userid"]."'";
			$string_query = "
				select * from email e
				left join email_receipients er
				on er.email_id = e.email_id ".$where."
				order by timestamp desc
				";
			$data = query($string_query);
			$all_data = $data;
			// dump($string_query);

			if($search == ""){
			$query_string = "

			select * from email e
				left join email_receipients er
				on er.email_id = e.email_id ".$where."
				order by timestamp desc
				limit ".$limit." offset ".$offset." ";
			// dump($query_string);

			$data = query($query_string);
			}
			else{
			$query_string = "

			select * from email e
				left join email_receipients er
				on er.email_id = e.email_id ".$where." and message like '%".$search."%'
				order by timestamp desc

			limit ".$limit." offset ".$offset."
			";
			$data = query($query_string);
			$query_string = "
			select * from email e
				left join email_receipients er
				on er.email_id = e.email_id ".$where." and message like '%".$search."%'
				order by timestamp desc
			";
			$all_data = query($query_string);
			}
			$i=0;
			
			foreach($data as $row):
		
			
				$data[$i]["receipient"] = "To: " .$Users[$row["receipient_id"]]["fullname"];
				$data[$i]["date"] = formatTimestamp($row["timestamp"]);
				$data[$i]["excerpt"] = "<b>".$row["subject"]."</b> - " . strip_tags($row["message"]);
				$data[$i]["excerpt"] = mb_strimwidth($data[$i]["excerpt"], 0, 100, '...');
				// $excerpt = strip_tags($row["message"]);
				// $excerpt = mb_strimwidth($excerpt, 0, 100, '...');


				// dump();	
				$i++;
			endforeach;
			$json_data = array(
				"draw" => $draw + 1,
				"iTotalRecords" => count($all_data),
				"iTotalDisplayRecords" => count($all_data),
				"aaData" => $data
			);
			echo json_encode($json_data);
		endif;

		if($_POST["action"] == "reply"):
			// dump($_POST);
			reply_mail($_POST["sender"], "REPLY SUBJECT", $_POST["message"], $_POST["receipient"], $_POST["thread_id"]);
			$res_arr = [
				"result" => "success",
				"title" => "Success",
				"message" => "Success",
				"link" => "refresh",
				];
				echo json_encode($res_arr); exit();
		endif;

		
    }
	else {


		if($_GET["action"] == "inbox"){

			$inbox = query("select * from email_receipients r left join 
							email e
							on e.email_id = r.email_id where receipient_id = ? order by timestamp desc");

			render("public/email_system/inbox.php",[
				"inbox" => $inbox,
			]);
		}


		if($_GET["action"] == "sent"){


			render("public/email_system/sent.php",[
			]);
		}

		if($_GET["action"] == "read_message"){
			query("update email_receipients set isread = 'read' where email_id = ? and receipient_id = ?",
						$_GET["id"], $_SESSION["mariphil"]["userid"]);
			$thread = query("select * from email_thread where email_id = ?", $_GET["id"]);
			$thread = query("select * from email_thread where thread_id = ?", $thread[0]["thread_id"]);
			$Emails = [];
			foreach($thread as $row):
				$Emails[] = '"' . $row["email_id"] . '"';
			endforeach;
			$inemail = implode(", ", $Emails);
			// dump($inemail);


			$mails = query("select * from email e
							left join email_receipients er
							on er.email_id = e.email_id
							where e.email_id in (" . $inemail . ")
							order by timestamp desc");
			$Users = [];
			$users = query("select * from users");
			foreach($users as $row):
				$Users[$row["user_id"]] = $row;
			endforeach;


			// dump($mails);
			render("public/email_system/read_message.php",[
				"mails" => $mails,
				"Users" => $Users,
				"thread_id" => $thread[0]["thread_id"],
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
