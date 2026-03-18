# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/network.nix
    ../../modules/users.nix
    ../../modules/shell.nix
    ../../modules/docker.nix
    ../../modules/ssh.nix
    ../../modules/tailscale.nix
    ../../modules/htop.nix
    ../../modules/mihomo.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostId = "ce4f3643";

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";

  programs.nix-ld.enable = true;

  boot.zfs.devNodes = "/dev/disk/by-path";

  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    wget
    btop
    pciutils
    lshw
    nixd
    nixfmt
    apptainer
    nmap
    unar
    parted
    dig
    whois
    openssl
    nssTools
    fastfetch
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.sanoid = {
    enable = true;
    interval = "minutely";
    templates = {
      # Besides used templates, default settings are still applied, so we may need to override all of them
      "data" = {
        hourly = 72;
        daily = 0;
        monthly = 0;
      };
    };
    datasets = {
      "nixos/home" = {
        use_template = [ "data" ];
      };
      "nixos/root" = {
        use_template = [ "data" ];
      };
      "nixos/var" = {
        use_template = [ "data" ];
      };
    };
  };

  services.syncoid = {
    enable = true;
    interval = "minutely";
    commonArgs = [
      "--no-sync-snap"
    ];
    commands = {
      "nixos/root" = {
        source = "nixos/root";
        target = "laf@alpha:data/backups/aliyun/nixos/root";
        sendOptions = "w";
      };
      "nixos/home" = {
        source = "nixos/home";
        target = "laf@alpha:data/backups/aliyun/nixos/home";
        sendOptions = "w";
      };
      "nixos/var" = {
        source = "nixos/var";
        target = "laf@alpha:data/backups/aliyun/nixos/var";
        sendOptions = "w";
      };
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [ ];

  # system.autoUpgrade = {
  #   enable = true;
  #   flags = [
  #     "-I"
  #     "nixos-config=/home/laf/nixos-config/machines/legion"
  #   ];
  # };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
