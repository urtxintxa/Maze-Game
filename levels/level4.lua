--[Variables y Tablas]--

movimiento = false

player = {
	grid_x = 64,
	grid_y = 96,
	act_x = 64,
	act_y = 96,
	size_w = 32,
	size_h = 32,
	speed = 10,
	pos_x = 64,
	pos_y = 96
}

finish = {
	pos_x = 621.5,
	pos_y = 525.5,
	size_w = 5,
	size_h = 5
}

enemy1 = {
	pos_x = 320,
	pos_y = 416,
	size_w = 31,
	size_h = 32,
	status = true
}

enemy2 = {
	pos_x = 384,
	pos_y = 256,
	size_w = 32,
	size_h = 32,
}

enemy3 = {
	pos_x = 672,
	pos_y = 416,
	size_w = 32,
	size_h = 32,
	status = true
}

enemy4 = {
	pos_x = 512,
	pos_y = 224,
	size_w = 32,
	size_h = 32,
}

map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,0,1},
	{1,0,0,0,1,0,1,1,0,0,0,1,0,0,1,0,0,1,0,1,0,0,1},
	{1,0,1,0,0,0,1,1,0,1,1,1,0,1,1,0,0,1,0,1,0,0,1},
	{1,0,1,1,1,1,1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,1,0,0,1,0,1,0,0,1,0,0,1,1,1},
	{1,1,1,0,1,0,1,1,1,1,0,1,0,0,1,1,1,1,0,1,1,0,1},
	{1,1,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,1},
	{1,1,0,0,1,0,0,1,1,1,1,1,1,1,1,1,0,1,0,0,1,0,1},
	{1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1},
	{1,0,1,1,1,0,0,1,0,0,0,1,1,1,0,1,0,1,1,0,0,0,1},
	{1,0,1,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,1},
	{1,0,1,0,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,0,1,0,1},
	{1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
		
	player.pos_x = player.act_x
	player.pos_y = player.act_y
	
	if player.grid_y >= 352 then
		movimiento = true
	end	

	if movimiento == true then
		mover_objy(enemy1, 448, 384, 30 * dt)
		mover_objy(enemy2, 256, 224, 30 * dt)
		mover_objy(enemy3, 448, 384, 30 * dt)
		mover_objx(enemy4, 512, 416, 30 * dt)
	end
	
	if colision(player, enemy1) then
		player.grid_x = 64
		player.grid_y = 96
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy2) then
		player.grid_x = 64
		player.grid_y = 96
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy3) then
		player.grid_x = 64
		player.grid_y = 96
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy4) then
		player.grid_x = 64
		player.grid_y = 96
		hurt:play()
		hurt:rewind()
	end

	if colision(player, finish) then
		love.filesystem.load("levels/level5.lua")() 
	end
end

--Funcion Imprimir
function love.draw()
	love.graphics.setColor(playerc)
    love.graphics.rectangle("fill", player.act_x, player.act_y, player.size_w, player.size_h)
	
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", finish.pos_x, finish.pos_y, finish.size_w, finish.size_h)
	
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
				blanco = love.graphics.setColor(255, 255, 255)
                love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
            end
		end
	end
	
	love.graphics.setColor(255, 126, 0)
	love.graphics.rectangle("line", enemy1.pos_x, enemy1.pos_y, enemy1.size_w, enemy1.size_h)

	love.graphics.setColor(0, 255, 126)
	love.graphics.rectangle("line", enemy2.pos_x, enemy2.pos_y, enemy2.size_w, enemy2.size_h)

	love.graphics.setColor(127.5, 100, 127.5)
	love.graphics.rectangle("line", enemy3.pos_x, enemy3.pos_y, enemy3.size_w, enemy3.size_h)

	love.graphics.setColor(255, 100, 255)
	love.graphics.rectangle("line", enemy4.pos_x, enemy4.pos_y, enemy4.size_w, enemy4.size_h)
	
	
end

-- Funcion Tecla Pulsada
function love.keypressed(key) 
    if key == "up" then
        if testMap(0, -1) then
            player.grid_y = player.grid_y - 32
        end
    elseif key == "down" then
        if testMap(0, 1) then
            player.grid_y = player.grid_y + 32
        end
    elseif key == "left" then
        if testMap(-1, 0) then
            player.grid_x = player.grid_x - 32
        end
    elseif key == "right" then
        if testMap(1, 0) then
            player.grid_x = player.grid_x + 32
        end
    end
    
    if key == "escape" then
		love.filesystem.load("menus/menu1.lua")()    
    end
end 
