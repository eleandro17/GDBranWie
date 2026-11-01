return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 17,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 7,
  nextobjectid = 75,
  properties = {},
  tilesets = {
    {
      name = "fondo_tileset2",
      firstgid = 1,
      class = "",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 12,
      image = "fondo_tileset2.png",
      imagewidth = 96,
      imageheight = 96,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      wangsets = {},
      tilecount = 144,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 17,
      id = 1,
      name = "piso",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        86, 86, 86, 86, 49, 49, 49, 49, 49, 49, 49, 49, 49, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 75, 76,
        86, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 76, 75, 75, 76,
        86, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 22, 22, 22, 22, 83, 129, 130, 131, 132, 129, 130, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 22, 22, 22, 22, 83, 141, 142, 143, 144, 141, 142, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 22, 22, 22, 22, 83, 129, 130, 131, 132, 129, 130, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 22, 22, 22, 22, 83, 141, 142, 143, 144, 141, 142, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 99, 99, 99, 99, 129, 130, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 111, 111, 111, 111, 75, 75, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 99, 99, 99, 99, 87, 87, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75, 75, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 87, 87, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 59, 60, 83, 83, 83, 75, 75, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 71, 72, 83, 83, 83, 75, 87, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 87, 75, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75, 75, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 75,
        49, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 75
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "paredes",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 232.25,
          y = 1.5,
          width = 7.5,
          height = 134.25,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.25,
          y = 0.25,
          width = 9.25,
          height = 135.083,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 10.5,
          y = 120.167,
          width = 220.5,
          height = 14.8333,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 9,
          y = 0.5,
          width = 222,
          height = 22.3333,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "puerta",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48.333,
          y = 95.5003,
          width = 15,
          height = 16,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["destino"] = "plano"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "spawn",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 24.8333,
          y = 32.333,
          width = 14,
          height = 16,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["desde"] = "presentacion1"
          }
        }
      }
    }
  }
}
