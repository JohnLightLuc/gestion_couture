<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Texture;

class TextureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $texture = Texture::all();

        if ($texture) {
            return response()->json(['status'=>TRUE, 'texture'=>$texture]);
        }else{
            return response()->json(['status'=>FALSE, 'texture'=>[]]);
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
            'description' => 'required'
        ]);

        $texture = Texture::create($validateData);

        if ($texture) {
            return response()->json(['status'=>TRUE, 'texture'=>$texture]);
        }else{
            return response()->json(['status'=>FALSE, 'texture'=>[]]);
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
        $texture = Texture::find($id);

        if ($texture) {
            return response()->json(['status'=>TRUE, 'texture'=>$texture]);
        }else{
            return response()->json(['status'=>FALSE, 'texture'=>[]]);
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
        $texture = Texture::find($id);
        $texture->update($request->all());

        if ($texture) {
            return response()->json(['status'=>TRUE, 'texture'=>$texture]);
        }else{
            return response()->json(['status'=>FALSE, 'texture'=>[]]);
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
       $texture = Texture::destroy($id);
       
       if ($texture) {
            return response()->json(['status'=>TRUE, 'message'=>'Texture has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Texture not fund !']);
        }
    }
}
