
require("camera")
require("player")
require("background")
require("hud")
require("aff_obs")

music = love.audio.newSource("assets/music.wav")

camera.x = 0
camera.y = 0
speedCamera = 200
level={}

N_LINE = 6

function love.load()
	player.load()
	background.load()
	level=importLevel("test.txt")
	love.audio.play(music)
end

function love.draw()
  camera:set()
  background.draw()
  player.draw()
  	   affiche_obstacles(level,math.floor(camera.x/72),math.floor((camera.x)/72+800/72))   
  for i = 0,6 do
	background.drawTrack(i)
	affiche_obstacles(level,math.floor(camera.x/72),math.floor((camera.x)/72+800/72),i+1)
	if (player.line == i) then
		player.draw()
	end
  end
  camera:unset()
  hud:draw()
end

function love.update(dt)
	camera.x = camera.x + speedCamera * dt
	player:update(dt)
	if level[player.line+1] ~= nil then
		checkCollisions(level[player.line+1],math.floor(camera.x/70),math.floor((camera.x)/70+800/70),player)
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

   if key == " " and player.jumping == false then
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
