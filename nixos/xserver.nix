{ config, lib, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    dpi = 221;
    xkbOptions = "caps:ctrl_modifier, shift:both_shiftlock, compose:ralt";
    desktopManager = {
      default = "xfce";
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
      session = [{
        name = "home-manager";
        start = ''
          ${pkgs.runtimeShell} $HOME/.xsession &
          waitPID=$!
        '';
      }];
    };
    videoDrivers = [ "intel" ];

    # Enable touchpad support.
    libinput = {
      enable = true;
      accelSpeed = "0.3";
      accelProfile = "adaptive";
    };
  };
  services.autorandr = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ arandr xorg.xkbcomp ];
}

