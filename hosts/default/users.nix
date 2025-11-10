{ pkgs, username, lib, ... }:
{
  users = { 
    mutableUsers = true;

    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${username}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];

      packages = with pkgs; [ ];
    };

    defaultUserShell = pkgs.fish;
  }; 
  
  environment.shells = with pkgs; [ fish zsh ];

  environment.systemPackages = with pkgs; [ lsd fzf fish ];

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set -gx EDITOR nvim
      '';
    };

    zsh = {
      enable = lib.mkForce false;
      ohMyZsh = {
        enable = false;
        theme = "agnoster";
        plugins = [ "git" ];
      };
    };
  };
}

