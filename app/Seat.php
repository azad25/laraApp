<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seat extends Model
{
    protected $fillable = [];
    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(\App\SeatCategory::class, 'seat_category', 'id');
    }
    public function ship()
    {
        return $this->belongsTo(\App\Ship::class, 'ship_id', 'id');
    }
}