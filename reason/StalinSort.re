/* Author Bill Wood */
let rec stalinSort = fun
  | [] => []
  | [x] => [x]
  | [x, y, ...tail] => x <= y ? [x, ...stalinSort([y, ...tail])] : stalinSort([x, ...tail]);

Js.log(stalinSort([1,2,3,2,5,8,4,9]));
Js.log(stalinSort(["a","b","c","b","e","g","d","x"]));
Js.log(stalinSort([
		"Fully Automated Luxury Space Communism",
        "Socialism",
        "Capitalism",
        "Communism"]));
