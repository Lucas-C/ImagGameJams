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
hud.CROSSX = 150
hud.CROSSY = 20
hud.BASKETX = 250
hud.BASKETY = 20
 
function hud:draw()
	love.graphics.draw(hud.picSpring, hud.SPRINGX, hud.SPRINGY, 0, hud.SPRINGSCALE, hud.SPRINGSCALE)
	love.graphics.draw(hud.picCross, hud.CROSSX, hud.CROSSY, 0, hud.CROSSSCALE, hud.CROSSSCALE)
	love.graphics.draw(hud.picSpring, hud.BASKETX, hud.BASKETY, 0, hud.BASKETSCALE, hud.BASKETSCALE)
	
	x = hud.SPRINGX + hud.picSpring:getWidth() * hud.SPRINGSCALE + hud.OFFSETX
	y = hud.SPRINGY
	love.graphics.print(player.numSprings, x, y)
	
	x = hud.CROSSX + hud.picCross:getWidth() * hud.CROSSSCALE + hud.OFFSETX
	y = hud.CROSSY
	love.graphics.print(player.numCrosses, x, y)
	
	x = hud.BASKETX + hud.picBasket:getWidth() * hud.BASKETSCALE + hud.OFFSETX
	y = hud.BASKETY
	love.graphics.print(player.numBaskets, x, y)
end
