return require("telescope").register_extension {
   exports = {
    command_palletes = require("one-for-all").command_palletes
   } 
}