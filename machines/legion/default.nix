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
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/packages.nix
    ../../modules/network.nix
    ../../modules/users.nix
    ../../modules/shell.nix
    ../../modules/vm.nix
    ../../modules/fcitx5.nix
    ../../modules/plasma.nix
    ../../modules/docker.nix
    ../../modules/ssh.nix
    ../../modules/audio.nix
    ../../modules/fonts.nix
    ../../modules/wireshark.nix
    ../../modules/tailscale.nix
    ../../modules/openvpn.nix
    ../../modules/obs-studio.nix
    ../../modules/htop.nix
    ../../modules/cern-ca/cern-ca.nix
    #../../modules/mihomo.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.grub = {
  #  enable = true;
  #  zfsSupport = true;
  #  efiSupport = true;
  #  eftInstallAsRemovable = true;
  #  mirroredBoots = [{devices = ["nodev"]; path = "/boot";}];
  #};

  networking.hostName = "legion"; # Define your hostname.
  networking.hostId = "8425e349";

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    open-vm-tools
    cifs-utils
  ];

  # Mount USB data drive on boot
  # fileSystems."/home/laf/data" = {
  #   device = "/dev/disk/by-uuid/A4F6645BF6642FAA";
  #   fsType = "ntfs-3g";
  #   options = [
  #     "rw"
  #     "uid=1000"
  #     "gid=100"
  #     "dmask=022"
  #     "fmask=133"
  #   ];
  # };
  # services.autofs = {
  #   enable = true;
  #   autoMaster =
  #     let
  #       mapConf = pkgs.writeText "auto" ''
  #         /home/laf/data -fstype=ntfs,uid=1000,gid=100,dmask=022,fmask=133 UUID=A4F6645BF6642FAA
  #       '';
  #     in
  #     ''
  #       /- file:${mapConf}
  #     '';
  # };

  # Mount SMB share
  services.autofs = {
    enable = true;
    autoMaster =
      let
        mapConf = pkgs.writeText "auto" ''
          /home/laf/data -fstype=cifs,uid=1000,gid=100,dir_mode=0755,file_mode=0644,credentials=/root/secrets/smb/alpha.txt ://alpha/data
        '';
      in
      ''
        /- file:${mapConf}
      '';
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  programs.nix-ld.enable = true;

  system.autoUpgrade = {
    enable = true;
    flags = [
      "-I"
      "nixos-config=/home/laf/nixos-config/machines/legion"
    ];
  };

  services.syncthing = {
    user = "laf";
    group = "users";
    cert = "/root/secrets/syncthing/cert.pem";
    key = "/root/secrets/syncthing/key.pem";
    dataDir = "/home/laf/syncthing-config";
    configDir = "/home/laf/syncthing-config";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "alpha" = {
          id = "VEPBG5B-OBYAMSY-G5PEMJZ-T74ODGY-36ACH45-QDZ6F2O-6GLYOJU-3YMGGQ5";
        };
        "hepfarm41" = {
          id = "QQ6IELW-BZ334EH-RLYSTEE-HYIYJZE-VYRWVJU-LZLHPDU-D2IWPY6-YQVRPA2";
        };
        "mbp" = {
          id = "LDOOZFY-V5TJBS6-S3M2GON-U76VFH4-RW25DV4-LX37CXF-536TJP7-B6Q4JQC";
        };
        "tab" = {
          id = "XD53RNY-4ODUXVH-LYPRSGY-4MAJ7NC-2PDNRKF-BZJDFL4-JNUHP5X-FQLVLA7";
        };
        "mi11u" = {
          id = "KPPLCSD-VULISYP-WE5MKDA-VX3HX6Q-JZBQRDA-LHQVRDS-NEISFMG-RRQHZAM";
        };
      };
      folders = {
        "default" = {
          id = "default";
          path = "/home/laf/Sync";
          devices = [
            "alpha"
            "hepfarm41"
            "mbp"
            "tab"
            "mi11u"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "main" = {
          id = "main";
          path = "/data/laf/Main";
          devices = [
            "alpha"
            "mbp"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "project" = {
          id = "project";
          path = "/data/laf/Projects";
          devices = [
            "alpha"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "zotero-storage" = {
          id = "zotero-storage";
          path = "/home/laf/Zotero/storage";
          devices = [
            "alpha"
            "mbp"
            "tab"
            "mi11u"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
      };
    };
  };
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";

  services.displayManager.defaultSession = "plasmax11";

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?
}
