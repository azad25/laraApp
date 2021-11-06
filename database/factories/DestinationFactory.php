<?php

use Faker\Generator as Faker;

$factory->define(App\Destination::class, function (Faker $faker) {
    return [
        'destinationName' => $faker->state,
        'description' => $faker->text,
    ];
});