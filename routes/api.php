<?php

use Illuminate\Http\Request;
use App\Http\Controllers\CouturierController;
use App\Http\Controllers\AtelierController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\CoutureController;


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
//********************* COUTURIER */ 
// middleware('auth:api')->

//Route::middleware('auth:api')->group(function(){

    Route::get("couturiers", 'CouturierController@index');
    Route::post("couturiers", 'CouturierController@store');
    Route::get("couturiers/{id}", 'CouturierController@show');
    Route::post('couturiers/{id}', 'CouturierController@update');
    Route::delete("couturiers/{id}", 'CouturierController@destroy');

    //********************* ATELIER */
    Route::get('ateliers', 'AtelierController@index');
    Route::post('ateliers', 'AtelierController@store');  //->middleware('auth:api');
    Route::get('ateliers/{id}', 'AtelierController@show');
    Route::post('ateliers/{id}', 'AtelierController@update');
    Route::delete('ateliers/{id}', 'AtelierController@destroy');

    //********************* CLIENT */
    Route::get('clients', 'ClientController@index');
    Route::post('clients', 'ClientController@store');
    Route::get('clients/{id}', 'ClientController@show');
    Route::get('atelier-clients/{id}', 'ClientController@clientByCouturier');
    Route::post('clients/{id}', 'ClientController@update');
    Route::delete('clients/{id}', 'ClientController@destroy');

    //********************* MESURE */
    Route::get('mesures', 'MesureController@index');
    Route::post('mesures', 'MesureController@store');
    Route::get('mesures/{id}', 'MesureController@show');
    Route::put('mesures/{id}', 'MesureController@update');
    Route::delete('mesures/{id}', 'MesureController@destroy');

    //********************* COUTURE */
    Route::get('coutures', 'CoutureController@index');
    Route::post('coutures', 'CoutureController@store');
    Route::get('coutures/{id}', 'CoutureController@show');
    Route::post('coutures/{id}', 'CoutureController@update');
    Route::delete('coutures/{id}', 'CoutureController@destroy');

    //********************* LIAISON */
    Route::get('couture-texture', 'LiaisonController@index');
    Route::post('couture-texture', 'LiaisonController@store');
    Route::get('couture-texture/{id}', 'LiaisonController@show');
    Route::put('couture-texture/{id}', 'LiaisonController@update');
    Route::delete('couture-texture/{id}', 'LiaisonController@destroy');

    //********************* MODELE */
    Route::get('modeles', 'ModeleController@index');
    Route::post('modeles', 'ModeleController@store');
    Route::get('modeles/{id}', 'ModeleController@show');
    Route::post('modeles/{id}', 'ModeleController@update');
    Route::delete('modeles/{id}', 'ModeleController@destroy');

    //********************* PAIEMENT */
    Route::get('paiements', 'PaiementController@index');
    Route::post('paiements', 'PaiementController@store');
    Route::get('paiements/{id}', 'PaiementController@show');
    Route::put('paiements/{id}', 'PaiementController@update');
    Route::delete('paiements/{id}', 'PaiementController@destroy');

    //********************* RENDEZ-VOUS */
    Route::get('rendez-vous', 'Rendez_vouController@index');
    Route::post('rendez-vous', 'Rendez_vouController@store');
    Route::get('rendez-vous/{id}', 'Rendez_vouController@show');
    Route::post('rendez-vous/{id}', 'Rendez_vouController@update');
    Route::delete('rendez-vous/{id}', 'Rendez_vouController@destroy');

    //********************* TEXTURE */
    Route::get('textures', 'TextureController@index');
    Route::post('textures', 'TextureController@store');
    Route::get('textures/{id}', 'TextureController@show');
    Route::post('textures/{id}', 'TextureController@update');
    Route::delete('textures/{id}', 'TextureController@destroy');
//});


// Routing for user
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return response()->json($request->user());
});
Route::prefix('/users')->group(function(){
    // Manage users
    Route::get('/', 'UserController@index');
    Route::post('/', 'UserController@store');
    Route::get('/{id}', 'UserController@show');
    Route::put('/{id}', 'UserController@update')->middleware('auth:api');
    Route::delete('/{id}', 'UserController@destroy')->middleware('auth:api');

    // Connexion    
    Route::post('/login', 'api\v1\AuthentificationController@authenticate')->name('getlogin');
    Route::get('/logout', 'api\v1\AuthentificationController@logout')->name('logout');
});
Route::get('/login', 'api\v1\AuthentificationController@authenticateMessage')->name('login');
