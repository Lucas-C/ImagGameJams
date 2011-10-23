line = {}

-- Renvoie les obstacles entre min et max.
function line:getObstacles(min, max)
index = 0
obstacles = {}
for i = min, max do
if line.i ~= nil then
obstacles.index = line.i
index = index + 1
end

end
return obstacles
end

-- Ajoute l'obstacle à la ligne 
function line:addObstacle(obstacle)
line[obstacle.position] = obstacle
end