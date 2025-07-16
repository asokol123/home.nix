{
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          sources.providers = {
            lazydev = {
              name = "LazyDev";
              module = "lazydev.integrations.blink";
              # make lazydev completions top priority (see `:h blink.cmp`)
              score_offset = 100;
            };
          };
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
