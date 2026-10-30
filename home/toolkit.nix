{
  config,
  lib,
  ...
}:

let
  colors = config.lib.stylix.colors.withHashtag;
  palette = {
    defaultBackground = colors.base00;
    lighterBackground = colors.base01;
    selectionBackground = colors.base02;
    comments = colors.base03;
    darkForeground = colors.base04;
    defaultForeground = colors.base05;
    lightForeground = colors.base06;
    lightBackground = colors.base07;
    variables = colors.base08;
    integers = colors.base09;
    classes = colors.base0A;
    strings = colors.base0B;
    support = colors.base0C;
    functions = colors.base0D;
    keywords = colors.base0E;
    deprecated = colors.base0F;
  };
in

{
  home.username = "toolkit";
  home.homeDirectory = "/home/toolkit";
  home.stateVersion = lib.trivial.release;

  home.file.".zshrc".text = "";

  programs.foot = {
    enable = true;
    settings = {
      main.pad = "4x4";
      scrollback.lines = 10000;
      mouse.hide-when-typing = "no";
    };
  };

  programs.yazi.enable = true;
  programs.btop.enable = true;
  programs.micro.enable = true;
  programs.micro.settings.colorscheme = "stylix";

  xdg.configFile."micro/colorschemes/stylix.micro".text = ''
    color-link default "${colors.base05},${colors.base00}"
    color-link comment "${colors.base03}"
    color-link identifier "${colors.base0D}"
    color-link constant "${colors.base09}"
    color-link constant.string "${colors.base0B}"
    color-link statement "${colors.base0E}"
    color-link symbol "${colors.base0C}"
    color-link preproc "${colors.base0D}"
    color-link type "${colors.base0A}"
    color-link special "${colors.base0C}"
    color-link underlined "underline ${colors.base0C},${colors.base00}"
    color-link error "bold ${colors.base08},${colors.base00}"
    color-link todo "bold ${colors.base0A},${colors.base00}"
    color-link hlsearch "${colors.base00},${colors.base0A}"
    color-link statusline "${colors.base00},${colors.base02}"
    color-link tabbar "${colors.base00},${colors.base02}"
    color-link indent-char "${colors.base03},${colors.base00}"
    color-link line-number "${colors.base04},${colors.base00}"
    color-link current-line-number "${colors.base05},${colors.base00}"
    color-link diff-added "${colors.base0B}"
    color-link diff-modified "${colors.base0A}"
    color-link diff-deleted "${colors.base08}"
    color-link gutter-error "${colors.base08},${colors.base00}"
    color-link gutter-warning "${colors.base0A},${colors.base00}"
    color-link cursor-line "${colors.base01}"
    color-link color-column "${colors.base01}"
    color-link match-brace "${colors.base00},${colors.base0A}"
    color-link tab-error "${colors.base08}"
    color-link trailingws "${colors.base08}"
  '';

  programs.zellij = {
    enable = true;

    extraConfig = ''
      keybinds {
          unbind "Ctrl g" "Ctrl p" "Ctrl n" "Ctrl h" "Ctrl t" "Ctrl s" "Ctrl o" "Ctrl b" "Ctrl q"

          shared_except "locked" {
              bind "Super g" { SwitchToMode "Locked"; }
          }
          shared_except "pane" "locked" {
              bind "Super p" { SwitchToMode "Pane"; }
          }
          shared_except "resize" "locked" {
              bind "Super n" { SwitchToMode "Resize"; }
          }
          shared_except "scroll" "locked" {
              bind "Super s" { SwitchToMode "Scroll"; }
          }
          shared_except "session" "locked" {
              bind "Super o" { SwitchToMode "Session"; }
          }
          shared_except "tab" "locked" {
              bind "Super t" { SwitchToMode "Tab"; }
          }
          shared_except "move" "locked" {
              bind "Super h" { SwitchToMode "Move"; }
          }
          shared_except "tmux" "locked" {
              bind "Super b" { SwitchToMode "Tmux"; }
          }

          pane {
              bind "Super p" { SwitchToMode "Normal"; }
          }
          tab {
              bind "Super t" { SwitchToMode "Normal"; }
          }
          resize {
              bind "Super n" { SwitchToMode "Normal"; }
          }
          move {
              bind "Super h" { SwitchToMode "Normal"; }
          }
          scroll {
              bind "Super s" { SwitchToMode "Normal"; }
          }
          search {
              bind "Super s" { SwitchToMode "Normal"; }
          }
          session {
              bind "Super o" { SwitchToMode "Normal"; }
          }
          tmux {
              bind "Super b" { Write 2; SwitchToMode "Normal"; }
          }
          locked {
              bind "Super g" { SwitchToMode "Normal"; }
          }
      }
    '';

    settings = {
      theme = "toolkit";
      mouse_mode = true;
      default_shell = "zsh";

      themes.toolkit = {
        text_unselected = {
          base = palette.defaultForeground;
          background = palette.lighterBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        text_selected = {
          base = palette.defaultForeground;
          background = palette.selectionBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        ribbon_selected = {
          base = palette.defaultBackground;
          background = palette.functions;
          emphasis_0 = palette.keywords;
          emphasis_1 = palette.defaultBackground;
          emphasis_2 = palette.support;
          emphasis_3 = palette.classes;
        };
        ribbon_unselected = {
          base = palette.darkForeground;
          background = palette.selectionBackground;
          emphasis_0 = palette.variables;
          emphasis_1 = palette.defaultForeground;
          emphasis_2 = palette.functions;
          emphasis_3 = palette.support;
        };
        table_title = {
          base = palette.functions;
          background = palette.defaultBackground;
          emphasis_0 = palette.keywords;
          emphasis_1 = palette.support;
          emphasis_2 = palette.darkForeground;
          emphasis_3 = palette.comments;
        };
        table_cell_selected = {
          base = palette.defaultForeground;
          background = palette.selectionBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        table_cell_unselected = {
          base = palette.defaultForeground;
          background = palette.lighterBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        list_selected = {
          base = palette.defaultForeground;
          background = palette.selectionBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        list_unselected = {
          base = palette.defaultForeground;
          background = palette.lighterBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        frame_selected = {
          base = palette.functions;
          background = palette.defaultBackground;
          emphasis_0 = palette.support;
          emphasis_1 = palette.keywords;
          emphasis_2 = palette.darkForeground;
          emphasis_3 = palette.defaultBackground;
        };
        frame_highlight = {
          base = palette.keywords;
          background = palette.defaultBackground;
          emphasis_0 = palette.functions;
          emphasis_1 = palette.support;
          emphasis_2 = palette.keywords;
          emphasis_3 = palette.darkForeground;
        };
        exit_code_success = {
          base = palette.support;
          background = palette.defaultBackground;
          emphasis_0 = palette.keywords;
          emphasis_1 = palette.lighterBackground;
          emphasis_2 = palette.support;
          emphasis_3 = palette.functions;
        };
        exit_code_error = {
          base = palette.variables;
          background = palette.defaultBackground;
          emphasis_0 = palette.variables;
          emphasis_1 = palette.defaultBackground;
          emphasis_2 = palette.defaultBackground;
          emphasis_3 = palette.defaultBackground;
        };
        multiplayer_user_colors = {
          player_1 = palette.functions;
          player_2 = palette.support;
          player_3 = palette.keywords;
          player_4 = palette.classes;
          player_5 = palette.strings;
          player_6 = palette.integers;
          player_7 = palette.variables;
          player_8 = palette.comments;
          player_9 = palette.lightForeground;
          player_10 = palette.deprecated;
        };
      };
    };
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      display.separator = " ";

      modules = [
        {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " OS";
          keyColor = colors.base08;
        }
        {
          type = "kernel";
          key = "├ Kernel";
          keyColor = colors.base08;
        }
        {
          type = "packages";
          key = "├󰏖 Packages";
          keyColor = colors.base08;
        }
        {
          type = "shell";
          key = "├ Shell";
          keyColor = colors.base08;
        }
        {
          type = "localIP";
          key = "├󰩟 Local IP";
          keyColor = colors.base08;
        }
        {
          type = "uptime";
          key = "└󰅐 Start Time";
          keyColor = colors.base08;
        }
        "break"
        {
          type = "wm";
          key = "󰧨 Window Manager";
          keyColor = colors.base0A;
        }
        {
          type = "custom";
          key = "├󱂬 Desktop Shell";
          keyColor = colors.base0A;
          format = "cage";
        }
        {
          type = "lm";
          key = "├󰧨 Login Manager";
          keyColor = colors.base0A;
        }
        {
          type = "wmtheme";
          key = "├󰉼 WM Theme";
          keyColor = colors.base0A;
        }
        {
          type = "theme";
          key = "├󰉼 Color Themes";
          keyColor = colors.base0A;
        }
        {
          type = "icons";
          key = "├󰸉 System Icons";
          keyColor = colors.base0A;
        }
        {
          type = "terminal";
          key = "├ Terminal";
          keyColor = colors.base0A;
        }
        {
          type = "terminalfont";
          key = "└ Terminal Font";
          keyColor = colors.base0A;
        }
        "break"
        {
          type = "chassis";
          key = "󰌢 PC";
          keyColor = colors.base0D;
        }
        {
          type = "board";
          key = "├ Board";
          keyColor = colors.base0D;
        }
        {
          type = "cpu";
          key = "├󰻠 CPU";
          keyColor = colors.base0D;
          temp = true;
          freqNdigits = 1;
        }
        {
          type = "memory";
          key = "├󰑭 RAM";
          keyColor = colors.base0D;
          percent = {
            type = 3;
            green = 30;
            yellow = 70;
          };
        }
        {
          type = "swap";
          key = "├󰓡 Zram";
          keyColor = colors.base0D;
          percent = {
            type = 3;
            green = 30;
            yellow = 70;
          };
        }
        {
          type = "disk";
          key = "├ Disk";
          keyColor = colors.base0D;
          percent = {
            type = 3;
            green = 30;
            yellow = 70;
          };
        }
        {
          type = "display";
          key = "├󰍹 Display(s)";
          keyColor = colors.base0D;
        }
        {
          type = "gpu";
          key = "├󰍛 GPU";
          keyColor = colors.base0D;
        }
        {
          type = "opengl";
          key = "├󰍛 OpenGL";
          keyColor = colors.base0D;
        }
        {
          type = "vulkan";
          key = "└󰍛 Vulkan";
          keyColor = colors.base0D;
        }
        "break"
        {
          type = "custom";
          format = builtins.fromJSON ''"\u001b[1m\u001b[31m󰆦  \u001b[1m\u001b[32m󰆦  \u001b[1m\u001b[33m󰆦  \u001b[1m\u001b[34m󰆦  \u001b[1m\u001b[35m󰆦  \u001b[1m\u001b[36m󰆦  \u001b[1m\u001b[37m󰆦  \u001b[1m\u001b[30m󰆦       \u001b[1m\u001b[91m󰆦  \u001b[1m\u001b[92m󰆦  \u001b[1m\u001b[93m󰆦  \u001b[1m\u001b[94m󰆦  \u001b[1m\u001b[95m󰆦  \u001b[1m\u001b[96m󰆦  \u001b[1m\u001b[97m󰆦  \u001b[1m\u001b[90m󰆦"'';
        }
      ];
    };
  };

  programs.fastfetch.settings.logo = {
    type = "auto";
    source = "nixos";
    width = 40;
    padding = {
      top = 0;
      left = 0;
      right = 2;
    };
    color = {
      "1" = colors.base02;
      "2" = colors.base08;
      "3" = colors.base02;
      "4" = colors.base0A;
      "5" = colors.base02;
      "6" = colors.base0D;
    };
  };

  stylix.targets.foot.enable = true;
  stylix.targets.zellij.enable = false;
  stylix.targets.bat.enable = true;
  stylix.targets.fzf.enable = true;
  stylix.targets.tmux.enable = true;
  stylix.targets.yazi.enable = true;
  stylix.targets.btop.enable = true;
  stylix.targets.micro.enable = false;
}
