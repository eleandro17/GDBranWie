require "dependencias"


ventana = { ancho = 240, alto = 136, escala = 3 }

MaqEstadoGlobal = MaqEstados{
    ["menu"] = function() return EstadoMenu() end,
    ["sala"] = function() return EstadoSala() end,
}

function love.load()
    love.window.setTitle("GDD - High Concept")
    love.window.setMode(ventana.ancho * ventana.escala, ventana.alto * ventana.escala)
    love.graphics.setDefaultFilter("nearest", "nearest")
    lienzo = love.graphics.newCanvas(ventana.ancho, ventana.alto)
    love.keyboard.setKeyRepeat(true)   -- mantener flecha = seguir caminando
    MaqEstadoGlobal:cambiar("menu")
end

function love.keypressed(key, scancode, repetida)
    local estado = MaqEstadoGlobal.actual
    if estado.inputsJuego then estado:inputsJuego(key, repetida) end
end

function love.update(dt)
    MaqEstadoGlobal.actual:actualizar(dt)
end

function love.draw()
    MaqEstadoGlobal.actual:dibujar()
end
