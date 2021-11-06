<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('unique_id');
            $table->bigInteger('schedule')->unsigned()->index();
            $table->foreign('schedule')->references('id')->on('branch_schedules')->onDelete('cascade');
            $table->string('name');
            $table->string('phone');
            $table->string('email')->nullable();
            $table->string('address')->nullable();
            $table->string('description')->nullable();
            $table->boolean('deck');
            $table->boolean('paid');
            $table->string('bkash');
            $table->boolean('approved');
            $table->bigInteger('sold_by')->unsigned()->index();
            $table->foreign('sold_by')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
