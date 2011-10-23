function aff_obs:affiche_obstacles(min,max)
	local level={}
	local i=1
	level=importLevel("test.txt")
	
	while level.i ~= nil do
		affiche_obstacles_line(level.i,min,max)
	end
	
	
end
	
function aff_obs:affiche_obstacles_line(line,min, max,lineNumber)
	local obstacles = {}
	obstacles = line:getObstacles(min,max)
	while obstacles.i ~= nil do
		affiche_obstacle(obstacles.i,lineNumber)
	end
end

function aff_obs:affiche_obstacle(obstacle,lineNumber)
	local obstacle.sprite = nil
	if obstacle.oType = "h" then
		obstacle.sprite = love.graphics.newImage("assets\seriousjoe2.png");
	end
	
	love.graphics.draw(obstacle.sprite, obstacle.position*50,600-lineNumber*50)
end
	
