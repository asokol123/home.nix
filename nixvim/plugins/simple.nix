{
  programs.nixvim = {
    plugins = {
      # Interface
      lualine.enable = true;
      web-devicons.enable = true;
      snacks.enable = true;
      noice.enable = true;
      which-key.enable = true;
      bufferline.enable = true;

      # Text editing
      treesitter.enable = true;
      visual-multi.enable = true;
      nvim-autopairs.enable = true;
      illuminate.enable = true;
      leap.enable = true;

      # Integrations
      gitsigns.enable = true;
      rustaceanvim.enable = true;
      dap.enable = true;
      dap-ui.enable = true;
      crates.enable = true;
      lspkind.enable = true;
      diffview.enable = true;
      none-ls.enable = true;
      auto-session.enable = true;
      aerial.enable = true;
      neogit.enable = true;
      nvim-ufo.enable = true;
    };
  };
} 
