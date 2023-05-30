<?php


	if(!isset($_SESSION["mariphil"])) {
		redirect("role");
	}
	
	// log out current user, if any
	logout();
	
	// redirect user
	redirect("role");

?>
