-- Objeto recogible: al pisar su casilla pasa al inventario.
-- Sprite: assets/item_<item>.png (por ejemplo item_gem.png). Si no existe, dibuja un cuadrado con su nombre.
Objeto = Class{}

function Objeto:init(x, y, item, sprite, clave)
    self.posX, self.posY = x, y
    self.item, self.clave = item, clave
    self.tex = cargarImagen(sprite or ("assets/item_" .. item .. ".png"), "nearest")
    self.tiempo = love.math.random() * 6
    self.alcance = 4   -- el jugador se mueve de a 8: solo cuenta la misma casilla
end

function Objeto:Actualizar(dt)
    self.tiempo = self.tiempo + dt
end

function Objeto:Tocado(jugador)
    return math.abs(jugador.posX - self.posX) <= self.alcance
       and math.abs(jugador.posY - self.posY) <= self.alcance
end

function Objeto:Dibujar()
    local y = redondear(self.posY + math.sin(self.tiempo * 4))
    local x = redondear(self.posX)
    if self.tex then
        love.graphics.draw(self.tex, x, y, 0, 1, 1, self.tex:getWidth() / 2, self.tex:getHeight() / 2)
    else
        love.graphics.setColor(0.4, 0.9, 1)
        love.graphics.rectangle("fill", x - 3, y - 3, 6, 6)
        love.graphics.setColor(0.05, 0.1, 0.15)
        love.graphics.rectangle("line", x - 3, y - 3, 6, 6)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(fuentes.get(8))
        love.graphics.printf(self.item, x - 20, y - 14, 40, "center")
    end
end