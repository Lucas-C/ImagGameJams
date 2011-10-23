
require("camera")
require("player")

camera.x = 0
camera.y = 0
speedCamera = 100

function love.load()
	player.sprite = love.graphics.newImage("assets/Guillaume_masterpiece.png")
end

function love.draw()
  camera:set()
  love.graphics.print("Hello World", 400, 300)
  player.draw()
  camera:unset()
end

function love.update(dt)
  camera.x = camera.x + speedCamera * dt
end


