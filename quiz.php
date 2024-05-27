<?php include './php/db_connection.php'; ?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/quiz.min.css">
    <title>Quiz</title>
</head>

<body>
    <form class="form" id="quizForm" action="./quiz_result.php" method="POST">
        <div class="form-content">
            <?php
            if (!$conn) {
                die("Connection failed: " . mysqli_connect_error());
            }

            $questions_query = "SELECT * FROM questions";
            $questions_result = mysqli_query($conn, $questions_query);

            if (!$questions_result) {
                die("Error: " . mysqli_error($conn));
            }

            while ($question_row = mysqli_fetch_assoc($questions_result)) {
                echo "<div class='form-block'><h3>" . $question_row['question'] . "</h3>";

                $answers_query = "SELECT * FROM answers WHERE question_id = " . $question_row['id'];
                $answers_result = mysqli_query($conn, $answers_query);

                if (!$answers_result) {
                    die("Error: " . mysqli_error($conn));
                }

                while ($answer_row = mysqli_fetch_assoc($answers_result)) {
                    echo "<label>";
                    echo "<input type='radio' name='answer[" . $question_row['id'] . "]' value='" . $answer_row['answer_value'] . "'>";
                    echo $answer_row['answer'];
                    echo "</label>";
                }

                echo "</div>";
            }
            ?>
        </div>
        <button type="submit" id="submitQuiz">Надіслати</button>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const radioGroups = document.querySelectorAll('form-block');
            const submitButton = document.getElementById('submitQuiz');

            function updateButtonState() {
                const allChecked = Array.from(radioGroups).every(group => {
                    return Array.from(group.querySelectorAll('input[type="radio"]')).some(radio => radio.checked);
                });
                submitButton.disabled = !allChecked;
            }

            radioGroups.forEach(group => {
                group.querySelectorAll('input[type="radio"]').forEach(radioButton => {
                    radioButton.addEventListener('change', updateButtonState);
                });
            });

            updateButtonState();
        });
    </script>
</body>

</html>