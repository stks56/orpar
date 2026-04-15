{ config, pkgs, ... }:

{
  imports = [
    ./module/nixos/hyprland.nix
    ./module/nixos/greetd.nix
    ./module/nixos/wezterm.nix
    ./module/nixos/firefox.nix
    ./module/nixos/fcitx5.nix
  ];
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "orpar";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  programs.zsh.enable = true;

  users.users.stks56 = {
    isNormalUser = true;
    shell = pkgs.zsh;
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

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
    ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans CJK JP" ];
      serif = [ "Noto Sans CJK JP" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    clang
    waybar
  ];

  system.stateVersion = "24.11";
}
