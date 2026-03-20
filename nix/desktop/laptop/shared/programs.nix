{ ... }:
{
  programs = {
    tuxclocker = {
      enable = true;
      useUnfree = true;
      enabledNVIDIADevices = [ 0 ];
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
            #homedir = "${config.home.homeDirectory}/.gnupg";
    };
  };
}
