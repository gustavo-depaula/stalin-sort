<?php

// This code works with PHP 7.4.
// Older versions of PHP are counter-revolutionary.

namespace stalin;

function sort(array $xs): array
{
    if (count($xs) <= 1) {
        return $xs;
    }
    
    $zs = $xs;
    $x = array_shift($zs);
    $y = array_shift($zs);
    
    if ($x <= $y) {
        return [$x, ...sort([$y, ...$zs])];
    }
    
    return sort([$x, ...$zs]);
}
