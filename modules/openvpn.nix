{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.openvpn.servers = {
    tjjkVPN = {
      config = "config /root/secrets/openvpn/tjjkVPN.conf";
    };
  };
}
