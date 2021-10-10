<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AdduserinAtelierTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('couturiers', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->after('contact')->nullable();
            $table->foreign('user_id')->references('id')->on('users');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('couturiers', function (Blueprint $table) {
            $table->dropForeign('couturier_user_id_foreign');
        });
    }
}
