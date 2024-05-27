<?php include './php/db_connection.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $score = 0;

        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $correct_answers_query = "SELECT id, correct_answer FROM questions";
        $correct_answers_result = mysqli_query($conn, $correct_answers_query);
        $correct_answers = [];

        if (!$correct_answers_result) {
            die("Error: " . mysqli_error($conn));
        }

        while ($row = mysqli_fetch_assoc($correct_answers_result)) {
            $correct_answers[$row['id']] = $row['correct_answer'];
        }

        if (!empty($_POST['answer'])) {
            foreach ($_POST['answer'] as $question_id => $user_answer) {
                if (isset($correct_answers[$question_id]) && !empty($user_answer) && $user_answer == 1) {
                    $score++;
                }
            }
        } else {
            echo "<p>Не отримано відповідей.</p>";
        }

        echo "<h2>Ваш результат: $score</h2>";

        echo "<h3>Правильні відповіді:</h3>";
        foreach ($correct_answers as $question_id => $correct_answer) {
            echo "<p>Питання $question_id: $correct_answer</p>";
        }
    }
    ?>
</body>

</html>