<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 


class Atelier extends Model
{
    use SoftDeletes;
    protected $guarded=['id'];

    public function clients()
    {
        return $this->hasMany(Client::class);
    }
    public function couturier()
    {
        return $this->belongsTo(Couturier::class);
    }
}
