<?php

namespace App\Http\Controllers\API;

use App\Branch;
use App\Schedule;
use App\Branches;
use App\BranchSchedule;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Validator;

class BranchSchedulesController extends Controller
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
            $payload = BranchSchedule::with('schedule','branch','ship')->get();
            return response()->json([
                'success' => true,
                'data' => $payload,
            ], 200);
        } else {
            return response()->json(['success' => false, 'errorw' => 'unauthorised'], 200);
        }
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'schedule_id' => 'required',
                'branch_id' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        //$input['user_id'] = $this->user->id;

        $data = BranchSchedule::create($input);

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
    public function showByShip($id)
    {
        $data = BranchSchedule::with('ship','branch')->where('ship_id',$id)->get();
        foreach($data as $item){
            $nd = Schedule::with('depDes','arDes')->where('id',$item->schedule_id)->get();
            $item['schedule']= $nd;
        }
        return response()->json([
            'success' => true,
            'payload' => $data,
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
    $data = BranchSchedule::with('schedule','ship','branch')->findOrFail($id);
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
        $data = BranchSchedule::findOrFail($id);
        $input = $request->all();
        $validator = Validator::make($input,
            [
                'schedule_id' => 'required',
                'branch_id' => 'required',
                'ship_id' => 'required'
            ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }
        //$input['user_id'] = $this->user->id;
        $data->schedule_id = $input['schedule_id'];
        $data->ship_id = $input['ship_id'];
        $data->branch_id = $input['branch_id'];
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
        $data = BranchSchedule::findOrFail($id);
        $data->delete();

        return response()->json([
            'success' => true,
        ], 200);
    }
}