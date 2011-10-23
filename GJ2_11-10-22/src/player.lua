player = {}
player.x = 50
player.y = 50
player.line = 0
player.speed = 100 -- to be changed
player.sprite = nil

function player:update(dt)
	player.y = 100 + player.line * 50
	player.x = player.speed * dt + player.x
end

function player:draw()
	love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1, 0, 0)
end
