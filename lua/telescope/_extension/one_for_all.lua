return require("telescope").register_extension {
   setup = {},
   exports = {
    one_for_all = require("one-for-all").colors
   } 
}