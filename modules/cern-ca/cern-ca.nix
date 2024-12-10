{
  config,
  lib,
  pkgs,
  ...
}:

{
  security.pki.certificateFiles = [
    "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ./cern-root-ca.pem
    ./cern-grid-ca.pem
  ];
}
