<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Rendez_vous extends Model
{
    use SoftDeletes;
    protected $fillable=['objet', 'date', 'couture_id'];
    protected $table = 'rendez_vous';
}
