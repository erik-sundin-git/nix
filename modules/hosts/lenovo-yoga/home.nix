# home-manager
#
# Erik Sundin
#
{
  config,
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in {
  imports = [
    ../desktop/home.nix
    ./modules.nix
    ../../overlays/nur.nix
  ];

  # manage.
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  home.packages = with pkgs; [
    obsidian # notes
    neomutt # email
    projectlibre

    kanshi # output settings for wayland TODO move?
    yabridge #use Windows VST2 and VST3 plugins on Linux TODO: move?
    yabridgectl #TODO: move?
    helm #synthesizer #TODO move
    wineWowPackages.staging
    winetricks
  ];
  nixpkgs.config.allowUnfree = true;

  # DO NOT CHANGE #
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # dotfiles
  home.file = {
    ".config/qtile/config.py".source = ../../user/qtile/config.py;
    ".config/hypr/hyprland/hyperland.conf".source = ../../user/hyprland/hyprland.conf;
    "~/.neomuttrc".source = ../../user/terminal/neomutt/neomuttrc;
    "~/.emacs.d/init.el".source = ../../user/emacs/init.el;
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/erik/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };
}
