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
  python3,
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
    python3
  ];
}
