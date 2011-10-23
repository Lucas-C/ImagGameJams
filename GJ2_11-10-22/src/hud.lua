require("player")

hud = {}
hud.picSpring = love.graphics.newImage("assets/doinkdoink.png")
hud.picCross = love.graphics.newImage("assets/crosse.png")
hud.picBasket = love.graphics.newImage("assets/baskets.png")
-- Image des Nombres
hud.picFontNombre = {}
for i = 0, 9 do
	hud.picFontNombre[i + 1] = love.graphics.newImage("assets/fonts/num_" .. i .. ".png")
end
hud.SPRINGSCALE = 0.2
hud.CROSSSCALE = 0.2
hud.BASKETSCALE = 0.2
hud.OFFSETX = 15
hud.SPRINGX = 15
hud.CROSSX = hud.SPRINGX + 100
hud.BASKETX = 15
hud.SPRINGY = 5
hud.CROSSY = 5
hud.BASKETY = 40
hud.FONT = love.graphics.newFont(30)

function hud:printNombre(nombre, x, y)
	love.graphics.draw(hud.picFontNombre[nombre + 1], x, y)
end
 
function hud:draw()
	-- save graphics state
	r, g, b, a = love.graphics.getColor()
	previousFont = love.graphics.getFont()
	
	basex = 450
	basey = 80
	hud:drawAux((basex - camera.x) % background.bleachers.sprite:getWidth() - background.bleachers.sprite:getWidth(), basey)
	hud:drawAux((basex - camera.x) % background.bleachers.sprite:getWidth(), basey)
	
	-- set previous graphics state
	love.graphics.setColor(r, g, b, a)
	love.graphics.setFont(previousFont)
end

function hud:drawAux(basex, basey)

	-- set new graphics state
	love.graphics.setColor(255, 255, 0, 255)

	-- w = (hud.BASKETX + hud.picBasket:getWidth() * hud.BASKETSCALE - hud.SPRINGX
	-- love.graphics.rectangle("fill", hud.SPRINGX - hud.OFFSETX, hud.SPRINGY - hud.OFFSETY, 
							-- getScaled(, height )
	
	-- set previous graphics state
	love.graphics.setColor(r, g, b, a)

	love.graphics.draw(hud.picSpring, basex + hud.SPRINGX, basey + hud.SPRINGY, 0, hud.SPRINGSCALE, hud.SPRINGSCALE)
	love.graphics.draw(hud.picCross, basex + hud.CROSSX, basey + hud.CROSSY, 0, hud.CROSSSCALE, hud.CROSSSCALE)
	love.graphics.draw(hud.picBasket, basex + hud.BASKETX, basey + hud.BASKETY, 0, hud.BASKETSCALE, hud.BASKETSCALE)
	
	-- set new graphics state
	love.graphics.setColor(255, 255, 0, 255)
	love.graphics.setFont(hud.FONT)

	-- draw texts
	x = basex + hud.SPRINGX + hud.picSpring:getWidth() * hud.SPRINGSCALE + hud.OFFSETX
	y = basey + hud.SPRINGY
	hud:printNombre(player.numSprings, x, y)
	--love.graphics.print("x"..player.numSprings, x, y)
	
	x = basex + hud.CROSSX + hud.picCross:getWidth() * hud.CROSSSCALE + hud.OFFSETX
	y = basey + hud.CROSSY
	hud:printNombre(player.numCrosses, x, y)
	--love.graphics.print("x"..player.numCrosses, x, y)
	
	x = basex + hud.BASKETX + hud.picBasket:getWidth() * hud.BASKETSCALE + hud.OFFSETX + 13
	y = basey + hud.BASKETY 
	hud:printNombre(player.numBaskets, x, y)
	--love.graphics.print("x"..player.numBaskets, x, y)
end