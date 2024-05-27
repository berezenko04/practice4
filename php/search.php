<?php
include 'db_connection.php';

if (isset($_GET['search'])) {
    $search = $_GET['search'];

    $sql = "SELECT * FROM users WHERE username LIKE '%$search%' OR email LIKE '%$search%'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table>";
        echo "<tr><th>ID</th><th>Юзернейм</th><th>Email</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["id"] . "</td><td>" . $row["username"] . "</td><td>" . $row["email"] . "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "Результатів не знайдено";
    }
}