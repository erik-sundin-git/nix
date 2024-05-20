# Nixos configuration file
# Author: Erik Sundin
#
#
#

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./services/msmtp.nix
    ];

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.trezord.enable = true;

  programs.fish.enable = true;
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

  boot.kernelParams = [ "intel_idle.max_cstate=1" ]; # In case your laptop hangs randomly
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
      # efiInstallAsRemovable = true;
       device = "nodev";
    };
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
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.enable = true;
  
  
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts =  [ 22000 21027 ];

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
    description = "erik";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [];
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
  system.stateVersion = "23.11"; # Did you read the comment?

}
