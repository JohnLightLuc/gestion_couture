<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableCoutures extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coutures', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text("description");
            $table->date("date");
            $table->decimal('somme', $precision = 12, $scale = 2);
            $table->string("apercu");
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
        Schema::dropIfExists('coutures');
    }
}
