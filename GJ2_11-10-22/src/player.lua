PLAYER_MIN_SPEED = 50
PLAYER_NORMAL_SPEED = 100
PLAYER_MAX_SPEED = 150

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

function player:acceleration(aType)

   if aType == "false" then
      player.speed = PLAYER_NORMAL_SPEED
   elseif aType == "max" then
      player.speed = PLAYER_MAX_SPEED
   elseif aType == "min" then
      player.speed = PLAYER_MIN_SPEED
   end
end
