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
  fonts = {
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      cascadia-code
      corefonts
      wqy_zenhei
      wqy_microhei
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [
          "Liberation Sans"
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
          "WenQuanYi Zen Hei"
        ];
        serif = [
          "Liberation Serif"
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
          "WenQuanYi Zen Hei"
        ];
        monospace = [ "Cascadia Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
