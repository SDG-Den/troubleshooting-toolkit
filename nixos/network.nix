{
  lib,
  pkgs,
  ...
}:

{
  networking.networkmanager.enable = lib.mkForce true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = lib.mkForce "no";
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    rsync
    openssh
    sshfs
    iproute2
    iputils
    inetutils
    net-tools
    ethtool
    iw
    wireless-regdb
    wpa_supplicant
    bluez
    dnsutils
    whois
    mtr
    traceroute
    nmap
    tcpdump
    wireshark-cli
    socat
    netcat-openbsd
    iperf3
    conntrack-tools
    nftables
    iptables
    wireguard-tools
    openvpn
    nfs-utils
    cifs-utils
    openiscsi
    lldpd
    tmux
  ];
}
