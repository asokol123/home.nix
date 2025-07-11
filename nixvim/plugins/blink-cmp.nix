{
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            list = {
              selection = {
                preselect = false;
              };
            };
          };
          keymap = {
            "<Tab>" = [ "select_next" "fallback" ];
            "<S-Tab>" = ["select_prev" "fallback" ];
            "<S-K>" = [ "show_signature" "hide_signature" "fallback" ];
            "<C-K>" = [ "show_documentation" "hide_documentation" "fallback" ];
            "<CR>" = [ "accept" "fallback" ];
            "<C-e>" = [ "show" ];
          };
        };
      };
    };
  };
} 