PLAYER_MIN_SPEED = 0
PLAYER_NORMAL_SPEED = 100
PLAYER_MAX_SPEED = 250

player = {}
player.x = 50
player.y = 50
player.line = 0
player.speed = PLAYER_NORMAL_SPEED
player.sprite = nil

function player:update(dt)
	player.y = 100 + player.line * 50
	player.x = player.speed * dt + player.x
end

function player:draw()
	love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1, 0, 0)
end

function player:setSpeed(sType)

   if sType == "normal" then
      player.speed = PLAYER_NORMAL_SPEED
   elseif sType == "max" then
      player.speed = PLAYER_MAX_SPEED
   elseif sType == "min" then
      player.speed = PLAYER_MIN_SPEED
   end
   
end

function player:getSpeed()

   if player.speed == PLAYER_NORMAL_SPEED then
      return "normal"
   elseif player.speed == PLAYER_MAX_SPEED then
      return "max"
   elseif player.speed == PLAYER_MIN_SPEED then
      return "min"
   end
   
end

function player:setLine(lType)

   if lType == "up" then
      player.line = player.line - 1
   elseif lType == "down" then
      player.line = player.line + 1
   end

end

function player:getLine()
   return player.line;
end
