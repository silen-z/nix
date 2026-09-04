{
  pkgs,
  unstable,
  noctalia,
  ...
}:
{
  imports = [ noctalia.homeModules.default ];

  home.stateVersion = "22.11";

  programs.fish.enable = true;

  programs.noctalia.enable = true;

  # XFCE got a working cursor theme for free via xfsettingsd/GTK defaults.
  # niri has no such daemon, so without this, XCURSOR_THEME/XCURSOR_SIZE are
  # unset and niri falls back to an internal theme that's missing most cursor
  # shapes (text, pointer, resize, grab, etc. never change on hover).
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
    gtk.enable = true;
    x11.enable = true; # covers Xwayland apps via xwayland-satellite
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      command = "${pkgs.fish}/bin/fish";
      theme = "Light Owl";

      keybind = [
        "ctrl+g=unbind"
        "ctrl+t=unbind"
        "ctrl+n=unbind"
        "ctrl+c=unbind"
        "ctrl+w=unbind"
        "ctrl+opt+left=unbind"
        "ctrl+opt+right=unbind"
      ];
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "onelight";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Pavel Hrách";
      user.email = "pavel.hrach@moderntv.eu";
    };

    # difftastic.enable = true;
  };

  programs.ssh = {
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = [
    pkgs.firefox
    pkgs.chromium
    pkgs.vlc
    pkgs.xarchiver
    pkgs.jq
    pkgs.difftastic
    pkgs.nodejs_24
    pkgs.cascadia-code
    pkgs.debootstrap
    pkgs.coreutils
    pkgs.vagrant
    pkgs.gnumake

    # IDEs
    # pkgs.jetbrains.phpstorm
    unstable.jetbrains.phpstorm
    unstable.code-cursor
    unstable.cursor-cli
    unstable.zed-editor
    unstable.nil
    unstable.nixd
    unstable.go
    unstable.gopls
    unstable.jujutsu
    unstable.claude-code
    # unstable.vscode
    # unstable.vscodium
  ];

  home.sessionPath = [
    "/home/pavelh/.cargo/bin"
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

}
