<?php

function dbconnection() {
    $con = mysqli_connect("localhost","root","","flutter_image_project");
    return $con;
}

?>