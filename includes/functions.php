<?php


    require_once("constants.php");

    function start_mail($sender, $subject, $message, $receipients, $threadbool){
            $queryFormat = '("%s","%s","%s")';
            $thread_id = create_uuid("THREAD");
            $email_id = create_uuid("MAIL");
            if (query("insert INTO email (
                email_id, sender_id, subject,
                message, timestamp,threadbool)
                VALUES(?,?,?,?,?,?)", 
                    $email_id, $sender, $subject,$message,time(),$threadbool) === false)
                    {
                        $res_arr = [
                            "result" => "failed",
                            "title" => "Failed",
                            "message" => "Form Done",
                            "link" => "refresh",
                            ];
                            echo json_encode($res_arr); exit();
                    }
            foreach($receipients as $row):
                $inserts[] = sprintf( $queryFormat, $email_id, $row,"unread");
            endforeach;
            $query = implode( ",", $inserts );
            query('insert into email_receipients(email_id, receipient_id, isread) VALUES '.$query);
            if (query("insert INTO email_thread (
                email_id, thread_id)
                VALUES(?,?)", 
                    $email_id, $thread_id) === false)
                    {
                        $res_arr = [
                            "result" => "failed",
                            "title" => "Failed",
                            "message" => "Form Done",
                            "link" => "refresh",
                            ];
                            echo json_encode($res_arr); exit();
                    }
    }
    function reply_mail($sender, $subject, $message, $receipients,$thread_id){

    }


    function formatTimestamp($timestamp) {
        $currentTime = time();
        $timeDifference = $currentTime - $timestamp;
    
        if ($timeDifference < 60) {
            return $timeDifference . " seconds ago";
        } elseif ($timeDifference < 3600) {
            $minutes = floor($timeDifference / 60);
            return $minutes . " minute" . ($minutes > 1 ? "s" : "") . " ago";
        } elseif ($timeDifference < 86400) {
            $hours = floor($timeDifference / 3600);
            return $hours . " hour" . ($hours > 1 ? "s" : "") . " ago";
        } elseif ($timeDifference < 2592000) { // 30 days
            $days = floor($timeDifference / 86400);
            return $days . " day" . ($days > 1 ? "s" : "") . " ago";
        } else {
            return date("F j, Y", $timestamp);
        }
    }
    

    function generate_otp($length = 10) {
        $characters = '23456789ABCDEFGHJKLMNPQRSTUVWXYZ'; // Excluding O, 0, 1, l, I
        $charLength = strlen($characters);
        $randomString = '';
    
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charLength - 1)];
        }
    
        return $randomString;
    }
    


     function to_peso($number){
        if($number != ""){
            return(number_format($number, 2, '.', ','));
        }
        else
        return($number);
    }

    function add_log($activity, $user){

        $log_id = create_uuid("LOG");
        $ip = getIPAddress(); 
        $date = date("Y-m-d G:i:s a");

        if (query("insert INTO tbl_logs (logs_id, action, logs_date, user_id, ip_address, timestamp) 
                    VALUES(?,?,?,?,?,?)", 
                $log_id, $activity, $date, $user, $ip, time()) === false)
				{
					dump("Sorry, that username has already been taken!");
                }
        ;

      
    }

    function getIPAddress() {  
        if(!empty($_SERVER['HTTP_CLIENT_IP'])) {  
                   $ip = $_SERVER['HTTP_CLIENT_IP'];  
           }  
       elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {  
                   $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];  
        }  
       else{  
                $ip = $_SERVER['REMOTE_ADDR'];  
        }  
        return $ip;  
   } 

    function dump($variable)
    {
        require("dump.php");
        exit;
    }
	
	function dumper($variable)
    {
        require("../../templates/dump.php");
        exit;
    }
	
	function utf8ize($d) {
    if (is_array($d)) {
        foreach ($d as $k => $v) {
            $d[$k] = utf8ize($v);
        }
    } else if (is_string ($d)) {
        return utf8_encode($d);
    }
    return $d;
	}

    /**
     * Executes SQL statement, possibly with parameters, returning
     * an array of all rows in result set or false on (non-fatal) error.
     */
    function query(/* $sql [, ... ] */)
    {
        // SQL statement
        $sql = func_get_arg(0);

        // parameters, if any
        $parameters = array_slice(func_get_args(), 1);

        // try to connect to database
        static $handle;
        if (!isset($handle))
        {
            try
            {
                // connect to database
                $handle = new PDO("mysql:dbname=" . DATABASE . ";host=" . SERVER, USERNAME, PASSWORD);
				// $handle->exec("set names utf8");
				// $handle->exec("set character_set_results='utf8'");
				// $handle->exec("set collation_connection='utf8'");
				// $handle->exec("set character_set_client='utf8'");
                // ensure that PDO::prepare returns false when passed invalid SQL
                $handle->setAttribute(PDO::ATTR_EMULATE_PREPARES, false); 
            }
            catch (Exception $e)
            {
                // trigger (big, orange) error
                trigger_error($e->getMessage(), E_USER_ERROR);
                exit;
            }
        }

        // prepare SQL statement
        $statement = $handle->prepare($sql);
        if ($statement === false)
        {
            // trigger (big, orange) error
            trigger_error($handle->errorInfo()[2], E_USER_ERROR);
            exit;
        }

        // execute SQL statement
        $results = $statement->execute($parameters);

        // return result set's rows, if any
        if ($results !== false)
        {
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        }
        else
        {
            return false;
        }
    }

    function the_base_url(){
        $protocol = isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] === "on" ? "https" : "http";
			$host = $_SERVER["HTTP_HOST"];
			$base_url = $protocol . "://" . $host;
            return $base_url;
    }

    function query_etracs(/* $sql [, ... ] */)
        {
            // SQL statement
            $sql = func_get_arg(0);
    
            // parameters, if any
            $parameters = array_slice(func_get_args(), 1);
    
            // try to connect to database
            static $handle;
            if (!isset($handle))
            {
                try
                {
                    // connect to database
                    $handle = new PDO("mysql:dbname=" . DATABASE_ETRACS . ";host=" . SERVER_ETRACS, USERNAME_ETRACS, PASSWORD_ETRACS);
                    $handle->exec("set names utf8");
                    $handle->exec("set character_set_results='utf8'");
                    $handle->exec("set collation_connection='utf8'");
                    $handle->exec("set character_set_client='utf8'");
                    // ensure that PDO::prepare returns false when passed invalid SQL
                    $handle->setAttribute(PDO::ATTR_EMULATE_PREPARES, false); 
                }
                catch (Exception $e)
                {
                    // trigger (big, orange) error
                    trigger_error($e->getMessage(), E_USER_ERROR);
                    exit;
                }
            }
    
            // prepare SQL statement
            $statement = $handle->prepare($sql);
            if ($statement === false)
            {
                // trigger (big, orange) error
                trigger_error($handle->errorInfo()[2], E_USER_ERROR);
                exit;
            }
    
            // execute SQL statement
            $results = $statement->execute($parameters);
    
            // return result set's rows, if any
            if ($results !== false)
            {
                return $statement->fetchAll(PDO::FETCH_ASSOC);
            }
            else
            {
                return false;
            }
        }


    

    function logout()
    {
        // unset any session variables
        $_SESSION["mariphil"] = [];

        // expire cookie
        if (!empty($_COOKIE[session_name()]))
        {
            setcookie(session_name(), "", time() - 42000);
        }

        // destroy session
        //session_destroy();
		unset($_SESSION["mariphil"]);
    }

    /**
     * Redirects user to destination, which can be
     * a URL or a relative path on the local host.
     *
     * Because this function outputs an HTTP header, it
     * must be called before caller outputs any HTML.
     * 
     * 
     * 
     */

    function strips($data) {
  	  $data = trim($data);
  	  $data = stripslashes($data);
  	  $data = htmlspecialchars($data);
      if(empty($data)) {
        return null;
      }
      else {
        return $data;
      }
  	}



    function redirect($destination)
    {
		
		
		
        // handle URL
        if (preg_match("/^https?:\/\//", $destination))
        {
            header("Location: " . $destination);
			
			
        }

        // handle absolute path
        else if (preg_match("/^\//", $destination))
        {
            $protocol = (isset($_SERVER["HTTPS"])) ? "https" : "http";
            $host = $_SERVER["HTTP_HOST"];
            header("Location: $protocol://$host$destination");
			
        }

        // handle relative path
        else
        {
            // adapted from http://www.php.net/header
            $protocol = (isset($_SERVER["HTTPS"])) ? "https" : "http";
            $host = $_SERVER["HTTP_HOST"];
            $path = rtrim(dirname($_SERVER["PHP_SELF"]), "/\\");
            header("Location: $protocol://$host$path/$destination");
			
			
        }
		
        // exit immediately since we're redirecting anyway
        exit;
    }

    /**
     * Renders template, passing in values.
     */
    function render($template, $values = [])
    {
		
        // if template exists, render it
        // if (file_exists("$template"))
        // {   // {   // {
            // extract variables into local scope
            extract($values);
            // render header
            require("layouts/header.php");
			
			// render sidebar
            require("layouts/sidebar.php");

            // render template
            require("$template");
        // }

        // else err
        // else
        // {
            // trigger_error("Invalid template: $template", E_USER_ERROR);
        // }
    }

    function renderview($template, $values = []) {
        extract($values);
        require("$template");
        
    }
	
	function check_input($data) {
	  $data = trim($data);
	  $data = stripslashes($data);
	  $data = htmlspecialchars($data);
	  return $data;
	}
	
	
	function super_unique($array,$key)
	{
		$temp_array = array();
		foreach ($array as &$v) {
		if (!isset($temp_array[$v[$key]]))
		$temp_array[$v[$key]] =& $v;
			}
		$array = array_values($temp_array);
		return $array;
	}
	
	header('content-type:text/html;charset=utf-8');
	
	


?>
