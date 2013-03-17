selec = love.audio.newSource("sound/select.wav")
hurt = love.audio.newSource("sound/hurt.wav")
selection = love.audio.newSource("sound/selection.wav")
music = love.audio.newSource("sound/music.mp3")

cursor = love.graphics.newImage("images/cursor.png")
title = love.graphics.newImage("images/title.png")

font = love.graphics.newFont("font/8-BIT.TTF", 17)

music:setLooping(true)
love.audio.play(music)


love.filesystem.load("menus/menu.lua")()
