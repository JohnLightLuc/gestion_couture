<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Atelier;
use App\Couturier;

class AtelierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ateliers= Atelier::all();

        if ($ateliers) {
            return response()->json(['status'=>TRUE, 'atelier'=>$ateliers]);
        }else{
            return response()->json(['status'=>FALSE, 'atelier'=>[]]);
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
        // ****** Validation des données ******* //
        $validatedata = $request->validate([
            'nom'=>'required|string',
            'ville'=>'required|string',
            'adresse'=>'required|string',
            'email'=>'required|string',
            'couturier_id'=>'required|integer'
        ]);
        
        // ****** verification de l'existance du couturier ******* //
        $couturierId = $request->get('couturier_id');
        $couturier = Couturier::find($couturierId);
        
        if ($couturier){
            $existcouturier = Atelier::where('couturier_id', $couturierId);
    
            if ($existcouturier->count() == 0){
                $atelier =Atelier::create($validatedata);
            }else{
                return response()->json(['status'=>FALSE, "message"=>"Désolé, ce couturier appartient deja à un atelier !"]);
            }
        }else{
            return response()->json(['status'=>FALSE, "message"=>"Désolé, ce couturier n'est pas actuellement disponible dans la base de donnée !"]);
        }
        
        // ****** Veification de l'enregistrement de l'atelier ******* //
        if ($atelier) {
            return response()->json(['status'=>TRUE, 'atelier'=>$atelier]);
        }else{
            return response()->json(['status'=>FALSE, 'atelier'=>[]]);
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
        $atelier = Atelier::find($id);

        if ($atelier) {
            return response()->json(['status'=>TRUE, 'atelier'=>$atelier]);
        }else{
            return response()->json(['status'=>FALSE, 'atelier'=>[]]);
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
        print_r($request->all());
        $atelier = Atelier::find($id);
        $atelier->update($request->all());

        if ($atelier) {
            return response()->json(['status'=>TRUE, 'atelier'=>$atelier]);
        }else{
            return response()->json(['status'=>FALSE, 'atelier'=>[]]);
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
        $atelier = Atelier::destroy($id);
        
        if ($atelier) {
            return response()->json(['status'=>TRUE, 'message'=>'Atelier has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Atelier not fund !']);
        }
    }
}
