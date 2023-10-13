<?php

function dbconnection(){
    $con = mysqli_connect("localhost", "root", "", "practice");
    return $con;
}

?>