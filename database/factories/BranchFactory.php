<?php

use Faker\Generator as Faker;

$factory->define(App\Branch::class, function (Faker $faker) {
    return [
        'name' => $faker->state,
        'description' => $faker->text,
        'phone' => $faker->phoneNumber,
        'address' => $faker->address,
        'parent_counter_id' => $faker->biasedNumberBetween($min = 1, $max = 10),
        'user_id' => $faker->biasedNumberBetween($min = 1, $max = 2)
    ];
});