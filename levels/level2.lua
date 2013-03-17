--[Variables y Tablas]--

movimiento = false

player = {
	grid_x = 288,
	grid_y = 544,
	act_x = 288,
	act_y = 544,
	size_w = 32,
	size_h = 32,
	speed = 10,
	pos_x = 288,
	pos_y = 544
}

finish = {
	pos_x = 525.5,
	pos_y = 365.5,
	size_w = 5,
	size_h = 5
}

bonus = {
	pos_x = 141.5,
	pos_y = 109.5,
	size_w = 5,
	size_h = 5
}

enemy1 = {
	pos_x = 290,
	pos_y = 192,
	size_w = 30,
	size_h = 30
}

enemy2 = {
	pos_x = 608,
	pos_y = 128,
	size_w = 32,
	size_h = 32,
	status = true
}


map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,0,0,1,1,1,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1},
	{1,0,1,0,1,1,1,1,0,0,1,0,0,0,1,0,1,1,1,1,1,0,1},
	{1,0,1,0,1,0,0,0,1,0,1,0,1,1,1,0,0,0,1,0,1,0,1},
	{1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1},
	{1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,0,1,1,0,0,0,1},
	{1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0,1,0,1,0,1},
	{1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0,1,0,1}, -- 16 Acaba
	{1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,1,0,1},
	{1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,0,0,0,1,0,1,0,1},
	{1,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0,1,0,1},
	{1,1,1,1,0,1,0,1,0,1,0,1,1,0,1,0,1,1,1,1,1,0,1},
	{1,0,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1}, -- 9 Empieza
	{0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)

	if player.grid_y <= 448 then
		movimiento = true
	end
	
	if movimiento == true then 
		mover_objx(enemy1, 320, 290, 30 * dt)
		mover_objy(enemy2, 160, 96, 30 * dt)
		if colision(player, enemy1) then
			player.grid_x = 288
			player.grid_y = 544
			hurt:play()
			hurt:rewind()
		end
	end
	
	player.pos_x = player.act_x
	player.pos_y = player.act_y
	
	if colision(player, bonus) then
		enemy1.pos_x = 900
		enemy1.pos_y = 700
		bonus.pos_x = 900
		bonus.pos_y = 700
	end
	
	if colision(player, enemy2) then
		player.grid_x = 288
		player.grid_y = 544
		hurt:play()
		hurt:rewind()
	end
	
	if colision(player, finish) then
		love.filesystem.load("levels/level3.lua")() 
	end
end

--Funcion Imprimir
function love.draw()
	love.graphics.setColor(playerc)
    love.graphics.rectangle("fill", player.act_x, player.act_y, player.size_w, player.size_h)
	
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", finish.pos_x, finish.pos_y, finish.size_w, finish.size_h)
	
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("fill", bonus.pos_x, bonus.pos_y, bonus.size_w, bonus.size_h)	
	
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
				blanco = love.graphics.setColor(255, 255, 255)
                love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
            end
		end
	end
	
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("line", enemy1.pos_x, enemy1.pos_y, enemy1.size_w, enemy1.size_h)
	
	love.graphics.setColor(221, 160, 221)
	love.graphics.rectangle("line", enemy2.pos_x, enemy2.pos_y, enemy2.size_w, enemy2.size_h)
	
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
