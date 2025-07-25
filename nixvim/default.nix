{ lib, ... }:
let
  utils = import ./utils.nix { inherit lib; };
  keymaps = import ./keymaps.nix;
in {
  imports = [
    ./plugins
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

      # ufo
      foldcolumn = "1";
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
    };

    # colorschemes.rose-pine.enable = true;
    colorscheme = "gruvbox-material";

    globals.mapleader = " ";

    keymaps = utils.convertKeymaps keymaps;

    editorconfig.enable = true;
  };
}
