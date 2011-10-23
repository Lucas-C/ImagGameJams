-- Une line contient les obstacles

-- Renvoie les obstacles entre min et max.
function getObstacles(line,min, max)
	local index = 1
	local obstacles = {}
	for i = min, max do
		if line[i] ~= nil then 
		obstacles[index] = line[i]
		index = index + 1
		end
	end
	return obstacles
end


-- Ajoute l'obstacle à la ligne 
function addObstacle(line,obstacle)
	line[obstacle.position] = obstacle
end