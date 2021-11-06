<?php

use Faker\Generator as Faker;

$factory->define(App\BranchSchedule::class, function (Faker $faker) {
    return [
        'ship_id' => $faker->biasedNumberBetween($min = 1, $max = 25),
        'branch_id' => $faker->biasedNumberBetween($min = 1, $max = 13),
        'schedule_id' => $faker->biasedNumberBetween($min = 13, $max = 22)
    ];
});
