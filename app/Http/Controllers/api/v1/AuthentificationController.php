<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\User;

class AuthentificationController extends Controller
{
    // Inscription des utilisateurs
    public function inscription(Request $request){
        // Validation des informations
        $login = $request->validate([
            'email'=>['required', 'email'],
            'password' => ['required'],
        ]);

        //Auth::loginUsingId(1)

        // Tante de connecter l'utilisateur, en cas d'erreur, renvoie un message 
        if (! (Auth::attempt($login))){
            return response()->json([
                'status'=>FALSE,
                'message'=>"Les informations d'identification fournies ne correspondent pas !"]);
        }
        print_r(Auth::user());
        // Si connexion reussie, renvoie l'utlisateur et le token generée
        $accessToken = Auth::user()->createToken('authToken')->accessToken;
        return response()->json([
            'status'=>TRUE, 
            'user'=>Auth::user(), 
            'access_token'=>$accessToken
        ]);
    }

    public function authenticate(Request $request){
        // Validation des informations
        $login = $request->validate([
            'email'=>['required', 'email'],
            'password' => ['required'],
        ]);

        //Auth::loginUsingId(1)

        // Tante de connecter l'utilisateur, en cas d'erreur, renvoie un message 
        if (! (Auth::attempt($login))){
            return response()->json([
                'status'=>FALSE,
                'message'=>"Email et/ou mot de pas incorrectent!"]);
        }

        // Si connexion reussie, renvoie l'utlisateur et le token generée
        $accessToken = Auth::user()->createToken('authToken')->accessToken;
        
        return response()->json([
            'status'=>TRUE, 
            'user'=>Auth::user(), 
            'access_token'=>$accessToken
        ]);
    }

    // Message de demande de connexion  
    public function authenticateMessage(Request $request){
        return response()->json([
            'status'=> FALSE, 
            'message'=> "Veuillez d'abord vous connecter svp!"
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json([
            'status'=> TRUE, 
            'message'=> "Déconnexion effectuée avec succes."
        ]);
    }
}
