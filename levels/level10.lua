--[Variables y Tablas]--

movimiento = false

player = {
	grid_x = 704,
	grid_y = 96,
	act_x = 704,
	act_y = 96,
	size_w = 32,
	size_h = 32,
	speed = 10,
	pos_x = 704,
	pos_y = 96
}

finish = {
	pos_x = 525.5,
	pos_y = 237.5,
	size_w = 5,
	size_h = 5
}

enemy = {}
enemy[1] = {
	pos_x = 352,
	pos_y = 256,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[2] = {
	pos_x = 352,
	pos_y = 288,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[3] = {
	pos_x = 608,
	pos_y = 129,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[4] = {
	pos_x = 289,
	pos_y = 128,
	size_w = 31,
	size_h = 30, 
	status = false
} 
enemy[5] = {
	pos_x = 224,
	pos_y = 448,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[6] = {
	pos_x = 288,
	pos_y = 512,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[7] = {
	pos_x = 352,
	pos_y = 448,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[8] = {
	pos_x = 416,
	pos_y = 512,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[9] = {
	pos_x = 544,
	pos_y = 384,
	size_w = 31,
	size_h = 30, 
	status = false
}

map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1},
	{1,0,1,1,1,1,1,1,0,0,0,0,1,1,1,0,1,0,0,0,1,0,1},
	{1,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
	{1,0,1,0,1,0,0,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1},
	{1,0,1,0,1,1,1,1,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1},
	{1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,1},
	{1,0,1,0,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,1},
	{1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,1},
	{1,0,1,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,0,1},
	{1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
	{1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1},
	{1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,1,1,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
	
	player.pos_x = player.act_x
	player.pos_y = player.act_y

	mover_objy(enemy[1], 288, 224, 60 * dt)
	mover_objy(enemy[2], 320, 256, 60 * dt)
	mover_objx(enemy[3], 640, 576, 50 * dt)
	mover_objy(enemy[4], 160, 96, 60 * dt)
	
	for i = 5, 8 do
		mover_objy(enemy[i], 512, 448, 30 * dt)
	end
	
	mover_objx(enemy[9], 704, 512, 70 * dt)
	
	for j = 1,8 do
		if colision(player, enemy[j]) then
			player.grid_x = 704
			player.grid_y = 96
			hurt:play()
			hurt:rewind()
		end
	end

	if colision(player, finish) then
		love.filesystem.load("menus/menu1.lua")()
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
	
	love.graphics.setColor(0, 125, 255)
	love.graphics.rectangle("line", enemy[1].pos_x, enemy[1].pos_y, enemy[1].size_w, enemy[1].size_h)

	love.graphics.setColor(0, 125, 255)
	love.graphics.rectangle("line", enemy[2].pos_x, enemy[2].pos_y, enemy[2].size_w, enemy[2].size_h)
	
	love.graphics.setColor(127.5, 10, 127.5)
	love.graphics.rectangle("line", enemy[3].pos_x, enemy[3].pos_y, enemy[3].size_w, enemy[3].size_h)

	love.graphics.setColor(199, 100, 0)
	love.graphics.rectangle("line", enemy[4].pos_x, enemy[4].pos_y, enemy[4].size_w, enemy[4].size_h)

	love.graphics.setColor(0, 100, 199)
	love.graphics.rectangle("line", enemy[5].pos_x, enemy[5].pos_y, enemy[5].size_w, enemy[5].size_h)
	
	love.graphics.setColor(199, 25, 0)
	love.graphics.rectangle("line", enemy[6].pos_x, enemy[6].pos_y, enemy[6].size_w, enemy[6].size_h)

	love.graphics.setColor(0, 0, 127)
	love.graphics.rectangle("line", enemy[7].pos_x, enemy[7].pos_y, enemy[7].size_w, enemy[7].size_h)
	
	love.graphics.setColor(130, 255, 30)
	love.graphics.rectangle("line", enemy[8].pos_x, enemy[8].pos_y, enemy[8].size_w, enemy[8].size_h)
	
	love.graphics.setColor(246, 146, 46)
	love.graphics.rectangle("line", enemy[9].pos_x, enemy[9].pos_y, enemy[9].size_w, enemy[9].size_h)
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
