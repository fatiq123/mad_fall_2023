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


$query = "UPDATE `user_table` SET `name`='$name',`password`='$password' WHERE `email`='$email'";
$exe = mysqli_query($con, $query);

$arr = [];

if ($exe) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'false';
}

print(json_encode($arr));

?>