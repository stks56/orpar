{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # Uncomment if cursor is invisible on NVIDIA
    # WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Uncomment if file dialogs don't work in GTK apps

  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
