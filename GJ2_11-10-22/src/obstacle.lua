function getNewObstacle(oType, position)
	obstacle = {}
	obstacle.oType = oType
	obstacle.position = position 
	
	
	
	if obstacle.oType == "h" then
		obstacle.anim = false
		obstacle.image = love.graphics.newImage("assets/hurdle.png")
	elseif obstacle.oType == "p" then
		obstacle.anim = true
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
		and (obstacle.position + 1) * 70 - 60> player.x
		and not player.jumping
	else return false
	end
end

function applyCollision(obstacle, player)
	if (obstacle.actif == nil or obstacle.actif == true) then
		print("AIE ")
		obstacle.actif = false
	end
end