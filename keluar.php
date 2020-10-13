<?php session_start(); ?>
<html>
<head>
    <title>Homepage</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
 
<body>
    <div id="header">
    </div>
    <?php
    if(isset($_SESSION['valid'])) {            
        include("include/koneksi.php");                    
        $result = mysqli_query($mysqli, "SELECT * FROM login");
    ?>                
        Welcome <?php echo $_SESSION['name'] ?> ! <a href='logout.php'>Logout</a><br/>
        <br/>
        <a href='view.php'>View Products</a>
        
        <br/><br/>
    <?php    
    } else {
        echo "Berhasil Keluar<br/><br/>";
        echo "<br>";
        echo "Ingin Input Data ? Anda harus Login terlebih dahulu  ";
        echo "<a href='login.php'>Login</a>"; 
        echo "<br><br>";
        
    }
    ?>
    <div id="footer">
        Created by Kelompok 1</a>
    </div>
</body>
</html>