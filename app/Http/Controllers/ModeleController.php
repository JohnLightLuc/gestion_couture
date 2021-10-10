<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Modele;

class ModeleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $modele = Modele::all();
        
        if ($modele) {
            return response()->json(['status'=>TRUE, 'modele'=>$modele]);
        }else{
            return response()->json(['status'=>FALSE, 'modele'=>[]]);
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
            'nom' => 'required',
            'description' => 'required',
            'photo' => 'required',
        ]);
        $request->file('photo')->store('modeles', 'public');

        $modele = Modele::create([
            'nom'=>$request->get('nom'),
            'description'=>$request->get('description'),
            'photo' => $request->file('photo')->hashName()
        ]);

        if ($modele) {
            return response()->json(['status'=>TRUE, 'modele'=>$modele]);
        }else{
            return response()->json(['status'=>FALSE, 'modele'=>[]]);
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
        $modele = Modele::find($id);
        if ($modele) {
            return response()->json(['status'=>TRUE, 'modele'=>$modele]);
        }else{
            return response()->json(['status'=>FALSE, 'modele'=>[]]);
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
        $modele = Modele::find($id);
        print_r($request->all());
        $modele->update($request->all());
        echo("request->file('photo')");
        print_r($request->file('photo'));
        if($request->file('photo')){
            //Store image in public file;
            $request->file('photo')->store('modeles', 'public');
            $modele->photo = $request->file('photo')->hashName();
            $modele->save();
            echo "photo update ";
        }

        if ($modele) {
            return response()->json(['status'=>TRUE, 'modele'=>$modele]);
        }else{
            return response()->json(['status'=>FALSE, 'modele'=>[]]);
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
        $modele = Modele::destroy($id);

        if ($modele) {
            return response()->json(['status'=>TRUE, 'message'=>'Modèle has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Modèle not fund !']);
        }
    }
}
