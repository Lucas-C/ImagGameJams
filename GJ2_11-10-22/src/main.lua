
require("camera")

camera.x = 0
camera.y = 0
speedCamera = 100
positionFond = 1

function love.draw()
  camera:set()
  positionFond = math.floor((camera.x+800)/800)
  love.graphics.print("Fond d'ecran", 800*(positionFond-1), 300)
  love.graphics.print("Fond d'ecran", 800*positionFond, 300)
  camera:unset()
end

function love.update(dt)
  camera.x = camera.x + speedCamera * dt
end
