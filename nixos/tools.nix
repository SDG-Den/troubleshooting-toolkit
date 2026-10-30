{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    htop
    btop
    atop
    sysstat
    iotop-c
    iftop
    nethogs
    lsof
    strace
    ltrace
    psmisc
    procps
    perf
    blktrace

    fio
    stress-ng
    memtester

    yazi

    dmidecode
    lshw
    hwinfo
    inxi
    pciutils
    usbutils
    hwloc
    numactl
    lm_sensors
    edac-utils
    rasdaemon
    acpica-tools

    smartmontools
    nvme-cli
    sg3_utils
    hdparm
    sdparm

    parted
    gptfdisk
    partclone
    testdisk
    ddrescue
    fsarchiver
    mtools
    e2fsprogs
    dosfstools
    exfatprogs
    ntfs3g
    f2fs-tools
    btrfs-progs
    xfsprogs
    lvm2
    mdadm
    multipath-tools
    cryptsetup
    zfs
    tpm2-tools

    efibootmgr
    efivar
    grub2
    syslinux
    os-prober
    flashrom
    mokutil
    sbctl

    evtest
    libinput
    alsa-utils
    edid-decode
    v4l-utils
    wayland-utils
    mesa-demos
    vulkan-tools

    file
    binutils
    less
    nano
    vim
    micro
    hexyl
    tree
    ncdu
    duf
    ripgrep
    jq
    yq-go
    p7zip
    unzip
    zip
    zstd
    xz
    pv
    openssl
    gitMinimal
    python3

    cowsay
    figlet
    github-cli
    opencode
    discordo
  ];
}
