<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Form</title>
    <link rel="stylesheet" href="./css/main.min.css">
</head>

<body>
    <form id="userForm" action="./php/submit.php" method="POST">
        <input type="text" id="username" required name="username" placeholder="Юзернейм">
        <input type="email" id="email" required name="email" placeholder="Email">
        <button type="submit">Відправити</button>
    </form>

    <form id="searchForm" action="./php/search.php" method="GET">
        <input type="text" id="search" name="search" placeholder="Пошук">
        <button type="submit">Пошук</button>
    </form>

    <script src="./js/main.js"></script>
</body>

</html>