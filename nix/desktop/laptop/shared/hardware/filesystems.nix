{
  ...
}: {

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/665fa2ae-8d06-4540-bc1b-fb88c2a6037a";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/9A23-6F02";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
  };

  swapDevices = [];
}
