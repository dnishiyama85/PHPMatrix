<?php
ini_set('memory_limit', '1G');

$SIZE = 100;

// 素のPHPの行列
$a = random_array($SIZE, $SIZE);
$b = random_array($SIZE, $SIZE);

// OpenBlas版 高速行列
$matA = Matrix::createFromData($a);
$matB = Matrix::createFromData($b);

$time_start = microtime(true);
for ($i = 0; $i < 100; $i++) {
    $matC = $matA->mul($matB);
}
$time = microtime(true) - $time_start;
echo "OpenBlas版 => {$time}秒\n";

$time_start = microtime(true);
for ($i = 0; $i < 100; $i++) {
    $c = naive_mul($a, $b);
}
$time = microtime(true) - $time_start;
echo "素のPHP版 => {$time}秒\n";


function random_array($r, $c) {
    $result = [];
    for ($i = 0; $i < $r; $i++) {
        $result[$i] = array_fill(0, $c, 0);
    }
    for ($i = 0; $i < $r; $i++) {
        for ($j = 0; $j < $c; $j++) {
            $result[$i][$j] = rand(0, 10000) / 10000.0; 
        }
    }
    return $result;
}

function naive_mul($a, $b) {
    $r1 = count($a);
    $c1 = count($a[0]);
    $r2 = count($b);
    $c2 = count($b[0]);
    
    $result = [];
    for ($i = 0; $i < $r1; $i++) {
        $result[$i] = array_fill(0, $c2, 0);
    }
    
    for ($i = 0; $i < $r1; $i++) {
        for ($j = 0; $j < $c2; $j++) {
            for ($k = 0; $k < $c1; $k++) {
                $result[$i][$j] += $a[$i][$k] * $b[$k][$j];
            }
        }
    }
    
    return $result;
}