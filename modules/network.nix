{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  networking.networkmanager.ensureProfiles.profiles = {
    Tsinghua-Secure = {
      "802-1x" = {
        eap = "peap;";
        identity = "laf21@tsinghua";
        password-flags = "1";
        phase1-auth-flags = "32";
        phase2-auth = "mschapv2";
      };
      connection = {
        id = "Tsinghua-Secure";
        permissions = "user:laf:;";
        timestamp = "1730182198";
        type = "wifi";
        uuid = "e4f946f6-61d7-4238-b9d3-e34057964db9";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
      proxy = { };
      wifi = {
        mode = "infrastructure";
        ssid = "Tsinghua-Secure";
      };
      wifi-security = {
        key-mgmt = "wpa-eap";
      };
    };
  };

  services.resolved.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 51821 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
