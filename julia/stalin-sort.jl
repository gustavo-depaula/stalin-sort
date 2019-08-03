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

    if isempty(arr)
        return []
    end

    max_val = arr[1]

    function add_val(num)
        max_val = num
        return num
    end

    return [add_val(x) for x in arr if x >= max_val]
end


# Test examples

#  unordered: [1, 2, 3, 4, 5]
# -> ordered: [1, 2, 3, 4, 5]
test1 = [1, 2, 3, 4, 5]
println("# unordered: $test1\n -> ordered: ", stalinsort(test1))

#  unordered: [10, 9, 8, 7, 2]
# -> ordered: [10]
test2 = [10, 9, 8, 7, 2]
println("# unordered: $test2\n -> ordered: ", stalinsort(test2))

# unordered: [1, 2, 3, 5, 4, 6]
#-> ordered: [1, 2, 3, 5, 6]
test3 = [1, 2, 3, 5, 4, 6]
println("# unordered: $test3\n -> ordered: ", stalinsort(test3))

#  unordered: [1.0, 2.4, 2.2, 3.0, 5.0, 4.0, 6.0]
# -> ordered: [1.0, 2.4, 3.0, 5.0, 6.0]
test4 = [1, 2.4, 2.2, 3, 5, 4, 6]
println("# unordered: $test4\n -> ordered: ", stalinsort(test4))

#  unordered: [-9, 6, 4, 10, -10, -5, 1, 8, -5, 10]
# -> ordered: [-9, 6, 10, 10]
test5 = rand(-10:10, 10)
println("# unordered: $test5\n -> ordered: ", stalinsort(test5))

#  unordered: [1, 2, 2, 5, 4, 5, 3, 7]
# -> ordered: [1, 2, 2, 5, 5, 7]
test6 = [1, 2, 2, 5, 4, 5, 3, 7]
println("# unordered: $test6\n -> ordered: ", stalinsort(test6))