import scala.util.Random

object StalinSort {
  def stalinSort(list: List[Int]): List[Int] = {
    var max = Int.MinValue
    list.filter(v => if (v >= max) {
      max = v; true
    } else false)
  }
}

object Main extends App {
  (1 to 5).foreach { _ =>
    val list = List.fill(10)(Random.nextInt % 100)
    val sortedList = StalinSort.stalinSort(list)

    println("Original Array: " + list)
    println("Sorted: " + sortedList)
  }
}
