<?php

include("dbconnection.php");
$con = dbconnection();

if (isset($_POST['name'])) {
    $name = $_POST["name"];
} else {
    return;
}

if (isset($_POST['email'])) {
    $email = $_POST["email"];
} else {
    return;
}

if (isset($_POST['password'])) {
    $password = $_POST["password"];
} else {
    return;
}



$query = "INSERT INTO `user_table`(`name`, `email`, `password`) VALUES ('$name', '$email', '$password')";

$execute = mysqli_query($con, $query);

$arr = [];

if ($execute) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'false';
}

print(json_encode($arr));


?>