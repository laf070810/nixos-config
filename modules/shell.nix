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
        "z"
        "git"
        "python"
        "man"
        "tmux"
      ];
      theme = "robbyrussell";
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = "
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_DEFAULT_SESSION_NAME=main
export ZSH_TMUX_CONFIG=/etc/tmux.conf
";
  };
}
