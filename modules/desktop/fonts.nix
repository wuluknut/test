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
  config.fonts = lib.mkIf cfg.enable {
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
}
