<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function schedule()
    {
        return $this->belongsTo(\App\Schedule::class, 'schedule_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(\App\User::class, 'user_id', 'id');
    }
}