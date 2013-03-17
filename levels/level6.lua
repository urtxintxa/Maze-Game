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
	pos_x = 333.5,
	pos_y = 397.5,
	size_w = 5,
	size_h = 5
}


enemy = {}
enemy[1] = {
	pos_x = 64,
	pos_y = 481,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[2] = {
	pos_x = 128,
	pos_y = 417,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[3] = {
	pos_x = 64,
	pos_y = 353,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[4] = {
	pos_x = 128,
	pos_y = 289,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[5] = {
	pos_x = 64,
	pos_y = 225,
	size_w = 31,
	size_h = 30, 
	status = false
}
enemy[6] = {
	pos_x = 128,
	pos_y = 161,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[7] = {
	pos_x = 160,
	pos_y = 160,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[8] = {
	pos_x = 224,
	pos_y = 96,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[9] = {
	pos_x = 288,
	pos_y = 160,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[10] = {
	pos_x = 352,
	pos_y = 96,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[11] = {
	pos_x = 416,
	pos_y = 160,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[12] = {
	pos_x = 480,
	pos_y = 96,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[13] = {
	pos_x = 544,
	pos_y = 160,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[14] = {
	pos_x = 608,
	pos_y = 96,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[15] = {
	pos_x = 704,
	pos_y = 161,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[16] = {
	pos_x = 640,
	pos_y = 225,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[17] = {
	pos_x = 704,
	pos_y = 289,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[18] = {
	pos_x = 640,
	pos_y = 353,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[19] = {
	pos_x = 704,
	pos_y = 417,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[20] = {
	pos_x = 289,
	pos_y = 512,
	size_w = 30,
	size_h = 31,
	status = true
}
enemy[21] = {
	pos_x = 353,
	pos_y = 448,
	size_w = 31,
	size_h = 30,
	status = true
}
enemy[22] = {
	pos_x = 417,
	pos_y = 512,
	size_w = 31,
	size_h = 30,
	status = true
}
enemy[23] = {
	pos_x = 481,
	pos_y = 448,
	size_w = 31,
	size_h = 30,
	status = true
}
enemy[24] = {
	pos_x = 545,
	pos_y = 512,
	size_w = 31,
	size_h = 30,
	status = true
}
enemy[25] = {
	pos_x = 609,
	pos_y = 448,
	size_w = 31,
	size_h = 30,
	status = true
}
enemy[26] = {
	pos_x = 192,
	pos_y = 353,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[27] = {
	pos_x = 256,
	pos_y = 417,
	size_w = 31,
	size_h = 30, 
	status = true
} 
enemy[28] = {
	pos_x = 288,
	pos_y = 288,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[29] = {
	pos_x = 352,
	pos_y = 224,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[30] = {
	pos_x = 416,
	pos_y = 288,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[31] = {
	pos_x = 480,
	pos_y = 224,
	size_w = 31,
	size_h = 31,
	status = true
}
enemy[32] = {
	pos_x = 512,
	pos_y = 320,
	size_w = 31,
	size_h = 30, 
	status = false
}

map = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
	{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
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
	
	for q = 1,6 do
		mover_objx(enemy[q], 128, 64, 30 * dt)
	end	
	
	for w = 7,14 do
		mover_objy(enemy[w], 160, 96, 30 * dt)
	end
	
	for e = 15,19 do
		mover_objx(enemy[e], 704, 640, 30 * dt)
	end
	
	for r = 20,25 do
		mover_objy(enemy[r], 512, 448, 30 * dt)	
	end
	
	mover_objx(enemy[26], 256, 192, 30 * dt)
	mover_objx(enemy[27], 256, 192, 30 * dt)
	
	for t = 28,31 do
		mover_objy(enemy[t], 288, 224, 30 * dt)
	end
	
	mover_objx(enemy[32], 576, 512, 30 * dt)
	
	for i = 1,32 do
		if colision(player, enemy[i]) then
			player.grid_x = 64
			player.grid_y = 512
			hurt:play()
			hurt:rewind()
		end
	end
	
	if colision(player, finish) then
		love.filesystem.load("levels/level7.lua")() 
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
	love.graphics.rectangle("line", enemy[1].pos_x, enemy[1].pos_y, enemy[1].size_w, enemy[1].size_h)

	love.graphics.setColor(189, 255, 189)
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
	
	love.graphics.setColor(199, 255, 9)
	love.graphics.rectangle("line", enemy[10].pos_x, enemy[10].pos_y, enemy[10].size_w, enemy[10].size_h)
	
	love.graphics.setColor(57, 200, 57)
	love.graphics.rectangle("line", enemy[11].pos_x, enemy[11].pos_y, enemy[11].size_w, enemy[11].size_h)
	
	love.graphics.setColor(25, 25, 50)
	love.graphics.rectangle("line", enemy[12].pos_x, enemy[12].pos_y, enemy[12].size_w, enemy[12].size_h)

	love.graphics.setColor(250, 50, 0)
	love.graphics.rectangle("line", enemy[13].pos_x, enemy[13].pos_y, enemy[13].size_w, enemy[13].size_h)
	
	love.graphics.setColor(25, 0, 250)
	love.graphics.rectangle("line", enemy[14].pos_x, enemy[14].pos_y, enemy[14].size_w, enemy[14].size_h)
	
	love.graphics.setColor(10, 120, 230)
	love.graphics.rectangle("line", enemy[15].pos_x, enemy[15].pos_y, enemy[15].size_w, enemy[15].size_h)
	
	love.graphics.setColor(5, 25, 255)
	love.graphics.rectangle("line", enemy[16].pos_x, enemy[16].pos_y, enemy[16].size_w, enemy[16].size_h)
	
	love.graphics.setColor(25, 255, 0)
	love.graphics.rectangle("line", enemy[17].pos_x, enemy[17].pos_y, enemy[17].size_w, enemy[17].size_h)
	
	love.graphics.setColor(25, 0, 255)
	love.graphics.rectangle("line", enemy[18].pos_x, enemy[18].pos_y, enemy[18].size_w, enemy[18].size_h)
	
	love.graphics.setColor(255, 25, 5)
	love.graphics.rectangle("line", enemy[19].pos_x, enemy[19].pos_y, enemy[19].size_w, enemy[19].size_h)
	
	love.graphics.setColor(97, 98, 99)
	love.graphics.rectangle("line", enemy[20].pos_x, enemy[20].pos_y, enemy[20].size_w, enemy[20].size_h)
	
	love.graphics.setColor(120, 120, 120)
	love.graphics.rectangle("line", enemy[21].pos_x, enemy[21].pos_y, enemy[21].size_w, enemy[21].size_h)
	
	love.graphics.setColor(50, 50, 50)
	love.graphics.rectangle("line", enemy[22].pos_x, enemy[22].pos_y, enemy[22].size_w, enemy[22].size_h)
	
	love.graphics.setColor(180, 50, 40)
	love.graphics.rectangle("line", enemy[23].pos_x, enemy[23].pos_y, enemy[23].size_w, enemy[23].size_h)
	
	love.graphics.setColor(0, 255, 33)
	love.graphics.rectangle("line", enemy[24].pos_x, enemy[24].pos_y, enemy[24].size_w, enemy[24].size_h)
			
	love.graphics.setColor(79, 180, 20)
	love.graphics.rectangle("line", enemy[25].pos_x, enemy[25].pos_y, enemy[25].size_w, enemy[25].size_h)

	love.graphics.setColor(56, 186, 98)
	love.graphics.rectangle("line", enemy[26].pos_x, enemy[26].pos_y, enemy[26].size_w, enemy[26].size_h)

	love.graphics.setColor(203, 63, 97)
	love.graphics.rectangle("line", enemy[27].pos_x, enemy[27].pos_y, enemy[27].size_w, enemy[27].size_h)

	love.graphics.setColor(186, 84, 244)
	love.graphics.rectangle("line", enemy[28].pos_x, enemy[28].pos_y, enemy[28].size_w, enemy[28].size_h)

	love.graphics.setColor(255, 56, 255)
	love.graphics.rectangle("line", enemy[29].pos_x, enemy[29].pos_y, enemy[29].size_w, enemy[29].size_h)

	love.graphics.setColor(57, 24, 164)
	love.graphics.rectangle("line", enemy[30].pos_x, enemy[30].pos_y, enemy[30].size_w, enemy[30].size_h)

	love.graphics.setColor(57, 255, 164)
	love.graphics.rectangle("line", enemy[31].pos_x, enemy[31].pos_y, enemy[31].size_w, enemy[31].size_h)

	love.graphics.setColor(255, 110, 164)
	love.graphics.rectangle("line", enemy[32].pos_x, enemy[32].pos_y, enemy[32].size_w, enemy[32].size_h)

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
