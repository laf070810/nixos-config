{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.zsh;
  users.users.laf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPasswordFile = "/home/laf/secrets/hashed_password.txt";
  };
}
