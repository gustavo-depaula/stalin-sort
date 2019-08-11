def stalinSort(arr) { 
    int[] array = arr.collect();
    int i = 0;
    for(j = 1; j < array.length; j++){
        if (array[i] > array[j]) {
                i--;
            } else {
                if (j - i > 1) {
                    array[i + 1] = array[j];
                }
            }
        i++;
    }
    return array[0..(i+1)].collect();
}