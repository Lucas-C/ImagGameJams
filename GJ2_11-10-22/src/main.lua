
require("camera")

camera.x = 0
camera.y = 0

function love.draw()
  camera:set()
  camera.x = camera.x + 1
  love.graphics.print("Hello World", 400, 300)
  camera:unset()
end

function love.update(dt)
end
