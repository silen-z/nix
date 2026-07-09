{
  pkgs,
  unstable,
  ...
}:
{
  home.stateVersion = "22.11";

  programs.fish.enable = true;

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
    pkgs.spotify
    pkgs.xarchiver
    pkgs.jq
    pkgs.difftastic
    pkgs.nodejs_24
    pkgs.rustup
    pkgs.cascadia-code
    pkgs.openttd
    pkgs.debootstrap
    pkgs.coreutils
    pkgs.vagrant
    pkgs.gnumake
    pkgs.just
    pkgs.uv

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
    unstable.codex
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
