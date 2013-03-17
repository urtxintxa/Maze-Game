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
	pos_x = 525.5,
	pos_y = 461.5,
	size_w = 5,
	size_h = 5
}

enemy1 = {
	pos_x = 544,
	pos_y = 224,
	size_w = 31,
	size_h = 32,
	status = true
}

enemy2 = {
	pos_x = 352,
	pos_y = 448,
	size_w = 32,
	size_h = 32
}

enemy3 = {
	pos_x = 640,
	pos_y = 416,
	size_w = 32,
	size_h  = 31
}


map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,1},
	{1,0,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,0,1,0,1,1,1},
	{1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,1,1,0,1,0,0,0,1},
	{1,1,1,0,1,0,1,1,1,1,1,0,1,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,1,1,1,0,1},
	{1,0,1,1,1,1,1,1,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1},
	{1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,1,0,1,0,0,1,0,1},
	{1,0,1,0,1,1,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1},
	{1,1,1,0,1,0,1,0,0,0,1,0,1,1,1,0,1,1,0,1,0,1,1},
	{1,0,0,0,0,0,1,1,1,1,1,0,1,0,0,0,1,0,0,0,0,1,1},
	{1,0,0,1,1,1,1,0,1,0,0,0,1,0,1,1,1,0,1,0,0,0,1},
	{1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
		
	player.pos_x = player.act_x
	player.pos_y = player.act_y
	
	if player.grid_y >= 192 then
		movimiento = true
	end
	
	if movimiento == true then
		mover_objy(enemy1, 288, 192, 30 * dt)
		mover_objy(enemy2, 448, 416, 30 * dt)
		mover_objx(enemy3, 704, 640, 30 * dt)
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
	
	if colision(player, finish) then
		love.filesystem.load("levels/level4.lua")() 
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
	
	love.graphics.setColor(255, 255, 0)
	love.graphics.rectangle("line", enemy1.pos_x, enemy1.pos_y, enemy1.size_w, enemy1.size_h)
	
	love.graphics.setColor(255, 0, 255)
	love.graphics.rectangle("line", enemy2.pos_x, enemy2.pos_y, enemy2.size_w, enemy2.size_h)
	
	love.graphics.setColor(127.5, 0, 127.5)
	love.graphics.rectangle("line", enemy3.pos_x, enemy3.pos_y, enemy3.size_w, enemy3.size_h)
	
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
