{
  pkgs,
  inputs,
  ...
}: {
  system.stateVersion = "25.11";

  environment.systemPackages = with pkgs; [
    inputs.self.packages.x86_64-linux.default

    gcc
    cmake
    gnumake
  ];
}
