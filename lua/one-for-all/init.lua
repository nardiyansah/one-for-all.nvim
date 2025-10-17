-- Main module for the Hello World plugin
local M = {}

-- Function to print the hello message
function M.say_hello()
  local buf = vim.api.nvim_create_buf(false, true)

  local content = { 'Hello World!' }
  vim.api.nvim_buf_set_lines(buf, 0, 0, false, content)

  local width = vim.api.nvim_get_option_value("columns")
  local height = vim.api.nvim_get_option_value("lines")

   -- Calculate floating window size and position
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }

  vim.api.nvim_open_win(buf, true, opts)
end

-- Function to set up the plugin (Most package managers expect the plugin to have a setup function)
function M.setup(opts)
  -- Merge user options with defaults
  opts = opts or {}

  -- Create the user command
  vim.api.nvim_create_user_command("Hello", M.say_hello, {})

  -- Set up a key mapping
  -- Use opts.keymap if provided, otherwise default to '<leader>hw'
  local keymap = opts.keymap or '<leader>hw'

  -- Create the keymap
  vim.keymap.set('n', keymap, M.say_hello, { 
    desc = "Say hello from our plugin",
    silent = true  -- Prevents the command from being echoed in the command line
  })
end

-- Return the module
return M