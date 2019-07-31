import scala.util.Random

object StalinSort {
  def purge(list: List[Int], prosecutors: Int): List[Int] = {
    val buf = list.toBuffer
    buf.remove(prosecutors)
    buf.toList
  }

  def stalinSort(list: List[Int]): List[Int] = {
    var correctList = list
    var i = 0
    while (correctList.length > i + 1) {
      if (correctList(i) > correctList(i + 1)) {
        correctList = purge(correctList, i + 1)
      } else {
        i += 1
      }
    }

    correctList
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
