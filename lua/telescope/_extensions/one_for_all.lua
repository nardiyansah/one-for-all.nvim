return require("telescope").register_extension {
   exports = {
    one_for_all = require("one-for-all").command_palletes
   } 
}