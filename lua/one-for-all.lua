local M = {}

function M.sayHello()
    print("Hello World")
end

function M.setup(opts)
    opts = opts or {}

    vim.api.nvim_create_user_command("HelloWorld", M.sayHello, {})
end

return M
