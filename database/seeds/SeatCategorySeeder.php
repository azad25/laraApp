<?php

use Illuminate\Database\Seeder;

class SeatCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory('App\SeatCategory', 10)->create();
    }
}