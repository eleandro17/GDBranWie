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
  nextobjectid = 73,
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
        1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3,
        25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27, 25, 26, 27,
        9, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 96, 83, 83, 83, 11,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 83, 83, 83, 23,
        33, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 96, 83, 83, 35,
        9, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 83, 96, 96, 83, 11,
        21, 22, 22, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 96, 96, 23,
        33, 22, 22, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 59, 60, 96, 96, 35,
        9, 22, 22, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 71, 72, 96, 96, 11,
        21, 22, 22, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 83, 96, 96, 23,
        33, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 22, 22, 35,
        9, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 22, 22, 22, 11,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 22, 22, 22, 22, 23,
        33, 22, 125, 125, 22, 22, 22, 125, 22, 22, 22, 125, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 96, 22, 22, 22, 22, 22, 35,
        9, 22, 125, 125, 22, 22, 125, 125, 125, 22, 22, 125, 125, 125, 22, 125, 125, 125, 125, 22, 22, 22, 96, 96, 96, 22, 22, 22, 22, 11,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23,
        33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35, 33, 34, 35
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
          width = 7.25,
          height = 77.0833,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.25,
          y = 80,
          width = 8.25,
          height = 54.5,
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
          y = 128.5,
          width = 220.5,
          height = 6.5,
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
          height = 9,
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
      properties = {
        ["destino"] = "inspiraciones"
      },
      objects = {
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200.333,
          y = 56.1667,
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
      properties = {
        ["desde"] = "plano"
      },
      objects = {
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40.5,
          y = 56.3333,
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
