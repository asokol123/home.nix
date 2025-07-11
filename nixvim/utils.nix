{ lib }:
{
  convertKeymaps = (keymaps:
    lib.flatten (lib.mapAttrsToList (mode: keys:
      lib.mapAttrsToList (key: actionConfig:
        let
          isSimpleAction = lib.isString actionConfig;

          baseKeymap = {
            inherit mode key;
            action = if isSimpleAction then actionConfig else actionConfig.action;
          };

          withOptions = 
            if isSimpleAction then baseKeymap
            else baseKeymap // (lib.optionalAttrs (actionConfig ? desc || actionConfig ? options) {
              options = (actionConfig.options or {}) // (lib.optionalAttrs (actionConfig ? desc) {
                desc = actionConfig.desc;
              });
            });
        in
        withOptions
      ) keys
    ) keymaps));
}
