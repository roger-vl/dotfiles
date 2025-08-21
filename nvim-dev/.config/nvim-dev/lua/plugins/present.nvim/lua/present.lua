local M = {}

M.setup = function()
  print("setup")
end

---@class present.Slides
---@field slides string[]: Slides of the file

--- Parse lines
---@param lines string[]: Lines on buffer
---@return present.Slides
local parse_slide = function(lines)
  local slides = { slides = {} }
  for _, line in ipairs(lines) do
    print(line)
  end
  return slides
end

parse_slide({ "some", "sim" })

return M
