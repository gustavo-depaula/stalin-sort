import java.util.Arrays;

/**
 * <a href="https://github.com/gustavo-depaula/stalin-sort/raw/master/stalin-sort.jpeg">Algorithm description</a>
 */
public class StalinSortArrays {

    public static int[] stalinSort(int[] array) {
        array = Arrays.copyOf(array, array.length);

        int i = 0;
        for (int j = 1; j < array.length; i++, j++) {
            if (array[i] > array[j]) {
                i--;
            } else {
                if (j - i > 1) {
                    array[i + 1] = array[j];
                }
            }
        }
        return Arrays.copyOf(array, i + 1);
    }

    public static void main(String[] args) {
        printArrays(new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9}, "Sorted array");
        printArrays(new int[] {1, 0, 3, 4, 5, 8, 6, 7, 9}, "Array with mixed numbers");
        printArrays(new int[] {1, 1, 1, 1, 2, 2, 2, 3, 4}, "Sorted array with repeats");
        printArrays(new int[] {9, 8, 7, 6, 5, 4, 3, 2, 1}, "Reversed array");
    }

    private static void printArrays(int[] sourceArray, String testName) {
        System.out.println("\n" + testName + ":");
        System.out.println("Source array: " + Arrays.toString(sourceArray));
        System.out.println("Result array: " + Arrays.toString(stalinSort(sourceArray)));
    }
}
