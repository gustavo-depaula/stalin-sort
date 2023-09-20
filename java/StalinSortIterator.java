import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class StalinSortIterator {

    public static <T extends Comparable<T>> List<T> sort(ArrayList<T> list) {
        if (list.isEmpty()) {
            return List.of();
        }
        Iterator<T> iterator = list.iterator();
        T previousValue = iterator.next();
        while (iterator.hasNext()) {
            T value = iterator.next();
            if (value.compareTo(previousValue) < 0) {
                iterator.remove();
            } else {
                previousValue = value;
            }
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(StalinSortIterator.sort(new ArrayList<>(Arrays.asList(args))));
    }

}
