local status, neorg = pcall(require, "neorg")
if not status then
    return
end

neorg.setup({
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Documents/notes",
                },
            },
        },
        ["core.keybinds"] = {}, -- Loads default keybindings
        ["core.integrations.treesitter"] = {}, -- Treesitter integration for better syntax highlighting and folding
    },
})
