<?php


// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

include_once "include/koneksi.php";
$status = 0;
$data = $_REQUEST['data']; 
$nama_id = $_REQUEST['nama_id'];  // nama kolom
$tabel = $_REQUEST['tabel']; 
$sql = "delete from ".$tabel." where ".$nama_id."='".$data."'";
$sql_query = mysqli_query($conn,$sql);
if($sql_query){
	$status = 1;
	}
	echo $status;
?>
