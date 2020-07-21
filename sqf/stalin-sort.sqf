/*	
	Description:
	Sorts an array according to the stalin sort algorithm (https://github.com/gustavo-depaula/stalin-sort)
	
	Parameters:
	0: ARRAY - Numeric input array
	
	Returns:
	ARRAY - sorted input array
*/

private _stalinSort = {
	params [
		["_inputArr", [], [[]]]
	];	
	private _current = 0;
	private _resultArr = [];
	{
		if(_x >= _current) then {
			_current = _x;
			_resultArr pushBack _x;
		}
	} forEach _inputArr;
	_resultArr;	
};

{
	systemChat (_x select 1);
	systemChat str ([(_x select 0)] call _stalinSort);
} forEach [
	[[1, 2, 3, 4, 5, 6, 7, 8, 9], "Sorted array"],
	[[1, 0, 3, 4, 5, 8, 6, 7, 9], "Array with mixed numbers"],
	[[1, 1, 1, 1, 2, 2, 2, 3, 4], "Sorted array with repeats"],
	[[9, 8, 7, 6, 5, 4, 3, 2, 1], "Reversed array"]
];
