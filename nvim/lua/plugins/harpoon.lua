local h = require("helpers")

require("telescope").load_extension("harpoon")

h.noremap("n", "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>")
h.noremap("n", "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
h.noremap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>")
h.noremap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_next()<cr>")
h.noremap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
h.noremap("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
h.noremap("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
h.noremap("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
h.noremap("n", "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>")
