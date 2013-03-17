menu = 1

function love.keypressed(key)
    if key == "up" then
		menu = menu - 1
		selec:play()
		selec:rewind()
    elseif key == "down" then
		menu = menu + 1
		selec:play()
		selec:rewind()
	end	

	if menu == 1 and key == "return" then
		love.filesystem.load("levels/level1.lua")()
		selection:play()
		selection:rewind()
	end
	
	if menu == 2 and key == "return" then
		love.filesystem.load("menus/menu2.lua")()
		selection:play()
		selection:rewind()
	end
	
	if menu == 3 and key == "return" then
		love.event.push("quit")
	end
	
	if key == "escape" then
		love.filesystem.load("menus/menu.lua")()
		selection:play()
		selection:rewind()
	end
end

function love.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.draw(title, 250, 100)
	
	love.graphics.setColor(0, 0, 255)
	if menu == 1 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 200)
	end
	love.graphics.print(play, 320, 200)
	

	love.graphics.setColor(0, 0, 255)
	if menu == 2 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 300)
	end
	love.graphics.print(options, 320, 300)
	
	
	love.graphics.setColor(0, 0, 255)
	if menu == 3 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 400)
	end
	love.graphics.print(exi, 320, 400)


end

function love.update()

	if menu > 3 then
		menu = 1
	elseif menu < 1 then
		menu = 3
	end
	
end
