<?php

namespace App\Http\Controllers\API;

use App\Destination;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class DestinationController extends Controller
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
            $destinations = Destination::paginate($limit);
            return response()->json([
                'success' => true,
                'data' => $destinations,
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
                'destinationName' => 'required',
                'description' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        //$input['user_id'] = $this->user->id;

        $data = Destination::create($input);

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
        $data = Destination::findOrFail($id);
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
        $data = Destination::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'destinationName' => 'required',
                'description' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->destinationName = $input['destinationName'];
        $data->description = $input['description'];
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
        $data = Destination::findOrFail($id);
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
            $ships = Destination::paginate($limit);
            if ($search = $request->get('q')) {
                $payload = Destination::where(function ($query) use ($search) {
                    $query->where('destinationName', 'LIKE', "%$search%");
                })->paginate($limit);
            } else {
                $payload = Destination::latest()->paginate();
            }
            return $payload;
        }
    }
}