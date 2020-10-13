<?php


// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

include_once "include/koneksi.php";
 
$data = $_POST['data'];
$sql = stripslashes($_POST['sql']).$data."%'";

$sql_query = mysqli_query($conn,$sql);
$data = array();
if($sql_query){
	while($baris = mysqli_fetch_array($sql_query)){
		array_push($data,$baris);
		}
	}
	echo json_encode($data);
?>
