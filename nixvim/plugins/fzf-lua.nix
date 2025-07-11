{
  programs.nixvim = {
    plugins = {
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
    };
  };
} 