-- Estado genérico: una sala = una entrada de datos/salas.lua
-- Fuente de la sala: un mapa de Tiled (s.mapa) o una sala generada (sin mapa).
EstadoSala = Class{__includes = Estado}

local function indiceSala(id)
    for i, s in ipairs(SALAS) do
        if s.id == id then return i end
    end
end

-- ================= CARGA =================
function EstadoSala:ingresar(parametros)
    parametros = parametros or {}
    self.idx = assert(indiceSala(parametros.id), "Sala inexistente: " .. tostring(parametros.id))
    self.sala = SALAS[self.idx]

    self.mundo = BUMP.newWorld(8)
    self.panel = FichaLarga()
    self.camara = CAM()
    self.fichas, self.puertas, self.spawns, self.rectParedes, self.objetos = {}, {}, {}, {}, {}
    self.cerca, self.aviso, self.tiempoAviso = nil, "", 0

    local entidades = self:CargarMapa()
    for _, e in ipairs(entidades) do
        if e.tipo == "ficha" then
            table.insert(self.fichas, Ficha(e.x, e.y, e.contenido, e.sprite))
        elseif e.tipo == "puerta" then
            table.insert(self.puertas, { x = e.x, y = e.y, w = e.w or 8, h = e.h or 8, destino = e.destino })
        elseif e.tipo == "spawn" then
            table.insert(self.spawns, e)
        elseif e.tipo == "objeto" and e.item then
            local clave = self.sala.id .. ":" .. e.item
            if not inventario.recogidos[clave] then
                table.insert(self.objetos, Objeto(e.x, e.y, e.item, e.sprite, clave))
            end
        end
    end

    -- spawn: el que corresponde a la sala de la que venimos, o el primero
    local sp = self.spawns[1] or { x = 28, y = 68 }
    for _, e in ipairs(self.spawns) do
        if e.desde and e.desde == parametros.desde then sp = e end
    end
    self.jugador = Jugador(sp.x, sp.y, self.mundo)
    self.tiempoEntrada = 0.5                          -- ignora la tecla mantenida al entrar
    self.enPuerta = self:PuertaBajoJugador() ~= nil   -- apareció sobre una puerta

    musica.poner(self.sala.musica)

    if parametros.aviso then self:Avisar(parametros.aviso, 4) end
end

local function agregarPared(self, x, y, w, h)
    local o = { esPared = true }
    self.mundo:add(o, x, y, w, h)
    table.insert(self.rectParedes, { x, y, w, h })
end

-- Devuelve la lista normalizada de entidades {tipo, x, y, w, h, contenido, destino, desde, sprite, item}
function EstadoSala:CargarMapa()
    local s = self.sala

    if s.mapa and existe(s.mapa) then
        self.mapa = STI(s.mapa)
        self.anchoPx = self.mapa.width * self.mapa.tilewidth
        self.altoPx = self.mapa.height * self.mapa.tileheight

        local lista = {}
        for _, capa in ipairs(self.mapa.layers) do
            if capa.type == "objectgroup" then
                for _, o in ipairs(capa.objects) do
                    if capa.name == "paredes" then
                        agregarPared(self, o.x, o.y, o.width, o.height)
                    else
                        local p = o.properties or {}
                        local tipo = o.type
                        if not tipo or tipo == "" then tipo = o.class end
                        if not tipo or tipo == "" then tipo = capa.name end  -- la capa dice qué es

                        local x, y = o.x, o.y   -- la puerta usa su esquina
                        if tipo ~= "puerta" then  -- spawn, ficha y objeto: centro del tile
                            local cx = o.x + (o.width or 0) / 2
                            local cy = o.y + (o.height or 0) / 2
                            x, y = math.floor(cx / 8) * 8 + 4, math.floor(cy / 8) * 8 + 4
                        end

                        table.insert(lista, { tipo = tipo, x = x, y = y,
                            w = (o.width and o.width > 0) and o.width or 8,
                            h = (o.height and o.height > 0) and o.height or 8,
                            contenido = p.contenido, destino = p.destino,
                            desde = p.desde, sprite = p.sprite, item = p.item or ((o.name ~= "") and o.name or nil) })
                    end
                end
            end
        end

        -- lo que definiste en salas.lua (fichas y objetos) se suma a lo de Tiled
        for _, e in ipairs(s.entidades or {}) do table.insert(lista, e) end
        return lista
    end

    -- Sala generada: borde de paredes + paredes extra opcionales
    self.mapa = nil
    local T = 8
    self.anchoPx, self.altoPx = (s.tilesAncho or 30) * T, (s.tilesAlto or 17) * T
    agregarPared(self, 0, 0, self.anchoPx, T)
    agregarPared(self, 0, self.altoPx - T, self.anchoPx, T)
    agregarPared(self, 0, 0, T, self.altoPx)
    agregarPared(self, self.anchoPx - T, 0, T, self.altoPx)
    for _, r in ipairs(s.paredes or {}) do agregarPared(self, r[1], r[2], r[3], r[4]) end
    return s.entidades or {}
end

-- ================= AVISOS =================
function EstadoSala:Avisar(texto, segundos)
    self.aviso, self.tiempoAviso = texto, segundos or 2
end

