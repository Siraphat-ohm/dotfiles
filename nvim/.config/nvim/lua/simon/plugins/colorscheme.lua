return {
    "echasnovski/mini.base16",
    version = "*",
    lazy = false,
    priority = 1000,
    config = function()
        -- Define your HackTheBox palette
        -- I have mapped your JSON colors to the Base16 standard for the best result.
        -- Note: I used the "Bright" versions of Blue/Purple/Cyan for better readability on the dark background.
        local htb_palette = {
            base00 = "#1a2332", -- background
            base01 = "#313f55", -- cursorColor / selectionBackground
            base02 = "#313f55", -- selection
            base03 = "#666666", -- brightBlack (Comments)
            base04 = "#a4b1cd", -- foreground (Darker text)
            base05 = "#a4b1cd", -- foreground (Main text)
            base06 = "#ffffff", -- white
            base07 = "#ffffff", -- brightWhite
            base08 = "#ff8484", -- brightRed (Variables)
            base09 = "#ffaf00", -- yellow (Integers/Orange)
            base0A = "#ffcc5c", -- brightYellow (Classes)
            base0B = "#9fef00", -- green (Strings)
            base0C = "#5cecc6", -- brightCyan (Support)
            base0D = "#5cb2ff", -- brightBlue (Functions) - Used bright for contrast
            base0E = "#c16cfa", -- brightPurple (Keywords) - Used bright for contrast
            base0F = "#ff3e3e", -- red (Deprecated/Brown)
        }

        require("mini.base16").setup({
            palette = htb_palette,
            use_cterm = true, -- Use terminal colors
        })
    end,
}
