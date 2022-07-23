local M = {}

local userPlugins = require "custom.plugins"

M.options = {
   user = function()
      require "custom.options"
   end,
}

M.ui = {
   theme = "catppuccin",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.configs.lspconfig",
      },
   },
   override = {
      ["hrsh7th/nvim-cmp"] = {
         formatting = {
            format = function(entry, vim_item)
               if entry.source.name == "copilot" then
                  vim_item.kind = "[] Copilot"
                  vim_item.kind_hl_group = "CmpItemKindCopilot"
                  return vim_item
               end

               local icons = require("nvchad_ui.icons").lspkind
               vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
               return vim_item
            end,
         },
         sources = {
            { name = "copilot" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "path" },
         },
      },
      ["kyazdani42/nvim-tree.lua"] = {
         view = {
            hide_root_folder = false,
         },
         git = {
            enable = true,
         },
      },
      ["nvim-treesitter/nvim-treesitter"] = {
         rainbow = {
            enable = true,
         },
      },
   },
   user = userPlugins,
}

M.mappings = require "custom.mappings"

return M
