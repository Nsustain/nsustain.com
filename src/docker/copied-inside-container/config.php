<?php return array (
  'debug' => DEBUG,
  'database' => 
  array (
    'driver' => 'mysql',
    'host' => 'DB_HOST',
    'port' => DB_PORT,
    'database' => 'DB_NAME',
    'username' => 'DB_USER',
    'password' => 'DB_PASS',
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix' => 'DB_PREF',
    'strict' => false,
    'engine' => 'InnoDB',
    'prefix_indexes' => true,
  ),
  'url' => 'FORUM_URL',
  'paths' => 
  array (
    'api' => 'api',
    'admin' => 'admin',
  ),
  'headers' => 
  array (
    'poweredByHeader' => true,
    'referrerPolicy' => 'same-origin',
  ),
);