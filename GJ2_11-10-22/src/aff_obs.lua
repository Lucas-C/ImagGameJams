require("level")
require("line")




function obstacles_entre_min_et_max_ligne_i(level,min,max,i)
	if level==nil then print("Je suis nul.") end
	if level[i] ~= nil then
		return getObstacles(level[i],min,max)
	else
		return nil
	end
end

function affiche_obstacles_ligne(obstacles,lineNumber)
	local i=1
	while obstacles[i] ~= nil do
		affiche_obstacle(obstacles[i],lineNumber)
		i=i+1
	end
end

function update_obstacles(obstacles,dt)
	local i=0
	while obstacles[i] ~= nil do
		if obstacle.anim then
		updateAnimation(obstacle.animation,dt)
		end
	end


end

function affiche_obstacle(obstacle,lineNumber)
	if obstacle.anim then
		drawAnimation(obstacle.animation, obstacle.position * 70 + 35 - obstacle.image:getWidth() / 2, obstacle.yOffset + (lineNumber + 1) * 70)
	else
		love.graphics.draw(obstacle.image, obstacle.position * 70 + 35 - obstacle.image:getWidth() / 2, obstacle.yOffset + (lineNumber + 1) * 70)
	end
end

