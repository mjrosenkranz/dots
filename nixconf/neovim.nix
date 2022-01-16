{ config, pkgs, libs, ... }:
{
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/nvim";
}
