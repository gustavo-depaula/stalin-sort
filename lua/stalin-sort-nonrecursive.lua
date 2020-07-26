function stalinsort(...)
	t, i = {...}, 1
	while t[i] and t[i + 1] do
		if t[i] > t[i + 1] then
			table.remove(t, i + 1)
		end

		i = i + 1
	end

	return t
end
