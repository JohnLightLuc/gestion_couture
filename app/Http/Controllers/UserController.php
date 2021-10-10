<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();

        if ($users) {
            return response()->json(['status'=>TRUE, 'users'=>$users]);
        }else{
            return response()->json(['status'=>FALSE, 'users'=>[]]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(request(), [
            'nom' => 'required',
            'prenom' => 'required',
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = User::create([
            'nom'=>$request->get('nom'),
            'prenom'=>$request->get('prenom'),
            'email'=>$request->get('email'), 
            'password'=>Hash::make($request->get('password')),
        ]);

        if ($user) {
            return response()->json(['status'=>TRUE, 'user'=>$user]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Problème d'enregistrement de l'utilisateur"]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $couturier = $user->couturier;
        $atelier = $couturier->atelier;
        $clients = $atelier->clients;
        //$coutures = $clients->coutures;
        if ($user) {
            return response()->json(['status'=>TRUE, 'user'=>$user]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Aucun utilisateur trouvé"]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->update($request->all());
        
        if ($user) {
            return response()->json(['status'=>TRUE, 'user'=>$user]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Aucun utilisateur trouvé"]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);
        
        if ($user) {
            $user->delete();
            return response()->json(['status'=>TRUE, 'message'=>"Utilisateur supprimé avec succès."]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Utilisateur non trouvé!"]);
        }
    }
}
