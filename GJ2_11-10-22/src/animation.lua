



function createAnimation()
	res = {}
	res.pictures = {}
	res.frame = 0
	res.frequency = 3
	addPictureInAnimation(res,  love.graphics.newImage("assets/seriousjoe/seriousjoe1.png"))
	addPictureInAnimation(res,  love.graphics.newImage("assets/seriousjoe/seriousjoe2.png"))
	addPictureInAnimation(res,  love.graphics.newImage("assets/seriousjoe/seriousjoe3.png"))
	addPictureInAnimation(res,  love.graphics.newImage("assets/seriousjoe/seriousjoe2.png"))
	return res
end

function addPictureInAnimation(animation, pic)
	table.insert(animation.pictures, pic)
end

function updateAnimation(animation, dt)
	animation.frame = animation.frame + animation.frequency * dt
end

function getCurrentPicAnimation(animation)
	a = animation
	n = table.getn(a.pictures)
	return a.pictures[1 + (math.floor(a.frame) % n) ]
end

function drawAnimation(animation, x, y)
	a = animation
	n = table.getn(a.pictures)
	love.graphics.draw(getCurrentPicAnimation(a), x, y)
end

function getAnimWidth(animation)
	return love.graphics.getWidth(getCurrentPicAnimation(animation))
end

function getAnimHeight(animation)
	return love.graphics.getHeight(getCurrentPicAnimation(animation))
end