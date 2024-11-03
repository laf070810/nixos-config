{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--login-server=https://hs.leptogen.cc:51840"
      "--accept-routes=true"
      "--accept-dns=true"
    ];
    authKeyFile = "/root/secrets/ts_preauth_key.txt";
  };
}
