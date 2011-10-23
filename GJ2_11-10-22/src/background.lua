background = {}
background.bleachers = {}
background.track = {}
background.track.pos_first = 180
background.track.height = 70
background.track.posX = {}

function background.loadElement(e, filename)
	e.sprite = love.graphics.newImage(filename)
	e.size = {}
	e.size.y = e.sprite:getHeight()
	e.size.x = e.sprite:getWidth()
end

function background.load()
	background.loadElement(background.bleachers, "assets/bleachers.png")
	background.loadElement(background.track, "assets/track_empty.png")
	for i = 0,6 do
		background.track.posX[i] = math.random(800)
	end
end

function background.drawElementHoriz(e, posX, posY)
	local repeatIndex = math.floor((camera.x + e.size.x) / e.size.x)
	love.graphics.draw(e.sprite, posX + e.size.x * (repeatIndex - 2), posY)
	love.graphics.draw(e.sprite, posX + e.size.x * (repeatIndex - 1), posY)
	love.graphics.draw(e.sprite, posX + e.size.x * repeatIndex, posY)
end

function background.draw()
	background.drawElementHoriz(background.bleachers, 0, 0)
end

function background.drawTrack(i)
	background.drawElementHoriz(background.track, background.track.posX[i], background.track.pos_first + i * background.track.height)
end
