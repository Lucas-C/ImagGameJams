
require("camera")
require("player")
require("fond")

camera.x = 0
camera.y = 0
speedCamera = 100

function love.load()
	player.sprite = love.graphics.newImage("assets/seriousjoe.png")
	fond.sprite = love.graphics.newImage("assets/Guillaume_masterpiece.png")
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

function love.keypress(key)
   if key == "up" then
      player.line = player.line + 1
   elseif key == "down" then
      player.line = player.line - 1
   end
   
   if key == "left" then
      player.acceleration("min")
   elseif key == "right" then
      player.acceleration("max")
   end
end

function love.keyreleased(key)
   if key == "left" or key == "right" then
      player.acceleration(false)
   end 
end
