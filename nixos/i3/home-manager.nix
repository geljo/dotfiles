{ pkgs, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "af2303526d425b9aed15134f28efdf29b038daaf";
    ref = "release-19.09";
  };
in {
  imports = [ "${home-manager}/nixos" ];

  home-manager.users.johann = {
    programs.git = {
      enable = true;
      userName = "JohannGelhorn";
      userEmail = "johanngelhorn@gmail.com";
    };

    home.packages = [
      pkgs.chromium
      pkgs.firefox
      pkgs.jetbrains.idea-ultimate
      pkgs.slack
      pkgs.spotify
      pkgs.xfce4-12.thunar
      pkgs.vlc
      pkgs.i3blocks
      pkgs.i3lock-fancy
      pkgs.lazygit
      pkgs.scrot
      pkgs.lastpass-cli
      pkgs.keybase
      pkgs.dunst
      pkgs.libnotify
      pkgs.postman
      pkgs.zoom-us
    ];

  };
}
