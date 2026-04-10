# orpar

NixOS system configuration.

## Installing by disko-install

Boot from the NixOS ISO, then:

```sh
ls -l /dev/disk/by-id/  # Find the target disk
sudo nix run --extra-experimental-features "nix-command flakes" 'github:nix-community/disko/latest#disko-install' -- --flake .#orpar --disk main /dev/disk/by-id/<disk-id>
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
