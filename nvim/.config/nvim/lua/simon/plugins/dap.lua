return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- UI for the debugger
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            -- shows variable values inline
            "theHamsta/nvim-dap-virtual-text",
            -- installs debuggers via Mason
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Mason installs codelldb automatically
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true,
            })

            -- Virtual text (show variable values inline while debugging)
            require("nvim-dap-virtual-text").setup()

            -- UI setup
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.4 },
                            { id = "breakpoints", size = 0.2 },
                            { id = "stacks", size = 0.2 },
                            { id = "watches", size = 0.2 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })

            -- Auto open/close UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- C++ adapter using codelldb
            local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Debug current file",
                    type = "codelldb",
                    request = "launch",
                    -- compiles with debug symbols first, then debugs
                    program = function()
                        local file = vim.fn.expand("%")
                        local out = "/tmp/" .. vim.fn.expand("%:r") .. "_debug"
                        vim.fn.system(string.format("g++ -std=c++17 -g -o %s %s", out, file))
                        return out
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    stdio = { "in.txt", nil, nil }, -- reads from in.txt automatically
                },
            }

            -- Keymaps
            local map = vim.keymap.set

            map("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
            map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
            map("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
            map("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
            map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
            map("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "DAP: Conditional Breakpoint" })
            map("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
            map("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
            map("n", "<leader>dx", dap.terminate, { desc = "DAP: Terminate" })
        end,
    },
}
