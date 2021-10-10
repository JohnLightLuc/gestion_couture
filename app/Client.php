<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Client extends Model
{
    use SoftDeletes;
    protected $fillable=['nom', "prenoms", "contact", "photo", "numero", "atelier_id" ];

    public function coutures()
    {
        return $this->hasMany(Couture::class);
    }

    public function atelier()
    {
        return $this->belongsTo(Atelier::class);
    }

}
