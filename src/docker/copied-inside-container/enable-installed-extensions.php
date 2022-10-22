<?php

// ----------------------------------------------------------------
// Enable all installed extensions.
// Source:
//   https://github.com/mondediefr/docker-flarum/issues/81#issuecomment-861108120
// ----------------------------------------------------------------

use Illuminate\Database\Capsule\Manager;

require_once 'vendor/autoload.php';

$config = include 'config.php';

$flarumDbPassword = $config['database']['password'] ? " -p{$config['database']['password']}" : '';

$db = new Manager();
$db->addConnection($config['database'], 'flarum');

// get supposed-to-be-enabled extensions
$extList = collect(explode("\n", file_get_contents('extensions/list')))
	->map(function($ext) {
          return str_replace('/', '-', $ext);
	})
	->filter(function ($ext) {
          return $ext != '';
	});

// get all currently enabled extensions and merge with supposed-to-be-enabled
$res = collect(json_decode($db->getConnection('flarum')
    ->table('settings')
    ->where('key', 'extensions_enabled')
    ->first()->value))
    ->merge($extList);

var_dump($res);

// save to database
$db->getConnection('flarum')
    ->table('settings')
    ->where('key', 'extensions_enabled')
    ->update(['value' => $res->values()->toJson(JSON_OBJECT_AS_ARRAY)]);