-- ================= ACTUALIZACION =================
function EstadoSala:actualizar(dt)
    self.tiempoEntrada = math.max(0, self.tiempoEntrada - dt)
    self.tiempoAviso = math.max(0, self.tiempoAviso - dt)
    self.jugador.puedeMoverse = not self.panel.abierta

    self.cerca = nil
    for _, f in ipairs(self.fichas) do
        f:Actualizar(dt)
        if f:Cerca(self.jugador) then self.cerca = f end
    end

    -- objetos del puzzle: al pisarlos pasan al inventario
    for i = #self.objetos, 1, -1 do
        local o = self.objetos[i]
        o:Actualizar(dt)
        if o:Tocado(self.jugador) then
            table.remove(self.objetos, i)
            inventario.agregar(o.item, o.clave)
            local receta = inventario.combinar()
            if receta then self:Avisar(receta.mensaje, 5)
            else self:Avisar("Encontraste: " .. o.item, 2.5) end
        end
    end

    self.camara:lookAt(self.jugador.posX, self.jugador.posY)
    clampCamara(self.camara, self.anchoPx, self.altoPx, ventana.ancho, ventana.alto)
end

function EstadoSala:PuertaBajoJugador()
    local j = self.jugador
    for _, p in ipairs(self.puertas) do
        if j.posX >= p.x and j.posX <= p.x + p.w and j.posY >= p.y and j.posY <= p.y + p.h then
            return p
        end
    end
end

function EstadoSala:ChequearPuertas()
    local p = self:PuertaBajoJugador()
    if not p then self.enPuerta = false return end
    if self.enPuerta then return end   -- empezó sobre una puerta: no cuenta hasta que salga de ella
    
    local final = self.sala.final
    if final then
        self.enPuerta = true   -- no se repite hasta que salga de la puerta
        if inventario.tiene(final.requiere) then
            self.panel:Abrir(final.contenido)
        else
            MaqEstadoGlobal:cambiar("sala", { id = SALAS[1].id, aviso = final.falta })
        end
        return
    end
    local destino = self.sala.siguiente or p.destino
    print(self.sala.id .. " -> " .. tostring(destino))

    if destino == self.sala.id then
        self:Avisar("(la puerta apunta a esta sala)", 3)
    elseif indiceSala(destino) then
        MaqEstadoGlobal:cambiar("sala", { id = destino, desde = self.sala.id })
    else
        self:Avisar("(sala en construccion)", 2)
    end
end

-- ================= RENDERIZADO =================
function EstadoSala:DibujarFondo()
    love.graphics.setColor(0.16, 0.14, 0.2)
    love.graphics.rectangle("fill", 0, 0, self.anchoPx, self.altoPx)
    love.graphics.setColor(0.35, 0.3, 0.45)
    for _, r in ipairs(self.rectParedes) do love.graphics.rectangle("fill", r[1], r[2], r[3], r[4]) end
    love.graphics.setColor(1, 1, 1)
end

function EstadoSala:dibujar()
    love.graphics.setCanvas(lienzo)
    love.graphics.clear(0.1, 0.09, 0.14)

    self.camara:attach(0, 0, ventana.ancho, ventana.alto)
    if self.mapa then
        for _, capa in ipairs(self.mapa.layers) do
            if capa.type == "tilelayer" then self.mapa:drawLayer(capa) end
        end
    else
        self:DibujarFondo()
    end
    love.graphics.setColor(1, 1, 1)
    for _, o in ipairs(self.objetos) do o:Dibujar() end
    for _, f in ipairs(self.fichas) do f:Dibujar(f == self.cerca) end
    self.jugador:Dibujar()
    self.camara:detach()

    -- HUD: dónde estoy
    love.graphics.setFont(fuentes.get(8))
    love.graphics.setColor(0, 0, 0, 0.6)
    love.graphics.rectangle("fill", 0, 0, ventana.ancho, 12)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(string.format("%d/%d  %s", self.idx, #SALAS, self.sala.titulo), 4, 2)

    -- HUD: objetos que llevo
    if #inventario.items > 0 then
        love.graphics.setColor(0, 0, 0, 0.6)
        love.graphics.rectangle("fill", 0, ventana.alto - 12, ventana.ancho, 12)
        love.graphics.setColor(1, 0.8, 0.3)
        love.graphics.print("Objetos: " .. table.concat(inventario.items, "  "), 4, ventana.alto - 10)
        love.graphics.setColor(1, 1, 1)
    end

    -- HUD: aviso
    if self.tiempoAviso > 0 then
        local y = ventana.alto - 36
        love.graphics.setColor(0, 0, 0, 0.8)
        love.graphics.rectangle("fill", 4, y, ventana.ancho - 8, 22)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", 4, y, ventana.ancho - 8, 22)
        love.graphics.printf(self.aviso, 8, y + 3, ventana.ancho - 16, "center")
    end

    love.graphics.setCanvas()
    love.graphics.draw(lienzo, 0, 0, 0, ventana.escala, ventana.escala)
    self.panel:Dibujar(ventana)
end

-- ================= INPUT =================
function EstadoSala:inputsJuego(key, repetida)
    if self.panel.abierta then
        if not repetida then self.panel:Input(key) end
        return
    end

    if key == "escape" then
        MaqEstadoGlobal:cambiar("menu")
        return
    end

    if key == "space" then
        if not repetida and self.cerca then self.panel:Abrir(self.cerca.contenido) end
        return
    end

    if repetida and self.tiempoEntrada > 0 then return end
    local dx, dy = 0, 0
    if key == "left" then dx = -1
    elseif key == "right" then dx = 1
    elseif key == "up" then dy = -1
    elseif key == "down" then dy = 1 end

    if dx ~= 0 or dy ~= 0 then
        self.jugador:Mover(dx, dy)
        self:ChequearPuertas()
    end
end