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
$data = $_POST["user_data"];
$dec_data = json_decode($data);

$uname = $dec_data->uname;
$user_name = $dec_data->user_name;
$password = $dec_data->password;
$gender = $dec_data->gender;
$grade = $dec_data->grade;
$role = $dec_data->role;
$institute = $dec_data->institute;
$contact = $dec_data->contact;


$sql = "insert into users(uname, user_name, password, gender, grade, role, institute, contact) values('$uname', '$user_name', '$password', '$gender', '$grade', '$role', '$institute', '$contact')";

if($con->query($sql)==TRUE)
{
    echo True;
}
else
{
    echo "error: ". $sql." <br>". $con->error;
}

 $con->close();
?>