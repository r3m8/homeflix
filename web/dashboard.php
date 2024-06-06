<?php
session_start();

if (!isset($_SESSION['id_account'])) {
    header("Location: index.php");
    exit();
}

$db_host = 'db-service';
$db_name = 'homeflix';
$db_user = 'homeflix';
$db_passwd = 'homeflix';

$con = new mysqli($db_host, $db_user, $db_passwd, $db_name);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

$id_account = $_SESSION['id_account'];

// Fetch user profiles
$sql_profiles = "SELECT pseudo, avatar, type FROM profils WHERE id_account = $id_account";
$result_profiles = $con->query($sql_profiles);

// Fetch video files
$sql_videos = "SELECT v.file_name, o.name as object_name, p.name as production_name 
               FROM video_file v 
               JOIN objects o ON v.id_obj = o.id_obj 
               JOIN productions p ON o.id_obj = p.id_obj";
$result_videos = $con->query($sql_videos);

$con->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Homeflix Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #141414;
            color: #fff;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .profile, .video {
            background-color: #333;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .profile img {
            border-radius: 50%;
            margin-right: 15px;
        }
        .profile h5, .video h5 {
            margin: 0;
        }
        .video img {
            border-radius: 8px;
            margin-right: 15px;
        }
        .videos .video {
            margin-bottom: 20px;
            margin-left: 20px;
            margin-right: 20px;
        }
        .logout-btn {
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Welcome to Homeflix, <?php echo $_SESSION['firstname']; ?></h1>
        <a href="logout.php" class="btn btn-danger logout-btn">Logout</a>
        <div class="profiles">
            <h2>Your Profiles</h2>
            <div class="row">
                <?php while($row = $result_profiles->fetch_assoc()): ?>
                    <div class="col-md-4 profile">
                        <div class="d-flex align-items-center">
                            <img src="<?php echo $row['avatar']; ?>" alt="Avatar" width="80" height="80">
                            <div>
                                <h5><?php echo $row['pseudo']; ?></h5>
                                <p>Type: <?php echo ucfirst($row['type']); ?></p>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
        <div class="videos">
            <h2>Available Videos</h2>
            <div class="row">
                <?php 
                $tmdb_api_key = '1ff409db01c4fdfebae3df557c59a924'; // Add your TMDB API key here
                while($row = $result_videos->fetch_assoc()): 
                    $search_query = urlencode($row['object_name']);
                    $api_url = "https://api.themoviedb.org/3/search/movie?api_key=$tmdb_api_key&query=$search_query";
                    $response = file_get_contents($api_url);
                    $response_data = json_decode($response, true);
                    $thumbnail_url = 'placeholder.jpg'; // Default to placeholder
                    if (!empty($response_data['results']) && isset($response_data['results'][0]['poster_path'])) {
                        $thumbnail_url = 'https://image.tmdb.org/t/p/w500' . $response_data['results'][0]['poster_path'];
                    }
                ?>
                    <div class="col-md-3 video">
                        <a href="video/player.php?file=<?php echo urlencode($row['object_name']); ?>" class="d-flex align-items-center">
                            <img src="<?php echo $thumbnail_url; ?>" alt="Video Thumbnail" width="80" height="120">
                            <div>
                                <h5><?php echo $row['object_name']; ?></h5>
                                <p>Production: <?php echo $row['production_name']; ?></p>
                            </div>
                        </a>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</body>
</html>
