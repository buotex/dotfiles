vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " " -- Set leader key before Lazy
 
require("vargus.lazy_init")
require("vargus.remap")
require("vargus.set")
