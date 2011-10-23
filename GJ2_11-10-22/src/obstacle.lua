function getNewObstacle(oType, position)
	obstacle = {}
	obstacle.oType = oType
	obstacle.position = position 
	obstacle.sprite = nil
	if obstacle.oType == "h" then
		obstacle.sprite = love.graphics.newImage("assets/hurdle.png")
	end
	return obstacle
end