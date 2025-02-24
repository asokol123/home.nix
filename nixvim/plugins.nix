{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      # interface
      lualine.enable = true;
      web-devicons.enable = true;
      fzf-lua = {
        enable = true;
        profile = "telescope";
        settings.winopts.preview.default = "bat";
        keymaps = {
          "<leader>lfd" = {
            action = "diagnostics_document";
            options = {
              silent = true;
              desc = "Find buffer diagnostics";
            };
          };
          "<leader>lfD" = {
            action = "diagnostics_workspace";
            options = {
              silent = true;
              desc = "Find workspace diagnostics";
            };
          };
        };
      };
      nvim-tree.enable = true;
      snacks.enable = true;
      noice.enable = true;
      which-key.enable = true;
      bufferline.enable = true;

      # text
      treesitter.enable = true;
      visual-multi.enable = true;
      nvim-autopairs.enable = true;
      illuminate.enable = true;
      leap.enable = true;

      # integrations
      gitsigns.enable = true;
      rustaceanvim.enable = true;
      dap.enable = true;
      dap-ui.enable = true;
      crates.enable = true;
      cmp = {
        autoEnableSources = true;
        enable = true;
        settings = {
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
          };

          preselect = "cmp.PreselectMode.None";

          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          basedpyright.enable = true;
          clangd.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI= {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>lw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>lr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "<leader>lfL" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "]d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "[d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
      lspkind.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-cmdline.enable = true;
      diffview.enable = true;
      none-ls.enable = true;
      auto-session.enable = true;
      aerial.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      gruvbox-material
      goto-preview
      vim-highlightedyank
      messenger-nvim
      vim-polyglot
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>lS";
        action = "<cmd>AerialToggle!<CR>";
        options = {
          desc = "Symbols outline";
        };
      }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }
    ];
  };
}
