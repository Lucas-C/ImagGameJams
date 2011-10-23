PLAYER_MIN_SPEED = 10
PLAYER_NORMAL_SPEED = 20
PLAYER_MAX_SPEED = 30

player = {}
player.x = 0
player.y = 0
player.line = 0
player.speed = PLAYER_NORMAL_SPEED
player.sprite = nil

function player:draw()
	love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1, 0, 0)
end

function player:acceleration(aType)
   if aType == false then
      player.speed = PLAYER_NORMAL_SPEED
   elseif aType == "max" then
      player.speed = PLAYER_MAX_SPEED
   elseif aType == "min" then
      player.speed = PLAYER_MIN_SPEED
   end
end
