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
    -- easy commenting (select text then 'gc')
	  'numToStr/Comment.nvim',
	  opts = {
		  -- add any options here
  		}
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
    -- oh so pretty greeting screen
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
};
}


