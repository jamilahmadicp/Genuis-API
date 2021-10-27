<?php
$servername = "localhost";
$username = "id17794283_jamil";
$password = "AcerPredator1@";
$dbname = "id17794283_geniusdb";

$con = new mysqli($servername, $username, $password, $dbname);

if($con->connect_error)
{
    // echo $con->connect_error;
    //die(False);
    echo json_encode(array("success"=>False));
}


// Receive and decode JSON data
//$data = $_POST["user_data"];
//$dec_data = json_decode($data);

$uname = $_POST["uname"];
$user_name = $_POST["user_name"];
$password = $_POST["password"];
$gender = $_POST["gender"];
$grade = $_POST["grade"];
$role = $_POST["role"];
$institute = $_POST["institute"];
$contact = $_POST["contact"];


$sql = "insert into users(uname, user_name, password, gender, grade, role, institute, contact) values('$uname', '$user_name', '$password', '$gender', '$grade', '$role', '$institute', '$contact')";

if($con->query($sql)==TRUE)
{
    echo json_encode(array("success"=>True));
}
else
{
    echo json_encode(array("success"=>False));
}

 $con->close();
?>
