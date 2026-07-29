{
  pkgs,
  user,
  nixos-wsl,
  ...
}:
{

  wsl = {
    enable = true;
    defaultUser = user;
    useWindowsDriver = true;
  };

  environment.systemPackages = with pkgs; [
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      #homedir = "${config.home.homeDirectory}/.gnupg";
    };
  };
}
