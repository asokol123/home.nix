{
  programs.nixvim = {
    plugins = {
      rustaceanvim = {
        enable = true;
        settings = {
          server = {
            default_settings = {
              rust-analyzer = {
                files = {
                  excludeDirs = [
                    ".direnv"
                  ];
                };

                cargo = {
                  features = "all";
                };

                check = {
                  command = "check";
                  features = "all";
                };
              };
            };
          };
        };
      };
    };
  };
}
