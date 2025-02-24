{
  _7zz,
  lib,
  stdenvNoCC,
  fetchurl,
}:

stdenvNoCC.mkDerivation (finalAttrs: let
  archSuffix = if stdenvNoCC.system == "x86_64-darwin" then "amd64"
               else if stdenvNoCC.system == "aarch64-darwin" then "arm64"
               else throw "Unsupported platform: ${stdenvNoCC.system}";
in {
  pname = "orbstack";
  version = "1.10.0_19021";

  src = fetchurl {
    name = "OrbStack.dmg";
    url = "https://cdn-updates.orbstack.dev/${archSuffix}/OrbStack_v${finalAttrs.version}_${archSuffix}.dmg";
    hash = "sha256-5l+d8YEPdObgIpzEe5mYd/q+tSkAEc+5CRQXdQixFLM=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  unpackCmd = ''
    echo "File to unpack: $curSrc"
    if ! [[ "$curSrc" =~ \.dmg$ ]]; then return 1; fi
    mnt=$(mktemp -d -t ci-XXXXXXXXXX)

    function finish {
      echo "Detaching $mnt"
      /usr/bin/hdiutil detach $mnt -force
      rm -rf $mnt
    }
    trap finish EXIT

    echo "Attaching $mnt"
    /usr/bin/hdiutil attach -nobrowse -readonly $src -mountpoint $mnt

    echo "What's in the mount dir"?
    ls -la $mnt/

    echo "Copying contents"
    shopt -s extglob
    DEST="$PWD"
    (cd "$mnt"; cp -a !(Applications) "$DEST/")
  '';

  sourceRoot = "OrbStack.app";

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications/OrbStack.app"
    cp -a ./. "$out/Applications/OrbStack.app/"

    runHook postInstall
  '';

  meta = {
    description = "Container and VM ranner for macos";
    homepage = "https://orbstack.dev/";
    license = lib.licenses.unfree;
    maintainers = [];
    platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
})
