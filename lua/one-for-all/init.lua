local pickers = require "telescope.pickers"
local finders = require "telescope.finders"

local colors = function ()
  pickers.new({
  prompt_title = "colors",
  finder = finders.new_table {
    results = { "red", "green", "blue"}
  }
}):find()
end

return colors