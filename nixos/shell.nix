{
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [ "completion" ];
    };
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    enableLsColors = true;
    histSize = 10000;

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "";
    };

    promptInit = ''
      SHELL=${pkgs.zsh}/bin/zsh
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${./zsh/config.zsh}
      source ${./zsh/functions.zsh}
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
      eval "$(zoxide init --cmd cd zsh)"
      source <(fzf --zsh)
    '';

    interactiveShellInit = ''
      if [ "$TERM_PROGRAM" != "vscode" ]; then
        if command -v fastfetch >/dev/null 2>&1; then
          fastfetch
        fi
      fi
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    zoxide
    eza
    fzf
    bat
    micro
    fastfetch
  ];

  environment.shellAliases = {
    ls = "eza -al --color=always --group-directories-first --icons=always";
    la = "eza -a --color=always --group-directories-first --icons=always";
    ll = "eza -l --color=always --group-directories-first --icons=always";
    lt = "eza -aT --level=4 --color=always --group-directories-first --icons=always";
    "l." = "eza -a | grep -e '^\\.'";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    "......" = "cd ../../../../..";
    dir = "dir --color=auto";
    vdir = "vdir --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
    find = "fzf --layout=reverse --preview='bat {}'";
    microfind = "micro $(pwd)/$(fzf --layout=reverse --preview='bat {}')";
  };
}
