# Nixos configuration file
# Author: Erik Sundin
#
# Main configuration.nix file.
# Includes the home-manager installation.
#
{
  config,
  pkgs,
  lib,
  pkgs-erik,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;

  #  xdg.portal.enable = true;

  programs.gnupg.agent = {
    enable =
      if systemSettings.enableGpg
      then true
      else false;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  ## Garbage collection ##
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  ## vm stuff ##
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  security.polkit.enable = true;

  networking.hostName = lib.mkDefault systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;
  networking.firewall.allowedTCPPorts = [8384 22000 3389];
  networking.firewall.allowedUDPPorts = [22000 21027];

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

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "se";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  users.users.${userSettings.user} = {
    isNormalUser = true;
    ignoreShellProgramCheck = true;

    shell = pkgs.${userSettings.shell};
    description = userSettings.user;
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
  };

  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {inherit pkgs-erik;};
  home-manager.users.${userSettings.user} = {pkgs, ...}: {
    home.stateVersion = "23.11";
    imports = [
      (../. + ("/" + systemSettings.hostname) + "/home.nix")
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = userSettings.editor;

  security.sudo.extraConfig = ''
    erik  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl
  '';
  system.stateVersion = "23.11"; # Did you read the comment?
}
