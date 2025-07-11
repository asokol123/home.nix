{ pkgs, lib, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in {
  imports = [
    ./nixvim
    nixvim.homeManagerModules.nixvim
  ];

  home.username = "asokolovskii";
  home.homeDirectory = "/Users/asokolovskii";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.packages = with pkgs; [
    qemu

    yabai
    skhd
    eternal-terminal

    vscode

    rustup

    ripgrep
    unzip
    unixtools.watch
    wget
    ncdu
    websocat
    bat
    most
    sshpass

    killall

    (python312.withPackages(python-pkgs: with python-pkgs; [
      autopep8
      ipython
      jupytext
      numpy
      pandas
      polars
      requests
    ]))
    uv

    cargo-cranky

    clang
    clang-tools
    jdk21

    jetbrains-mono
    fira-code
    open-dyslexic
    cascadia-code
    # gohufont # dpkg is broken

    dbeaver-bin
    firefox
    kitty
    iterm2
    raycast
    slack
    spotify
    postman
    jetbrains.pycharm-community-bin
  ];

  home.file = {
  };

  home.sessionPath = [
    "/Users/asokolovskii/.nix-profile/bin"
  ];

  home.sessionVariables = {
    LIBRARY_PATH = ''${lib.makeLibraryPath [pkgs.libiconv]}''${LIBRARY_PATH:+:$LIBRARY_PATH}'';
    RUSTFLAGS = "-L ${pkgs.libiconv}/lib";
  };

  programs = {
    command-not-found = {
      enable = true;
    };
    git = {
      aliases = {
        lol = "log --oneline --graph --all";
        co = "checkout";
      };
      enable = true;
      userName = "Aleksei Sokolovskii";
      userEmail = "asokolovskii@bhft.com";
      difftastic = {
        enable = true;
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;

      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
    };
    fd = {
      enable = true;
      hidden = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    go = {
      enable = true;
    };
    htop.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "poshmon";
    };
    ssh = {
      addKeysToAgent = "yes";
      enable = true;
      includes = ["~/.ssh/custom-config"];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      autocd = true;
      autosuggestion = {
        enable = true;
      };
      enable = true;
      # defaultKeymap = "viind";
      defaultKeymap = "emacs";
      dotDir = ".config/zsh";
      enableVteIntegration = true;
      history = {
        path = "$ZDOTDIR/.zsh_history";
        size = 1000000000;
      };
      initContent = ''
        [[ -f $HOME/.config/zsh/zshrc ]] && source ~/.config/zsh/zshrc
      '';
      oh-my-zsh = {
        enable = true;
      };
      shellAliases = {
        cd = "z";
        pip = "uv pip";
        avim = "NVIM_APPNAME=astronvim nvim";
        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
        rsync = "rsync -azvhP";
        H = "| head";
        T = "| tail";
        G = "| grep";
        L = "| less";
        M = "| most";
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
