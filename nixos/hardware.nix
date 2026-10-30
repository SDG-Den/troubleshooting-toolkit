{
  ...
}:

{
  hardware.enableAllHardware = true;
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;

  boot.supportedFilesystems = [
    "btrfs"
    "cifs"
    "exfat"
    "ext4"
    "f2fs"
    "ntfs3"
    "vfat"
    "xfs"
    "zfs"
  ];
}
