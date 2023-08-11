fun <T : Comparable<T>> Iterable<T>.stalinSorted(): List<T> =
    if (none()) emptyList()
    else {
        var previous = first()
        filter { next ->
            if (next >= previous) true.also { previous = next }
            else false
        }
    }

fun <T : Comparable<T>> MutableIterable<T>.stalinSort() {
    val it = iterator()
    if (!it.hasNext()) return
    var previous = it.next()
    var curr: T
    while (it.hasNext()) {
        curr = it.next()
        if (curr < previous) it.remove()
        else previous = curr
    }
}

fun <T : Comparable<T>> Iterable<T>.sortComrades(): List<T> {
    var previous = firstOrNull() ?: return emptyList()
    return mapNotNull { comrade ->
        if (comrade >= previous) {
            previous = comrade
            comrade
        } else {
            null
        }
    }
}
