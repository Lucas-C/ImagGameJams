
require("camera")
require("player")
require("fond")

camera.x = 0
camera.y = 0
speedCamera = 200

N_LINE = 6

function love.load()
	player.sprite = love.graphics.newImage("assets/seriousjoe/seriousjoe1.png")
	fond.sprite = love.graphics.newImage("assets/background.png")
end

function love.draw()
  camera:set()
  fond.draw()
  player.draw()
  camera:unset()
end

function love.update(dt)
  camera.x = camera.x + speedCamera * dt
  player:update(dt)
end

function love.keypressed(key)
   if key == "up" and player.getLine() > 0 then
      player:setLine("up")
   elseif key == "down" and player.getLine() < N_LINE then
      player:setLine("down")
   end
   
   if key == "left" then
      player:setSpeed("min")
   elseif key == "right" then
      player:setSpeed("max")
   end
   
   if key == " " and player.jumping == false then
      player.jumping = true;
      player.jumpTime = love.timer.getMicroTime()
   end
end

function love.keyreleased(key)
   if key == "left" and player:getSpeed() == "min" then
      player:setSpeed("normal")
   end

   if key == "right" and player:getSpeed() == "max" then
      player:setSpeed("normal");
   end 
end
