<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLiaisonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('liaisons', function (Blueprint $table) {
            $table->unsignedBigInteger('id_texture')->primary();
            $table->unsignedBigInteger('id_commande')->primary();
            $table->string('description');
            $table->timestamps();

            $table->foreign('id_texture')->references('id')->on('textures');
            $table->foreign('id_commande')->references('id')->on('commandes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('liaisons');
    }
}
