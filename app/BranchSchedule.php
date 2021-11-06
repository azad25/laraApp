<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BranchSchedule extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function schedule()
    {
        return $this->belongsTo(\App\Schedule::class, 'schedule_id', 'id');
    }
    public function branch()
    {
        return $this->belongsTo(\App\Branch::class, 'branch_id', 'id');
    }
    public function ship()
    {
        return $this->belongsTo(\App\Ship::class, 'ship_id', 'id');
    }
    public function depDes()
    {
        return $this->belongsTo(\App\Destination::class, 'schedule.fromm', 'id');
    }
}