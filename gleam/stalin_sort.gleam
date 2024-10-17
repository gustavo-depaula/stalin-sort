import gleam/order.{type Order, Eq, Gt, Lt}

/// Returns a list sorted with Stalin Sort.
///
/// `list` is the initial (maybe) unsorted list.
/// `cmp` is the comparison function, returning `order.Gt` if the element
/// must be purged, and returning `order.Eq` or `order.Lt` otherwise.
///
/// ## Examples
///
/// ```gleam
/// stalinsort([3, 2, 4, 1, 8], int.compare)         // [3, 4, 8]
/// stalinsort(                                      // [5, 4 ,3, 1]
///   [5, 4, 3, 6, 1],
///   fn(a, b) { order.negate(int.compare(a, b)) }
/// )
/// ```
pub fn stalinsort(list: List(t), cmp: fn(t, t) -> Order) -> List(t) {
  case list {
    [] -> []
    [x] -> [x]
    [first, second, ..rest] ->
      case cmp(first, second) {
        Eq | Lt -> [first, ..stalinsort([second, ..rest], cmp)]
        Gt -> stalinsort([first, ..rest], cmp)
      }
  }
}
