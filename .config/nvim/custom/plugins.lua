local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require'lspconfig'.clangd.setup{}
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
            }
        }
    },
}
return plugins
