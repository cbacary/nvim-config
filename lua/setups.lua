
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true }, -- enable treesitter syntax highlighting
    indent = { enable = true }, -- better indentation behavior
    ensure_installed = {
        -- auto-install the Treesitter parser for python and related languages
        "python",
        "toml",
        "rst",
        "ninja",
        -- needed for formatting code-blocks inside markdown via conform.nvim
        "markdown", 
        "markdown_inline", 
        "lua",
    },
}

-- SEMSHI
vim.g.python3_host_prog = vim.fn.exepath("python")
-- better done by LSP
vim.g["semshi#error_sign"] = false
vim.g["semshi#simplify_markup"] = false
vim.g["semshi#mark_selected_nodes"] = false
vim.g["semshi#update_delay_factor"] = 0.001

-- Setting semshiGlobal to altfont essentially disables semshiGlobal
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    callback = function()
        vim.cmd([[
            highlight semshiSelf guifg=#4FC1FE guibg=NONE
            highlight! semshiGlobal gui=altfont
            highlight! link semshiImported @lsp.type.namespace
            highlight! link semshiParameter @lsp.type.parameter
            highlight! link semshiParameterUnused DiagnosticUnnecessary
            highlight! link semshiBuiltin @function.builtin
            highlight! link semshiAttribute @field
            highlight! link semshiUnresolved @lsp.type.unresolvedReference
            highlight! link semshiFree @comment
        ]])
    end,
})

-- THEME
vim.o.background = 'dark'
require('vscode').load()

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black", "isort" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

require('auto-session').setup()

-- Indent blank line
require('ibl').setup({
    scope = {
        -- Removes annoying thing that underlines current scope
        enabled = true,
        show_start = true,
        show_end = true,
    },
    indent = {
        char = "|",
        smart_indent_cap = false,
    }
})

require('lualine').setup()
require('gitsigns').setup()

-- Set fold keybinds for UFO
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

