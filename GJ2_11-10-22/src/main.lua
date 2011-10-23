
require("camera")
require("player")
require("background")
require("hud")
require("aff_obs")

music = love.audio.newSource("assets/sounds/music.wav")
music = love.audio.newSource("assets/sounds/music.wav")
music:setLooping(true)

pause = false;

camera.x = 0
camera.y = 0
speedCamera = 200
level={}
obstaclesEntreMinEtMax = {}
for i =1,6 do
obstaclesEntreMinEtMax[i]=nil
end

N_LINE = 6

function love.load()
-- 	test_sprite = love.graphics.newImage("assets/sand.png")
	player.load()
	background.load()
	level=importLevel("test.txt")
	love.audio.play(music)
end

function love.draw()
	if (player.dead) then 
		camera:set()
		player.draw()
		camera:unset()
		return
	end
   love.graphics.setColor(255, 255, 255, 255)
   camera:set()
   background.draw()
   hud.draw()
   player.draw()
   for i = 0,5 do
      background.drawTrack(i)
      obstaclesEntreMinEtMax[i+1]=obstacles_entre_min_et_max_ligne_i(level,obstaclesEntreMinEtMax[i+1],math.floor(math.max(camera.x - 300, 0) / 70), math.floor((camera.x + 1000) / 70),i+1)
      obstaclesEntreMinEtMax[i+1]=obstacles_entre_min_et_max_ligne_i(level,obstaclesEntreMinEtMax[i+1],math.floor(camera.x/70),math.floor((camera.x)/70+1000/70),i+1)
	  if obstaclesEntreMinEtMax[i+1] ~= nil then
		affiche_obstacles_ligne(obstaclesEntreMinEtMax[i+1],i+1)
	  end
      if (player.line == i) then
	      player.draw()
      end

   end

   --   love.graphics.draw(test_sprite, 800, 240)
   camera:unset()
   --hud:draw()
   
   if pause then
      love.graphics.setColor(0, 0, 0, 150)
      love.graphics.rectangle("fill", 0, 0, 800, 600)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.setFont(love.graphics.newFont(30))
      love.graphics.print("Pause", 360, 270)
   end
end

function love.update(dt)
	if player.dead then
		updateAnimation(player.animation, dt)
	elseif not pause then
		if level[player.line+1] ~= nil then
			checkCollisions(level[player.line+1],math.floor(camera.x/70),math.floor((camera.x)/70+800/70),player,obstaclesEntreMinEtMax[player.line+1])
		end

		camera.x = camera.x + speedCamera * dt
		player:update(dt)
		update_obstacles(obstaclesEntreMinEtMax,dt)
   end
end

function love.keypressed(key)
   if key == "escape" then
      love.event.push('q')
   end
	if player.dead then
		return
	end
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
