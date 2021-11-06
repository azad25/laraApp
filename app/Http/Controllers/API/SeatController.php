<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Seat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class SeatController extends Controller
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
        $category = $request->category;
        $ship = $request->ship;
        if (Gate::allows('isAdmin')) {
            $payload = Seat::with('category','ship')->paginate($limit);
            
            if(isset($category) || isset($ship)){
                $payload = Seat::with('category','ship')->orWhere('ship_id',$ship)->orWhere('seat_category',$category)->paginate($limit);
            }
            return response()->json([
                'success' => true,
                'data' => $payload
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
                'seat_category' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        $seats = $input['seat_name'];

        $send_data = [
            "seat_name" => "",
            "seat_category" => $input['seat_category'],
            "ship_id" => $input['ship_id']
        ];

        if(count($seats) > 0){
            for($in = 0; $in < count($seats); $in++){
                $send_data['seat_name'] = $seats[$in];
                $data = Seat::create($send_data);
            }
        }

        return response()->json([
            'success' => true
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
        $data = Seat::with('ship','category')->findOrFail($id);
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
        $data = Seat::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'seat_name' => 'required',
                'seat_category' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->seat_name = $input['seat_name'];
        $data->seat_category = $input['seat_category'];
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
        $data = Seat::findOrFail($id);
        $data->delete();

        return response()->json([
            'success' => true,
        ], 200);
    }
}