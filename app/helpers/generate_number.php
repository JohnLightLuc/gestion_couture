<?php

use App\Client;
// Fonction for genarate unique number fo client
if (! function_exists('generationNumero')){
    function generationNumero() {
        $number = mt_rand(100000000, 999999999); // better than Rand()
        
        $exist = Client::whereNumero($number)->exists();
        if ($exist ==TRUE) {
            return generationNumero();
        }
            
        return $number;
    }
}
