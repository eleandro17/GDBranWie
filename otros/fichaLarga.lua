-- Panel de lectura a resolución de ventana (fuera del lienzo), con páginas.
-- Cada contenido: { titulo=, url=, paginas = { {titulo=, texto=, imagen=, filtro=}, ... } }
FichaLarga = Class{}

-- Ajustables a gusto
local MARGEN = 24
local TAM_TITULO, TAM_TEXTO, TAM_PIE = 16, 16, 8

function FichaLarga:init()
    self.abierta = false
    self.contenido = nil
    self.pagina = 1
end

function FichaLarga:Abrir(id)
    self.contenido = CONTENIDO[id] or {
        titulo = "Falta contenido",
        paginas = { { texto = "No existe CONTENIDO['" .. tostring(id) .. "'] en datos/contenido.lua" } },
    }
    self.pagina = 1
    self.abierta = true
end

function FichaLarga:Cerrar()
    self.abierta = false
end

function FichaLarga:Input(key)
    local n = #self.contenido.paginas
    if key == "space" or key == "return" or key == "right" then
        if self.pagina < n then self.pagina = self.pagina + 1 else self:Cerrar() end
    elseif key == "left" then
        self.pagina = math.max(1, self.pagina - 1)
    elseif key == "escape" then
        self:Cerrar()
    elseif key == "o" and self.contenido.url then
        love.system.openURL(self.contenido.url)
    end
end

function FichaLarga:Dibujar(ventana)
    if not self.abierta then return end
    local W, H = ventana.ancho * ventana.escala, ventana.alto * ventana.escala
    local c = self.contenido
    local n = #c.paginas
    local p = c.paginas[self.pagina]
    local fuenteAnterior = love.graphics.getFont()

    love.graphics.setColor(0, 0, 0, 0.85)
    love.graphics.rectangle("fill", 0, 0, W, H)
    love.graphics.setColor(0.08, 0.07, 0.12)
    love.graphics.rectangle("fill", MARGEN, MARGEN, W - 2 * MARGEN, H - 2 * MARGEN)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", MARGEN, MARGEN, W - 2 * MARGEN, H - 2 * MARGEN)

    local x, y, w = MARGEN + 16, MARGEN + 16, W - 2 * MARGEN - 32

    -- título
    love.graphics.setFont(fuentes.get(TAM_TITULO))
    love.graphics.setColor(1, 0.8, 0.3)
    love.graphics.printf(p.titulo or c.titulo or "", x, y, w, "left")
    y = y + TAM_TITULO * 2

    -- cuerpo: texto (+ imagen a la derecha si la página la trae)
    local altoCuerpo = (H - MARGEN - 12 - TAM_PIE * 3) - y
        local anchoTexto = w
    if p.imagen then
        local soloImagen = not p.texto
        anchoTexto = soloImagen and 0 or (math.floor(w * 0.5) - 8)
        local zx = soloImagen and x or (x + anchoTexto + 16)
        local zw = soloImagen and w or (w - anchoTexto - 16)
        local zh = altoCuerpo
        local img = cargarImagen(p.imagen, p.filtro or "linear")
        if img then
            local s = math.min(zw / img:getWidth(), zh / img:getHeight())
            if p.filtro == "nearest" then s = math.max(1, math.floor(s)) end  -- escala entera, sin deformar píxeles
            local iw, ih = img:getWidth() * s, img:getHeight() * s
            love.graphics.setColor(1, 1, 1)
            love.graphics.draw(img, zx + (zw - iw) / 2, y + (zh - ih) / 2, 0, s, s)
        else
            love.graphics.setColor(0.5, 0.5, 0.6)
            love.graphics.rectangle("line", zx, y, zw, zh)
            love.graphics.setFont(fuentes.get(TAM_PIE))
            love.graphics.printf("(falta " .. p.imagen .. ")", zx + 8, y + 8, zw - 16, "left")
        end
    end
    if p.texto then
        love.graphics.setFont(fuentes.get(TAM_TEXTO))
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(p.texto, x, y, anchoTexto, "left")
    end
    love.graphics.setFont(fuentes.get(TAM_TEXTO))
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(p.texto or "", x, y, anchoTexto, "left")

    -- pie
    love.graphics.setFont(fuentes.get(TAM_PIE))
    love.graphics.setColor(0.6, 0.6, 0.7)
    local pie = string.format("%d/%d  [<][>] mover  [ESPACIO] %s  [ESC] cerrar",
                              self.pagina, n, self.pagina < n and "siguiente" or "cerrar")
    if c.url then pie = pie .. "  [O] abrir enlace" end
    love.graphics.printf(pie, x, H - MARGEN - 12 - TAM_PIE * 2, w, "left")

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(fuenteAnterior)
end
