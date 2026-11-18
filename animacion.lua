-- Animación por cuadros sueltos (un PNG por cuadro), dibujada centrada en la sala.
-- cfg: { patron = "assets/intro/frame%02d.png",  -- %02d se reemplaza por el número de cuadro
--        frames = 13, desde = 1, fps = 8, loop = true }
Animacion = Class{}

function Animacion:init(cfg)
    self.cuadros = {}
    local desde = cfg.desde or 1
    for i = desde, desde + cfg.frames - 1 do
        local img = cargarImagen(string.format(cfg.patron, i), "nearest")
        if img then table.insert(self.cuadros, img) end
    end
    self.esperados = cfg.frames
    self.fps = cfg.fps or 8
    self.loop = cfg.loop ~= false
    self.tiempo = 0
end

function Animacion:Actualizar(dt)
    self.tiempo = self.tiempo + dt
end

-- Se dibuja en coordenadas del mundo, centrada en una sala de anchoPx x altoPx
function Animacion:Dibujar(anchoPx, altoPx)
    local n = #self.cuadros
    if n == 0 then
        love.graphics.setColor(0.5, 0.5, 0.6)
        love.graphics.rectangle("line", (anchoPx - 128) / 2, (altoPx - 128) / 2, 128, 128)
        love.graphics.setFont(fuentes.get(8))
        love.graphics.printf("falta animacion", (anchoPx - 128) / 2, altoPx / 2 - 4, 128, "center")
        love.graphics.setColor(1, 1, 1)
        return
    end
    local i = math.floor(self.tiempo * self.fps)
    if self.loop then i = i % n + 1 else i = math.min(i + 1, n) end
    local img = self.cuadros[i]
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(img, math.floor((anchoPx - img:getWidth()) / 2), math.floor((altoPx - img:getHeight()) / 2))
end