{ pkgs, ... }:
{
  imports = [
    ./blink-cmp.nix
    ./fzf-lua.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./rustaceanvim.nix
    ./simple.nix
  ];

  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      gruvbox-material
      goto-preview
      vim-highlightedyank
      messenger-nvim
      vim-polyglot
      fugitive-gitlab-vim
    ] ++ [
    ];

    globals.fugitive_gitlab_domains = ["https://gitlab.advsys.work"];

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
