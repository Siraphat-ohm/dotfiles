return {
    -- Competitive programming test runner
    {
        "xeluxee/competitest.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("competitest").setup({
                runner_ui = { interface = "split" },
                compile_command = {
                    cpp = {
                        exec = "g++",
                        args = { "-std=c++17", "-O2", "-Wall", "-o", "$(BINPATH)", "$(FNAME)" },
                    },
                    python = { exec = "python3" },
                },
                run_command = {
                    cpp = { exec = "$(BINPATH)" },
                    python = { exec = "python3", args = { "$(FNAME)" } },
                },
                testcases_directory = "./tests",
            })
        end,
    },
}
