return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
        direction = "float",
        float_opts = {
            border = "curved",
        },
        winbar = {
            enabled = false,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end
        },
    },
}
