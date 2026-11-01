-- Una sola pista a la vez; si la sala siguiente usa la misma, no se reinicia.
musica = { fuente = nil, ruta = nil }

function musica.poner(ruta, volumen)
    if ruta == musica.ruta then return end
    if musica.fuente then musica.fuente:stop() end
    musica.fuente, musica.ruta = nil, ruta
    if existe(ruta) then
        musica.fuente = love.audio.newSource(ruta, "stream")
        musica.fuente:setLooping(true)
        musica.fuente:setVolume(volumen or 0.3)
        musica.fuente:play()
    end
end
