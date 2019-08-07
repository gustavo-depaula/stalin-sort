trait StalinSort[A]{
  def canPurge(x: A, y: A): Boolean
}

object StalinSort {
  implicit class StalinSeq[A](list: Seq[A])(implicit sortRule: StalinSort[A]){
    private def judge(typeParamSeq: Seq[A]): Seq[A] = typeParamSeq match {
      case x::y::z if sortRule.canPurge(x, y) => judge(x::z)
      case x::y::z => x +: judge(y::z)
      case _ => typeParamSeq
    }

    def stalinSort: Seq[A] = judge(list)
  }
}

object NumericSort {
  implicit val intSort: StalinSort[Int] = new StalinSort[Int] {
    override def canPurge(x: Int, y: Int): Boolean = x > y
  }

  implicit val longSort: StalinSort[Long] = new StalinSort[Long] {
    override def canPurge(x: Long, y: Long): Boolean = x > y
  }

  implicit val floatSort: StalinSort[Float] = new StalinSort[Float] {
    override def canPurge(x: Float, y: Float): Boolean = x > y
  }

  implicit val doubleSort: StalinSort[Double] = new StalinSort[Double] {
    override def canPurge(x: Double, y: Double): Boolean = x > y
  }
}

object CustomTypeStalinSort extends App {
  import StalinSort._


  // sort numeric list
  import NumericSort._

  val intList: Seq[Int] = Seq(1, 1, 3, 4, 2, 5, 3, 2, 10)
  val longList: Seq[Long] = Seq(1L, 1L, 3L, 4L, 2L, 5L, 3L, 2L, 10L)
  val floatList: Seq[Float] = Seq(1.11f, 1.11f, 3.33f, 4.44f, 2.22f, 5.55f, 3.33f, 2.22f, 10.10f)
  val doubleList: Seq[Double] = Seq(1.11, 1.11, 3.33, 4.44, 2.22, 5.55, 3.33, 2.22, 10.10)

  println(intList.stalinSort)
  println(longList.stalinSort)
  println(floatList.stalinSort)
  println(doubleList.stalinSort)


  // sort custom type list
  case class Vegetable(name: String, price: Int)
  val vegetableList: Seq[Vegetable] = Seq(
    Vegetable("cucumber", 45),
    Vegetable("eggplant", 80),
    Vegetable("onion", 50),
    Vegetable("cabbage", 100),
    Vegetable("potato", 90),
    Vegetable("lettuce", 120)
  )

  implicit val vegetableSort: StalinSort[Vegetable] = new StalinSort[Vegetable] {
    override def canPurge(x: Vegetable, y: Vegetable): Boolean = x.price > y.price
  }

  println(vegetableList.stalinSort)

  println(Seq(1, 3, 3, 5, 4).stalinSort)  //if you run it, the result of is List(1, 3, 3, 5)
}