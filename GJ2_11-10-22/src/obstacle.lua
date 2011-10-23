function getNewObstacle(oType, position)
	obstacle = {}
	obstacle.oType = oType
	obstacle.position = position 
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