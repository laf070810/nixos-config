{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  programs.virt-manager.enable = true;
}
