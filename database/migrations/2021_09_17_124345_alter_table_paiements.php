<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTablePaiements extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('paiements', function (Blueprint $table) {
            $table->unsignedBigInteger('couture_id');

            $table->foreign('couture_id')->references('id')->on('coutures');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('paiements', function (Blueprint $table) {
            $table->dropColumn('couture_id');
        });
    }
}
