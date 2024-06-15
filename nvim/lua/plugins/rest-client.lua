local h = require("helpers")

h.g.rest_client_cookie_file = vim.fn.expand("~/cookie.txt")
h.autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.http", "*.rest" }, command = "set filetype=http" })
