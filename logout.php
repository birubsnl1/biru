<?php
/**
 * BR SQUARE CLASSES - Logout Script
 * file: logout.php
 */

// 1. Start the session to gain access to it
session_start();

// 2. Unset all session variables
$_SESSION = array();

// 3. If it's desired to kill the session, also delete the session cookie.
// This completely resets the browser's connection to the session.
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// 4. Finally, destroy the session on the server
session_destroy();

// 5. Redirect to the login page or index page with a logout message
header("Location: login.php?msg=logged_out");
exit();
?>