-- Inventario global: vive fuera de EstadoSala, así sobrevive al cambio de sala.
-- recogidos:  qué objetos ya se tomaron (no reaparecen al volver).
-- fabricados: qué resultados ya se armaron (las recetas `unica` no se repiten).
inventario = { items = {}, recogidos = {}, fabricados = {} }

-- Nombre que se muestra en pantalla (si un id no está acá, se muestra tal cual)
inventario.nombres = {
    bolsa = "Bagayo", linga = "Linga", palo = "Palo",
    Transform1 = "T1", lingera = "Linghera",
}

function inventario.nombre(id)
    return inventario.nombres[id] or id
end

function inventario.reiniciar()
    inventario.items, inventario.recogidos, inventario.fabricados = {}, {}, {}
end

local function indice(item)
    for i, v in ipairs(inventario.items) do
        if v == item then return i end
    end
end

function inventario.tiene(item)
    return indice(item) ~= nil
end

function inventario.agregar(item, clave)
    inventario.recogidos[clave] = true
    if not indice(item) then table.insert(inventario.items, item) end
end

-- Combinación automática: si están todas las piezas de una receta, las reemplaza
-- por el resultado y devuelve la receta. Una receta `unica` se arma una sola vez.
function inventario.combinar()
    for _, r in ipairs(COMBINACIONES) do
        if not (r.unica and inventario.fabricados[r.resultado]) then
            local completa = true
            for _, pieza in ipairs(r.piezas) do
                if not indice(pieza) then completa = false end
            end
            if completa then
                for _, pieza in ipairs(r.piezas) do
                    table.remove(inventario.items, indice(pieza))
                end
                table.insert(inventario.items, r.resultado)
                inventario.fabricados[r.resultado] = true
                return r
            end
        end
    end
end

-- Transformación manual (tecla T): con el transformador en el inventario,
-- cada objeto de la regla cambia de sentido. El transformador no se gasta.
function inventario.puedeTransformar()
    for _, t in ipairs(TRANSFORMACIONES) do
        if indice(t.requiere) then
            for _, par in ipairs(t.cambios) do
                if indice(par[1]) then return true end
            end
        end
    end
    return false
end

-- Devuelve la lista de cambios hechos: { {de=, a=}, ... }
function inventario.transformar()
    local hechos = {}
    for _, t in ipairs(TRANSFORMACIONES) do
        if indice(t.requiere) then
            for _, par in ipairs(t.cambios) do
                local i = indice(par[1])
                if i then
                    inventario.items[i] = par[2]
                    table.insert(hechos, { de = par[1], a = par[2] })
                end
            end
        end
    end
    return hechos
end
