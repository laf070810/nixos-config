{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable sound.
  hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = false;
    pulse.enable = false;
  };
}
