{pkgs, ...}: {
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      alacritty
      arandr
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
      unzip
      wget
      xclip
      zip
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
