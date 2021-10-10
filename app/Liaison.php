<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Liaison extends Model
{
    use SoftDeletes;
    protected $guarded=['id'];
    protected $table = 'couture_texture';
}
