<?php
session_start();

if (!isset($_SESSION['id_account'])) {
    header("Location: ../index.php");
    exit();
}

// Get the video file from the URL parameter or set a default
$video_file = isset($_GET['file']) ? $_GET['file'] : 'video1.mp4';

// Extract the film name from the file name (remove file extension and replace underscores with spaces)
$film_name = ucwords(str_replace('_', ' ', pathinfo($video_file, PATHINFO_FILENAME)));
?>

<!DOCTYPE html>
<html>
<head>
    <title>Homeflix Video Player</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #141414;
            color: #fff;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            text-align: center;
        }
        .container {
            margin-top: 50px;
        }
        video {
            width: 100%;
            max-width: 800px;
            border-radius: 8px;
        }
        .back-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Now Playing: <?php echo htmlspecialchars($film_name); ?></h1>
        <video controls>
            <source src="/video/video1.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div>
            <a href="../dashboard.php" class="btn btn-danger back-btn">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
