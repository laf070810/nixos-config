{
  config,
  lib,
  pkgs,
  ...
}:

{
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
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
    nixfmt
    apptainer
    wineWow64Packages.stable
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
    rustdesk-flutter
    musescore
    stellarium
    android-tools
    pkgs-2511.diffoscope

    microsoft-edge
    vscode-fhs
    claude-code
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
