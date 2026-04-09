# orpar

NixOS system configuration.

## Installation

Boot from the NixOS ISO, then:

```sh
# Find the NixOS SSD device path
ls -l /dev/disk/by-id/
# Update disk-config.nix device with actual path
sudo nix run github:nix-community/disko -- --mode disko /tmp/orpar/disk-config.nix
sudo nixos-install --flake .#orpar
sudo reboot
```

## Usage

### Apply

```sh
sudo nixos-rebuild switch --flake .#orpar
```

### Update

```sh
nix flake update
```
