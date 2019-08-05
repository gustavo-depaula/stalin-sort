import java.util.ArrayList;
import java.util.Arrays;

class StalinSort {
    public static int[] stalinSort(int arr[]) {
        ArrayList<Integer> sorted =
            new ArrayList<>(Arrays.asList(Arrays.stream(arr).boxed().toArray(Integer[]::new)));
        for (int i = 1; i < sorted.size(); i++) {
            if (sorted.get(i) < sorted.get(i - 1)) {
                sorted.remove(i);
                i--;
            }
        }
        return sorted.stream().mapToInt(i -> i).toArray();
    }

    public static void main(String[] args) {
        int arr1[] = new int[]{1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
        int sorted1[] = stalinSort(arr1);
        int arr2[] = new int[]{9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
        int sorted2[] = stalinSort(arr2);
        int arr3[] = new int[]{1, 3, 2, 5, 4, 7, 0, 9, 8, 6};
        int sorted3[] = stalinSort(arr3);
        System.out.print("Original: ");
        System.out.println(Arrays.toString(arr1));
        System.out.print("Sorted: ");
        System.out.println(Arrays.toString(sorted1));
        System.out.print("Original: ");
        System.out.println(Arrays.toString(arr2));
        System.out.print("Sorted: ");
        System.out.println(Arrays.toString(sorted2));
        System.out.print("Original: ");
        System.out.println(Arrays.toString(arr3));
        System.out.print("Sorted: ");
        System.out.println(Arrays.toString(sorted3));
    }
}
