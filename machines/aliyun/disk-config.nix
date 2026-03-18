{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/vda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "nixos";
              };
            };
          };
        };
      };
    };
    zpool = {
      nixos = {
        type = "zpool";
        rootFsOptions = {
          compression = "zstd";
        };
        mountpoint = "/";

        datasets = {
          "home" = {
            type = "zfs_fs";
            mountpoint = "/home";
          };
          "root" = {
            type = "zfs_fs";
            mountpoint = "/root";
          };
          "var" = {
            type = "zfs_fs";
            mountpoint = "/var";
          };
        };
      };
    };
  };
}
