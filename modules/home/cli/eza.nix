{
  programs.eza = {
    enable = true;
    icons = "auto";
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--header"
      "--git-ignore"
      "--classify"
      "--hyperlink"
    ];
  };
  home.shellAliases = {
    ":q" = "exit";
    sv = "sudo nvim";
    v = "nvim";
    c = "clear";
    ls = "eza";
    lt = "eza --tree --level=2";
    ll = "eza  -a --no-user --long";
    la = "eza -lah ";
    lsbc = "lsblk -f | bat -l conf -p ";
    tree = "eza --tree ";
    d = "exa -a --grid ";
    dir = "exa -a --grid";
    jctl = "journalctl -p 3 -xb";
    notes = "nvim ~/notes.txt";
    ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    man = "batman";
    dysk = "dysk -c label+default";
    zi = "cdi";
    serie = "serie -p kitty --preload -g double";
  };
}
