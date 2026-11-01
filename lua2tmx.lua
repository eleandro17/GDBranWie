-- Convierte un mapa exportado por Tiled a Lua (.lua) de vuelta a .tmx, para poder editarlo.
-- Uso:  lua5.1 lua2tmx.lua mapa/algo.lua      ->  crea mapa/algo_recuperado.tmx
-- No pisa ningún .tmx existente.

local ruta = arg[1]
assert(ruta, "uso: lua5.1 lua2tmx.lua mapa/archivo.lua")
local m = dofile(ruta)

local function esc(s)
    s = tostring(s)
    s = s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;")
    return s
end

local out = {}
local function w(s) table.insert(out, s) end

local function propiedades(t, sangria)
    if not t or next(t) == nil then return end
    local claves = {}
    for k in pairs(t) do table.insert(claves, k) end
    table.sort(claves)
    w(sangria .. "<properties>")
    for _, k in ipairs(claves) do
        local v = t[k]
        if type(v) == "boolean" then
            w(string.format('%s <property name="%s" type="bool" value="%s"/>', sangria, esc(k), tostring(v)))
        elseif type(v) == "number" then
            w(string.format('%s <property name="%s" type="float" value="%s"/>', sangria, esc(k), tostring(v)))
        else
            w(string.format('%s <property name="%s" value="%s"/>', sangria, esc(k), esc(v)))
        end
    end
    w(sangria .. "</properties>")
end

local bg = ""
if m.backgroundcolor then
    bg = string.format(' backgroundcolor="#%02x%02x%02x"',
        m.backgroundcolor[1], m.backgroundcolor[2], m.backgroundcolor[3])
end

w('<?xml version="1.0" encoding="UTF-8"?>')
w(string.format('<map version="1.10" tiledversion="%s" orientation="%s" renderorder="%s" width="%d" height="%d" tilewidth="%d" tileheight="%d" infinite="0"%s nextlayerid="%d" nextobjectid="%d">',
    esc(m.tiledversion or "1.10"), esc(m.orientation or "orthogonal"), esc(m.renderorder or "right-down"),
    m.width, m.height, m.tilewidth, m.tileheight, bg, m.nextlayerid or 99, m.nextobjectid or 999))
propiedades(m.properties, " ")

for _, ts in ipairs(m.tilesets or {}) do
    w(string.format(' <tileset firstgid="%d" name="%s" tilewidth="%d" tileheight="%d" tilecount="%d" columns="%d">',
        ts.firstgid, esc(ts.name), ts.tilewidth, ts.tileheight, ts.tilecount or 0, ts.columns or 0))
    local trans = ts.transparentcolor and (' trans="' .. esc(ts.transparentcolor:gsub("#", "")) .. '"') or ""
    w(string.format('  <image source="%s"%s width="%d" height="%d"/>', esc(ts.image), trans, ts.imagewidth, ts.imageheight))
    w(' </tileset>')
end

for _, l in ipairs(m.layers or {}) do
    local vis = (l.visible == false) and ' visible="0"' or ""
    local op = (l.opacity and l.opacity ~= 1) and (' opacity="' .. l.opacity .. '"') or ""
    if l.type == "tilelayer" then
        w(string.format(' <layer id="%d" name="%s" width="%d" height="%d"%s%s>', l.id, esc(l.name), l.width, l.height, vis, op))
        propiedades(l.properties, "  ")
        w('  <data encoding="csv">')
        local filas = {}
        for y = 0, l.height - 1 do
            local fila = {}
            for x = 1, l.width do fila[x] = l.data[y * l.width + x] end
            filas[#filas + 1] = table.concat(fila, ",")
        end
        w(table.concat(filas, ",\n"))
        w('  </data>')
        w(' </layer>')
    elseif l.type == "objectgroup" then
        w(string.format(' <objectgroup id="%d" name="%s"%s%s>', l.id, esc(l.name), vis, op))
        propiedades(l.properties, "  ")
        for _, o in ipairs(l.objects or {}) do
            local tipo = (o.type and o.type ~= "") and (' type="' .. esc(o.type) .. '"') or ""
            local nombre = (o.name and o.name ~= "") and (' name="' .. esc(o.name) .. '"') or ""
            local tam = ""
            if o.width and o.width > 0 then tam = tam .. ' width="' .. o.width .. '"' end
            if o.height and o.height > 0 then tam = tam .. ' height="' .. o.height .. '"' end
            w(string.format('  <object id="%d"%s%s x="%s" y="%s"%s>', o.id, nombre, tipo, tostring(o.x), tostring(o.y), tam))
            propiedades(o.properties, "   ")
            if o.shape == "point" then w('   <point/>')
            elseif o.shape == "ellipse" then w('   <ellipse/>') end
            w('  </object>')
        end
        w(' </objectgroup>')
    elseif l.type == "imagelayer" then
        w(string.format(' <imagelayer id="%d" name="%s"%s%s>', l.id, esc(l.name), vis, op))
        if l.image then w(string.format('  <image source="%s"/>', esc(l.image))) end
        w(' </imagelayer>')
    end
end
w('</map>')

local destino = ruta:gsub("%.lua$", "") .. "_recuperado.tmx"
local f = assert(io.open(destino, "w"))
f:write(table.concat(out, "\n"), "\n")
f:close()
print("Creado: " .. destino)
