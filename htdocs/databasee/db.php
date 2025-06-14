<?php
$servername = "localhost";
$dbname = "webdevlab";
$username = "root";
$password = ""; // Update with your MySQL password

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
