{
  programs.nixvim = {
    plugins = {
      nvim-tree = {
        settings = {
          update_focused_file.enable = true;
          sync_root_with_cwd = true;
        };
        autoClose = true;
        enable = true;
      };
    };
  };
} 
