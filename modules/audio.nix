{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable sound.
  services.pulseaudio.enable = true;
  services.pipewire = {
    enable = false;
    pulse.enable = false;
  };
}
