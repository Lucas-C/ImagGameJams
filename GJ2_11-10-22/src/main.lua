
require("camera")
require("player")

camera.x = 0
camera.y = 0
speedCamera = 100

function love.load()
player.sprite = love.graphics.rectangle( "fill", 0, 0, 20, 20 )
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


