---@class Command
---@field prefix string Show group/tag of command
---@field usage string Detail usage of command
---@field cmd function Action to run
local Command = {}

---@type Command[]
local CommandList = {
  {
    prefix = "Telescope",
    usage = "Find Files",
    cmd = function() 
     require('telescope.builtin').find_files()
    end
  }
}

local function get_command_list()
  return CommandList
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

-- Add a setup function that your init.lua expects
function M.setup(opts)
  opts = opts or {}
  -- You can add any setup logic here if needed
  -- For now, this is just a placeholder to prevent the error
end

function M.command_palletes(opts)
  opts = opts or require('telescope.themes').get_dropdown{}
  
  pickers.new(opts, {
    prompt_title = "Commands",
    finder = finders.new_table {
      results = get_command_list(),
      entry_maker = function (entry)
        return {
          value = entry,
          display = entry.prefix .. " : " .. entry.usage,
          ordinal = entry.usage,
          cmd = entry.cmd
        }
      end
    },
    attach_mappings = function (prompt_bufnr, map)
      actions.select_default:replace(function ()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.schedule(function ()
          if entry.cmd then
            entry.cmd()
          else
             vim.notify("Error: No cmd function found", vim.log.levels.ERROR)
          end
        end)
      end)
      return true
    end,
    sorter = conf.generic_sorter(opts),
  }):find()
end

return M