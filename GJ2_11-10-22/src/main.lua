
require("camera")
require("player")
require("background")
require("aff_obs")

music = love.audio.newSource("assets/music.wav")

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
  camera:set()
  background.draw()
  player.draw()
  for i = 0,5 do
	background.drawTrack(i)
	affiche_obstacles(level,math.floor(camera.x/72),math.floor((camera.x)/72+800/72),i+1)
	if (player.line == i) then
		player.draw()
	end
  end
--   love.graphics.draw(test_sprite, 800, 240)
  camera:unset()
end

function love.update(dt)
  camera.x = camera.x + speedCamera * dt
  player:update(dt)
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

   if key == " " and player.jumping == false then
      player:jump()
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
