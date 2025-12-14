return {
    "echasnovski/mini.base16",
    version = "*",
    lazy = false,
    priority = 1000,
    config = function()
        local htb_palette = {
            base00 = "#1a2332",
            base01 = "#313f55",
            base02 = "#313f55",
            base03 = "#666666",
            base04 = "#a4b1cd",
            base05 = "#a4b1cd",
            base06 = "#ffffff",
            base07 = "#ffffff",
            base08 = "#ff8484",
            base09 = "#ffaf00",
            base0A = "#ffcc5c",
            base0B = "#9fef00",
            base0C = "#5cecc6",
            base0D = "#5cb2ff",
            base0E = "#c16cfa",
            base0F = "#ff3e3e",
        }

        require("mini.base16").setup({
            palette = htb_palette,
        })
    end,
}
