<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Credentials: true');

Route::get('/', 'ProductController@show');
Route::get('/produto/referencias', 'ProductController@getReferencesProduct');
Route::get('/produtos/all', 'ProductController@getAll');
Route::post('/produto/salvar', 'ProductController@save');
Route::post('/produto/{id}/estoque', 'ProductController@atualizarEstoque');
Route::delete('/produto/{id}', 'ProductController@delete');
Route::get('/produto/{id}', 'ProductController@getProduct');
