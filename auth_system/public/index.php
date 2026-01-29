<?php
require_once 'init.php';

// Redirect to login if not authenticated
if (!Auth::check()) {
    header('Location: login.php');
    exit;
}

// Redirect to homepage if authenticated
header('Location: home.php');
exit;
