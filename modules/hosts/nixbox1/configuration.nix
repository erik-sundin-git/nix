# Nixos configuration file
# Author: Erik Sundin
#
# nixbox1/configuration.nix
# Main nixbox config
# Includes the home-manager installation.
#

{
  config,
  pkgs,
  lib,
  systemSettings,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

    # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  ## Garbage collection ##
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };


  networking.hostName = lib.mkDefault systemSettings.hostname; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];

  # Set your time zone.
  time.timeZone = lib.mkDefault systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault systemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erik = {
    isNormalUser = true;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    description = "erik";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    packages = with pkgs; [];
  };

  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;
  home-manager.users.erik = {pkgs, ...}: {
    home.stateVersion = "23.11";
    imports = [
      (../. + ("/" + systemSettings.hostname) + "/home.nix")
      #      (../. + ("/" + systemSettings.hostname) + "/modules.nix") Moved import to home.nix
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = "nvim";
  

  security.sudo.extraConfig = ''
    erik  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl
  '';
  system.stateVersion = "23.11"; # Did you read the comment?
}
