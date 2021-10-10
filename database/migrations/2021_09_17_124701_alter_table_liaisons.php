<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableLiaisons extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('liaisons', function (Blueprint $table) {
            $table->unsignedBigInteger('couture_id');
            $table->unsignedBigInteger('texture_id');

            $table->foreign('couture_id')->references('id')->on('coutures');
            $table->foreign('texture_id')->references('id')->on('texture');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('liaisons', function (Blueprint $table) {
            $table->dropCoolumn('couture_id');
            $table->dropCoolumn('texture_id');
        });
    }
}
