List<T> stalinSort<T extends num>(List<T> list) {
  if (list.isEmpty) return <T>[];

  var x = list.first;
  return list
    ..removeWhere((value) {
      return (x = value >= x ? value : x) != value;
    });
}

main() {
  final list = [1, 2, 4, 3, 8, 0, 5, 9, 7, 11];
  print(stalinSort(list)); // => [1, 2, 4, 8, 9, 11]
}
