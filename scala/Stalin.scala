import scala.util.Random

object Stalin extends App {

  def stalinSort(list: List[Int]): List[Int] = {
    var i: Int = -1
    list.filter{ j =>
      if (i > j) false else {
        i = j
        true
      }
    }
  }

  val randomList = List.fill(30)(Random.nextInt(100))
  println("Original: " + randomList.toString)
  println("Sorted: " + stalinSort(randomList).toString)

}