{...}: {
  programs = {
    #pay-respects.enable = true;
    #ccache.enable = true;

    traceroute.enable = true;

    wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };

    thunar.enable = true;

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
