<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources([
    'user' => 'API\UserController',
    'ship' => 'API\ShipController',
    'auth' => 'API\AuthController',
]);

Route::get('profile', 'API\UserController@profile');
Route::get('findUser', 'API\UserController@search');
Route::put('profile', 'API\UserController@updateProfile');

Route::post('login', 'API\AuthController@login');
Route::post('register', 'API\AuthController@register');
Route::group(['middleware' => 'auth:api'], function () {
    Route::get('details', 'API\AuthController@details');

    Route::resource('ships', 'API\ShipController');
    Route::get('findShips', 'API\ShipController@search');

    Route::resource('destinations', 'API\DestinationController');
    Route::get('findDestinations', 'API\DestinationController@search');

    Route::resource('schedules', 'API\ScheduleController');
    Route::get('findSchedules', 'API\ScheduleController@search');

    Route::resource('counters', 'API\CounterController');
    Route::get('findCounters', 'API\CounterController@search');

    Route::resource('branches', 'API\BranchController');
    Route::get('findBranches', 'API\BranchController@search');

    Route::resource('branchSchedules', 'API\BranchSchedulesController');
    Route::get('branchSchedules/getShip/{id}', 'API\BranchSchedulesController@showByShip');

    Route::resource('seat_categories', 'API\SeatCategoryController');
    Route::resource('seats', 'API\SeatController');
    // Route::resource('tickets', 'API\TicketController');
    // Route::resource('seat_tickets', 'API\SeatTicketController');
    Route::resource('layouts', 'API\LayoutController');
});