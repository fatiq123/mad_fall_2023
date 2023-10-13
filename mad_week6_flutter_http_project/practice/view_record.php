<?php

include("dbconnection.php");
$con = dbconnection();


$query = "SELECT `id`, `name`, `email`, `password` FROM `user_table`";
$exe = mysqli_query($con, $query);

$arr = [];

while ($row = mysqli_fetch_array($exe)) {
    $arr[] = $row;
}

print(json_encode($arr));

?>