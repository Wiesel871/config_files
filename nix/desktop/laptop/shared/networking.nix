{...}: {
  networking = {
    useDHCP = true;
    firewall = {
      allowPing = true;
      allowedTCPPortRanges = [
        {
          from = 8000;
          to = 9000;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 8000;
          to = 9000;
        }
      ];
    };
  };
}
