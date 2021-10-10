<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableAteliers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ateliers', function (Blueprint $table) {
            $table->unsignedBigInteger('couturier_id');
            $table->foreign('couturier_id')->references('id')->on('couturiers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ateliers', function (Blueprint $table) {
            $table->dropColumn('couturier_id');
        });
    }
}
