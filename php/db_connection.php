<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "practice4";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Немає підключення: " . $conn->connect_error);
}
?>