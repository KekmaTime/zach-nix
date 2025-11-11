{ pkgs
, inputs
, host
, ...
}:
{

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland; #hyprland-git
      #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; #xdph-git

      portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
      xwayland.enable = true;
    };
    zsh.enable = true;
    firefox.enable = false;
    waybar.enable = false; #started by Hyprland dotfiles. Enabling causes two waybars
    hyprlock.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    git.enable = true;
    tmux.enable = true;
    nm-applet.indicator = true;
    neovim = {
      enable = true;
      defaultEditor = false;
    };

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "update" ''
      cd ~/NixOS-Hyprland
      nh os switch -u -H ${host} .
    '')
    (pkgs.writeShellScriptBin "rebuild" ''
      cd ~/NixOS-Hyprland
      nh os switch -H ${host} .
    '')
    (writeShellScriptBin "ncg" ''
      nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot
    '')
    hypridle
    hyprpolkitagent
    pyprland
    hyprlang
    hyprshot
    hyprcursor
    mesa
    nwg-displays
    nwg-look
    waypaper
    waybar
    hyprland-qt-support
    loupe
    appimage-run
    bc
    brightnessctl
    btop
    bottom
    baobab
    btrfs-progs
    cmatrix
    dua
    duf
    cava
    cargo
    clang
    cmake
    cliphist
    cpufrequtils
    curl
    dysk
    eog
    eza
    findutils
    figlet
    ffmpeg
    fd
    feh
    file-roller
    glib
    gsettings-qt
    git
    google-chrome
    gnome-system-monitor
    fastfetch
    jq
    gcc
    git
    gnumake
    grim
    grimblast
    gtk-engine-murrine
    inxi
    imagemagick
    killall
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    lazydocker
    libappindicator
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    openssl
    pciutils
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    kdePackages.polkit-kde-agent-1
    rofi
    slurp
    swappy
    serie
    swaynotificationcenter
    swww
    unzip
    wallust
    wdisplays
    wl-clipboard
    wlr-randr
    wlogout
    wget
    xarchiver
    yad
    yazi
    yt-dlp
    vesktop
    brave
    spotify
    pokemon-colorscripts
    code-cursor
    (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default)
    (inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.default)
    browsr
    ctop
    erdtree
    frogmouth
    lstr
    lolcat
    lsd
    macchina
    mcat
    mdcat
    parallel-disk-usage
    pik
    oh-my-posh
    ncdu
    ncftp
    netop
    ripgrep
    socat
    starship
    trippy
    tldr
    tuptime
    ugrep
    unrar
    v4l-utils
    obs-studio
    zoxide
    atop
    bandwhich
    caligula
    cpufetch
    cpuid
    cpu-x
    cyme
    gdu
    glances
    gping
    htop
    hyfetch
    ipfetch
    pfetch
    smartmontools
    light
    lm_sensors
    mission-center
    neofetch
    luarocks
    nh
    discord
    virt-viewer
    libvirt
    vlc
    kitty
    wezterm
    qbittorrent
    docker
    docker-compose
    bun
    pnpm
    postgresql
    sqlite
    duckdb
    mariadb
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    cargo-watch
    cargo-audit
    lld
    mold
    ninja
    meson
    telegram-desktop
    texmaker
    go
    zlib
    yarn
    typescript
    eslint
    prettier
    tailwindcss
    gh
    vercel-cli
    zip
  ];

}
