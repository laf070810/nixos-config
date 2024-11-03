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
    hashedPasswordFile = "/root/secrets/hashed_passwords/laf.txt";
  };
}
