{
    function stalin_sort(arr) {
        if (!array_length(arr)) {
            return [];
        }

        return array_reduce(arr, function(prev, next) {
            return (!array_length(prev) || next >= prev[array_length(prev) - 1]) ?
                array_concat(prev, [next]) : prev;
        }, []);
    }

    var test_cases = [
        [1, 2, 3, 4, 5],   // [1, 2, 3, 4, 5]
        [5, 4, 3, 2, 1],   // [5]
        [],                // []
        [2],               // [2]
        [1, 1],            // [1, 1]
        [2, 2, 2],         // [2, 2, 2]
        [1, 2, 5, 3, 4, 7] // [1, 2, 5, 7]
    ];
    for (var i = 0; i < array_length(test_cases); i++) {
        show_debug_message(stalin_sort(test_cases[i]));
    }
}
