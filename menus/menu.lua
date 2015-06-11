language = 1
menu3 = 1
playerc = {255, 246, 0}

function love.keypressed(key)
    if key == "up" then
		menu3 = menu3 - 1
		selec:play()
		selec:rewind()
	end
    if key == "down" then
		menu3 = menu3 + 1
		selec:play()
		selec:rewind()
	end	

	if menu3 == 1 and key == "return" then
		love.filesystem.load("menus/menu1.lua")()
		selection:play()
		selection:rewind()
	end
	
	if menu3 == 2 and key == "return" then
		love.filesystem.load("menus/menu1.lua")()
		selection:play()
		selection:rewind()
	end
	
	if menu3 == 3 and key == "return" then
		love.filesystem.load("menus/menu1.lua")()
		selection:play()
		selection:rewind()
	end
	
	if menu3 == 4 and key == "return" then
		love.filesystem.load("menus/menu1.lua")()
		selection:play()
		selection:rewind()
	end

end

function love.draw()

	love.graphics.setColor(255, 0, 0)
	love.graphics.draw(title, 250, 100)

	love.window.setTitle("Maze Game")
	
	love.graphics.setColor(0, 0, 255)
	if menu3 == 1 then
		love.graphics.setFont(font)
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 200)
		language = 1
	end
	love.graphics.print("Euskera", 320, 200)
	

	love.graphics.setColor(0, 0, 255)
	if menu3 == 2 then
		love.graphics.setFont(font)
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 300)
		language = 2
	end
	love.graphics.print("Catala", 320, 300)
	
	
	love.graphics.setColor(0, 0, 255)
	if menu3 == 3 then
		love.graphics.setFont(font)
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 400)
		language = 3
	end
	love.graphics.print("Castellano", 320, 400)

	love.graphics.setColor(0, 0, 255)	
	if menu3 == 4 then
		love.graphics.setFont(font)
		love.graphics.setColor(255, 0, 0)
		love.graphics.draw(cursor, 300, 500)
		language = 4
	end
	love.graphics.print("English", 320, 500)

end

function love.update()

	if language == 1 then
		play = "Jolastu"
		options = "Aukerak"
		exi = "Irten"
		lang = "Hizkuntza"
		musi = "Musika"
		colorplayer = "Jokalariaren kolorea"
	end

	if language == 4 then
		play = "Play"
		options = "Options"
		exi = "Exit"
		lang = "Language"
		musi = "Music"
		colorplayer = "Player color"
	end

	if language == 3 then
		play = "Jugar"
		options = "Opciones"
		exi = "Salir"
		lang = "Idioma"
		musi = "Musica"
		colorplayer = "Color del Jugador"
	end
	
	if language == 2 then
		play = "Jugar"
		options = "Opcions"
		exi = "Sortir"
		lang = "Llenguatge"
		musi = "Musica"
		colorplayer = "Color del Jugador"
	end

	if menu3 > 4 then
		menu3 = 1
	elseif menu3 < 1 then
		menu3= 4
	end
end
