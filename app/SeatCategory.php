<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SeatCategory extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function ship()
    {
        return $this->belongsTo(\App\Ship::class, 'ship_id', 'id');
    }
}