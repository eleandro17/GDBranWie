# GDBranWie

GDD (High Concept) jugable. O aventura gráfica en diseño. Un juego top-down hecho con LOVE2D

> Autoría y materia: Emilio Leandro Gómez Viera

## Cómo jugarlo

**Con LÖVE instalado** (versión **11.5**; Debian/Ubuntu: `sudo apt install love`), desde la carpeta del proyecto:

```
love .
```

También se puede abrir el archivo `GDD.love`: en Linux con `love GDD.love`, y en Windows arrastrándolo sobre `love.exe` (o con doble clic si LÖVE está instalado). Descarga de LÖVE: [love2d.org](https://love2d.org).

## Controles

| Tecla | Acción |
|---|---|
| Flechas | Caminar, de a un paso |
| Espacio | Leer una ficha cercana / pasar de página |
| Espacio o Enter | Avanzar o cerrar un diálogo |
| `<` `>` | Página anterior / siguiente dentro de una ficha |
| `O` | Abrir el enlace de la ficha |
| Esc | Cerrar la ficha o el diálogo, o volver al menú |
| Enter | Entrar a la sala elegida (menú) |

## Recorrido

El menú lista las salas y permite saltar a cualquiera. Jugando, cada sala tiene una puerta a la siguiente:

Presentación 1 → Receptores → Plano de evacuación → Inspiraciones → La Historia → Mecánicas 2 → 3 → 4 → Lo Visual → Los colores → Lo sonoro → Despedida

**Puzzle:** hay objetos escondidos en distintas salas. Al juntar las piezas `gem`, `in` e `I` se combinan solas en una palabra nueva. El inventario se ve abajo en pantalla.

**Última puerta:** con la palabra armada en el inventario, la puerta de Despedida abre la ficha final. Sin ella, devuelve al inicio, conservando lo ya recogido.

### Nueva serie (en desarrollo)

Una continuación del recorrido: una primera sala con una animación a pantalla casi completa, música nueva y seis salas más con una dinámica distinta de objetos y puzzles.

## Estructura del proyecto

```
main.lua            arranque y ventana (lienzo 240x136, escala x3)
dependencias.lua    librerías y módulos
inventario.lua      objetos recogidos y combinaciones
animacion.lua       animación por cuadros sueltos (PNG)
jugador.lua         movimiento por pasos y sprite
estados/            máquina de estados: menú y sala genérica
otros/              ficha, panel de lectura (fichaLarga), objeto
datos/
  salas.lua         orden del recorrido, mapa, música y sala siguiente
  contenido.lua     todo el texto del GDD, en páginas
  combinaciones.lua recetas del puzzle
mapa/               mapas exportados de Tiled (.lua) y sus tilesets (.png)
assets/             imágenes, animaciones, fuente y música
lib/                librerías de terceros
```

## Cómo agregar o cambiar contenido

- **Texto de una ficha:** se edita en `datos/contenido.lua`. Cada ficha tiene páginas con `titulo`, `texto` y, opcionalmente, `imagen`. Una página con imagen y sin texto muestra la imagen a todo el ancho.
- **Una sala nueva:** una entrada más en `datos/salas.lua`, con su `mapa` y su `siguiente`. Si el mapa todavía no existe, el juego genera una sala provisoria para poder probar el recorrido. Opciones de cada sala:
  - `mapa`: archivo de Tiled exportado a Lua.
  - `siguiente`: id de la sala a la que lleva su puerta.
  - `musica`: pista de la sala. Si la sala siguiente usa la misma, no se reinicia; si usa otra, cambia.
  - `animacion`: animación de fondo.
  - `final`: condición de la última puerta (`requiere`, `contenido`, `falta`).
- **Una animación de fondo:** cuadros PNG sueltos numerados (`assets/anim1/frame01.png`, `frame02.png`...), configurados con `animacion = { patron = "assets/anim1/frame%02d.png", frames = 13, fps = 8 }`. Se dibuja centrada en la sala.
- **Un diálogo por posición:** un `disparador(...)` en la lista de entidades de la sala. Al pisar su zona se abre el texto, una vez por visita a la sala. El texto puede ser una frase o una lista de frases.
- **Un objeto del puzzle:** en Tiled, una capa de objetos llamada `objeto` con un rectángulo de 8x8 cuyo **Name** sea el nombre del objeto. Sprite opcional: `assets/item_<nombre>.png`.
- **Una receta nueva:** una línea en `datos/combinaciones.lua`.

## Mapas (Tiled)

- Tiles de 8x8, mapas no infinitos.
- Capas que lee el juego: tiles (se dibujan todas), `paredes` (colisiones), `puerta`, `spawn` y `objeto`.
- Se editan los `.tmx` y se **exportan a Lua** en `mapa/`. El juego solo lee los `.lua`.
- El destino de cada puerta lo define `siguiente` en `datos/salas.lua`, no las propiedades del mapa.

## Build

1. `.love`: zip del proyecto con `main.lua` en la raíz (sin `.git`, `.vscode` ni `.tmx`).
2. Windows, opcional (ejecutable propio): `cat love.exe GDD.love > GDD.exe` con el `love.exe` de la misma versión (11.5), y copiar las DLLs de LÖVE al lado.

## Créditos

- Motor: [LÖVE](https://love2d.org) 11.5
- Librerías: [HUMP](https://github.com/vrld/hump) (class, camera), [STI](https://github.com/karai17/Simple-Tiled-Implementation) y [bump.lua](https://github.com/kikito/bump.lua)
- Fuente: Press Start 2P
- Marco teórico: Katie Salen y Eric Zimmerman, *Rules of Play: Game Design Fundamentals*, MIT Press, 2004
- Arte, música y textos: Dibujos hechos en papel, despues en libresprite y Tiled, música sintetizada y grabada en Ardour y plugins gratuitos y/o de código abierto. Textos propios, dibujos propios y música y sonidos caseros. Todo caserito.