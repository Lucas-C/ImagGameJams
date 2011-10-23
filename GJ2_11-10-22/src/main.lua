
require("camera")
require("player")
require("background")
require("hud")
require("aff_obs")
require("use_obj")

music = love.audio.newSource("assets/sounds/music.wav")

music:setLooping(true)

pause = false;

camera.x = 0
camera.y = 0
speedCamera = 200
level={}
obstaclesEntreMinEtMax = {}
itemselected = nil
for i =1,6 do
obstaclesEntreMinEtMax[i]=nil
end

nextLevelIndex = 1

N_LINE = 6


function love.load()
-- 	test_sprite = love.graphics.newImage("assets/sand.png")
	player.load()
	background.load()
	--level=importLevel("levels/002.txt")
	initNextLevel()
	love.audio.play(music)
end

function love.deathDraw()
	camera:set()
	player.draw()
	camera:unset()
end

function love.pauseDraw()
	love.graphics.setColor(0, 0, 0, 150)
   love.graphics.rectangle("fill", 0, 0, 800, 600)
   love.graphics.setColor(255, 255, 255, 255)
   love.graphics.setFont(love.graphics.newFont(30))
   love.graphics.print("Pause", 360, 270)
end

function love.mainDraw()
	love.graphics.setColor(255, 255, 255, 255)
   camera:set()
   background.draw()
   hud.draw()
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
	camera:unset()
end

function love.draw()
	if (player.dead) then 
		love.deathDraw()
		-- need to die after a while
	elseif pause then
		love.mainDraw()
		love.pauseDraw()
	else
		love.mainDraw()
	end
end

function love.deathUpdate(dt)
	updateAnimation(player.animation, dt)
	love.audio.stop(music)
end

function love.mainUpdate(dt)
	if level[player.line+1] ~= nil then
		checkCollisions(obstaclesEntreMinEtMax[player.line+1])
	end

	camera.x = camera.x + speedCamera * dt
	player:update(dt)
	update_obstacles(obstaclesEntreMinEtMax,dt)
	if player.won then
		player.won = false;
		initNextLevel();
	end	
end

function love.update(dt)
	if player.dead then
		love.deathUpdate(dt)
	elseif not pause then
		love.mainUpdate(dt)
   end
end

function love.keypressed(key)
   if key == "escape" then
      love.event.push('q')
   end
	if key == "r" and player.dead then
		restart()
		player.dead = false;
		player.load()
	end
	if player.dead then
		return
	end
   if key == "up" and player.getLine() > 0 then
      player:setLine("up")
   elseif key == "down" and player.getLine() < ln - 1 then
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
   
   if key == "z" or key == "x" or key == "c" then
		select_objet(key) end

   if key == " " and player.jumping == false and (love.timer.getMicroTime() - player.jumpTime) > 0.6 then
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

function initNextLevel()
	print("levels/"..nextLevelIndex)
	level = importLevel("levels/"..nextLevelIndex..".lvl")
	nextLevelIndex = nextLevelIndex + 1
	camera.x = 0
	player.x = 0
	for i =1,6 do
		obstaclesEntreMinEtMax[i]=nil
	end
end

function restart()
	nextLevelIndex = 1
	print("levels/"..nextLevelIndex)
	level = importLevel("levels/"..nextLevelIndex..".lvl")
	nextLevelIndex = 2
	camera.x = 0
	player.x = 0
	for i =1,6 do
		obstaclesEntreMinEtMax[i]=nil
	end
end
