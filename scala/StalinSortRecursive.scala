import scala.util.Random

object StalinSort {
  def stalinSort(list: List[Int]): List[Int] = {
    if (list.isEmpty)
      list
    else {
      val head = list.head
      val tail = list.tail
      if (tail.isEmpty) {
        list
      } else if (head <= tail.head) {
        head +: stalinSort4(tail)
      } else {
        stalinSort4(head +: tail.tail)
      }
    }
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
