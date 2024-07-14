-- Set this to true to enable debug debug_prints, false to disable them
local debug_mode = false

local function debug_print(message)
    if debug_mode then
        debug_print(message)
    end
end


debug_print("Starting nvim-cmp configuration")

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    debug_print("Failed to load cmp")
    return
end
debug_print("cmp loaded successfully")

-- lspkind adds vscode-like pictograms to neovim built-in lsp
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    debug_print("Failed to load lspkind")
    return
end
debug_print("lspkind loaded successfully")

vim.opt.completeopt = "menu,menuone,noselect"

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    debug_print("Failed to load luasnip")
    return
end
debug_print("luasnip loaded successfully")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
})

debug_print("nvim-cmp setup completed")
