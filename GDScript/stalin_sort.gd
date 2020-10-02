extends Node

func stalin_sort(array: Array) -> Array:
    if(!array.size()): return array;
    var temp = array[0];
    var result:Array = [];
    for item in array:
        if(item >= temp):
            result.append(item)
            temp = item;
    return result;
