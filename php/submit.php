<?php
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];

    $sql = "INSERT INTO users (username, email) VALUES ('$username', '$email')";

    if ($conn->query($sql) === TRUE) {
        echo "Новий запис доданий успішно";
    } else {
        echo "Помилка: " . $sql . "<br>" . $conn->error;
    }
}
?>