{
  config,
  lib,
  pkgs,
  ...
}:

{
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  #hardware.nvidia.modesetting.enable = true;
  #services.xserver.videoDrivers = [ "nvidia" ];

  #boot.kernelParams = [ "intel_iommu=on" ];
  #boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
  #boot.kernelModules = [ "kvm-amd" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
  #boot.extraModprobeConfig = "options vfio-pci ids=10de:134d";
}
