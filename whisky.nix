{
  fetchurl,
  lib,
  stdenvNoCC,
  unzip,
}:

stdenvNoCC.mkDerivation (finalAttrs: let
  archSuffix = if stdenvNoCC.system == "x86_64-darwin" then "amd64"
               else if stdenvNoCC.system == "aarch64-darwin" then "arm64"
               else throw "Unsupported platform: ${stdenvNoCC.system}";
in {
  pname = "whisky";
  version = "2.3.4";

  src = fetchurl {
    name = "Whisky.zip";
    url = "https://github.com/Whisky-App/Whisky/releases/download/v${finalAttrs.version}/Whisky.zip";
    hash = "sha256-ABKz3WhdoScFsCbXC69nGQULwEFBJbWwiqO8CVhnjtY=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  nativeBuildInputs = [ unzip ];

  sourceRoot = "Whisky.app";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications/Whisky.app
    cp -R . $out/Applications/Whisky.app

    runHook postInstall
  '';

  meta = {
    description = "Container and VM ranner for macos";
    homepage = "https://getwhisky.app/";
    license = lib.licenses.unfree;
    maintainers = [];
    platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
})
