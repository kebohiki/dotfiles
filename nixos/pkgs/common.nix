{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    tig
    fish
    tmux
    binutils
    ag
    fzf
    python3
    direnv
    terminator
    chromium
  ];
}
