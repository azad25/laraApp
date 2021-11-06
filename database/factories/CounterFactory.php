<?php

use Faker\Generator as Faker;

$factory->define(App\Counter::class, function (Faker $faker) {
    return [
        'counterName' => $faker->state,
        'description' => $faker->text,
        'phone' => $faker->phoneNumber,
        'destination_id' => $faker->biasedNumberBetween($min = 11, $max = 20),
    ];
});