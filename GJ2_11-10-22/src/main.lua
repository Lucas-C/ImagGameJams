
require("camera")
require("player")
require("fond")

camera.x = 0
camera.y = 0
speedCamera = 100

function love.load()
	player.sprite = love.graphics.newImage("assets/Guillaume_masterpiece.png")
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
end

function love.keypress(key)
   if key == "up" then
      player.line = player.line + 1
   elseif key == "down" then
      player.line = player.line - 1
   elseif key == "left" then
      player.speed = 10
   elseif key == "right" then
      player.speed = 20
   end
end
