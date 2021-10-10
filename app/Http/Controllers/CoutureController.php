<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Couture;
use App\Client;
use App\Modele;

class CoutureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $coutures = Couture::all();

        if ($coutures) {
            return response()->json(['status'=>TRUE, 'couture'=>$coutures]);
        }else{
            return response()->json(['status'=>FALSE, 'couture'=>[]]);
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
            'description' => 'required',
            'somme' => 'required',
            'apercu' => 'required',
            'client_id' => 'required',
            'modele_id' => 'required'
        ]);
        $clientId = $request->input('client_id');
        $modeleId = $request->input('modele_id');
        

        $client = Client::find($clientId);
        $modele = Modele::find($modeleId);
        
        if ($client && $modele) {
            // Store image in public file;
            $request->file('apercu')->store('couture', 'public');
            echo "start saving...";
            $couture = Couture::create([
                'description'=> $request->input('description'),
                'date' => $request->input('date'),
                'somme' => $request->input('somme'),
                'apercu' => $request->file('apercu')->hashName(),
                'client_id' => $request->input('client_id'),
                'modele_id' => $request->input('modele_id')
            ]);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Veuillez vous assurez de l'existance du client et du modele dans la base de donnée svp." ]);
        }
        
        if ($couture) {
            return response()->json(['status'=>TRUE, 'couture'=>$couture]);
        }else{
            return response()->json(['status'=>FALSE, 'couture'=>[]]);
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
        $couture = Couture::find($id);

        if ($couture) {
            return response()->json(['status'=>TRUE, 'couture'=>$couture]);
        }else{
            return response()->json(['status'=>FALSE, 'couture'=>[]]);
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
        $couture = Couture::find($id);
        $couture->update($request->all());
        
        if($request->file('apercu') != null){
            //Store image in public file;Welcome
            echo("Welcome to apercu");
            $request->file('apercu')->store('couture', 'public');
            $couture->apercu = $request->file('apercu')->hashName();
            $couture->save();
            echo ("Apercu save");
        }

        if ($couture) {
            return response()->json(['status'=>TRUE, 'couture'=>$couture]);
        }else{
            return response()->json(['status'=>FALSE, 'couture'=>[]]);
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
        $couture = Couture::destroy($id);

        if ($couture) {
            return response()->json(['status'=>TRUE, 'message'=>'Couture has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Couture not fund !']);
        }
    }
}
