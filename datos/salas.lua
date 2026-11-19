-- Orden de este arreglo = orden del recorrido y del menú.
-- Cada sala tiene un mapa de Tiled (mapa/xxx.lua) y una sala `siguiente`.
-- Si el archivo del mapa todavía no existe, se genera una sala provisoria
-- (rectángulo vacío con la ficha y una puerta a la siguiente), así se puede
-- probar el recorrido completo mientras se dibujan los mapas.

local T = 8
local function centro(n) return n * T + T / 2 end
local function ficha(tx, ty, contenido) return { tipo = "ficha", x = centro(tx), y = centro(ty), contenido = contenido } end
local function spawn(tx, ty, desde)     return { tipo = "spawn", x = centro(tx), y = centro(ty), desde = desde } end
local function puerta(tx, ty, destino)  return { tipo = "puerta", x = tx * T, y = ty * T, w = T, h = T, destino = destino } end
local MUSICA_B = "assets/fm1_coral.ogg"
-- zona invisible: al pisarla se abre un diálogo (texto puede ser un string o una lista de strings)
local function disparador(tx, ty, tw, th, texto)
    return { tipo = "disparador", x = tx * T, y = ty * T, w = tw * T, h = th * T, texto = texto }
end

-- objeto recogible del puzzle: item = nombre; sprite opcional (por defecto assets/item_<item>.png)
local function objeto(tx, ty, item, sprite)
    return { tipo = "objeto", x = centro(tx), y = centro(ty), item = item, sprite = sprite }
end

-- opciones: mapa, siguiente, musica, tilesAncho, tilesAlto, paredes = { {x,y,w,h}, ... }
local function sala(id, titulo, entidades, opciones)
    local s = opciones or {}
    s.id, s.titulo, s.entidades = id, titulo, entidades or {}
    return s
end

local function npc(tx, ty, cfg)
    cfg.tipo, cfg.x, cfg.y = "npc", centro(tx), centro(ty)
    return cfg
end

local lista = {
    sala("presentacion1", "Presentacion 1", { ficha(10, 6, "concepto"), ficha(18, 10, "pilares") },
        { mapa = "mapa/presentacion1.lua", siguiente = "presentacion2" }),

    sala("presentacion2", "Receptores", { ficha(14, 6, "publico") },
        { mapa = "mapa/apresentacao.lua", siguiente = "plano" }),

    sala("plano", "Plano de evacuacion", { ficha(14, 6, "plano") },
        { mapa = "mapa/evacuacion.lua", siguiente = "inspiraciones" }),

    sala("inspiraciones", "Inspiraciones", { ficha(14, 6, "inspiraciones") },
        { mapa = "mapa/inspiraciones.lua", siguiente = "mecanicas1" }),

    sala("mecanicas1", "La Historia", { ficha(14, 6, "mecanicas1") },
        { mapa = "mapa/mecanicas1.lua", siguiente = "mecanicas2" }),

    sala("mecanicas2", "Mecanicas 2", { ficha(14, 6, "mecanicas2") },
        { mapa = "mapa/mecanicas2.lua", siguiente = "mecanicas3" }),

    sala("mecanicas3", "Mecanicas 3 - Reglas", { ficha(14, 6, "mecanicas3") },
        { mapa = "mapa/mecanicas3.lua", siguiente = "mecanicas4" }),

    sala("mecanicas4", "Mecanicas 4 - Elecciones", { ficha(14, 6, "mecanicas4") },
        { mapa = "mapa/mecanicas4.lua", siguiente = "paleta1" }),

    sala("paleta1", "Lo Visual ...", { ficha(14, 6, "paleta1") },
        { mapa = "mapa/paleta1.lua", siguiente = "paleta2" }),

    sala("paleta2", "Los colores", { ficha(14, 6, "paleta2") },
        { mapa = "mapa/paleta2.lua", siguiente = "musica" }),

    sala("musica", "Lo sonoro", { ficha(14, 6, "musica") },
        { mapa = "mapa/musica.lua", siguiente = "despedida" }),

    sala("despedida", "Despedida", { ficha(14, 6, "despedida") },
        { mapa = "mapa/despedida.lua",
          final = { requiere = "Gem in i", contenido = "final", luego = "nivelB1",
                    falta = "Epa... Te falto algo" } }),

        -- ===== NUEVAs Salas ====
    
    sala("nivelB1", "Nivel B1",
        { disparador(14, 8, 2, 1, "Yo soy yo... yo soy Vos, somos todos y uno, y aún así debemos continuar") },
        { mapa = "mapa/nivelB1.lua", siguiente = "nivelB2", musica = MUSICA_B,
          animacion = { patron = "assets/anim1/frame%02d.png", frames = 13, fps = 8 } }),

    sala("nivelB2", "Nivel B2",
        { npc(10, 8, { nombre = "edo", sprite = "assets/edo.png", entrega = "Transform1",
                       lineas = { "Hola corazón. Fijate si te sirve esto" },
                       despues = { "Anda probando, no lo desperdicies" } }) },
        { mapa = "mapa/nivelB2.lua", siguiente = "nivelB3", musica = MUSICA_B }),

    sala("nivelB3", "Nivel B3", {}, { mapa = "mapa/nivelB3.lua", siguiente = "nivelB4", musica = MUSICA_B }),
    sala("nivelB4", "Nivel B4", {}, { mapa = "mapa/nivelB4.lua", siguiente = "nivelB5", musica = MUSICA_B }),
    sala("nivelB5", "Nivel B5", {}, { mapa = "mapa/nivelB5.lua", siguiente = "nivelB6", musica = MUSICA_B }),
    sala("nivelB6", "Nivel B6", {}, { mapa = "mapa/nivelB6.lua", siguiente = "nivelB7", musica = MUSICA_B }),
    sala("nivelB7", "Nivel B7", {}, { mapa = "mapa/nivelB7.lua", siguiente = "nivelB8", musica = MUSICA_B }),   -- última de la serie
    sala("nivelB8", "Nivel B8", {}, { mapa = "mapa/nivelB8.lua", musica = MUSICA_B }),
}

-- Salas cuyo mapa aún no existe: spawn y puerta provisorios
for _, s in ipairs(lista) do
    if not love.filesystem.getInfo(s.mapa) then
        table.insert(s.entidades, spawn(3, 8))
        if s.siguiente then table.insert(s.entidades, puerta(28, 8, s.siguiente)) end
    end
end

-- Una pista para todas las salas (si una sala define la suya, esa gana)
for _, s in ipairs(lista) do
    s.musica = s.musica or "assets/musicafondo.ogg"
end

return lista