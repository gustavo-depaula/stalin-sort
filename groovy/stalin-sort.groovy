def stalin_sort(alist) {

    int big = Integer.MIN_VALUE  // let big be minimum integer possible
    def blist = []

    alist.each {
        if( it >= big ) {
            big = it   // "it" , is the current element of list inside groovy "each" loop
            blist.add(it)
        }
    }

    return blist

}

def unsorted_list = [1, 2, 5, 3, 5, 7]

stalin_sorted_list = stalin_sort(unsorted_list)

println stalin_sorted_list
