{
  imports = [
    ./plugins.nix
    ./keymaps.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    opts = {
      autoindent = true;
      number = true;

      # Appearance
      termguicolors = true;
      showtabline = 2;
      cursorline = true;
      cursorcolumn = true;

      smartcase = true;
      ignorecase = true;

      # Text
      tabstop = 4;
      shiftwidth = 0;
      expandtab = true;
      wrap = false;
      linebreak = true;
      list = true;
    };

    # colorschemes.rose-pine.enable = true;
    colorscheme = "gruvbox-material";

    globals.mapleader = " ";
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          desc = "Open/Close Neotree";
        };
      }
    ];

    editorconfig.enable = true;
  };
}
