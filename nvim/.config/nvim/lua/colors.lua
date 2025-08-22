local palette = {
  Default = "#AAB7C7", -- Default
  Keywords = "#F92672", -- Keywords
  String = "#E6DA74", -- String
  Number = "#AE81FF", -- Number
  Class = "#65DAEF", -- Class, Struct
  Abstract = "#68B0AB", -- Abstract Class
  Interface = "#0FD38B", -- Interface, Protocol
  Method = "#A6E22F", -- Method
  Parameter = "#FD971E", -- Parameter
  VariableMember = "#CF8823",
  Local = "#CAAD96", -- Local variable
  Annotation = "#BCB52A", -- Annotation
  Comment = "#7A7A7A", -- Comment
  Doc = "#639756", -- Doc
  Enum = "#4186F8", -- Enum, Constant
  Typealias = "#517974", -- Typealias, Generic Type
  Package = "#A9B7C6", -- modules
  Border = "#393637",
  BuiltInType = "#21999D",
  ParameterN = "#EADCB2",
  VariableT = "#CBAD96",
  NeoTreeNormalBG = "#252525",
  NeoTreeCode = "#028CA8", -- Abstract Class
  NeoTreeTest = "#7F3873", -- Abstract Class
  NeoTreeMock = "#397172", -- Abstract Class
  NeoTreeDir = "#6F4F2E", -- Abstract Class
  NeoTreeDirText = "#A28E74", -- Abstract Class
  NeoTreePipe = "#BA7346", -- Abstract Class
  NeoTreePipeEnd = "#E78A4F", -- Abstract Class
  NeoTreeCursor = "#212222",
  NeoTreeDirOpen = "#E78A4F",
  TeleResults = "#222223",
  none = "none",

  -- variables
  InnerVar = "#B15D5E",
  C_err = "#21999D",
  C_var0 = "#AE8D69",
  C_var1 = "#2B9A54",
  C_var2 = "#B56C55",
  C_var3 = "#9D527C",
  C_var4 = "#76903E",
  C_var5 = "#339C78",
  C_var6 = "#C98474",
  C_var7 = "#967E76",
  C_var8 = "#6A8759",
  C_var9 = "",
  C_var10 = "",
  C_var11 = "",
}

local colorPalette = {
  { fg = "#B15D5E" },
  { fg = "#A26079" },
  { fg = "#BE7070" },
  { fg = "#3D8A47" },
  { fg = "#C18A8A" },
  { fg = "#BF8D8D" },
  { fg = "#D49DA5" },
  { fg = "#7FEC35" },
  { fg = "#F6B223" },
  { fg = "#F67C1B" },
  { fg = "#DE9A4E" },
  { fg = "#BBEA87" },
  { fg = "#EEF06D" },
  { fg = "#8FB272" },
  { fg = "#8FB333" },
}

local overrides = {
  rosewater = "#ea6962",
  flamingo = "#ea6962",
  red = "#ea6962",
  maroon = palette.Parameter, -- parameters
  pink = "#d3869b",
  mauve = palette.Keywords, -- keyword
  peach = "#e78a4e",
  yellow = "#d8a657",
  green = palette.String, -- strings
  teal = "#89b482",
  sky = "#89b482",
  sapphire = "#89b482",
  blue = "#7E9CD8", -- methods functions
  lavender = "#7daea3",
  text = palette.Default, -- default
  subtext1 = "#d5c4a1",
  subtext0 = "#bdae93",
  overlay2 = palette.Comment, -- comments
  overlay1 = "#928374",
  overlay0 = "#595959",
  surface2 = "#4d4d4d",
  surface1 = "#404040",
  surface0 = "#292929",
  base = "#322F30",
  mantle = "#322F30",
  crust = "#322F30",
}

return {
  palette = palette,
  colorpalette = colorPalette,
  overrides = overrides,
}
