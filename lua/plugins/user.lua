-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "neo-tree.nvim",
    opts = function()
      return {
        filesystem = {
          window = {
            mappings = {
              -- disable fuzzy finder
              ["/"] = "noop",
              -- Jump to current nodes parent
              -- like `p` in NERDTree Mappings
              ["P"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local parent_node = tree:get_node(node:get_parent_id())
                local renderer = require "neo-tree.ui.renderer"
                renderer.redraw(state)
                renderer.focus_node(state, parent_node:get_id())
              end,
              ["T"] = { "toggle_preview", config = { use_float = true } },
            },
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
        },
      }
    end,
  },

  {
    "catppuccin/nvim",
    init = function() -- init function runs before the plugin is loaded
      require("catppuccin").setup { flavour = "frappe" }
    end,
  },

  {
    "shaunsingh/nord.nvim",
    init = function()
      vim.g.nord_italic = false
      require("nord").set()
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    init = function()
      markdown = {
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
      }
    end,
  },
  {
    "APZelos/blamer.nvim",
    -- https://github.com/APZelos/blamer.nvim
    init = function()
      vim.g.blamer_enabled = true
      vim.g.blamer_prefix = " > "
      vim.g.blamer_delay = 500
    end,
  },

  -- {
  --   "keaising/im-select.nvim",
  --   lazy = false,
  --   config = function()
  --     require("im_select").setup {
  --       -- IM will be set to `default_im_select` in `normal` mode
  --       -- For Windows/WSL, default: "1033", aka: English US Keyboard
  --       -- For macOS, default: "com.apple.keylayout.ABC", aka: US
  --       -- For Linux, default: "keyboard-us" for Fcitx5 or "1" for Fcitx or "xkb:us::eng" for ibus
  --       -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name you preferred
  --       default_im_select = "com.apple.keylayout.ABC",
  --       -- Can be binary's name or binary's full path,
  --       -- e.g. 'im-select' or '/usr/local/bin/im-select'
  --       -- For Windows/WSL, default: "im-select.exe"
  --       -- For macOS, default: "im-select"
  --       -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
  --       default_command = "/opt/homebrew/bin/im-select",
  --       -- Restore the default input method state when the following events are triggered
  --       set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
  --       -- Restore the previous used input method state when the following events are triggered
  --       -- if you don't want to restore previous used im in Insert mode,
  --       -- e.g. deprecated `disable_auto_restore = 1`, just let it empty `set_previous_events = {}`
  --       set_previous_events = { "InsertEnter" },
  --       -- Show notification about how to install executable binary when binary is missing
  --       keep_quiet_on_no_binary = false,
  --     }
  --   end,
  -- },
}
