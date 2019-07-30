extension Sequence where Element: Comparable {
    public func stalinSort() -> [Element] {
        return stalinSort(initialResult: [] as [Element])
    }

    fileprivate func stalinSort<C>(initialResult: C) -> C
        where C: RangeReplaceableCollection, C: RandomAccessCollection,
        C.Element == Element {
        return reduce(into: initialResult, { (result, element) in
            if result.last.map({ $0 < element }) ?? true {
                result.append(element)
            }
        })
    }
}

extension RangeReplaceableCollection where Self: RandomAccessCollection, Element: Comparable {
    public mutating func stalinSorted() {
        self = stalinSort()
    }
    
    fileprivate func stalinSort() -> Self {
        return stalinSort(initialResult: Self())
    }
}
