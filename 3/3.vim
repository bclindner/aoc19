function s:DrawPath(lineid, line, grid)
	let cmdarr = split(a:line, ",")
	let idx = 0
	let x = 0
	let y = 0
	for cmd in cmdarr
		let dir = cmd[0]	
		let amt = str2nr(cmd[1:])
		while amt > 0
			if dir ==# "R"
					let x += 1
			elseif dir ==# "L"
					let x -= 1
			elseif dir ==# "U"
					let y += 1
			elseif dir ==# "D"
					let y -= 1
			endif

			let amt -= 1
			let idx += 1

			if has_key(a:grid, x) == 0
				let a:grid[x] = {}
			endif
			if has_key(a:grid[x], y) == 0
				let a:grid[x][y] = {}
			endif
			if has_key(a:grid[x][y], a:lineid) == 0
				let a:grid[x][y][a:lineid] = idx
			endif
		endwhile
	endfor
endfunction

function s:AOC3a(lineA, lineB)
	let grid = {}
	let apath = s:DrawPath("a", a:lineA, grid)
	let bpath = s:DrawPath("b", a:lineB, grid)
	let intersections = []
	for [xpos, row] in items(grid)
		for [ypos, column] in items(row)
			if has_key(column, "a") == 1 && has_key(column, "b") == 1
				call add(intersections, [xpos, ypos])
			endif
		endfor
	endfor
	let distances = []
	for ipos in intersections
			call add(distances, abs(ipos[0]) + abs(ipos[1]))
	endfor
	echo min(distances)
endfunction

function s:AOC3b(lineA, lineB)
	let grid = {}
	let apath = s:DrawPath("a", a:lineA, grid)
	let bpath = s:DrawPath("b", a:lineB, grid)
	let steptotals = []
	for [xpos, row] in items(grid)
		for [ypos, column] in items(row)
			if has_key(column, "a") == 1 && has_key(column, "b") == 1
				call add(steptotals, column["a"] + column["b"])
			endif
		endfor
	endfor
	echo min(steptotals)
endfunction

function s:AOC3aFromFile(filename)
	let lines = readfile(a:filename)
	call s:AOC3a(lines[0], lines[1])
endfunction

function s:AOC3bFromFile(filename)
	let lines = readfile(a:filename)
	call s:AOC3b(lines[0], lines[1])
endfunction

command -nargs=1 AOC3a call s:AOC3aFromFile(<f-args>)
command -nargs=1 AOC3b call s:AOC3bFromFile(<f-args>)
