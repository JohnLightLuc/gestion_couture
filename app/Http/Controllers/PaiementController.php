<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Paiement;
use App\Couture;

class PaiementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $paiement = Paiement::all();

        if ($paiement) {
            return response()->json(['status'=>TRUE, 'paiement'=>$paiement]);
        }else{
            return response()->json(['status'=>FALSE, 'paiement'=>[]]);
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
            'type'=>'required',
            'reference'=>'required',
            'montant'=>'required',
            'date' => 'required',
            'couture_id' => 'required'
        ]);

        $couture = Couture::find($request->get('couture_id'));
        if ($couture) {
            $paiement = Paiement::create($validateData);
        }else{
            return response()->json(['status'=>FALSE, 'paiement'=>"Veullez vous assurer de l'existence de la couture svp!"]);
        }
        if ($paiement) {
            return response()->json(['status'=>TRUE, 'paiement'=>$paiement]);
        }else{
            return response()->json(['status'=>FALSE, 'paiement'=>[]]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($coutureid)
    {
        $couture = Couture::find($request->get('couture_id'));
        if ($couture){
            $paiement = Paiement::where('couture_id', $coutureid)->get();

            if ($paiement->count() != 0) {
                return response()->json(['status'=>TRUE, 'paiement'=>$paiement]);
            }else{
                return response()->json(['status'=>FALSE, 'message'=>"Désolé, cette couture n'a pas encore de paiement !"]);
            }
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Veuillez vous assurer de l'existance de la couture dans la base de donnée svp !"]);
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
        $paiement = Paiement::find($id);
        $paiement->update($request->all());

        if ($paiement) {
            return response()->json(['status'=>TRUE, 'paiement'=>$paiement]);
        }else{
            return response()->json(['status'=>FALSE, 'paiement'=>[]]);
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
        $paiement = Paiement::destroy($id);
        if ($paiement) {
            return response()->json(['status'=>TRUE, 'message'=>'Paiement has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Paiement not fund !']);
        }
    }
}
