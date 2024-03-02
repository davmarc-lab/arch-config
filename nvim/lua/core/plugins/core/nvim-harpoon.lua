return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local harpoon = require("harpoon")
        harpoon.setup()

        vim.keymap.set("n", "<leader>hs", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle menu", })
        vim.keymap.set("n", "<leader>ha", function () harpoon:list():append() end, { desc = "Harpoon add file", })

        vim.keymap.set("n", "<C-q>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-p>", function() harpoon:list():next() end)
    end,
}
