{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          # basedpyright.enable = true;
          clangd.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          gopls.enable = true;
          hls = {
            enable = true;
            installGhc = true;
          };
          kotlin_language_server.enable = true;
          lemminx.enable = true;
          neocmake.enable = true;
          nixd.enable = true;
          pyright.enable = true;
          serve_d.enable = true;
          sourcekit.enable = true;
          texlab.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            # grr, gri, gra, grn
            # gr = {
            #   action = "references";
            #   desc = "Goto References";
            # };
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
    };
  };
} 
