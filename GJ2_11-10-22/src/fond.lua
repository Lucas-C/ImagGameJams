fond = {}
fond.position = 1
fond.taille = {}
fond.taille.x = 724
fond.taille.y = 322
fond.sprite = nil

function fond:draw()
	fond.position = math.floor((camera.x+fond.taille.x)/fond.taille.x)
	love.graphics.draw(fond.sprite, fond.taille.x*(fond.position-1), 0)
	love.graphics.draw(fond.sprite, fond.taille.x*fond.position, 0)
end
