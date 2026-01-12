{
  mkShellNoCC,
  callPackage,

  # extra tooling
  go,
  gopls,
  goreleaser,
  gcc,
  gnumake,
  gdb,
}:
let
  defaultPackage = callPackage ./default.nix { };
in
mkShellNoCC {
  inputsFrom = [ defaultPackage ];

  packages = [
    go
    gopls
    goreleaser
    gcc
    gnumake
    gdb
  ];
}
