{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.tmux = {
    enable = true;
    historyLimit = 100000;
    keyMode = "vi";
    extraConfig = "set -g mouse on";
    terminal = "tmux-256color";
  };
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
        "tmux"
      ];
      theme = "robbyrussell";
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}
