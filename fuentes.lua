-- Fuentes con caché. Usa PressStart2P si está en assets; si no, la de LÖVE.
fuentes = { ruta = "assets/PressStart2P-Regular.ttf", cache = {} }

function fuentes.get(tam)
    if not fuentes.cache[tam] then
        local f
        if existe(fuentes.ruta) then f = love.graphics.newFont(fuentes.ruta, tam)
        else f = love.graphics.newFont(tam) end
        f:setFilter("nearest", "nearest")
        fuentes.cache[tam] = f
    end
    return fuentes.cache[tam]
end
