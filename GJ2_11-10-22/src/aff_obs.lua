require("level")
require("line")




function affiche_obstacles(level,min,max,i)
	if level==nil then print("Je suis nul.") end
	if level[i] ~= nil then
		affiche_obstacles_line(level[i],min,max,i)
	end
	
	
end
	
function affiche_obstacles_line(line,min, max,lineNumber)
	local obstacles = {}
	local i=1
	
	obstacles = getObstacles(line,min,max)
	while obstacles[i] ~= nil do
		affiche_obstacle(obstacles[i],lineNumber)
		i=i+1
	end
end

function affiche_obstacle(obstacle,lineNumber)
--[[
	local obstacle.sprite = nil
	if obstacle.oType = "h" then
		obstacle.sprite =
	end
--]]
	love.graphics.draw(love.graphics.newImage("assets/hurdle.png"), obstacle.position*70,80+(lineNumber)*70)
end
	
