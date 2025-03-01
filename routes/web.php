<?php

use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/api/auth/google', [AuthController::class, 'redirectToGoogle']);

Route::get('/api/auth/google/callback', [AuthController::class, 'handleGoogleCallback']);




