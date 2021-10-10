<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Couturier extends Model
{
    use SoftDeletes;
    protected $guarded=['id'];

    public function atelier()
    {
        return $this->hasOne(Atelier::class);    
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
