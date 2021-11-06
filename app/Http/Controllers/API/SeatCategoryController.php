<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\SeatCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class SeatCategoryController extends Controller
{
    protected $user;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();

            return $next($request);
        });

        $this->user = Auth::user();
    }

    public function index(Request $request)
    {
        $limit = $request->limit;
        $ship = $request->ship_id;
        if (Gate::allows('isAdmin')) {
            if(empty($ship)){
                $payload = SeatCategory::with('ship')->paginate($limit);
            }else{
                $payload = SeatCategory::with('ship')->where('ship_id',$ship)->paginate($limit);
            }
            
            return response()->json([
                'success' => true,
                'data' => $payload,
            ], 200);
        } else {
            return response()->json(['success' => false, 'error' => 'unauthorised'], 200);
        }
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'category_name' => 'required',
                'category_price' => 'required',
                'category_description' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        $data = SeatCategory::create($input);

        return response()->json([
            'success' => true,
            'payload_id' => $data->id,
        ], 200);

    }
/**
 * Display the specified resource.
 *
 * @param  int  $id
 * @return \Illuminate\Http\Response
 */
    public function show($id)
    {
        $data = SeatCategory::findOrFail($id);
        return response()->json([
            'success' => true,
            'payload' => $data,
        ], 200);
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
        $data = SeatCategory::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'category_name' => 'required',
                'category_price' => 'required',
                'category_description' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->category_name = $input['category_name'];
        $data->category_price = $input['category_price'];
        $data->category_description = $input['category_description'];
        $data->ship_id = $input['ship_id'];

        //$data->user_id = $input['user_id'];

        $data->save();

        return response()->json([
            'success' => true,
        ], 200);

    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = SeatCategory::findOrFail($id);
        $data->delete();

        return response()->json([
            'success' => true,
        ], 200);
    }
}