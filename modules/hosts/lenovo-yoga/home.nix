# home-manager
#
# Erik Sundin
#
{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../desktop/home.nix
  ];

  # manage.
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  home.packages = with pkgs; [
  ];
  nixpkgs.config.allowUnfree = true;

  # DO NOT CHANGE #
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # dotfiles
  home.file = {
    ".config/qtile/config.py".source = ../../user/qtile/config.py;
    ".config/hypr/hyprland/hyperland.conf".source = ../../user/hyprland/hyprland.conf;
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
