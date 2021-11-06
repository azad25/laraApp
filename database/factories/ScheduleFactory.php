<?php

use Faker\Generator as Faker;

$factory->define(App\Schedule::class, function (Faker $faker) {
    return [
        'schedule' => $faker->state,
        'departure' => $faker->time($format = 'H:i a'),
        'arrival' => $faker->time($format = 'H:i a'),
        'description' => $faker->text,
        'destination_id' => $faker->biasedNumberBetween($min = 11, $max = 20),
        'from' => $faker->biasedNumberBetween($min = 11, $max = 20),
        'to' => $faker->biasedNumberBetween($min = 11, $max = 20),
    ];
});