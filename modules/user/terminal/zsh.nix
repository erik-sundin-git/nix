# zsh.nix
# zsh config
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zinit
  ];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    ### Plugins ###
    antidote.enable = true;
    antidote.plugins = [
      "zsh-users/zsh-syntax-highlighting"
      "zsh-users/zsh-autosuggestions"
      "zsh-users/zsh-history-substring-search"
    ];

  };
}
