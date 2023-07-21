-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- HINT: Find the selected key set by going into edit mode, then press ctrl-v and the keys you wish to map

-- Copied from lazyvim.config.keymaps so we have a simple map functions
-- Better than using vim.map.set :P
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- From the demo video
-- map("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

-- Toggle Neotree using ctrl-b
map("n", "<C-b>", ":Neotree toggle<CR>")

-- Move to start/end of line using Ctrl and left/right
map("n", "<C-Left>", "<esc>^", { desc = "Move to start of line", remap = true })
map("n", "<C-Right>", "<esc>$", { desc = "Move to end of line", remap = true })

-- Map Ctrl-p to find files
map("n", "<C-p>", require("telescope.builtin").find_files)

-- Map Ctrl-Shift-p to command console
-- map("n", "<C-S-p>", "CmdLine".console , { desc = "Command console" })

-- Move Lines using Ctrl-shift and up/down
map("i", "<C-S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("n", "<C-S-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-S-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Duplicate Line using Ctrl-Shift-d
map("n", "<C-S-D>", "<cmd>t.<cr>", { desc = "Duplicate line" })
map("i", "<C-S-D>", "<esc><cmd>t.<cr>", { desc = "Duplicate line" })
map("v", "<C-S-D>", "y'>p", { desc = "Duplicate line" })
