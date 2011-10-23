require("player")

hud = {}
hud.picSpring = love.graphics.newImage("assets/crosse.png")
hud.picCross = love.graphics.newImage("assets/crosse.png")
hud.picBasket = love.graphics.newImage("assets/crosse.png")
 
hud.OFFSETX = 10
hud.SPRINGX = 20
hud.SPRINGY = 20
hud.SPRINGSCALE = 0.2
hud.CROSSSCALE = 0.2
hud.BASKETSCALE = 0.2
hud.CROSSX = hud.SPRINGX + 100
hud.CROSSY = 20
hud.BASKETX = hud.CROSSX + 100
hud.BASKETY = 20
hud.FONT = love.graphics.newFont(30)

 
function hud:draw()
	love.graphics.draw(hud.picSpring, hud.SPRINGX, hud.SPRINGY, 0, hud.SPRINGSCALE, hud.SPRINGSCALE)
	love.graphics.draw(hud.picCross, hud.CROSSX, hud.CROSSY, 0, hud.CROSSSCALE, hud.CROSSSCALE)
	love.graphics.draw(hud.picSpring, hud.BASKETX, hud.BASKETY, 0, hud.BASKETSCALE, hud.BASKETSCALE)
	
	-- save graphics state
	r, g, b, a = love.graphics.getColor()
	previousFont = love.graphics.getFont()
	
	-- set new graphics state
	love.graphics.setColor(255, 255, 0, 255)
	love.graphics.setFont(hud.FONT)

	-- draw texts
	x = hud.SPRINGX + hud.picSpring:getWidth() * hud.SPRINGSCALE + hud.OFFSETX
	y = hud.SPRINGY
	love.graphics.print("x"..player.numSprings, x, y)
	
	x = hud.CROSSX + hud.picCross:getWidth() * hud.CROSSSCALE + hud.OFFSETX
	y = hud.CROSSY
	love.graphics.print("x"..player.numCrosses, x, y)
	
	x = hud.BASKETX + hud.picBasket:getWidth() * hud.BASKETSCALE + hud.OFFSETX
	y = hud.BASKETY
	love.graphics.print("x"..player.numBaskets, x, y)
	
	-- set previous graphics state
	love.graphics.setColor(r, g, b, a)
	love.graphics.setFont(previousFont)
end
