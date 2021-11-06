<?php

namespace App\Http\Controllers\API;

use App\Branch;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class BranchController extends Controller
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
            $payload = Branch::with('schedule','user')->paginate($limit);
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
                'name' => 'required',
                'description' => 'required',
                'phone' => 'required',
                'address' => 'required',
                'parent_counter_id' => 'required',
                'user_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        $data = Branch::create($input);

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
        $data = Branch::with('schedule','counter')->findOrFail($id);
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
        $data = Branch::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'name' => 'required',
                'description' => 'required',
                'phone' => 'required',
                'address' => 'required',
                'parent_counter_id' => 'required',
                'user_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        $input['user_id'] = $this->user->id;
        $data->name = $input['name'];
        $data->description = $input['description'];
        $data->phone = $input['phone'];
        $data->address = $input['address'];
        $data->parent_counter_id = $input['parent_counter_id'];
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
        $data = Branch::findOrFail($id);
        $data->delete();

        return response()->json([
            'success' => true,
        ], 200);
    }
}