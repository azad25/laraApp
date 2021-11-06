<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('schedules', function (Blueprint $table) {
            $table->bigInteger('from')->unsigned()->index()->default(null)->after('description');
            $table->foreign('from')->references('id')->on('destinations')->onDelete('cascade');
            $table->bigInteger('to')->unsigned()->index()->default(null)->after('from');
            $table->foreign('to')->references('id')->on('destinations')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}