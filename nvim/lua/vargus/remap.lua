local which_key = require("which-key")
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')


which_key.add({
  { "<leader>e", "<cmd>Yazi<cr>", desc = "Explore files" },
})


-- Telescope Commands

which_key.add({
  { "<leader>s",  group = "Search" },
  { "<leader>sf", builtin.find_files, desc = "Search files" },
  { "<leader>sg", builtin.git_files,  desc = "Search git files" },
  { "<leader>ss", builtin.grep_string,  desc = "Search text under cursor" },
  { "<leader>st", builtin.live_grep,  desc = "Search text" },
  { "<leader>sh", builtin.help_tags,  desc = "Search help tags" },
  { "<leader>sl", builtin.lsp_references,  desc = "List references" },
  { "<leader>sd", "<cmd>Telescope live_grep search_dirs={vim.fn.expand('%:p:h')}<CR>", desc = "Search Text in Subdirectory" },
  { "<leader>so", "<cmd>Telescope live_grep grep_open_files=true<CR>", desc = "Search Text in open files" },
  { "<leader>sr", builtin.oldfiles, desc = "Open Recent File" },
  { "<leader>sx", builtin.resume, desc = "Resume" },
})

which_key.add({
  { "<leader>l",  group = "Lsp search" },
  { "<leader>lr", builtin.lsp_references, desc = "Lists lsp references" },
  { "<leader>lb", builtin.lsp_document_symbols, desc = "Lists lsp buffer symbols" },
  { "<leader>lw", builtin.lsp_workspace_symbols, desc = "Lists lsp workspace symbols" },
  { "<leader>ld", builtin.diagnostics, desc = "Lists lsp diagnostics symbols" },
})

which_key.add({
  { "<leader>g",  group = "Git" },
  { "<leader>gs", builtin.git_status, desc = "Git status" },
  { "<leader>gt", builtin.git_stash, desc = "Git stash" },
  { "<leader>gc", builtin.git_commits, desc = "Git commits" },
  { "<leader>gb", builtin.git_bcommits, desc = "Git commits for buffer" },
  { "<leader>gr", builtin.git_bcommits_range, desc = "Git commits for buffer, ranged" },
})

which_key.add({
  { "gd",  builtin.lsp_definitions, desc="Go to definition" },
  { "gi",  builtin.lsp_implementations, desc="Go to implementation" },
})

-- Register the semicolon mapping separately as it doesn't use the leader prefix
which_key.add({
  { ";", builtin.buffers, desc = "Find buffers" },
  { "E", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" , mode = 'n'}
})

which_key.add({
    {
      "<leader>x",
      group = "Trouble"
    },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  })


-- Format command
-- vim.keymap.set("n", "<leader>f", function()
-- vim.lsp.buf.format()
-- end)

-- insert commands

vim.keymap.set({ 'n', 'v' }, "n", "j") -- down
vim.keymap.set({ 'n', 'v' }, "e", "k") -- up
vim.keymap.set({ 'n', 'v' }, "i", "l") -- right
vim.keymap.set({ 'n', 'v' }, "l", "i") -- insert before
vim.keymap.set({ 'n', 'v' }, "k", "n") -- search forward
vim.keymap.set({ 'n', 'v' }, "K", "N") -- search backward
vim.keymap.set({ 'n', 'v' }, "N", "L") -- go to bottom
vim.keymap.set({ 'n', 'v' }, "L", "I") -- insert beginning of line

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<c-d>"] = actions.delete_buffer,
            },
            n = {
                ["<c-d>"] = actions.delete_buffer,
            },
        },
    },
}

-- vim.keymap.set({ 'n', 'v' }, "j", "e") -- 
--vim.keymap.set({ 'n', 'v' }, "N", "J")
-- vim.keymap.set({ 'n', 'v' }, "E", "K")
--vim.keymap.set({ 'n', 'v' }, "I", "L")
--vim.keymap.set({ 'n', 'v' }, "J", "E")
--vim.keymap.set({ 'n', 'v' }, "K", "N")
--vim.keymap.set({ 'n', 'v' }, "L", "I")
