import std.stdio;
import std.algorithm;

int[] stalin_sort(int[] arr){
    if(arr == [])
        return arr; 

    int[] result = [arr[0]];

    for(int i = 1; i < arr.length; i++){
        if(tail(result) <= arr[i])
            result ~= arr[i];
    }
    return result;
}

int main()
{
    int[] foo = [1, 2, 5, 3, 5, 7];
    auto bar = stalin_sort(foo);
    foreach(int e; bar){
        writeln(e);
    }
    return 0;
}

// Helpers
int tail(int[] arr)
{
    return arr[arr.length - 1];
}

