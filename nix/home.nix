{...}: let
  theme = "Rose-Pine";
in {
  home = {
    #username = "nixos";
    #homeDirectory = "/home/nixos";
    stateVersion = "24.05";
    packages = [
    ];
  };

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "extension-list@tu.berry"
      ];
    };

    "org/gnome/shell/extensions/extension-list" = {
      show-extension-version = true;
      show-extension-description = true;
    };

    /*
    "org/gnome/desktop/interface" = {
      gtk-theme = lib.mkForce theme;
      color-scheme = "prefer-dark";
    };
    */
  };

  /*
  gtk = {
    enable = true;
    theme = {
      name = theme;
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = theme;
      package = pkgs.rose-pine-gtk-theme;
    };
    cursorTheme = {
      name = theme;
      package = pkgs.rose-pine-gtk-theme;
    };
  };
  */
}
