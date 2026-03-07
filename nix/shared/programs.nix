{...}: {
  programs = {
    vim.enable = true;
    git = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableLsColors = true;
      autosuggestions = {
        enable = true;
        strategy = ["completion"];
      };
      #ohMyZsh = {
      #    enable = true;
      #    plugins = ["git"]
      #};
    };
    tmux = {
      enable = true;
    };
  };
}
