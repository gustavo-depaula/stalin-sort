<?php

/**
 * @param array $array
 * @return array
 */
function stalinSort(array $array): array
{
    $last = current($array);
    foreach ($array as $i => $value) {
        if ($value < $last) {
            unset($array[$i]);
            continue;
        }

        $last = $value;
    }

    return array_values($array);
}

// print_r(stalinSort([0, -1, 3, 2, 6, 4, 5, 19, 11]));
// print_r(stalinSort(['a','b','d','c', 'e', 'g', 'h', 'f'])); Hu3Hu3Hu3Hu3
