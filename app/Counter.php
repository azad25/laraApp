<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Counter extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function destination()
    {
        return $this->belongsTo(\App\Destination::class, 'destination_id', 'id');
    }
}