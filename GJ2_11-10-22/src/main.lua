
require("camera")
require("player")
require("background")
require("hud")
require("aff_obs")

music = love.audio.newSource("assets/sounds/music.wav")

pause = false;

camera.x = 0
camera.y = 0
speedCamera = 200
level={}

N_LINE = 6

function love.load()
-- 	test_sprite = love.graphics.newImage("assets/sand.png")
	player.load()
	background.load()
	level=importLevel("test.txt")
	love.audio.play(music)
end

function love.draw()
   love.graphics.setColor(255, 255, 255, 255)
   camera:set()
   background.draw()
   player.draw()
   for i = 0,5 do
      background.drawTrack(i)
      affiche_obstacles(level,math.floor(camera.x/70),math.floor((camera.x)/70+1000/70),i+1)
      if (player.line == i) then
	      player.draw()
      end
   end

   --   love.graphics.draw(test_sprite, 800, 240)
   camera:unset()
   hud:draw()
   
   if pause then
      love.graphics.setColor(0, 0, 0, 150)
      love.graphics.rectangle("fill", 0, 0, 800, 600)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.setFont(love.graphics.newFont(30))
      love.graphics.print("Pause", 360, 270)
   end
end

function love.update(dt)
   if not pause then
      camera.x = camera.x + speedCamera * dt
      player:update(dt)
   end
end

function love.keypressed(key)
   if key == "up" and player.getLine() > 0 then
      player:setLine("up")
   elseif key == "down" and player.getLine() < N_LINE - 1 then
      player:setLine("down")
   end

   if key == "left" then
      player:setSpeed("min")
   elseif key == "right" then
      player:setSpeed("max")
   end
   	
   if key == "p" and not pause then
      pause = true;
   elseif key == "p" and pause then
      pause = false;
   end
   
   if key == "escape" then
      love.event.push('q')
   end

   if key == " " and player.jumping == false and (love.timer.getMicroTime() - player.jumpTime) > 0.8 then
      player:startJumping()
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
