<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

Route::get('/', function () {
    return view('welcome');
});

// Route resource for products (covers index, create, store, etc.)
Route::resource('/products', ProductController::class);
?>