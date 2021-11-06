<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Ship;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class ShipController extends Controller
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
        if (Gate::allows('isAdmin')) {
            $ships = Ship::paginate($limit);
            return response()->json([
                'success' => true,
                'data' => $ships,
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
                'shipName' => 'required',
                'description' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        $input['user_id'] = $this->user->id;

        $data = Ship::create($input);

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
        $data = Ship::findOrFail($id);
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
        $data = Ship::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'shipName' => 'required',
                'description' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        $input['user_id'] = $this->user->id;
        $data->shipName = $input['shipName'];
        $data->description = $input['description'];

        $data->user_id = $input['user_id'];

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
        $data = Ship::findOrFail($id);
        $data->delete();

        return response()->json([
            'success' => true,
        ], 200);
    }
    /**
     * Search the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        $limit = $request->limit;
        if (Gate::allows('isAdmin')) {
            $ships = Ship::paginate($limit);
            if ($search = $request->get('q')) {
                $payload = Ship::where(function ($query) use ($search) {
                    $query->where('shipName', 'LIKE', "%$search%");
                })->paginate($limit);
            } else {
                $payload = Ship::latest()->paginate();
            }
            return $payload;
        }
    }
}