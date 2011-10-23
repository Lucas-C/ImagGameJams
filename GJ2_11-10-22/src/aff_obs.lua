require("level")
require("line")




function affiche_obstacles(level,min,max)
	local i=1
	if level==nil then print("Je suis nul.") end
	while level[i] ~= nil do
		affiche_obstacles_line(level[i],min,max,i)
		i=i+1
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
	love.graphics.draw(love.graphics.newImage("assets/seriousjoe/seriousjoe2.png"), obstacle.position*72,50+(lineNumber)*72)
end
	
