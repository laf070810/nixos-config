{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    wget
    microsoft-edge
    qq
    telegram-desktop
    zotero
    joplin
    libreoffice
    zoom-us
    vlc
    vscode-fhs
    qbittorrent
    htop
    btop
    pciutils
    lshw
    nixd
    nixfmt-rfc-style
    apptainer
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
