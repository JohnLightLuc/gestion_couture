<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;
use App\Atelier;
use App\Mesure;
use App\Couturier;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clients = Client::all();

        if ($clients) {
            return response()->json(['status'=>TRUE, 'client'=>$clients]);
        }else{
            return response()->json(['status'=>FALSE, 'client'=>[]]);
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
            'nom'=>'required|string',
            'prenoms'=>'required|string',
            'contact'=>'required|string',
            'atelier_id'=>'required|integer'
            //'photo' => 'mimes:jpeg,jpg,png'
        ]);
        $number = generationNumero();
        

        // Store image in public file;
        $request->file('photo')->store('clients', 'public');



        // ****** verification de l'existance du atelier et mesure ******* //
        $atelierId = $request->get('atelier_id');
        
        $atelier = Atelier::find($atelierId);

        if ($atelier ) {
            // Store image in public file;
            $request->file('photo')->store('clients', 'public');

            $client = Client::create([
                'nom'=>$request->get('nom'),
                'prenoms'=>$request->get('prenoms'),
                'contact'=>$request->get('contact'),
                'atelier_id'=>$request->get('atelier_id'),
                'numero'=>$number,
                'photo'=>$request->file('photo')->hashName()
            ]);
        }else{
            return response()->json(['status'=>TRUE, 'message'=>"Veuillez vous assurer de l'existence de l'atelier et de la mesure dans la base de donnée svp!"]);
        }
    
        if ($client) {
            return response()->json(['status'=>TRUE, 'client'=>$client]);
        }else{
            return response()->json(['status'=>FALSE, 'client'=>[]]);
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
        
        $client = Client::find($id);
        $coutures = $client->coutures;
        
        if ($client) {
            return response()->json(['status'=>TRUE, 'client'=>$client, 'coutures'=>$coutures ]);
        }else{
            return response()->json(['status'=>FALSE, 'client'=>[]]);
        }
    }

    public function clientByCouturier($id)
    {
        $couturier = Couturier::where('user_id', $id)->first();
        $atelier = Atelier::where("couturier_id", $couturier->id)->first();
        $clients = Client::where('atelier_id', $atelier->id)->get();
        

        if ($clients->count() > 0) {
            return response()->json(['status'=>TRUE, 'client'=>$clients]);
        }else{
            return response()->json(['status'=>FALSE, 'client'=>[]]);
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
        $client = Client::find($id);
        $client->update($request->all());
        if($request->file('photo')){
                //Store image in public file;
            $request->file('photo')->store('clients', 'public');
            $client->photo = $request->file('photo')->hashName();
            $client->save();
            
        }
        if ($client) {
            return response()->json(["status"=>TRUE, "client"=>$client]);
        }else{
            return response()->json(["status"=>FALSE, "client"=>[]]);
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
        $client = Client::destroy($id);

        if ($client) {
            return response()->json(['status'=>TRUE, 'message'=>'Client has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Client not fund !']);
        }
    }
}
