min = tonumber(arg[1])
max = tonumber(arg[2])

count = 0
for i=min,max do
	hasAdjacent = false
	neverDecreases = true
	lastdigit = 0
	digits = tostring(i)
	for nidx=1, #digits do
		digit = tonumber(digits:sub(nidx,nidx))
		if (digit < lastdigit) then
			neverDecreases = false
			break
		elseif (digit == lastdigit) then
			hasAdjacent = true
		end
		lastdigit = digit
	end
	if (#digits == 6 and hasAdjacent and neverDecreases) then
		count = count + 1
	end
end
print(count)
