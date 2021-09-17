<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCouturiersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('couturiers', function (Blueprint $table) {
            $table->bigIncrements('id')->primary();
            $table->string('nom');
            $table->string('pnom');
            $table->string('adresse');
            $table->string('email')->unique();
            $table->string('contact')->unique();
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
        Schema::dropIfExists('couturiers');
    }
}
