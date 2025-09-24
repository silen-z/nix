{
  config,
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
      theme = "GitLab-Light";

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
    userName = "Pavel Hrách";
    userEmail = "pavel.hrach@moderntv.eu";

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
    pkgs.nodejs
    pkgs.rustup
    pkgs.cascadia-code
    pkgs.openttd
    unstable.jujutsu

    # IDEs
    pkgs.jetbrains.phpstorm
    unstable.code-cursor
    unstable.zed-editor
    # unstable.vscode
    # unstable.vscodium
    # unstable.jetbrains.idea-community
  ];

  home.sessionPath = [
    "/home/pavelh/.cargo/bin"
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

}
