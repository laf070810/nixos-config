{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.mihomo = {
    enable = true;
    configFile = "/root/secrets/mihomo-config-server.yml";
  };
}
