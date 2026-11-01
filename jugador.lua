-- Jugador mínimo: movimiento por pasos de 8 px (como tu proyecto base).
-- Tu Jugador completo (dash, daño) se puede traer de vuelta en las salas de mecánicas.
Jugador = Class{}

function Jugador:init(x, y, mundo)
    self.posX, self.posY = x, y
    self.ancho, self.alto = 8, 8
    self.origX, self.origY = 4, 4
    self.paso = 8
    self.puedeMoverse = true
    self.tex = cargarImagen("assets/jugador.png", "nearest")
    self.frames = 2
    self.frame = 1
    self.cuadros = {}
    if self.tex then
        local fw, fh = self.tex:getWidth() / self.frames, self.tex:getHeight()
        for i = 1, self.frames do
            self.cuadros[i] = love.graphics.newQuad((i - 1) * fw, 0, fw, fh, self.tex:getDimensions())
        end
        self.spriteOrigX, self.spriteOrigY = fw / 2, fh / 2
    end
    self.mundo = mundo
    mundo:add(self, x - self.origX, y - self.origY, self.ancho, self.alto)
end

function Jugador:ChocaPared()
    local items, cant = self.mundo:queryRect(self.posX - self.origX, self.posY - self.origY,
                                             self.ancho, self.alto)
    for i = 1, cant do
        if items[i].esPared then return true end
    end
    return false
end

function Jugador:Mover(dx, dy)
    if not self.puedeMoverse then return end
    local px, py = self.posX, self.posY
    self.posX, self.posY = px + dx * self.paso, py + dy * self.paso
    self.mundo:update(self, self.posX - self.origX, self.posY - self.origY, self.ancho, self.alto)
    if self:ChocaPared() then
        self.posX, self.posY = px, py
        self.mundo:update(self, px - self.origX, py - self.origY, self.ancho, self.alto)
    else
        self.frame = self.frame % self.frames + 1   -- paso válido: cambia el cuadro
    end
end

function Jugador:Dibujar()
    if self.tex then
        love.graphics.draw(self.tex, self.cuadros[self.frame],
            redondear(self.posX), redondear(self.posY), 0, 1, 1,
            self.spriteOrigX, self.spriteOrigY)
    else
        love.graphics.setColor(0.95, 0.45, 0.35)
        love.graphics.rectangle("fill", self.posX - 4, self.posY - 4, 8, 8)
        love.graphics.setColor(1, 1, 1)
    end
end
