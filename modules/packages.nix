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
    wezterm
    clash-verge-rev
    telegram-desktop
    libreoffice
    vlc
    qbittorrent
    btop
    pciutils
    lshw
    nixd
    nixfmt-rfc-style
    apptainer
    wineWowPackages.stable
    winetricks
    nmap
    joplin-desktop
    zotero
    signal-desktop
    seafile-client
    unar
    rustdesk-flutter

    microsoft-edge
    zoom-us
    vscode-fhs
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  programs.thunderbird.enable = true;

  services.flatpak.enable = true;
  # use flatpak in nixos-24.05 to avoid ostree/libcurl bug in the new flatpak
  nixpkgs.config.packageOverrides = pkgs: {
    nixos2405 = import <nixos-24.05> { config = config.nixpkgs.config; };
  };
  services.flatpak.package = pkgs.nixos2405.flatpak;

  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.bzip2
      ];
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
