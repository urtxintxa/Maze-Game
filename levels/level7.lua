--[Variables y Tablas]--

movimiento = false

snivel = false

player = {
	grid_x = 64,
	grid_y = 288,
	act_x = 64,
	act_y = 288,
	size_w = 32,
	size_h = 32,
	speed = 10,
	pos_x = 64,
	pos_y = 288
}

finish = {
	pos_x = 77.5,
	pos_y = 301.5,
	size_w = 5,
	size_h = 5
}

bonus = {
	pos_x = 685.5,
	pos_y = 301.5,
	size_w = 5,
	size_h = 5
}


enemy = {}
enemy[1] = {
	pos_x = 129,
	pos_y = 225,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[2] = {
	pos_x = 129,
	pos_y = 256,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[3] = {
	pos_x = 129,
	pos_y = 288,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[4] = {
	pos_x = 129,
	pos_y = 320,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[5] = {
	pos_x = 129,
	pos_y = 352,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[6] = {
	pos_x = 385,
	pos_y = 224,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[7] = {
	pos_x = 385,
	pos_y = 256,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[8] = {
	pos_x = 385,
	pos_y = 288,
	size_w = 31,
	size_h = 30, 
	status = true
}
enemy[9] = {
	pos_x = 385,
	pos_y = 320,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[10] = {
	pos_x = 385,
	pos_y = 351,
	size_w = 31,
	size_h = 30, 
	status = true
}


map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1},
	{0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
}

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
		
	player.pos_x = player.act_x
	player.pos_y = player.act_y

	for i = 1,5 do
		mover_objx(enemy[i], 352, 129, 80 * dt)
	end
	
	for i = 6,10 do
		mover_objx(enemy[i], 608, 385, 80 * dt)
	end
	
	for j = 1,10 do
		if colision(player, enemy[j]) then
			player.grid_x = 64
			player.grid_y = 288
			bonus.pos_x = 685.5
			bonus.pos_y = 301.5
			snivel = false
			hurt:play()
			hurt:rewind()
		end
	end
	
	if colision(player, bonus) then
		snivel = true
		bonus.pos_x = 1000
		bonus.pos_y = 1000
	end
	
	if snivel == true and colision(player, finish) then
		love.filesystem.load("levels/level8.lua")() 
	end
	
end

--Funcion Imprimir
function love.draw()
	love.graphics.setColor(playerc)
    love.graphics.rectangle("fill", player.act_x, player.act_y, player.size_w, player.size_h)
	
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", finish.pos_x, finish.pos_y, finish.size_w, finish.size_h)

	love.graphics.setColor(255, 246, 0)
    love.graphics.rectangle("fill", bonus.pos_x, bonus.pos_y, bonus.size_w, bonus.size_h)
	
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
				blanco = love.graphics.setColor(255, 255, 255)
                love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
            end
		end
	end
	
	
	for k = 1,10 do
		love.graphics.setColor(176, 126, 63)
		love.graphics.rectangle("line", enemy[k].pos_x, enemy[k].pos_y, enemy[k].size_w, enemy[k].size_h)
	end	
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
