<?php
use App\Client;
$json = json_decode('{"longueur":12,"largueur":18.5,"hauteur":40}');
echo '<ul>';
foreach($json as $key => $val) {
    echo "<li>$key: $val</li>";
} 
echo '</ul>';
$nombre = mt_rand(100000000, 999999999);
$img = asset('storage/clients/ylb2Bu5FSBzQrUwdjZ6IKiqj3UNS9LswXU6sL3Wb.webp');
echo "<img src='$img' alt='myimage' />";
?>