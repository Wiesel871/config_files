{pkgs, ...}: {
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      alacritty
      arandr
      brave
      cmake
      deja-dup
      discord
      dsda-doom
      dsda-launcher
      feh
      firefox
      gimp
      gnumake
      lshw
      parsec-bin
      spotify
            #teamspeak3
      unzip
      wget
      xclip
      zip
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };
}
