<?php

use Faker\Generator as Faker;

$factory->define(App\Ship::class, function (Faker $faker) {
    return [
        'shipName' => $faker->name,
        'description' => $faker->text,
        'user_id' => 2,
    ];
});