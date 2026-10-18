{
  config,
  lib,
  pkgs,
  ...
}:

{
  security.pki.certificateFiles = [
    ./cern-root-ca.pem
    ./cern-grid-ca.pem
  ];
}
