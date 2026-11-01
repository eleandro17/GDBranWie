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
  nextobjectid = 72,
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
        62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 38, 62, 62, 62, 62, 62, 62, 62, 62, 62, 99, 100, 62, 62, 62, 62, 62, 62, 62, 62,
        111, 112, 83, 83, 83, 111, 112, 83, 83, 83, 83, 83, 111, 112, 38, 111, 112, 83, 37, 83, 111, 112, 83, 83, 83, 83, 83, 83, 83, 62,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62, 83,
        83, 83, 83, 83, 83, 83, 83, 83, 38, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62, 83,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 37, 83, 83, 83, 83, 83, 83, 83, 37, 83, 83, 83, 83, 83, 83, 83, 83, 62, 83,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 49, 49, 49, 49,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 59, 60, 49,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 71, 72, 49,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 49, 49, 49, 49,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 49, 49, 49,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62, 83,
        83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 62,
        142, 130, 130, 142, 142, 130, 142, 142, 142, 132, 142, 142, 132, 132, 142, 142, 142, 142, 132, 142, 142, 142, 132, 142, 142, 132, 142, 132, 142, 142
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "paredes",
      class = "",
      visible = false,
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
          height = 54.75,
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
          x = 216.667,
          y = 72.8333,
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
          x = 4.5,
          y = 103.667,
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
