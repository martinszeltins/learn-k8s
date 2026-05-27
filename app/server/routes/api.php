<?php

use Illuminate\Support\Facades\Route;

Route::get('/user', function () {
    return response()->json([
        'id' => 1,
        'username' => 'Test User',
        'email' => 'test@example.com',
    ]);
});
