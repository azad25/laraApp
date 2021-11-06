<?php

namespace App\Http\Controllers\API;

use App\Counter;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class CounterController extends Controller
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
            $payload = Counter::with('destination')->paginate($limit);
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
                'counterName' => 'required',
                'description' => 'required',
                'phone' => 'required',
                'destination_id' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        //$input['user_id'] = $this->user->id;

        $data = Counter::create($input);

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
        $data = Counter::with('destination')->findOrFail($id);
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
        $data = Counter::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'counterName' => 'required',
                'description' => 'required',
                'phone' => 'required',
                'destination_id' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->counterName = $input['counterName'];
        $data->description = $input['description'];
        $data->phone = $input['phone'];
        $data->destination_id = $input['destination_id'];

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
        $data = Counter::findOrFail($id);
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
            if ($search = $request->get('q')) {
                $payload = Counter::with('destination')->where(function ($query) use ($search) {
                    $query->where('counterName', 'LIKE', "%$search%")
                    ->orWhere('phone', 'LIKE', "%$search%");
                })->paginate($limit);
            } else {
                $payload = Counter::latest()->paginate();
            }
            return $payload;
        }
    }
}