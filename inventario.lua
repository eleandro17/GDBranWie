-- Inventario global: vive fuera de EstadoSala, así sobrevive al cambio de sala.
-- `recogidos` recuerda qué objetos ya se tomaron, para que no reaparezcan al volver.
inventario = { items = {}, recogidos = {} }

function inventario.reiniciar()
    inventario.items, inventario.recogidos = {}, {}
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

-- Si están todas las piezas de una receta, las reemplaza por el resultado
-- y devuelve la receta. Si no, devuelve nil.
function inventario.combinar()
    for _, r in ipairs(COMBINACIONES) do
        local completa = true
        for _, pieza in ipairs(r.piezas) do
            if not indice(pieza) then completa = false end
        end
        if completa then
            for _, pieza in ipairs(r.piezas) do
                table.remove(inventario.items, indice(pieza))
            end
            table.insert(inventario.items, r.resultado)
            return r
        end
    end
end