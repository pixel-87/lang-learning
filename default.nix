{ lib, buildGoModule }:
let
  version = "0.0.1";
in
buildGoModule {
  pname = "Learning golang from boot.dev guest mode";
  inherit version;

  src = ./learn-go;

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  meta = {
    description = "Learning go on boot.dev, but I have to compile locally";
    homepage = "https://github.com/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "example";
  };
}
