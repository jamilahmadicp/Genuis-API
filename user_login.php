<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "geniusdb";

$con = new mysqli($servername, $username, $password, $dbname);

if($con->connect_error)
{
    // echo $con->connect_error;
    die(False);
}


// Receive and decode JSON data
$data = $_POST["login_data"];
$dec_data = json_decode($data);

$uname = $dec_data->uname;
$password = $dec_data->password;

// Check to see if user exists
$sql = "select * from users where uname='$uname' and password='$password'";
$result = $con->query($sql);
if($result->num_rows>0)
{
    echo 1;  //User exists with the provided credentials
}
else
{
    echo 0;  //User does not exist or incorrect credentials
}

 $con->close();
?>