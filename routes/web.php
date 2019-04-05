<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('type', function(){
    if(Gate::allows('isAdmin')){
        return "You are allowed type";
    }else{
        return "not allowed error";
    }
});

Route::get('/home', 'HomeController@index')->name('home');

Route::get('{path}', "HomeController@index")->where( 'path', '([A-z\d-/+\/_.]+)?' );
