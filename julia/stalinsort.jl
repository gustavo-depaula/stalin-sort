# Stalin Sort

"""
A Julia implementation of the Stalin Sort algorithm.
Inspired by the Python implementation.

Elements that are out of order are eliminated.

Args:
    arr: An AbstractVector

Returns:
    Stalin sorted array.  
"""

function stalinsort(arr::AbstractVector)
    max_val = arr[1]

    function add_val(num)
        max_val = num
        return num
    end

    return [add_val(x) for x in arr if x >= max_val]
end


# Test examples

test1 = [1, 2, 3, 4, 5]
println("# unordered: $test1\n -> ordered: ", stalinsort(test1))

test2 = [10, 9, 8, 7, 2]
println("# unordered: $test2\n -> ordered: ", stalinsort(test2))

test3 = [1, 2, 3, 5, 4, 6]
println("# unordered: $test3\n -> ordered: ", stalinsort(test3))

test4 = [1, 2.4, 2.2, 3, 5, 4, 6]
println("# unordered: $test4\n -> ordered: ", stalinsort(test4))

test5 = rand(-10:10, 10)
println("# unordered: $test5\n -> ordered: ", stalinsort(test5))
