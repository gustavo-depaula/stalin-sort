class StalinSort{
    public static function sort(array:Array<Int>):Array<Int>{
        var maxValue:Int = array[0];
        var sortedArray:Array<Int> = [array[0]];

        for (index in 1...array.length){
            if (array[index] >= maxValue){
                sortedArray.push(maxValue = array[index]);
            }
        }
        return sortedArray;
    }
}

class Main{
    public static function main(){
        trace(StalinSort.sort([1, 2, 3, 5, 4, 5, 2, 1]));
    }
}