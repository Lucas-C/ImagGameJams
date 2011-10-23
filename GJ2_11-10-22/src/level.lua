function level:addLine(line)
	level:insert(line)
end

function level:importLevel(filename)
	level = {}
	if (love.filesystem.isFile(filename)) then
		exit(3)
	end
	contents = love.filesystem.read(filename)
	local ln = contents:sub(1, 1)
	local d = 0
	local cl = 0
	for i = 2, #contents do
		local c = contents:sub(i, i)
		if c == "\n" then
			d = i
			break
		end
	end
	local sums = {}
	for i = d+1, #contents do
		local c = contents:sub(i, i)
		if c == "\n" then
			cl = (cl + 1) % ln
		else 
			sums[cl+1] = sums[cl+1] + 1
			if c == "h" then
				obstacle:getNew("h", sums[cl+1])
				level[cl+1]:addObstacle(obstacle)
		end
	end	
end

