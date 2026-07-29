{ pkgs, ... }: {
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    networkmanager.plugins = with pkgs; [ networkmanager-strongswan ];
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
    /*
      interfaces.enp49s0 = {
        useDHCP = false;
        ipv4.addresses = [
          {
            address = "192.168.1.100";
            prefixLength = 24;
          }
        ];
      };
    */
  };
}
