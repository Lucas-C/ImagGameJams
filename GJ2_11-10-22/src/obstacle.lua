function getNewObstacle(oType, position)
	obstacle = {}
	obstacle.oType = oType
	obstacle.position = position 
	return obstacle
end

function collideWith(obstacle, playerPos)
	return obstacle.position * 72 < playerPos and (obstacle.position + 1) * 72 > playerPos
end