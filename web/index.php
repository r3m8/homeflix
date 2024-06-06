<?php
session_start();

$db_host = 'db-service';
$db_name = 'homeflix';
$db_user = 'homeflix';
$db_passwd = 'homeflix';

$con = new mysqli($db_host, $db_user, $db_passwd, $db_name);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT id_account, firstname, lastname FROM accounts WHERE email = '$email' AND password = '$password'";
    $result = $con->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $_SESSION['id_account'] = $row['id_account'];
        $_SESSION['firstname'] = $row['firstname'];
        $_SESSION['lastname'] = $row['lastname'];
        header("Location: dashboard.php");
        exit();
    } else {
        $message = "Invalid email or password.";
    }
}

$con->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Homeflix Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #141414;
            color: #fff;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #333;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container .form-group {
            margin-bottom: 15px;
        }
        .login-container .btn-primary {
            background-color: #e50914;
            border: none;
        }
        .login-container .btn-primary:hover {
            background-color: #f40612;
        }
        .login-container .message {
            color: #e50914;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center">Homeflix</h2>
        <?php if ($message): ?>
            <p class="text-center message"><?php echo $message; ?></p>
        <?php endif; ?>
        <form method="post" action="" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
        </form>
    </div>

    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;

            if (email == "" || password == "") {
                alert("Email and Password must be filled out");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
