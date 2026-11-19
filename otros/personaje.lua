-- NPC: ESPACIO estando cerca abre su diálogo. Al terminarlo puede entregar un objeto (una sola vez).
-- cfg: { nombre, sprite, lineas = {...}, despues = {...}, entrega = "id", clave = "..." }
Personaje = Class{}

function Personaje:init(x, y, cfg)
    self.posX, self.posY = x, y
    self.nombre = cfg.nombre or "?"
    self.lineas = cfg.lineas or { "..." }
    self.despues = cfg.despues     -- lo que dice después de haber entregado
    self.entrega = cfg.entrega
    self.clave = cfg.clave
    self.tex = cfg.sprite and cargarImagen(cfg.sprite, "nearest") or nil
    self.alcance = 12
end

function Personaje:Actualizar(dt) end

function Personaje:Cerca(jugador)
    return math.abs(jugador.posX - self.posX) <= self.alcance
       and math.abs(jugador.posY - self.posY) <= self.alcance
end

function Personaje:Dibujar(cerca)
    local x, y = redondear(self.posX), redondear(self.posY)
    if self.tex then
        love.graphics.draw(self.tex, x, y, 0, 1, 1, self.tex:getWidth() / 2, self.tex:getHeight() / 2)
    else
        love.graphics.setColor(0.9, 0.3, 0.8)
        love.graphics.rectangle("fill", x - 4, y - 4, 8, 8)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(fuentes.get(8))
        love.graphics.printf(self.nombre, x - 20, y - 14, 40, "center")
    end
    if cerca then
        love.graphics.setFont(fuentes.get(8))
        love.graphics.printf("ESPACIO", x - 30, y - 18, 60, "center")
    end
end
