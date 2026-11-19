-- Cada receta: piezas que hay que juntar -> resultado (la palabra nueva).
-- Se arma sola cuando el inventario tiene todas las piezas.
-- unica = true: se arma una sola vez (así volver a juntar las mismas piezas no la repite).
return {
    { piezas = { "gem", "in", "I" }, resultado = "Gem in i", mensaje = "Gem + in + I = Gemini", unica = true },
    { piezas = { "bolsa", "linga", "palo" }, resultado = "lingera", mensaje = "Bagayo + Linga + Palo = Linghera", unica = true },
}
