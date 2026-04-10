{ config, pkgs, ... }:

{
  imports = [
    ./module/nixos/hyprland.nix
    ./module/nixos/wezterm.nix
    ./module/nixos/firefox.nix
  ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "orpar";

  time.timeZone = "Asia/Tokyo";

  users.users.stks56 = {
    isNormalUser = true;
    hashedPassword = "$6$.bjhLL2ocrNbUoB5$77WPGkvd2BnBmodkrlDf1D5.QI0dRxVv6az7vQPC5nxbzPGzD6f0rZsjsgS1JTCKC3bW7sSyD0aqPu6Bvfzq/.";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "24.11";
}
