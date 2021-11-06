<?php

use Illuminate\Database\Seeder;

class BranchScheduleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory('App\BranchSchedule', 25)->create();
    }
}
