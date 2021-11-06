<?php

namespace App\Http\Controllers;

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class ScheduleController extends Controller
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
            $payload = Schedule::with('depDes', 'arDes')->paginate($limit);

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
                'schedule' => 'required',
                'description' => 'required',
                'departure' => 'required',
                'arrival' => 'required',
                'destination_id' => 'required',
                'fromm' => 'required',
                'too' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        //$input['user_id'] = $this->user->id;

        $data = Schedule::create($input);

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
        $data = Schedule::with('depDes', 'arDes')->findOrFail($id);
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
        $data = Schedule::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'schedule' => 'required',
                'description' => 'required',
                'departure' => 'required',
                'arrival' => 'required',
                'destination_id' => 'required',
                'fromm' => 'required',
                'too' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->schedule = $input['schedule'];
        $data->description = $input['description'];
        $data->departure = $input['departure'];
        $data->arrival = $input['arrival'];
        $data->destination_id = $input['destination_id'];
        $data->fromm = $input['fromm'];
        $data->too = $input['too'];

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
        $data = Schedule::findOrFail($id);
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
                $payload = Schedule::with('depDes','arDes')->where(function ($query) use ($search) {
                    $query->where('schedule', 'LIKE', "%$search%");
                })->paginate($limit);
            } else {
                $payload = Schedule::latest()->paginate();
            }
            return $payload;
        }
    }
}