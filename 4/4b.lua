function testnumber(i)
	twoAdjacentCt = 0
	multiAdjacentCt = 0
	neverDecreases = true
	digitBeforeLast = -1
	lastDigit = -1
	digits = tostring(i)
	for nidx=1, #digits do
		digit = tonumber(digits:sub(nidx,nidx))
		if (digit < lastDigit) then
			neverDecreases = false
			break
		elseif (digit == lastDigit and lastDigit == digitBeforeLast) then
			-- hack time :)
			if (twoAdjacentCt == 2 and multiAdjacentCt == 1) then
				break
			end
			multiAdjacentCt = multiAdjacentCt + 1
		elseif (digit == lastDigit) then
			twoAdjacentCt = twoAdjacentCt + 1
		end
		digitBeforeLast = lastDigit
		lastDigit = digit
	end
	if (#digits == 6 and neverDecreases and twoAdjacentCt > multiAdjacentCt) then
		return true
	else
		return false
	end
end

min = tonumber(arg[1])
max = tonumber(arg[2])
count = 0
for i=min,max do
	if (testnumber(i)) then
		count = count + 1
	end
end
print(count)
