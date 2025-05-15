<?php
// MySQL server configuration
$servername = "database-1.cz2sgk6emz49.us-east-2.rds.amazonaws.com";
$username = "capstoneuser";
$password = "Bhanu123";
$dbname = "capstone";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the username entered by the user
$userInput = $_POST['Name'];

// Prepare the SQL statement to check username validity
$stmt = $conn->prepare("SELECT * FROM capstone.customers WHERE Name = ?");
$stmt->bind_param("s", $userInput);
$stmt->execute();
$result = $stmt->get_result();

// Check if the username exists
if ($result->num_rows > 0) {
    include 'thankyou.html';
} else {
    echo "Username is invalid.";
}

// Close the connection
$conn->close();
?>
