{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  services.getty.autologinUser = "nerd-cat";
  services.displayManager.ly.enable = true;

  networking.hostName = "nixos-btw"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Calcutta";


  # enable niri
  programs.niri = {
    enable = true;
  };

  # set up user
  users.users.nerd-cat = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
     packages = with pkgs; [
       tree
     ];
  };
  
  programs.firefox.enable = true;
  
  # enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";


}

