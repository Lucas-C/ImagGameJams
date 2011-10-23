function getNewObstacle(oType, position)
	local obstacle = {}
	obstacle.oType = oType
	obstacle.position = position

	if obstacle.oType == "h" then
		obstacle.anim = false
		obstacle.yOffset = 0
		obstacle.image = love.graphics.newImage("assets/hurdle.png")
	elseif obstacle.oType == "w" then
		obstacle.anim = false
		obstacle.yOffset = -30
		obstacle.image = love.graphics.newImage("assets/wall.png")
	elseif obstacle.oType == "s" then
		obstacle.anim = false
		obstacle.yOffset = 25
		obstacle.image = love.graphics.newImage("assets/sand.png")
	elseif obstacle.oType == "p" then
		obstacle.anim = true
		obstacle.yOffset = 0
		obstacle.animation = createAnimation()
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/punching_ball/pb0001.png"), "normal")
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/punching_ball/pb0002.png"), "normal")
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/punching_ball/pb0003.png"), "normal")
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/punching_ball/pb0002.png"), "normal")
		setAnimationState(obstacle.animation, "normal")
	end
	return obstacle
end

function collideWith(obstacle, player)
	if obstacle.oType == "h" then
		return (obstacle.position) * 70  < player.x
		and obstacle.position * 70 + 10 > player.x
		and not player.jumping
	elseif obstacle.oType == "w" then
		return (obstacle.position) * 70  < player.x
		and obstacle.position * 70 + 10 > player.x
	elseif obstacle.oType == "s" then
		return (obstacle.position) * 70 - 175  < player.x
		and obstacle.position * 70 + 150 > player.x
	else return false
	end
end

function applyCollision(obstacle, player)
	if (obstacle.actif == nil or obstacle.actif == true) then
		print("AIE ")
		obstacle.actif = false
	end
end
