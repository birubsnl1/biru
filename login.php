<?php
// login.php
session_start();
require_once('config/database.php');

$error = "";

if (isset($_POST['login_btn'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        // 1. Check in Students Table first
        $stmt = $conn->prepare("SELECT id, full_name, password, 'student' as role FROM students WHERE email_id = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        // 2. If not found in students, check in an 'admins' table (or check a specific email)
        if (!$user) {
            $stmt = $conn->prepare("SELECT id, username as full_name, password, 'admin' as role FROM admins WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();
        }

        if ($user && password_verify($password, $user['password'])) {
            // Set Session Variables
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['full_name'];
            $_SESSION['role'] = $user['role'];

            // Redirect based on role
            if ($user['role'] == 'admin') {
                header("Location: admin/index.php");
            } else {
                header("Location: student/index.php");
            }
            exit();
        } else {
            $error = "Invalid Email or Password! / गलत ईमेल या पासवर्ड।";
        }
    } catch (PDOException $e) {
        $error = "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | BR SQUARE CLASSES</title>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
        body { background-color: #f1f5f9; height: 100vh; display: flex; align-items: center; }
        .login-card { border-radius: 15px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 100%; max-width: 400px; margin: auto; }
        .btn-login { background: #d32f2f; color: white; font-weight: bold; border-radius: 8px; padding: 12px; }
        .btn-login:hover { background: #b71c1c; color: white; }
    </style>
</head>
<body>

<div class="container">
    <div class="card login-card p-4">
        <div class="text-center mb-4">
            <h3 class="fw-bold text-danger">BR SQUARE</h3>
            <p class="text-muted small">Login to your Dashboard / डैशबोर्ड लॉगिन</p>
        </div>

        <?php if($error): ?>
            <div class="alert alert-danger small p-2"><?= $error ?></div>
        <?php endif; ?>

        <form method="POST">
            <div class="mb-3">
                <label class="form-label small fw-bold">Email ID / ईमेल</label>
                <input type="email" name="email" class="form-control" placeholder="example@mail.com" required>
            </div>
            <div class="mb-4">
                <label class="form-label small fw-bold">Password / पासवर्ड</label>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>
            <button type="submit" name="login_btn" class="btn btn-login w-100 mb-3">Login / प्रवेश करें</button>
            
            <div class="text-center">
                <span class="small text-muted">Don't have an account?</span>
                <a href="registration/reg.php" class="small text-danger text-decoration-none fw-bold">Register Now</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>