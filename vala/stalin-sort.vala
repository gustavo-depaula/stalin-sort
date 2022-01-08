 public class StalinSort : Object {

     public static long[] stalinSort(string[] array) {
         if(array.length == 0){
             return {};
         }
         long[] sortedArray = {};
         long previousElem = long.parse(array[0]);
         foreach (string elem in array) {
             long elem_ = long.parse(elem);
             if(elem_ >= previousElem){
                 // Only elements in order are spared from Gulag
                 sortedArray += elem_;
                 previousElem = elem_;
             }
         }
         return sortedArray;
     }
 }

 void main(string[] args) {

     long[] sortedArray = StalinSort.stalinSort(args[1:]);
     stdout.printf("[");
     for (int idx = 0; idx < sortedArray.length; idx++)
     {
         if(idx == 0){
             stdout.printf(" ");
         }
         stdout.printf("%ld", sortedArray[idx]);
         if(idx != sortedArray.length - 1){
             stdout.printf(", ");
         }
         else{
             stdout.printf(" ");
         }
     }
     stdout.printf("]\n");
 }

