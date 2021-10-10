<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableClient extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('Clients', function (Blueprint $table) {
            $table->dropColumn('taille_epaule');
            $table->dropColumn('taille_tour_de_poitine');
            $table->dropColumn('tour_de_manche');
            $table->dropColumn('taille_du_haut');
            $table->dropColumn('taille_tour_de_taille_ceinture');
            $table->dropColumn('taille_tour_de_bassin');
            $table->dropColumn('taille_de_robe_courte');
            $table->dropColumn('taille_de_robe_longue');
            $table->dropColumn('taille_de_jupe_courte');
            $table->dropColumn('taille_de_jupe_longue');
            $table->dropColumn('taille_epaule_hanche');
            $table->dropColumn('taille_manche_longue');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('Clients', function (Blueprint $table) {
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
        });
    }
}
