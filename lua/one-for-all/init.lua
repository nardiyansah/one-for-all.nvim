---@class Command
---@field prefix string Show group/tag of command
---@field usage string Detail usage of command
---@field cmd function Action to run
local Command = {}

---@type Command[]
local CommandList = {
  {
    prefix = "Test",
    usage = "Print test",
    cmd = print("Hello")
  }
}

local function get_command_list()
  return CommandList
end

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
    prompt_title = "Commands",
    finder = finders.new_table {
      results = get_command_list(),
      entry_maker = function (entry)
        return {
          value = entry,
          display = entry.prefix .. " : " .. entry.usage,
          ordinal = entry.usage
        }
      end
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

return M