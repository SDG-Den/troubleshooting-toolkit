{
  pkgs,
  ...
}:

let
  hardwareSession = pkgs.writeShellScript "toolkit-session" ''
    exec ${pkgs.cage}/bin/cage -- ${pkgs.foot}/bin/foot -e ${pkgs.zellij}/bin/zellij
  '';

  softwareSession = pkgs.writeShellScript "toolkit-session-software" ''
    export LIBGL_ALWAYS_SOFTWARE=1
    export WLR_RENDERER_ALLOW_SOFTWARE=1
    exec ${pkgs.cage}/bin/cage -- ${pkgs.foot}/bin/foot -e ${pkgs.zellij}/bin/zellij
  '';

  sessionPackage = pkgs.runCommand "toolkit-sessions" {
    providedSessions = [
      "toolkit"
      "toolkit-software"
    ];
  } ''
    mkdir -p $out/share/wayland-sessions

    cat > $out/share/wayland-sessions/toolkit.desktop <<EOF
    [Desktop Entry]
    Name=Toolkit
    Comment=Cage running foot with zellij
    Exec=${hardwareSession}
    Type=Application
    DesktopNames=toolkit;
    EOF

    cat > $out/share/wayland-sessions/toolkit-software.desktop <<EOF
    [Desktop Entry]
    Name=Toolkit (software rendering)
    Comment=Cage running foot with zellij on llvmpipe
    Exec=${softwareSession}
    Type=Application
    DesktopNames=toolkit;
    EOF
  '';
in
{
  services.displayManager.sessionPackages = [ sessionPackage ];

  environment.systemPackages = [
    pkgs.cage
    pkgs.foot
    pkgs.zellij
  ];
}
