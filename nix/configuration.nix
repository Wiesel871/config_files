{ config, lib, pkgs, inputs, ... }:

{
	imports = [
# include NixOS-WSL modules
		<nixos-wsl/modules>
	];

	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;

	wsl.enable = true;
	wsl.defaultUser = "nixos";

	system.stateVersion = "25.05";
        programs = {
                nvf = {
                        enable = true;
                        settings = {
                        };
                };
        };
}
