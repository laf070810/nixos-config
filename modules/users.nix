{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.laf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };
}
