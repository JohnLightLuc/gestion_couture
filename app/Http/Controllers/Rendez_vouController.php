<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rendez_vous;
use App\Couture;

class Rendez_vouController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $rendez_vous = Rendez_vous::all();
        
        if ($rendez_vous) {
            return response()->json(['status'=>TRUE, 'rendez_vous'=>$rendez_vous]);
        }else{
            return response()->json(['status'=>FALSE, 'rendez_vous'=>[]]);
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
            'objet'=>'required',
            'date' => 'required',
            'couture_id' => 'required|integer',
        ]);
        $couture = Couture::find($request->get('couture_id'));
        if ($couture) {
            $rendez_vous= Rendez_vous::create([
                'objet'=> $request->get('objet'),
                'date' => $request->get('date'),                   //$request->find('date'),
                'couture_id' => $request->get('couture_id')
            ]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Veuillez vous assurer de l'existance de la couture dans la base de donnée svp!"]);
        }
       
        
        if ($rendez_vous) {
            return response()->json(['status'=>TRUE, 'rendez-vous'=>$rendez_vous]);
        }else{
            return response()->json(['status'=>FALSE, 'rendez-vous'=>[]]);
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
        $couturier = Couturier::where('user_id', $id)->first();
        $atelier = Atelier::where("couturier_id", $couturier->id)->first();
        $clients = Client::where('atelier_id', $atelier->id)->get();

        if ($rendez_vous) {
            return response()->json(['status'=>TRUE, 'rendez_vous'=>$rendez_vous]);
        }else{
            return response()->json(['status'=>FALSE, 'rendez_vous'=>[]]);
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
        $rendez_vous = Rendez_vous::find($id);
        $rendez_vous->update($request->all());

        if ($rendez_vous) {
            return response()->json(['status'=>TRUE, 'rendez_vous'=>$rendez_vous]);
        }else{
            return response()->json(['status'=>FALSE, 'rendez_vous'=>[]]);
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
        $rendez_vous = Rendez_vous::destroy($id);
        if ($rendez_vous) {
            return response()->json(['status'=>TRUE, 'message'=>'Rendez-vous has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Rendez-vous not fund !']);
        }
    }
}
