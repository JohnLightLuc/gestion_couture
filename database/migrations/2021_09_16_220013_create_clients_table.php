<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->bigIncrements('id')->primary();
            $table->string('nom');
            $table->string('pnom');
            $table->string('contact')->unique();
            $table->string('epaule');
            $table->integer('tour_poitrine');
            $table->integer('longueur_taille');
            $table->integer('tour_manche');
            $table->integer('longueur_haut');
            $table->integer('tour_taille');
            $table->integer('tour_bassin');
            $table->integer('longueur_robe');
            $table->integer('longueur_jupe');
            $table->integer('longueur_epaule-manche');
            $table->integer('longueur_manche');
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
        Schema::dropIfExists('clients');
    }
}
