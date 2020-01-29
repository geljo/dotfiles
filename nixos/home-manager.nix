{ pkgs, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "af2303526d425b9aed15134f28efdf29b038daaf";
    ref = "release-19.09";
  };
in {
  imports = [ "${home-manager}/nixos" ];

  home-manager.users.edward = {
    programs.git = {
      enable = true;
      userName = "scompt";
      userEmail = "scompt@scompt.com";
    };

    home.packages = [
      pkgs.vscode
      pkgs.chromium
      pkgs.enpass
      pkgs.firefox
      pkgs.jetbrains.pycharm-professional
      pkgs.slack
      pkgs.spotify
      pkgs.xfce4-12.thunar
      pkgs.vlc
      pkgs.i3blocks
      pkgs.i3lock-fancy
      pkgs.scrot
      pkgs.lastpass-cli
      pkgs.keybase
      pkgs.dunst
      pkgs.libnotify
      pkgs.postman
      pkgs.zoom-us
    ];

    services.redshift = {
      enable = true;
      latitude = "48.1351";
      longitude = "11.5820";
    };
    services.screen-locker = {
      enable = true;
      lockCmd = "${pkgs.i3lock-fancy}/bin/i3lock-fancy -n";
      xssLockExtraOptions = [ "--transfer-sleep-lock" ];
      xautolockExtraOptions = [
        "-time 5"
        "-notifier ${pkgs.libnotify}/bin/notify-send"
      ];
    };
    services.dunst.enable = true;
    services.keybase.enable = true;


    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "git-extras" "gpg-agent" "docker" ];
        theme = "robbyrussell";
      };
      sessionVariables = { EDITOR = "vim"; };
      shellAliases = {
        gf = "git fetch --all --tags --prune";
        gdc = "git diff --cached";
      };
    };

    home.file.".config/i3blocks/config".source = ./i3blocks.config;
    home.file.".config/i3blocks/battery.sh".source = ./battery.sh;

    home.file.".gitconfig".source = ./git_config;
    home.file.".gitignore_global".source = ./gitignore_global;

    home.file.".ssh/config".source = ./ssh_config;

    xsession.enable = true;
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        bars = [{
          fonts = [ "FontAwesome 10" "Terminus 10" ];
          statusCommand = "${pkgs.i3blocks}/bin/i3blocks";
        }];
      };
    };

    xresources.properties = {
      "URxvt*background" = "#101010";
      "URxvt*foreground" = "#d0d0d0";
      "URxvt*color0" = "#101010";
      "URxvt*color1" = "#960050";
      "URxvt*color2" = "#66aa11";
      "URxvt*color3" = "#c47f2c";
      "URxvt*color4" = "#30309b";
      "URxvt*color5" = "#7e40a5";
      "URxvt*color6" = "#3579a8";
      "URxvt*color7" = "#9999aa";
      "URxvt*color8" = "#030303";
      "URxvt*color9" = "#ff0090";
      "URxvt*color10" = "#80ff00";
      "URxvt*color11" = "#ffba68";
      "URxvt*color12" = "#5f5fee";
      "URxvt*color13" = "#bb88dd";
      "URxvt*color14" = "#4eb4fa";
      "URxvt*color15" = "#d0d0d0";
      "URxvt.font" = "xft:bitstream vera sans mono:size=10:antialias=true";

      "URxvt.clipboard.autocopy" = "true";
      "URxvt.keysym.M-c" = "perl=clipboard=copy";
      "URxvt.keysym.M-v" = "perl=clipboard=paste";

      "URxvt.keysym.Control-l" = "command:\033c";

    };
  };
}
