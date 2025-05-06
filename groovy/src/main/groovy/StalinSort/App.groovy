package StalinSort

class App {
    List<Integer> StalingSort(List<Integer> source) {
        def result = []
        source?.forEach {
            if (result.max() <= it) {
                result << it
            }
        }
        return result
    }

    static void main(String[] args) {
        println new App().StalingSort()
    }
}
