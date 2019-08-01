object StalinSortFunctional extends App {

  def stalinSort[A: Ordering](xs: List[A]): List[A] = xs match {
    case Nil          => Nil
    case x :: Nil     => List(x)
    case x :: y :: zs =>
      if (implicitly[Ordering[A]].lteq(x, y)) x :: stalinSort(y :: zs)
      else stalinSort(x :: zs)
  }

  println(stalinSort(1 :: 2 :: 3 :: Nil))
  println(stalinSort(3 :: 1 :: 3 :: Nil))
  println(stalinSort(3 :: 1 :: 2 :: Nil))

}
