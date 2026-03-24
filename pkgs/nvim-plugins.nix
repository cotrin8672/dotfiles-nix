{ pkgs, ... }:
with pkgs.vimPlugins; [
  vim-edgemotion
  neodim
  neotab-nvim
  wisteria-nvim
]
