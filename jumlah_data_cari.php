<?php

// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

include_once "include/koneksi.php";

// untuk update data
$tabel = isset($_REQUEST['tabel']) ? $_REQUEST['tabel'] : '';
$sql = urlDecode($_REQUEST['sql']);	
$sql = stripslashes($sql); // hapus tanda /
$sql_exe = mysqli_query($conn,$sql);
if($sql_exe){
	echo mysqli_num_rows($sql_exe);	
}
?>
