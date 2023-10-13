<?php

include("dbconnection.php");
$con = dbconnection();


if (isset($_POST['caption'])) {
    $caption = $_POST["caption"];
} else {
    return;
}

if (isset($_POST['name'])) {
    $name = $_POST['name'];
} else {
    return;
}

if (isset($_POST['data'])) {
    $data = $_POST['data'];
} else {
    return;
}

$path = "upload/$name";

$query = "INSERT INTO `image`(`caption`, `image_path`) VALUES ('$caption', '$path')";
file_put_contents($path, base64_decode($data));

$arr = [];
$exe = mysqli_query($con, $query);

if ($exe) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'false';
}

print(json_encode($arr));

?>