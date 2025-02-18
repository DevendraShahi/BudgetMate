<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TransactionController;
use Illuminate\Support\Facades\Auth;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Route for new user/register
Route::post('/register', [AuthController::class, 'register']);

// For test
Route::get('/login', [AuthController::class, 'loginPage']);

// Route for user to login to app
Route::post('/login', [AuthController::class, 'login'])->name('login');

// Sanctum middleware which will allow to use following route only if token are matched
Route::middleware(['auth:sanctum'])->group(function () {

    // for test
    Route::get('/test', function (Request $request) { // Your test route
        dd($request->user(), Auth::user()); // Debugging!
        return response(['user' => $request->user(), 'auth_user' => Auth::user()]);
    });

    // Route to load all the transactions in the transactions page
    Route::get('/transactions/read', [TransactionController::class, 'readTransaction']);

    // Route to create new transaction
    Route::post('/transactions/create', [TransactionController::class,'createTransaction']);

    // Route to delete the transaction
    Route::post('transactions/delete/{id}', [TransactionController::class, 'deleteTransaction']);
});

