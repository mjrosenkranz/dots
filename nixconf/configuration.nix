{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "morgpad";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  users.users.mjr = {
    isNormalUser = true;
    home = "/home/mjr";
    shell = pkgs.zsh;
    description = "Morgan Jake Rosenkranz";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  security.doas.enable = true;
  security.doas.extraRules = [{
    groups = [ "wheel" ];
    keepEnv = true;
    noPass = true;
  }];

  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    zsh
    neovim
    git
    wget
    firefox
  ];

  nix = {
    package = pkgs.nixUnstable;
    trustedUsers = [ "root" "mjr" "@wheel" ];
    extraOptions = ''
	experimental-features = nix-command flakes
    '';
  };
}
