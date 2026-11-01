-- Objeto del mundo que, al acercarse y apretar ESPACIO, abre una ficha larga.
Ficha = Class{}

function Ficha:init(x, y, idContenido, sprite)
    self.posX, self.posY = x, y
    self.contenido = idContenido
    --self.tex = sprite and cargarImagen(sprite, "nearest") or nil
    self.tex = cargarImagen(sprite or "assets/ido.png", "nearest")
    self.tiempo = love.math.random() * 6
    self.alcance = 12
end

function Ficha:Actualizar(dt)
    self.tiempo = self.tiempo + dt
end

function Ficha:Cerca(jugador)
    return math.abs(jugador.posX - self.posX) <= self.alcance
       and math.abs(jugador.posY - self.posY) <= self.alcance
end

function Ficha:Dibujar(cerca)
    local y = self.posY + math.sin(self.tiempo * 3) * 1.5
    if self.tex then
        love.graphics.draw(self.tex, redondear(self.posX), redondear(y), 0, 1, 1,
                           self.tex:getWidth() / 2, self.tex:getHeight() / 2)
    else
        love.graphics.setColor(1, 0.8, 0.3)
        love.graphics.rectangle("fill", redondear(self.posX) - 4, redondear(y) - 4, 8, 8)
        love.graphics.setColor(0.1, 0.1, 0.1)
        love.graphics.rectangle("line", redondear(self.posX) - 4, redondear(y) - 4, 8, 8)
        love.graphics.setColor(1, 1, 1)
    end
    if cerca then
        love.graphics.setFont(fuentes.get(8))
        love.graphics.printf("ESPACIO", self.posX - 30, self.posY - 16, 60, "center")
    end
end
