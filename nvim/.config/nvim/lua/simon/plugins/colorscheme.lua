return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "dawn", -- light theme (options: "auto", "main", "moon", "dawn")
            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },
        })

        vim.cmd("colorscheme rose-pine-dawn")
    end,
}
