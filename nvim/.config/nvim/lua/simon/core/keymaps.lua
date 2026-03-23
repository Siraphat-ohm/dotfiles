vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ── Competitive Programming ──────────────────────────────────────────

-- Compile & run with in.txt → output printed inline
keymap.set("n", "<F9>", function()
    local file = vim.fn.expand("%")
    local out = vim.fn.expand("%:r")
    vim.cmd("w")
    vim.cmd(
        string.format(
            "!g++ -std=c++17 -O2 -Wall -Wl,-z,stacksize=268435456 -o /tmp/%s %s && /tmp/%s < in.txt",
            out,
            file,
            out
        )
    )
end, { desc = "CP: Compile & Run" })

-- CompetiTest
keymap.set("n", "<leader>cr", "<cmd>CompetiTestRun<cr>", { desc = "CP: Run tests" })
keymap.set("n", "<leader>ca", "<cmd>CompetiTestAdd<cr>", { desc = "CP: Add test" })
keymap.set("n", "<leader>cd", "<cmd>CompetiTestDelete<cr>", { desc = "CP: Delete test" })
keymap.set("n", "<leader>cf", "<cmd>CompetiTestReceive<cr>", { desc = "CP: Fetch tests from browser" })

-- Open in.txt and out.txt side by side
keymap.set("n", "<leader>io", function()
    vim.cmd("vsplit in.txt")
    vim.cmd("split out.txt")
end, { desc = "CP: Open in/out split" })
