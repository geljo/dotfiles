# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./xserver.nix
    ./home-manager.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.earlyVconsoleSetup = true;

  nixpkgs.config.allowUnfree = true;
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  # boot.initrd.luks.devices = [{
  #   name = "root";
  #   device = "/dev/nvme0n1p2";
  #   preLVM = true;
  #   allowDiscards = true;
  # }];

  powerManagement.enable = true;
  networking = {
    hostName = "jarvis";
    wireless.enable = true;
    useDHCP = true;
    enableIPv6 = false;
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    #firewall.allowedTCPPorts = [ 22 17500 ];
    #firewall.allowedUDPPorts = [ 17500 ];
  };

  # services.openvpn.servers = {
  #   smartlaneVPN = { config = "config /etc/nixos/smartlaneVPN.conf "; };
  # };

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-thinkpad;
  };

  services.acpid.enable = true;
  services.openssh.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  services.pcscd.enable = true;
  services.udev = {
    packages = [ pkgs.yubikey-personalization ];
    extraRules = ''

'';
  };

  # environment.shellInit = ''
  #   export GPG_TTY="$(tty)"
  #   gpg-connect-agent /bye
  #   export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  # '';
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  systemd.user.services.dropbox = {
    description = "Dropbox";
    after = [ "xembedsniproxy.service" ];
    wants = [ "xembedsniproxy.service" ];
    wantedBy = [ "graphical-session.target" ];
    environment = {
      QT_PLUGIN_PATH = "/run/current-system/sw/"
        + pkgs.qt5.qtbase.qtPluginPrefix;
      QML2_IMPORT_PATH = "/run/current-system/sw/"
        + pkgs.qt5.qtbase.qtPluginPrefix;
    };
    serviceConfig = {
      ExecStart = "${pkgs.dropbox.out}/bin/dropbox";
      ExecReload = "${pkgs.coreutils.out}/bin/kill -HUP $MAINPID";
      KillMode = "control-group";
      Restart = "on-failure";
      PrivateTmp = true;
      ProtectSystem = "full";
      Nice = 10;
    };
  };
  # Select internationalisation properties.
  i18n = {
    consoleFont = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = false;

    fonts = with pkgs; [
      powerline-fonts
      inconsolata
      corefonts
      terminus_font
      dejavu_fonts
      source-code-pro
      ubuntu_font_family
      unifont
      fira-code
      fira-code-symbols
      font-awesome_5
    ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vimHugeX
    nixfmt
    xclip
    zsh
    nmap
    docker
    docker-compose
    rxvt_unicode
    mpv
    git
    tmux
    htop
    dropbox-cli
    gnupg
    catimg
    fd
    plantuml
    git-hub
    imagemagick
    openssl
    unzip
    tree
    pulsemixer
    awscli
    bat
    gitAndTools.diff-so-fancy
    gnuplot
    graphviz
    jq
    file
    parallel
    pv
    rsync
    silver-searcher
    acpitool
    fwupd
    libfprint
    libfprint-thinkpad
    thermald
    ffmpeg
    irssi
    killall
    amazon-ecr-credential-helper
  ];

  services.thermald.enable = true;
  services.fwupd.enable = true;

  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "sound" "video" ];
    # openssh.authorizedKeys.keyFiles = [ ./id_rsa.pub ];
    shell = "/run/current-system/sw/bin/zsh";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

