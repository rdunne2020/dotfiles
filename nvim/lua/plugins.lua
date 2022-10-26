local settings = require("settings")
local fn = vim.fn

local install_path = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"

local function get_config(name)
  return string.format('require("config/%s")', name)
end

local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("coding.treesitter"),
    run = ":TSUpdate",
  })

  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

  use({ "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" })

  use({ "onsails/lspkind-nvim" })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("coding.cmp"),
  })

  -- install rust-tools
  use({ "simrat39/rust-tools.nvim", config = get_config("coding.rust-tools") })

  use({ "rafamadriz/friendly-snippets" })

  use({
    "L3MON4D3/LuaSnip",
    requires = "saadparwaiz1/cmp_luasnip",
    config = get_config("coding.luasnip"),
  })

  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })

  -- {{{ LSP
  use({ "neovim/nvim-lspconfig", config = get_config("lsp.lsp") })

  -- Move up above the cmp setup since cmp imports this use({ "onsails/lspkind-nvim" })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_config("lsp.null-ls"),
  })

  use({ "SmiteshP/nvim-navic" })

  use({
    "williamboman/mason.nvim",
    cmd = "Mason*",
    module = "mason-tool-installer",
    requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = get_config("lsp.mason"),
  })
  -- }}} LSP

  -- {{{ UI
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = get_config("ui.telescope"),
  })
  use({ "jvgrootveld/telescope-zoxide" })
  use({ "crispgm/telescope-heading.nvim" })
  use({ "nvim-telescope/telescope-symbols.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "nvim-telescope/telescope-packer.nvim" })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use({ "ptethng/telescope-makefile" })
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "NeoTree*",
    requires = {
      {
        "s1n7ax/nvim-window-picker", -- only needed if you want to use the commands with "_with_window_picker" suffix
        config = get_config("ui.nvim-window-picker"),
      },
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = get_config("ui.neotree"),
  })
  use({ "numToStr/Navigator.nvim", config = get_config("ui.navigator") })

  use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = get_config("ui.symbols"),
  })

  use({
    "akinsho/nvim-toggleterm.lua",
    config = get_config("ui.toggleterm"),
  })

  use({ "ahmedkhalf/project.nvim", config = get_config("ui.project") })

  use({ "folke/which-key.nvim", config = get_config("ui.which-key") })

  if settings.theme == "nightfox" then
    use({ "EdenEast/nightfox.nvim", config = get_config("ui.themes.nightfox") })
  elseif settings.theme == "tundra" then
    use({ "sam4llis/nvim-tundra", config = get_config("ui.themes.tundra") })
  elseif settings.theme == "tokyonight" then
    use({ "folke/tokyonight.nvim", branch = "main", config = get_config("ui.themes.tokyonight") })
  else
    use({ "catppuccin/nvim", as = "catppuccin", config = get_config("ui.themes.catppuccin") })
  end

  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = get_config("ui.alpha"),
  })

  use({
    "anuvyklack/windows.nvim",
    event = "VimEnter",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = get_config("ui.windows"),
  })

  use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = get_config("ui.noice"),
    requires = {
      "MunifTanjim/nui.nvim",
      { "rcarriga/nvim-notify", config = get_config("ui.notify") },
    },
  })
  -- }}} UI
end)
