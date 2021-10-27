<?php
$servername = "localhost";
$username = "id17794283_jamil";
$password = "AcerPredator1@";
$dbname = "id17794283_geniusdb";

$con = new mysqli($servername, $username, $password, $dbname);

if($con->connect_error)
{
    // echo $con->connect_error;
    // die(False);
    echo json_encode(array("success"=>False));
}


// Receive and decode JSON data

$uname = $_POST["uname"];
$password = $_POST["password"];

// Check to see if user exists
$sql = "select * from users where uname='$uname' and password='$password'";
$result = $con->query($sql);
if($result->num_rows>0)
{
    echo json_encode(array("success"=>True));  //User exists with the provided credentials
}
else
{
    echo json_encode(array("success"=>False));  //User does not exist or incorrect credentials
}

 $con->close();
?>
