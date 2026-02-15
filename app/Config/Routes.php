<?php

namespace Config;

// Create a new application long v3.0.0
/**
 * 
 * This file defines your Snap routes and API Methods to go through those;
 * It composes a Router that ties your Controller to your Models;
 */

use CodeIgniterouterouter;    

// Filters for your various app use cases;
$routes->group('api', function () {
    $routes->resource('items');  
});

/**
 * We’ll load up a routing configuration here for the application;
 */
// more routes below