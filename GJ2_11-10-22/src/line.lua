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

function checkCollisions(line, min, max, player)
	obstacles = getObstacles(line, min, max)
	index = 1
	while obstacles[index] ~= nil do
		if collideWith(obstacles[index], player) then
			applyCollision(obstacles[index], player)
		end	
		index = index + 1
	end	
end 


-- Ajoute l'obstacle à la ligne 
function addObstacle(line,obstacle)
	line[obstacle.position] = obstacle
end