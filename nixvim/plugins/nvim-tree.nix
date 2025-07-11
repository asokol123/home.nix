{
  programs.nixvim = {
    plugins = {
      nvim-tree = {
        updateFocusedFile = {
          enable = true;
        };
        autoClose = true;
        enable = true;
        syncRootWithCwd = true;
      };
    };
  };
} 