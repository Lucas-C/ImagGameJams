function level:addLine(line)
	level:insert(line)
end

function level:importLevel(filename)
	if (love.filesystem.isFile(filename)) then
		exit(3)
	end
	
end

