player = {}
player.x = 0
player.y = 0
player.sprite = nil

function player:draw()
	love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1, 0, 0)
end