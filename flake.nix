{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ 
        vim
        neovim
        tmux
        htop
        ripgrep
        jq
        mtr
        wget
        yt-dlp
        watch
        cmake
        gitAndTools.gh
      ];

      programs.zsh.enable = true;
      system.stateVersion = 4;
      
      # Disable nix-darwin's Nix management since we're using Determinate Nix
      nix.enable = false;
    };
  in
  {
    darwinConfigurations."Gabriels-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
  };
}
