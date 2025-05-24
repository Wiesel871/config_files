{ pkgs, lib, ... }:

{
        vim = {
                theme = {
                        enable = true;
                        name = "gruvbox";
                        style = "dark";
                };
                languages = {
                        nix.enable = true;
                };
        };
}
