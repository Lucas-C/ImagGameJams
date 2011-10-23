require("player")

hud = {}
hud.picSpring = love.graphics.newImage("assets/crosse.png")
hud.picCross = love.graphics.newImage("assets/crosse.png")
hud.picBasket = love.graphics.newImage("assets/crosse.png")
-- Image des Nombres
hud.picNombre = {}
for i = 0, 9 do
	hud.picNombre[i + 1] = love.graphics.newImage("assets/fonts/num_" .. i .. ".png")
end

hud.OFFSETX = 10
hud.SPRINGX = 0
hud.SPRINGY = 0
hud.SPRINGSCALE = 0.2
hud.CROSSSCALE = 0.2
hud.BASKETSCALE = 0.2
hud.CROSSX = hud.SPRINGX + 100
hud.CROSSY = 0
hud.BASKETX = hud.CROSSX + 100
hud.BASKETY = 0
hud.FONT = love.graphics.newFont(30)


 
function hud:draw()
	-- save graphics state
	r, g, b, a = love.graphics.getColor()
	previousFont = love.graphics.getFont()
	
	basex = 0
	basey = 30
	hud:drawAux(basex, basey)
	
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
	love.graphics.draw(hud.picSpring, basex + hud.BASKETX, basey + hud.BASKETY, 0, hud.BASKETSCALE, hud.BASKETSCALE)
	
	-- set new graphics state
	love.graphics.setColor(255, 255, 0, 255)
	love.graphics.setFont(hud.FONT)

	-- draw texts
	x = basex + hud.SPRINGX + hud.picSpring:getWidth() * hud.SPRINGSCALE + hud.OFFSETX
	y = basey + hud.SPRINGY
	love.graphics.print("x"..player.numSprings, x, y)
	
	x = basex + hud.CROSSX + hud.picCross:getWidth() * hud.CROSSSCALE + hud.OFFSETX
	y = basey + hud.CROSSY
	love.graphics.print("x"..player.numCrosses, x, y)
	
	x = basex + hud.BASKETX + hud.picBasket:getWidth() * hud.BASKETSCALE + hud.OFFSETX
	y = basey + hud.BASKETY
	love.graphics.print("x"..player.numBaskets, x, y)
end