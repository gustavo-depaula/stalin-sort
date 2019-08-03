import scala.math.BigDecimal.RoundingMode
import scala.util.Random

object Stalin extends App {

  def stalinSort[B](list: List[B])(implicit cmp: Ordering[B]): List[B] = {
    list match {
      case first :: _ =>
        var i: B = first
        list.filter{ j =>
          if (cmp.gt(i, j)) false else {
            i = j
            true
          }
        }

      case Nil => list
    }
  }

  val randomIntList = List.fill(10)(Random.nextInt(100) - 50)
  println("Original: " + randomIntList.toString)
  println("Sorted: " + stalinSort(randomIntList).toString())
  println

  val randomDecimalList = List.fill(10)(BigDecimal((100*Random.nextDouble) - 50).setScale(3, RoundingMode.HALF_UP))
  println("Original: " + randomDecimalList.toString)
  println("Sorted: " + stalinSort(randomDecimalList).toString)
  println

  // Sort by string length
  val randomStringList: List[String] = List.fill(10)(Random.alphanumeric.take(Random.nextInt(10)).mkString)
  println("Original: " + randomStringList.toString)
  println("Sorted: " + stalinSort(randomStringList)((x: String, y: String) => x.length.compareTo(y.length)).toString)
  println

}
