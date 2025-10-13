{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./nixvim
    inputs.nixvim.homeModules.nixvim
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
    # zed-editor
    code-cursor
    cursor-cli
    utm

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
    just
    cmake
    libiconv
    zstd
    tldr
    hydra-check

    nix-output-monitor
    nh

    killall

    (python313.withPackages(python-pkgs: with python-pkgs; [
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

    # jetbrains-mono
    fira-code
    open-dyslexic
    cascadia-code
    nerd-fonts.fira-code
    # gohufont # dpkg is broken

    bitwarden-desktop
    colima
    dbeaver-bin
    # firefox
    alacritty
    iterm2
    raycast
    # spotify # spotify tries to download from webarchive and fails
    postman
    docker
    # jetbrains.pycharm-community-bin
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
    kitty = {
      enable = true;
      enableGitIntegration = true;
    };
    lazygit.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "poshmon";
    };
    ssh = {
      enable = true;
      includes = ["~/.ssh/custom-config"];
      enableDefaultConfig = false;
      matchBlocks."*" = {
        forwardAgent = false;
        addKeysToAgent = "yes";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
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
      dotDir = "${config.xdg.configHome}/zsh";
      enableVteIntegration = true;
      history = {
        path = "$ZDOTDIR/.zsh_history";
        size = 1000000000;
      };
      initContent = ''
        [[ -f $HOME/.config/zsh/zshrc ]] && source ~/.config/zsh/zshrc
      '' + builtins.readFile ./cursor.zsh;
      oh-my-zsh = {
        enable = true;
      };
      shellAliases = {
        avim = "NVIM_APPNAME=astronvim nvim";
        cd = "z";
        cp = "cp -i";
        mv = "mv -i";
        pip = "uv pip";
        rm = "rm -i";
        rsync = "rsync -azvhP";
        ssh = "TERM=xterm-256color ssh";
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
