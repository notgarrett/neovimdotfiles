local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end
vim.g.nvim_tree_quit_on_open = 0 -- this doesn't play well with barbar

local options = {
    ensure_installed = { "lua" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

treesitter.setup(options)
