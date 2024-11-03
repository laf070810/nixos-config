{
  config,
  lib,
  pkgs,
  ...
}:
{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  systemd.user.services.docker.environment = {
    HTTP_PROXY = "socks5://100.64.0.1:7890";
    HTTPS_PROXY = "socks5://100.64.0.1:7890";
  };
}
