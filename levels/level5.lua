--[Variables y Tablas]--

movimiento = false

player = {
	grid_x = 64,
	grid_y = 512,
	act_x = 64,
	act_y = 512,
	size_w = 32,
	size_h = 32,
	speed = 10,
	pos_x = 64,
	pos_y = 512
}

finish = {
	pos_x = 722.5,
	pos_y = 301.5,
	size_w = 5,
	size_h = 5
}

enemy1 = {
	pos_x = 352,
	pos_y = 193,
	size_w = 31,
	size_h = 30,
	status = false
}

enemy2 = {
	pos_x = 416,
	pos_y = 225,
	size_w = 31,
	size_h = 31,
	status = true
}

enemy3 = {
	pos_x = 448,
	pos_y = 384,
	size_w = 31,
	size_h = 31,
	status = true
}

enemy4 = {
	pos_x = 577,
	pos_y = 192,
	size_w = 30,
	size_h = 31,
	status = true
}

enemy5 = {
	pos_x = 673,
	pos_y = 192,
	size_w = 30,
	size_h = 31,
	status = false
}

map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1},
	{1,1,0,1,1,1,1,1,0,1,0,0,1,0,1,1,1,1,1,1,1,0,1},
	{1,0,0,0,0,1,0,1,0,1,1,1,1,0,1,0,0,0,0,0,0,0,1},
	{1,1,1,1,0,1,0,1,0,0,0,0,0,0,1,1,0,0,1,1,0,0,1},
	{1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1},
	{1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1},
	{1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1},
	{1,0,1,1,1,1,0,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,1},
	{1,0,1,0,0,0,0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1},
	{1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,0,0,1,0,0,1,0,1},
	{1,0,1,0,1,0,1,0,0,0,1,0,1,0,1,1,0,0,1,0,1,0,1},
	{1,0,1,0,0,0,1,1,1,0,0,0,1,0,1,0,1,0,1,0,1,0,1},
	{1,0,1,1,1,0,0,0,0,0,1,1,1,0,1,0,1,0,1,0,1,0,1},
	{1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
		
	player.pos_x = player.act_x
	player.pos_y = player.act_y
	
	if player.grid_y >= 384 then
		movimiento = true
	end	

	if movimiento == true then
		mover_objx(enemy1, 448, 288, 30 * dt)
		mover_objx(enemy2, 448, 288, 30 * dt)
		mover_objx(enemy3, 448, 384, 30 * dt)
		mover_objy(enemy4, 224, 160, 30 * dt)
		mover_objy(enemy5, 224, 160, 30 * dt)
	end
	
	if colision(player, enemy1) then
		player.grid_x = 64
		player.grid_y = 512
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy2) then
		player.grid_x = 64
		player.grid_y = 512
		hurt:play()
		hurt:rewind()
	end

	if colision(player, enemy3) then
		player.grid_x = 64
		player.grid_y = 512
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy4) then
		player.grid_x = 64
		player.grid_y = 512
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, enemy5) then
		player.grid_x = 64
		player.grid_y = 512
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, finish) then
		love.filesystem.load("levels/level6.lua")() 
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
	
	love.graphics.setColor(63, 126, 63)
	love.graphics.rectangle("line", enemy1.pos_x, enemy1.pos_y, enemy1.size_w, enemy1.size_h)

	love.graphics.setColor(189, 255, 189)
	love.graphics.rectangle("line", enemy2.pos_x, enemy2.pos_y, enemy2.size_w, enemy2.size_h)

	love.graphics.setColor(127.5, 10, 127.5)
	love.graphics.rectangle("line", enemy3.pos_x, enemy3.pos_y, enemy3.size_w, enemy3.size_h)

	love.graphics.setColor(199, 100, 0)
	love.graphics.rectangle("line", enemy4.pos_x, enemy4.pos_y, enemy4.size_w, enemy4.size_h)
	
	love.graphics.setColor(0, 100, 199)
	love.graphics.rectangle("line", enemy5.pos_x, enemy5.pos_y, enemy5.size_w, enemy5.size_h)
	
	
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
