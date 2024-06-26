# Nixos configuration file
# Author: Erik Sundin
#
#
#
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;

  services.trezord.enable = true;

  services.syncthing = {
    enable = true;
    user = "erik";
    dataDir = "/home/erik/Documents";
    settings.gui = {
      user = "erik";
      password = "plssteal";
    };
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-45d67f0d-83e2-4a2f-9c40-79917a5a4b89".device = "/dev/disk/by-uuid/45d67f0d-83e2-4a2f-9c40-79917a5a4b89";
  boot.loader.grub.devices = ["/dev/disk/by-uuid/45d67f0d-83e2-4a2f-9c40-79917a5a4b89"];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  #Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # vm stuff
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  security.polkit.enable = true;
  #audio
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # hardware.pulseaudio.enable = true;

  networking.hostName = lib.mkDefault "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;
  networking.firewall.allowedTCPPorts = [8384 22000 3389];
  networking.firewall.allowedUDPPorts = [22000 21027];

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erik = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "erik";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    packages = with pkgs; [];
  };

  home-manager.backupFileExtension = "backup";
  home-manager.users.erik = {pkgs, ...}: {
    imports = [../../user/home.nix];
  };

  # MPD
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
               type "pulse"
        name "pulseaudio"
        server "127.0.0.1"
             }
    '';
  };
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    wget
  ];

  security.sudo.extraConfig = ''
    erik  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl
  '';
  system.stateVersion = "23.11"; # Did you read the comment?
}
