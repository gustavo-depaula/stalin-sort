def stalinSort(unsorted: List[Int]): List[Int] = {

  @scala.annotation.tailrec
  def inner(sublist: List[Int], max: Int, result: List[Int]): List[Int] = {
    if (sublist.isEmpty) result.reverse
    else if (sublist.head >= max) inner(sublist.tail, sublist.head, sublist.head :: result)
    else inner(sublist.tail, max, result)
  }

  if (unsorted.isEmpty) Nil
  else inner(unsorted.tail, unsorted.head, List(unsorted.head))
}


stalinSort(List(1, 2, 3))        // val res0: List[Int] = List(1, 2, 3)
stalinSort(List(1, 2, 3, 3))     // val res1: List[Int] = List(1, 2, 3, 3)
stalinSort(List(3, 2, 1))        // val res2: List[Int] = List(3)
stalinSort(List(1, 1, 1))        // val res3: List[Int] = List(1)
stalinSort(List(3))              // val res4: List[Int] = List(3)
stalinSort(List())               // val res5: List[Int] = List()
stalinSort(List(1, 5, 2, 7, 1))  // val res6: List[Int] = List(1, 5, 7)
