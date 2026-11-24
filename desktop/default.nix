{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos"; 
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Calcutta";
  
  users.users.doraemon = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
     packages = with pkgs; [
       tree
     ];
  };

  security = {
    rtkit.enable = true;
  };

  services = {
    pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
    };
    gnome.gnome-keyring.enable = true;
    
    regreet = {
        enable = true;
    };
  };

  programs = {
    git = {
    	enable = true;
    };

    sway = {
        enable = true;
    };

    zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuilt switch";
        };
    };

  };
  
  # nix search <package-name>
  # searches for package name in the current version of nixos
  environment.systemPackages = with pkgs; [
    wget
    rofi

	firefox
	librewolf
	vim
	nvim
    pwvucontrol
	thunar
    foot
	steam
  ]; 
  
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.gc = {
    automatic = true;
    dates = weekly;
  };    

  system.stateVersion = "26.05";
}

