<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Couturier;

class CouturierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       // get couturier
       $couturiers = Couturier::all();

       if ($couturiers) {
            return response()->json(['status'=>TRUE, 'couturier'=>$couturiers]);
        }else{
            return response()->json(['status'=>FALSE, 'couturier'=>[]]);
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
        // 
        $validateData = $request->validate([
            'nom'=>'required|string',
            'prenoms'=>'required|string',
            'adresse'=>'required|string',
            'email'=>'required|string',
            'contact'=>'required|string',
        ]);

        $couturier = Couturier::create($validateData);
        
        if ($couturier) {
            return response()->json(['status'=>TRUE, 'couturier'=>$couturier]);
        }else{
            return response()->json(['status'=>FALSE, 'couturier'=>[]]);
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
        $couturier = Couturier::find($id);

        if ($couturier) {
            return response()->json(['status'=>TRUE, 'couturier'=>$couturier]);
        }else{
            return response()->json(['status'=>FALSE, 'couturier'=>[]]);
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
        $couturier = Couturier::find($id);
        $couturier->update($request->all());

        if ($couturier) {
            return response()->json(['status'=>TRUE, 'couturier'=>$couturier]);
        }else{
            return response()->json(['status'=>FALSE, 'couturier'=>[]]);
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
        $couturier = Couturier::destroy($id);
        if ($couturier) {
            return response()->json(['status'=>TRUE, 'message'=>'Couturier has been delete with success.']);
        }else{
            return response()->json(['status'=>FALSE, 'message'=>'Couturier not fund !']);
        }
    }
}
