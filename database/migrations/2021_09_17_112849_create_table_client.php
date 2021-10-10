<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableClient extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nom');
            $table->string('prenoms');
            $table->string('contact');
            $table->decimal('taille_epaule', $precision = 5, $scale = 2);
            $table->decimal('taille_tour_de_poitine', $precision = 5, $scale = 2);
            $table->decimal('tour_de_manche', $precision = 5, $scale = 2);
            $table->decimal('taille_du_haut', $precision = 5, $scale = 2);
            $table->decimal('taille_tour_de_taille_ceinture', $precision = 5, $scale = 2);
            $table->decimal('taille_tour_de_bassin', $precision = 5, $scale = 2);
            $table->decimal('taille_de_robe_courte', $precision = 5, $scale = 2);
            $table->decimal('taille_de_robe_longue', $precision = 5, $scale = 2);
            $table->decimal('taille_de_jupe_courte', $precision = 5, $scale = 2);
            $table->decimal('taille_de_jupe_longue', $precision = 5, $scale = 2);
            $table->decimal('taille_epaule_hanche', $precision = 5, $scale = 2);
            $table->decimal('taille_manche_longue', $precision = 5, $scale = 2);
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
