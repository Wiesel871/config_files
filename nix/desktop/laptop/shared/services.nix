{...}: {
  services = {
    hardware.bolt.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [
                #"modesetting"
                "nvidia"
            ];
    };
  };
}
