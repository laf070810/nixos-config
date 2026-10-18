{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.displayManager.plasma-login-manager.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.desktopManager.plasma6.enable = true;
}
