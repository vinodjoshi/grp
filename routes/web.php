<?php

use App\Http\Controllers\Api\OptionController;
use App\Http\Controllers\IndexController;
use Illuminate\Support\Facades\Route;

Route::get('/', [IndexController::class, 'index']);

// API routes for select options
Route::prefix('api/options')->group(function () {
    Route::get('/capital-bands', [OptionController::class, 'capitalBands']);
    Route::get('/time-availabilities', [OptionController::class, 'timeAvailabilities']);
    Route::get('/skills', [OptionController::class, 'skills']);
    Route::get('/risk-tolerances', [OptionController::class, 'riskTolerances']);
    Route::get('/all', [OptionController::class, 'all']);
});
