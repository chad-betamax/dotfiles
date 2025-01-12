return {
	
  {
    -- syntax highlighting for justfiles
	  "NoahTheDuke/vim-just", 
	  ft = { "just" }, -- Lazy-load for `just` filetype
	  config = function()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "just",
        callback = function()
          vim.bo.shiftwidth = 4
          vim.bo.tabstop = 4
          vim.bo.expandtab = true
        end,
      })
    end,
  },
  {
    -- easy commenting (select text in visual mode then \cc)
	  'numToStr/Comment.nvim',
	  opts = {
		  vim.keymap.set(
      'x', 
      '<Leader>cc', -- Key mapping
      '<Plug>(comment_toggle_linewise_visual)', 
      { desc = "Toggle comment (visual)" }
      )
  		}
	},
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    -- colour scheme picker
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
      themes = {
        "angr", "apprentice", "deus", "gotham256",
        "hybrid_reverse", "hybrid", "jellybeans",
        "materialbox", "meta5", "minimalist", "molokai",
        "molokayo", "one-dark", "one", "PaperColor", "pink-moon",
        "sierra", "space-vim-dark", "sunbather",
        "tender", "termschool", "wombat256mod", 
        },
      livePreview = true,
      })
    end
  },
  {
    "wfxr/minimap.vim",
        config = function()
          vim.g.minimap_width = 10
          vim.g.minimap_auto_start = 1 -- auto start 
          vim.g.minimap_auto_start_win_enter = 1 -- start when entering a window
          
          -- Key mapping to toggle Minimap
          vim.api.nvim_set_keymap(
            'n',                        -- Mode: normal mode
            '<Leader>m',                -- Key mapping
            ':MinimapToggle<CR>',       -- Command to execute
            { noremap = true, silent = true } -- Options
          )
        end,
  },
  {
    -- oh so pretty greeting screen
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
};
}


