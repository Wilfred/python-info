{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {

  buildInputs = with pkgs; [
    python gnumake wget texinfo virtualenv
  ];

  shellHook = ''
    VERSION=3.9.9
  '';

}
