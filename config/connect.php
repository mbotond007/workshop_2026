<?php
$connection=new mysqli("localhost", "root", "", "workshop25");

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$connection->query("set names utf8");
?>