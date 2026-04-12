{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    # May conflict with XWayland apps like Steam
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
