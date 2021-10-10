<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Mesure extends Model
{
    use SoftDeletes;
    protected $fillable = ["couture_id","mesure","valeur"];
}
