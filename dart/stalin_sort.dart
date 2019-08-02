List<T> stalinSort<T extends num>(List<T> list) {
  if (list.isEmpty) return <T>[];

  var x = list.first;
  return list
    ..removeWhere((value) {
      return (x = value >= x ? value : x) != value;
    });
}
