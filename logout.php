<?php


	if(!isset($_SESSION["mariphil"])) {
		redirect("login");
	}
	
	// log out current user, if any
	logout();
	
	// redirect user
	redirect("login");

?>
