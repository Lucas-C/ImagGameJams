require("animation")


PLAYER_MIN_SPEED = 0
PLAYER_NORMAL_SPEED = 200
PLAYER_MAX_SPEED = 400

player = {}
player.x = 50
player.y = 50
player.line = 0
player.speed = PLAYER_NORMAL_SPEED
player.animation = nil
player.jumping = false
player.jumpTime = 0
player.jumpSound = love.audio.newSource("assets/jump.wav")

function player:load()
	player.animation = createAnimation()
	addPictureInAnimation(player.animation, love.graphics.newImage("assets/seriousjoe/seriousjoe1.png"), "normal")
	addPictureInAnimation(player.animation, love.graphics.newImage("assets/seriousjoe/seriousjoe2.png"), "normal")
	addPictureInAnimation(player.animation, love.graphics.newImage("assets/seriousjoe/seriousjoe3.png"), "normal")
	addPictureInAnimation(player.animation, love.graphics.newImage("assets/seriousjoe/seriousjoe2.png"), "normal")
	addPictureInAnimation(player.animation, love.graphics.newImage("assets/seriousjoe/seriousjoe1.png"), "jump")
	
	setAnimationState(player.animation, "normal")
end

function player:update(dt)
   updateAnimation(player.animation, dt)
   
   -- jump management
   if (love.timer.getMicroTime() - player.jumpTime) > 0.3 then
      player::stopJumping()
   end

   player.y = 130 + player.line * 70
   
   if player.jumping then
	   player.y = player.y - 40
	   setAnimationState(player.animation, "jump")
   end
	
	player.x = player.speed * dt + player.x
	
   if (player.x - camera.x) <= 0 then
      player.x = camera.x
      player.getSpeed("normal")
   elseif (player.x - camera.x) >= (800 - getAnimWidth(player.animation)) then
      player.x = camera.x + 800 - getAnimWidth(player.animation)
      player.getSpeed("normal")
   end
end

function player:draw()
	drawAnimation(player.animation, player.x, player.y)
end

function player:setSpeed(sType)

   if sType == "normal" then
      player.speed = PLAYER_NORMAL_SPEED
   elseif sType == "max" then
      player.speed = PLAYER_MAX_SPEED
   elseif sType == "min" then
      player.speed = PLAYER_MIN_SPEED
   end
   
   player.animation.frequency = player.speed / 50
   
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

function player:startJumping()
	player.jumping = true;
	player.jumpTime = love.timer.getMicroTime()
	love.audio.stop(player.jumpSound)
	love.audio.play(player.jumpSound)
end

function player:stopJumping()
   player.jumping = false
   setAnimationState(player.animation, "normal")
end
