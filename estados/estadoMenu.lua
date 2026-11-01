EstadoMenu = Class{__includes = Estado}

local TITULO = "Bran Wie GDD"   
local VISIBLES = 6

function EstadoMenu:ingresar()
    musica.poner(nil)
    self.sel = 1
end

function EstadoMenu:dibujar()
    love.graphics.setCanvas(lienzo)
    love.graphics.clear(0.1, 0.09, 0.14)

    local fondo = cargarImagen("assets/menu.png", "nearest")
    if fondo then love.graphics.draw(fondo, 0, 0) end

    love.graphics.setFont(fuentes.get(16))
    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.printf(TITULO, 0, 6, ventana.ancho, "center")

    love.graphics.setFont(fuentes.get(8))
    local inicio = math.max(1, math.min(self.sel - 2, #SALAS - VISIBLES + 1))
    for i = inicio, math.min(#SALAS, inicio + VISIBLES - 1) do
        local y = 50 + (i - inicio) * 10
        if i == self.sel then love.graphics.setColor(0.1, 0.8, 0.3) else love.graphics.setColor(0.2, 0.1, 1) end
        love.graphics.print((i == self.sel and "> " or "  ") .. i .. ". " .. SALAS[i].titulo, 24, y)
    end
    love.graphics.setColor(0.2, 0.1, 0.1)
    love.graphics.printf("ARR/ABA elegir  ENTER entrar", 0, 124, ventana.ancho, "center")
    love.graphics.setColor(1, 1, 1)

    love.graphics.setCanvas()
    love.graphics.draw(lienzo, 0, 0, 0, ventana.escala, ventana.escala)
end

function EstadoMenu:inputsJuego(key)
    if key == "up" then
        self.sel = (self.sel - 2) % #SALAS + 1
    elseif key == "down" then
        self.sel = self.sel % #SALAS + 1
    elseif key == "return" then
        MaqEstadoGlobal:cambiar("sala", { id = SALAS[self.sel].id })
    elseif key == "escape" then
        love.event.quit()
    end
end
