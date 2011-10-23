background = {}
background.bleachers = {}
background.track = {}

function background.loadElement(e, filename)
	e.sprite = love.graphics.newImage(filename)
	e.size = {}
	e.size.y = e.sprite:getHeight()
	e.size.x = e.sprite:getWidth()
end

function background.load()
	background.loadElement(background.bleachers, "assets/bleachers.png")
	background.loadElement(background.track, "assets/track_empty.png")
end

function background.drawElementHoriz(e, posY)
	local repeatIndex = math.floor((camera.x + e.size.x) / e.size.x)
	love.graphics.draw(e.sprite, e.size.x * (repeatIndex - 1), posY)
	love.graphics.draw(e.sprite, e.size.x * repeatIndex, posY)
	love.graphics.draw(e.sprite, e.size.x * (repeatIndex + 1), posY)
end

function background.draw()
	background.drawElementHoriz(background.bleachers, 0);
	background.drawElementHoriz(background.track, 180);
	background.drawElementHoriz(background.track, 250);
	background.drawElementHoriz(background.track, 320);
	background.drawElementHoriz(background.track, 390);
	background.drawElementHoriz(background.track, 460);
	background.drawElementHoriz(background.track, 530);
end
