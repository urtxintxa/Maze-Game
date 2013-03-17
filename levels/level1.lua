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
	pos_x = 269.5,
	pos_y = 205.5,
	size_w = 5,
	size_h = 5
}

enemy1 = {
	pos_x = 160,
	pos_y = 384,
	size_w = 32,
	size_h = 32
}

enemy2 = {
	pos_x = 672,
	pos_y = 224,
	size_w = 31,
	size_h = 32
}

enemy3 = {
	pos_x = 544,
	pos_y = 224,
	size_w = 31,
	size_h = 31,
	status = true
}

map = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },		
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 },
    { 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1 },
    { 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1 },
    { 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1 },
    { 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1 }, -- 21 se mueve // 16 se mueve
    { 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1 },
    { 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1 },
    { 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1 },
    { 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1 },
    { 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1 }, -- 5 se mueve
    { 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1 }, 
    { 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1 },
    { 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
}						

--[Funciones]--

-- Actualizar(Delta-Time)
function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
	
	if player.grid_y >= 256 then
		movimiento = true
	end
	
	if movimiento == true then
		mover_objx(enemy1, 160, 128, 30 * dt)
		mover_objy(enemy2, 224, 192, 30 * dt)
		mover_objy(enemy3, 256, 160, 30 * dt)
	end 
	
	player.pos_x = player.act_x
	player.pos_y = player.act_y

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
		love.filesystem.load("levels/level2.lua")() 
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
				love.graphics.setColor(255 , 255, 255)
                love.graphics.rectangle("line", x * 32, y * 32, 32, 32)
            end
		end
	end
	
	love.graphics.setColor(178, 34, 34)
	love.graphics.rectangle("line", enemy1.pos_x, enemy1.pos_y, enemy1.size_w, enemy1.size_h)
	
	love.graphics.setColor(221, 160, 221)
	love.graphics.rectangle("line", enemy2.pos_x, enemy2.pos_y, enemy2.size_w, enemy2.size_h)
	
	love.graphics.setColor(255, 0, 255)
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
--Funcion Colision
function colision(obj1, obj2)
    if obj1.pos_x+obj1.size_w>obj2.pos_x
        and obj1.pos_x<obj2.pos_x+obj2.size_w
        and obj1.pos_y+obj1.size_h>obj2.pos_y
        and obj1.pos_y<obj2.pos_y+obj2.size_h then
            return true
        end
    return false
end

-- Funcion Testear el Mapa
function testMap(x, y)
	if map[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then
		return false
	end
	
	return true
end

--Funcion Mover los Enemigos
function mover_objx(obj, c1, c2, vel)
	if obj.pos_x >= c1 then
		obj.status = true
	end
	if obj.pos_x <= c2 then
		obj.status = false
	end

	if obj.status == true then
		obj.pos_x = obj.pos_x - vel
	end
	if obj.status == false then
		obj.pos_x = obj.pos_x + vel
	end
end

function mover_objy(obj, c1, c2, vel)
	if obj.pos_y >= c1 then
		obj.status = true
	end
	if obj.pos_y <= c2 then
		obj.status = false
	end

	if obj.status == true then
		obj.pos_y = obj.pos_y - vel
	end
	if obj.status == false then
		obj.pos_y = obj.pos_y + vel
	end
end
