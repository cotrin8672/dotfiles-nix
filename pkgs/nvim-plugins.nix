{ pkgs, ... }:
with pkgs.vimPlugins; [
  vim-edgemotion
  neodim
  neotab-nvim
  nvim-nio
  wisteria-nvim
]
