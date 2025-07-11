{ pkgs, ... }:
{
  imports = [
    ./simple.nix
    ./fzf-lua.nix
    ./nvim-tree.nix
    ./blink-cmp.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      gruvbox-material
      goto-preview
      vim-highlightedyank
      messenger-nvim
      vim-polyglot
    ] ++ [
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