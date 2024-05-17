local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "tpope/vim-surround",
        lazy = false
    },
    {
        "vim-scripts/ReplaceWithRegister",
        lazy = false
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
    	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim'},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup {
			defaults = {
				mappings = {
					i = {
						["<Up>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,
					},
				},
			}
		}
	end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
	config = function()
		require("telescope").setup {
  			extensions = {
    				["ui-select"] = {
      					require("telescope.themes").get_dropdown {
      					}
    				}
  			}
		}
		require("telescope").load_extension("ui-select")
	end
    },
    {
        "nvim-tree/nvim-tree.lua",
  	    version = "*",
  	    lazy = false,
  	    dependencies = {
    	    "nvim-tree/nvim-web-devicons",
  	    },
 	    config = function()
    		vim.g.loaded = 1
		    vim.g.loaded_netrwPlugin = 1
		    require("nvim-tree").setup {
			    actions = {
				    open_file = {
					    window_picker = {
						    enable = false,
					    },
				    },
			    },
		    }
	    end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
	"echasnovski/mini.completion",
	version = false,
	config = function() require("mini.completion").setup() end
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.cmake.setup({})
            lspconfig.gopls.setup({})
            lspconfig.pyre.setup({})
            lspconfig.mesonlsp.setup({})
            lspconfig.elixirls.setup({})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install")
        end,
        config = function()
            require("nvim-treesitter").setup(
            {
                highlight = { enable = true },
                indent = { enable = true },
                ensure_install = {
                    "bash",
                    "c",
                    "c_sharp",
                    "cmake",
                    "cpp",
                    "elixir",
                    "go",
                    "haskell",
                    "html",
                    "javascript",
                    "css",
                    "lua",
                    "make",
                    "scala",
                }
            }
            )
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true
            }
        end,
    },
    {
            "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(client, bufnr)
      -- your on_attach function
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
    },
    {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {

    }
}
local opts = {}
require("lazy").setup(plugins, opts)
require("Comment").setup()
require("lualine").setup()
require("mason").setup()


