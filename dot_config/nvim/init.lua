-- Set the Leader key to \
vim.g.mapleader = "\\"

-- Set up lazy.nvim as plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Copy and paste functionality
vim.opt.clipboard = "unnamedplus"
-- set y to yank text to right click
vim.keymap.set("v", "<leader>y", '"*y', { noremap = true, silent = true })


-- Function to set indentation with customizable values
local function set_indentation(shiftwidth, tabstop, expandtab)
  vim.opt_local.shiftwidth = shiftwidth  -- Number of spaces to use for each step of (auto)indent
  vim.opt_local.tabstop = tabstop        -- Number of spaces that a <Tab> counts for
  vim.opt_local.expandtab = expandtab    -- Convert tabs to spaces
end

-- Bash and Lua use 2 space indents 
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "sh" },
  callback = function()
    set_indentation(2, 2, true)  -- Set shiftwidth=2, tabstop=2, and expandtab=true
  end,
})


-- Enable search highlighting
vim.opt.hlsearch = true

-- Disable highlight after leaving command line
vim.cmd [[
  autocmd CmdlineLeave /,? :set nohlsearch
]]
