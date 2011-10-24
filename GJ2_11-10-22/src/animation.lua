



function createAnimation()
	res = {}
	res.pictures = {}
	res.frame = 0
	res.frequency = 5
	res.state = nil
	res.yOffset = 0
	return res
end

function setAnimationState(animation, state)
	animation.state = state
end

function setAnimationFrequency(animation, frequency)
	animation.frequency = frequency
end

function addPictureInAnimation(animation, pic, state)
	if (animation.pictures[state] == nil) then
		animation.pictures[state] = {}
	end
	table.insert(animation.pictures[state], pic)
end

function makeDirectoryAnimationForObstacles(obstacle,dossier,name,nombre,status)
		local nbs =""
		for k = 1,nombre do
		if k<10 then nbs = "0"..k
		else nbs= ""..k end
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/"..dossier.."/"..name.."00"..nbs..".png"), status)
		end
		for k = nombre-1,2 do
		if k<10 then nbs = "0"..k
		else nbs= ""..k end
		addPictureInAnimation(obstacle.animation, love.graphics.newImage("assets/"..dossier.."/"..name.."00"..nbs..".png"), status)
		end
end

function updateAnimation(animation, dt)
	animation.frame = animation.frame + animation.frequency * dt
end

function getCurrentPicAnimation(animation)
	a = animation
	n = table.getn(a.pictures[animation.state])
	return a.pictures[animation.state][1 + (math.floor(a.frame) % n) ]
end

function drawAnimation(animation, x, y)
	a = animation
	love.graphics.draw(getCurrentPicAnimation(a), x, y + a.yOffset)
end

function getAnimWidth(animation)
	return getCurrentPicAnimation(animation):getWidth()
end

function getAnimHeight(animation)
	return getCurrentPicAnimation(animation):getHeight()
end
