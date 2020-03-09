stalinSort(List<num> l) => l.fold(0, (l, e) => l == 0 ? [e] : (e < l.last ? l : [...l, e]));
