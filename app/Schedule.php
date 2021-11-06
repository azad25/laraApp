<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function depDes()
    {
        return $this->belongsTo(\App\Destination::class, 'fromm', 'id');
    }
    public function arDes()
    {
        return $this->belongsTo(\App\Destination::class, 'too', 'id');
    }
}