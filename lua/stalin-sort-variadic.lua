function stalinsort(...)
	if select('#', ...) < 2 then return ... end
	local t = {...}
	if t[1] <= t[2] then
		return t[1], stalinsort(table.unpack(t, 2))
	else
		t[2] = t[1]
		return stalinsort(table.unpack(t, 2))
	end
end
