{ ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./configuration.shared.nix
      ./configuration.desktop.nix
    ];
}
