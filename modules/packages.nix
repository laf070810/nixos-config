{
  config,
  lib,
  pkgs,
  ...
}:

{
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nixpkgs.config.packageOverrides = pkgs: {
    nixos2405 = import <nixos-24.05> { config = config.nixpkgs.config; };
  };

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
    parted
    dig
    whois
    openssl
    nssTools
    fastfetch
    nixos2405.rustdesk-flutter # temporarily broken in unstable

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
  services.flatpak.package = pkgs.flatpak;

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
