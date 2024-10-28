{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.mihomo = {
    enable = true;
    configFile = "/home/laf/secrets/mihomo-config-server.yml";
  };
}
