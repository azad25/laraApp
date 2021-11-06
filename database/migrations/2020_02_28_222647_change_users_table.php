<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function ($table) {
            $table->string('gender')->after('photo')
                                ->nullable();
            $table->string('phone')->after('gender')->nullable();
            $table->string('address')->after('phone')->nullable();
            $table->string('data')->after('address')->nullable();
            $table->bigInteger('branch_id')->after('photo')->unsigned()->index()->nullable()->default(null);
            $table->foreign('branch_id')->references('id')->on('branches')->onDelete('cascade');
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