background = {}
background.bleachers = {}
background.track = {}
background.track.pos_first = 180
background.track.height = 70


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
end

function background.drawTrack(i)
	background.drawElementHoriz(background.track, background.track.pos_first + i * background.track.height);
end
