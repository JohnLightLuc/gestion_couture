<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Liaison;
use App\Couturier;
use App\Texture;

class LiaisonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $liaisons = Liaison::all();
        if ($liaisons) {
            return response()->json(['status'=>TRUE, 'liaison'=>$liaisons]);
        }else{
            return response()->json(['status'=>FALSE, 'liaison'=>[]]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response  
     *  
     */
    public function store(Request $request)
    {
        $validateData = $request->validate([
            'description' => 'required',
            'couture_id' => 'required',
            'texture_id' => 'required',
        ]);
        $couturier = Couturier::find($request->get('couture_id'));
        $texture = Texture::find($request->get('texture_id'));

        if($couturier && $texture){
            $exist = Liaison::whereCoutureId($request->get('couture_id'))->whereTextureId($request->get('texture_id'))->get();
            echo($exist->count());
            if($exist->count()== 0){
                $liaison = Liaison::create($validateData);
            }else{
                return response()->json(['status'=>TRUE, 'liaison'=>$exist ]);              
            }
            
        }else{
            return response()->json(['status'=>FALSE, 'message'=>"Veuillez vous assurez de l'existence de la texture et de la couture svp!" ]);
        }

        if ($liaison) {
            return response()->json(['status'=>TRUE, 'liaison'=>$liaison]);
        }else{
            return response()->json(['status'=>FALSE, 'liaison'=>[]]);
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
        $liaison = Liaison::find($id);

        if ($liaison) {
            return response()->json(['status'=>TRUE, 'liaison'=>$liaison]);
        }else{
            return response()->json(['status'=>FALSE, 'liaison'=>[]]);
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
        $liaison = Liaison::find($id);
        $liaison->update($request->all());

        if ($liaison) {
            return response()->json(['status'=>TRUE, 'liaison'=>$liaison]);
        }else{
            return response()->json(['status'=>FALSE, 'liaison'=>[]]);
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
        $liaison = Liaison::destroy($id);

        if ($liaison) {
            return response()->json(['status'=>TRUE, 'message'=>'Liaison has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Liaison not fund !']);
        }
    }
}
