require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,

    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}