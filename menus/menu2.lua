menu2 = 1

function love.keypressed(key)
    if key == "up" then
		menu2 = menu2 - 1
		selec:play()
		selec:rewind()
    elseif key == "down" then
		menu2 = menu2 + 1
		selec:play()
		selec:rewind()
	end	

	if key == "escape" then
		love.filesystem.load("menus/menu1.lua")()
		selection:play()
		selection:rewind()
	end
end

function love.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.draw(title, 250, 100)
	
	love.graphics.setColor(0, 0, 255)
	if menu2 == 1 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 200)
	end
	love.graphics.print(musi, 320, 200)
	
	
	love.graphics.setColor(0, 0, 255)
	if menu2 == 2 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 400)
	end
	love.graphics.print(colorplayer, 320, 400)


end

function love.update()

	if menu2 > 2 then
		menu2 = 1
	elseif menu2 < 1 then
		menu2 = 2
	end
end
