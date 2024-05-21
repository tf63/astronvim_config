-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- https://docs.astronvim.com/recipes/colorscheme
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.dracula-nvim" },
  -- { import = "astrocommunity.colorscheme.everforest" },
  -- { import = "astrocommunity.colorscheme.iceberg-vim" },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- { import = "astrocommunity.colorscheme.mellow-nvim" },
  -- { import = "astrocommunity.colorscheme.night-owl-nvim" },
  -- { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  -- { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  -- { import = "astrocommunity.colorscheme.poimandres-nvim" },
  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.colorscheme.vim-dogrun" },
  -- { import = "astrocommunity.colorscheme.vscode-nvim" },
  -- import/override with your plugins folder
}
