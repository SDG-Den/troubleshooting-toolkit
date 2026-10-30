# troubleshooting-toolkit
a nixos based ISO with a simple TUI (with mouse support) with a large list of troubleshooting tools.

## build

```
nix build .#iso
```

the image is written to `result/iso/*.iso`.

## boot

```
qemu-system-x86_64 -m 4G -cdrom result/iso/*.iso
```

the live system boots into LY. log in as `toolkit` with an empty password and choose `Toolkit` or `Toolkit (software rendering)`.

## nix

the store is a writable tmpfs overlay and nixpkgs is bundled in the ISO, so `nix shell nixpkgs#htop` and `nix run nixpkgs#hello` work once the network is up. nothing persists across reboots.

## usb

```
sudo dd if=result/iso/*.iso of=/dev/sdX bs=4M status=progress oflag=sync
```
