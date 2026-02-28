{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.wuOptions.desktop;
in
{
  options.wuOptions.desktop = {
    fonts.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable font specific configurations";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts = lib.mkIf cfg.fonts.enable {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        font-awesome
        sarasa-gothic

        nerd-fonts.meslo-lg
        nerd-fonts.symbols-only
        nerd-fonts.jetbrains-mono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          emoji = [
            "Noto Color Emoji"
          ];
          monospace = [
            "JetBrainsMono Nerd Font"
            "Symbols Nerd Font"
            "Sarasa Mono SC"
          ];
          sansSerif = [
            "Noto Sans CJK SC"
            "DejaVu Sans"
          ];
          serif = [
            "Noto Serif CJK SC"
            "DejaVu Serif"
          ];
        };
      };
    };

    i18n = {
      extraLocaleSettings = {
        LC_ADDRESS = "zh_CN.UTF-8";
        LC_IDENTIFICATION = "zh_CN.UTF-8";
        LC_MEASUREMENT = "zh_CN.UTF-8";
        LC_MONETARY = "zh_CN.UTF-8";
        LC_NAME = "zh_CN.UTF-8";
        LC_NUMERIC = "zh_CN.UTF-8";
        LC_PAPER = "zh_CN.UTF-8";
        LC_TELEPHONE = "zh_CN.UTF-8";
        LC_TIME = "zh_CN.UTF-8";
      };

      inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-qt
          fcitx5-gtk
          fcitx5-rime
        ];
      };
    };
  };
}
