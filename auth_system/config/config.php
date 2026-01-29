<?php
// Configuration de la base de données
define('DB_HOST', 'localhost');
define('DB_USER', 'auth-user');
define('DB_PASS', 'AuthP@ss2026!');
define('DB_NAME', 'auth_db');

// Chemins
define('APP_ROOT', dirname(__DIR__));
define('URL_ROOT', 'https://192.168.1.10/auth_system/public');

// Clé de chiffrement (pour les tokens)
define('APP_KEY', bin2hex(random_bytes(32)));

// Paramètres de sécurité
define('SESSION_TIMEOUT', 1800); // 30 minutes
