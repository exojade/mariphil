<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {

		if($_POST["action"] == "inbox-datatable"):
			
			$draw = isset($_POST["draw"]) ? $_POST["draw"] : 1;
			$offset = $_POST["start"];
			$limit = $_POST["length"];
			$search = $_POST["search"]["value"];

			$search = isset($_POST["search"]["value"]) ? $_POST["search"]["value"] : '';
$searchSubject = isset($_POST["subject"]) ? $_POST["subject"] : '';

			$Users = [];
			$users = query("select * from users");
			foreach($users as $row):
				$Users[$row["user_id"]] = $row;
			endforeach;
			

			$where = " where receipient_id = '".$_SESSION["mariphil"]["userid"]."'";
			$data = query("SELECT r.*, e.*
			FROM email_receipients r
			LEFT JOIN email e ON e.email_id = r.email_id
			INNER JOIN (
				SELECT thread_id, MAX(email.timestamp) AS latest_timestamp
				FROM email_thread
				LEFT JOIN email ON email_thread.email_id = email.email_id
				GROUP BY thread_id
			) latest_email ON e.email_id = latest_email.email_id AND e.timestamp = latest_email.latest_timestamp
			" . $where . "
			ORDER BY latest_timestamp DESC");
			$all_data = $data;

			if($search == ""){
			$query_string = "SELECT r.*, e.*
			FROM email_receipients r
			LEFT JOIN email e ON e.email_id = r.email_id
			INNER JOIN (
				SELECT thread_id, MAX(email.timestamp) AS latest_timestamp
				FROM email_thread
				LEFT JOIN email ON email_thread.email_id = email.email_id
				GROUP BY thread_id
			) latest_email ON e.email_id = latest_email.email_id AND e.timestamp = latest_email.latest_timestamp
			" . $where . "
			ORDER BY latest_timestamp DESC
							limit ".$limit." offset ".$offset." ";
			$data = query($query_string);
			}
			else{
			$query_string = "
			SELECT r.*, e.*
    FROM email_receipients r
    LEFT JOIN email e ON e.email_id = r.email_id
    INNER JOIN (
        SELECT thread_id, MAX(email.timestamp) AS latest_timestamp
        FROM email_thread
        LEFT JOIN email ON email_thread.email_id = email.email_id
        GROUP BY thread_id
    ) latest_email ON e.email_id = latest_email.email_id AND e.timestamp = latest_email.latest_timestamp
    " . $where . "
    AND (e.subject LIKE '%" . $searchSubject . "%' OR e.message LIKE '%" . $search . "%')
    ORDER BY latest_timestamp DESC
			limit ".$limit." offset ".$offset."
			";
			$data = query($query_string);
			$query_string = "
			SELECT r.*, e.*
			FROM email_receipients r
			LEFT JOIN email e ON e.email_id = r.email_id
			INNER JOIN (
				SELECT thread_id, MAX(email.timestamp) AS latest_timestamp
				FROM email_thread
				LEFT JOIN email ON email_thread.email_id = email.email_id
				GROUP BY thread_id
			) latest_email ON e.email_id = latest_email.email_id AND e.timestamp = latest_email.latest_timestamp
			" . $where . "
			AND (e.subject LIKE '%" . $searchSubject . "%' OR e.message LIKE '%" . $search . "%')
			ORDER BY latest_timestamp DESC
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

		if($_GET["action"] == "read_message"){
			query("update email_receipients set isread = 'read' where email_id = ? and receipient_id = ?",
						$_POST["id"], $_SESSION["mariphil"]["userid"]);
			$mail = query("select * from email_receipients r left join 
							email e
							on e.email_id = r.email_id where receipient_id = ? order by timestamp desc");

			render("public/email_system/inbox.php",[
				"inbox" => $inbox,
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
