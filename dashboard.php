<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class ="card">
        <header>
            <h1>YouChef</h1>
        </header>
        <div class="welcome">
            <h3>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h3>
            <p>You're now logged in to your account.</p>
            <?php include 'main.php'; ?>
            <?php include 'nav.php'; ?>
            <?php include 'footer.php'; ?>
        </div>
    </div>
</body>
</html>
