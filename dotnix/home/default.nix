{ pkgs, ... }:

{   

   home.username = "nerd-cat";
   home.homeDirectory = "/home/nerd-cat";
   home.stateVersion = "26.05";

   # packages installed
   home.packages = with pkgs; [
	vim
	wget
	foot
	mako
	fuzzel
	yazi
	thunar
   ];
   
   # git config ~/.config/git/config
   programs.git = {
     enable = true;
     # add username and usremail
   };
  
   # vim 
   
 
}
