--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "storm"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.lsp.buffer_mappings.normal_mode["E"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "List references" }
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })



-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
vim.opt.shell = "/bin/sh"
vim.keymap.set({ 'n', 'v' }, "n", "j")
vim.keymap.set({ 'n', 'v' }, "e", "k")
vim.keymap.set({ 'n', 'v' }, "i", "l")
vim.keymap.set({ 'n', 'v' }, "j", "e")
vim.keymap.set({ 'n', 'v' }, "k", "n")
vim.keymap.set({ 'n', 'v' }, "l", "i")

vim.keymap.set({ 'n', 'v' }, "N", "J")
-- vim.keymap.set({ 'n', 'v' }, "E", "K")
vim.keymap.set({ 'n', 'v' }, "I", "L")
vim.keymap.set({ 'n', 'v' }, "J", "E")
vim.keymap.set({ 'n', 'v' }, "K", "N")
vim.keymap.set({ 'n', 'v' }, "L", "I")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.autopairs.active = false
lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.project.manual_mode = false
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.which_key.setup.plugins.registers = true


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell", "d" }
lvim.builtin.treesitter.highlight.enabled = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "pylyzer" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.diagnostics.ruff,
  }
})
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "ruff" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}


-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup()
    end,
  },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "ellisonleao/glow.nvim" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")
        }
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "ilyachur/cmake4vim"
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }
}
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
  -- any other extensions loading
end
-- lvim.builtin.telescope.defaults.layout_strategy = "vertical"

local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i = vim.tbl_extend("keep",
  {
    ["<C-T>"] = function(prompt_bufnr, _mode)
      require("trouble.providers.telescope").open_with_trouble(prompt_bufnr,
        _mode)
    end
  },
  lvim.builtin.telescope.defaults.mappings.i)

lvim.builtin.which_key.mappings["m"] = {
  name = "Make",
  b = { "<cmd>CMakeBuild<cr>", "CMake Build" },
  c = { "<cmd>CMakeClean<cr>", "CMake Clean" },
  t = { "<cmd>CMakeBuild tests <cr> CTest<cr>", "Run tests" },
}
lvim.builtin.which_key.mappings["s"] = {
  name = "Search",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  d = { "<cmd>Telescope live_grep search_dirs={vim.fn.expand('%:p:h')}<CR>", "Search Text in Subdirectory" },
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  s = { "<cmd>Telescope grep_string<cr>", "Search String" },
  t = { "<cmd>Telescope live_grep_args<CR>", "Search Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  p = {
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}
lvim.builtin.which_key.mappings["d"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["q"] = {
  name = "Persistence",
  d = { "<cmd>lua require('persistence').stop()<cr>", "Stop saving session" },
  l = { "<cmd>lua require('persistence').load({last = true})<cr>", "restore last" },
  s = { "<cmd>lua require('persistence').load()<cr>", "restore for current directory" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "ﭧ Test",
  f = {
    "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), env=require('user.ntest').get_env()})<cr>",
    "File",
  },
  o = { "<cmd>lua require('neotest').output.open({ enter = true, short = false })<cr>", "Output" },
  r = { "<cmd>lua require('neotest').run.run({env=require('user.ntest').get_env()})<cr>", "Run" },
  a = { "<cmd>lua require('user.ntest').run_all()<cr>", "Run All" },
  c = { "<cmd>lua require('user.ntest').cancel()<cr>", "Cancel" },
  R = { "<cmd>lua require('user.ntest').run_file_sync()<cr>", "Run Async" },
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
  n = { "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", "jump to next failed" },
  p = { "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", "jump to previous failed" },
  d = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "Dap Run" },
  x = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  w = { "<cmd>lua require('neotest').watch.watch()<cr>", "Watch" },
}


--local dashboard = require "alpha.themes.dashboard"
--lvim.builtin.alpha.dashboard.section.buttons.val[1] =
--dashboard.button("SPC f", "  Find File", "<CMD>Telescope find_files<CR>")
--lvim.builtin.alpha.dashboard.section.buttons.val[5] =
--dashboard.button("SPC s t", "  Find Word", "<CMD>Telescope live_grep_args<CR>")
--lvim.builtin.alpha.dashboard.section.buttons.val[7] =
--dashboard.button("SPC q l", "💾 Restore last session", "<CMD>lua require('persistence').load({last=true})<CR>")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  {
    pattern = { "COMMIT_EDITMSG", "MERGEMSG" },
    command = [[ lua require('persistence').stop() ]]
  })

vim.api.nvim_create_autocmd({ "BufReadPost" },
  {
    pattern = { "*.cpp", "*.h", "*.cpp.in", "*.h.in" },
    command = [[
    let filename = findfile('CMakeLists.txt', '.;')
    let g:CMAKE_LOCATIONS = get(g:, "CMAKE_LOCATIONS", {})
    silent! let g:CMAKE_LOCATIONS[expand('%:p')]=filename
    let g:CMAKE_PROJECTS = get(g:, "CMAKE_PROJECTS", {})
    silent! let g:CMAKE_PROJECTS[expand('%:p')]=matchlist(readfile(filename), 'project(\([a-z_]\+\))')[1]
    ]]
  })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
  {
    pattern = { "*.cpp", "*.h", "*.cpp.in", "*.h.in" },
    command = [[ silent! let g:cmake_src_dir=fnamemodify(g:CMAKE_LOCATIONS[expand("%:p")], ':h') |
                 silent! let g:cmake_build_dir=$CATKIN_BUILD_DIR . "/" . g:CMAKE_PROJECTS[expand("%:p")] |
    ]]
  })
vim.g.make_arguments = "-j28"

function Find_cmake_dir(fname)
  local util = require("lspconfig/util")
  local filename = util.path.is_absolute(fname) and fname
      or util.path.join(vim.loop.cwd(), fname)
  local cmake_pattern = util.root_pattern("CMakeLists.txt")
  return cmake_pattern(filename)
end

function Find_project_name(cmake_dir)
  local cmake_path = cmake_dir .. "/CMakeLists.txt"
  if (cmake_path)
  then
    local project_name = vim.fn.matchlist(vim.fn.readfile(cmake_path), 'project(\\([a-z_]\\+\\))')[2]
    return project_name
  end
  return ""
end

function Find_project_dir(fname)
  local catkin_build_dir = os.getenv("CATKIN_BUILD_DIR")
  print(catkin_build_dir)
  local cmake_dir = Find_cmake_dir(fname)
  print(cmake_dir)
  local project_name = Find_project_name(cmake_dir)
  print(project_name)
  return catkin_build_dir .. "/" .. project_name
end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
