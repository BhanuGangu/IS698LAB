<?php
$name = $_POST['name'];
$gender = $_POST['gender'];
$email = $_POST['email'];
$phone = $_POST['phone'];

$mysqli = new mysqli('database-1.cz2sgk6emz49.us-east-2.rds.amazonaws.com', 'capstoneuser', 'Bhanu123', 'capstone');
if ($mysqli->connect_errno) {
    die('Failed to connect to MySQL: ' . $mysqli->connect_error);
}

$query = "INSERT INTO customers (name, gender, email, phone) VALUES ('$name', '$gender', '$email', '$phone')";
if (!$result = $mysqli->query($query)) {
    die('Error executing query: ' . $mysqli->error);
}

$mysqli->close();


include 'thankyou.html';

?>