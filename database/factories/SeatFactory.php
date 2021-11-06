<?php

use Faker\Generator as Faker;

$factory->define(App\Seat::class, function (Faker $faker) {
    return [
        'seat_name' => $faker->stateAbbr . "" . $faker->numberBetween($min = 15, $max = 50),
        'seat_layout' => "row-" . $faker->stateAbbr,
        'description' => $faker->text,
        'seat_category' => $faker->biasedNumberBetween($min = 1, $max = 10),
    ];
});