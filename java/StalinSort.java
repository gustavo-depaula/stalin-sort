import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static java.util.Collections.emptyList;

public class StalinSort {

    public static <T extends Comparable<T>> List<T> stalinSort(List<T> list) {
        if (list.isEmpty()) {
            return emptyList();
        }
        List<T> sorted = new ArrayList<>();
        T max = null;
        for (T candidate : list) {
            if (sorted.isEmpty() || candidate.compareTo(max) >= 0) {
                sorted.add(candidate);
                max = candidate;
            }
        }
        return sorted;
    }
    
    public static void main(String[] args) {
        System.out.println(stalinSort(Arrays.asList(args)));
    }

}
