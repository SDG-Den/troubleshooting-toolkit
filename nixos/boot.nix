{
  lib,
  ...
}:

{
  isoImage.makeBiosBootable = true;
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  isoImage.volumeID = "TOOLKIT";
  isoImage.edition = "toolkit";
  isoImage.squashfsCompression = "zstd -Xcompression-level 19";

  boot.loader.timeout = lib.mkForce 5;
  boot.loader.grub.memtest86.enable = true;

  boot.kernelParams = [
    "console=tty0"
    "console=ttyS0,115200n8"
  ];
}
