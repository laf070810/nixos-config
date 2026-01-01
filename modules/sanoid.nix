{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.sanoid = {
    enable = true;
    interval = "minutely";
    templates = {
      # Besides used templates, default settings are still applied, so we may need to override all of them
      "data" = {
        hourly = 72;
        daily = 0;
        monthly = 0;
      };
    };
    datasets = {
      "nixos/home" = {
        use_template = [ "data" ];
      };
      "nixos/root" = {
        use_template = [ "data" ];
      };
      "nixos/var" = {
        use_template = [ "data" ];
      };
      "nixos/data" = {
        use_template = [ "data" ];
      };
    };
  };
}
