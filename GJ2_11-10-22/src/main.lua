
require("camera")
require("player")

camera.x = 0
camera.y = 0
speedCamera = 100
positionFond = 1

function love.load()
	player.sprite = love.graphics.newImage("assets/Guillaume_masterpiece.png")
end

function love.draw()
  camera:set()
  positionFond = math.floor((camera.x+800)/800)
  love.graphics.print("Fond d'ecran", 800*(positionFond-1), 0)
  love.graphics.print("Fond d'ecran", 800*positionFond, 0)
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
   elseif key == "left" then
      player.speed = 10
   elseif key == "right" then
      player.speed = 20
   end
end
