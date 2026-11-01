function redondear(n)
    return math.floor(n + 0.5)
end

function existe(ruta)
    return ruta ~= nil and love.filesystem.getInfo(ruta) ~= nil
end

-- Devuelve la imagen o nil si el archivo no existe (así se puede probar sin assets)
local cacheImg = {}
function cargarImagen(ruta, filtro)
    if not existe(ruta) then return nil end
    if not cacheImg[ruta] then cacheImg[ruta] = love.graphics.newImage(ruta) end
    filtro = filtro or "nearest"
    cacheImg[ruta]:setFilter(filtro, filtro)
    return cacheImg[ruta]
end

function clampCamara(cam, mapaAnchoPx, mapaAltoPx, viewW, viewH)
    local zoom = cam.scale or 1
    local vw, vh = viewW / zoom, viewH / zoom
    local x, y = cam.x, cam.y

    if mapaAnchoPx <= vw then x = mapaAnchoPx / 2
    else x = math.max(vw / 2, math.min(mapaAnchoPx - vw / 2, x)) end

    if mapaAltoPx <= vh then y = mapaAltoPx / 2
    else y = math.max(vh / 2, math.min(mapaAltoPx - vh / 2, y)) end

    cam:lookAt(x, y)
end
