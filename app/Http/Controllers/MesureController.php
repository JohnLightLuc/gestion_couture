<?php

namespace App\Http\Controllers;

use App\Mesure;
use App\Couture;
use Illuminate\Http\Request;

class MesureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mesures = Mesure::all();

        if ($mesures) {
            return response()->json(['status'=>TRUE, 'mesure'=>$mesures]);
        }else{
            return response()->json(['status'=>FALSE, 'mesure'=>[]]);
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
        $validateData = $request->validate([
            "couture_id"=>'required|integer',
            "mesure"=>'required|string',
            "valeur"=>'required',
        ]);

        $couture = Couture::find($request->get('couture_id'));
        if ($couture) {
            $mesure = Mesure::create($validateData);
        }else{
            return response()->json(['status'=>TRUE, 'message'=>"Veuillez vous assurer de l'existance de la couture svp!"]);           
        }
        
        if ($mesure) {
            return response()->json(['status'=>TRUE, 'mesure'=>$mesure]);
        }else{
            return response()->json(['status'=>FALSE, 'mesure'=>[]]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Mesure  $mesure
     * @return \Illuminate\Http\Response
     */
    public function show($coutureid)
    {
        $mesure = Mesure::where('couture_id', $coutureid)->get();
        if ($mesure->count() != 0) {
            return response()->json(['status'=>TRUE, 'mesure'=>$mesure]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Désolé, cette couture n'a pas encore de mesures!"]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Mesure  $mesure
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $mesure)
    {
        $mesure = Mesure::find($mesure);
        $mesure->update($request->all());

        if ($mesure) {
            return response()->json(['status'=>TRUE, 'mesure'=>$mesure]);
        }else{
            return response()->json(['status'=>FALSE, 'mesure'=>[]]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Mesure  $mesure
     * @return \Illuminate\Http\Response
     */
    public function destroy($mesure)
    {
        $mesure = Mesure::destroy($mesure);

        if ($mesure) {
            return response()->json(['status'=>TRUE, 'message'=>'Mesure has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Mesure not fund !']);
        }
    }
}
