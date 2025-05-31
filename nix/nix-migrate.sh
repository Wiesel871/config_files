sudo cp flake.nix /etc/nixos/
sudo cp configuration.nix /etc/nixos/
sudo cp nvf-configuration.nix /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#default --impure
