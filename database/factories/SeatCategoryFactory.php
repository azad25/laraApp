<?php

use Faker\Generator as Faker;

$factory->define(App\SeatCategory::class, function (Faker $faker) {
    return [
        'category_name' => $faker->cityPrefix,
        'category_price' => $faker->biasedNumberBetween($min = 800, $max = 2000),
        'category_description' => $faker->text,
        'ship_id' => $faker->biasedNumberBetween($min = 1, $max = 10),
    ];
});