local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local M = {}

-- Add a setup function that your init.lua expects
function M.setup(opts)
  opts = opts or {}
  -- You can add any setup logic here if needed
  -- For now, this is just a placeholder to prevent the error
end

function M.colors(opts)
  opts = opts or {}
  
  pickers.new(opts, {
    prompt_title = "Colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

return M