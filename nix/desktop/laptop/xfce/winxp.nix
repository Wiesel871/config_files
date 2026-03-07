{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation rec {
  pname = "xptc-project";
  version = "unstable-2023-12-19"; # Update with actual version/date

  src = fetchFromGitHub {
    owner = "rozniak";
    repo = "xfce-winxp-tc";
    rev = "c9e301b7981c720e39307dd90e727f081492f22f";
    sha256 = "sha256-2c/Oo9R3ouMb2hqsEyWUXtzdzgE/uMGLCbrMN8cvhKI=";
  };

  nativeBuildInputs = with pkgs;
    [
      cmake
      fakeroot
      pkg-config
      python3
      coreutils
      gcc
      gnumake
      bash
      autoPatchelfHook
    ]
    ++ lib.optionals stdenv.isLinux [
      # Distro-specific tools (we'll handle the build ourselves)
      rpm
    ];

  # Store the build outputs
  outputs = ["out"];

  # Skip the standard configure and build phases since we use the project's scripts
  dontConfigure = true;
  dontBuild = true;

  # Make SKU configurable with a default
  sku = "xpclient-pro";

  # The actual build process
  buildPhase = ''
    runHook preBuild
    echo "Current directory: $(pwd)"

    # Move to packaging directory
    cd packaging

    # Install build dependencies using the project's script
    echo "Installing build dependencies..."
    # We handle dependencies through Nix, but the script might check for them
    # Run the dependency check but don't install (Nix handles this)
    ./chkdeps.sh || true

    # Build the project
    echo "Building project..."
    ./buildall.sh ${lib.optionalString (sku != null) "-s ${sku}"}

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    # The build output should be in packaging/xptc/
    if [ -d "xptc" ]; then
      # Create output directory
      mkdir -p $out

      # Copy all built packages to output
      cp -r xptc/* $out/
    else
      echo "Warning: xptc directory not found after build"
    fi

    runHook postInstall
  '';
}
