
require("camera")

camera.x = 0
camera.y = 0
speedCamera = 100

function love.draw()
  camera:set()
  love.graphics.print("Hello World", 400, 300)
  camera:unset()
end

function love.update(dt)
  camera.x = camera.x + speedCamera * dt
end
