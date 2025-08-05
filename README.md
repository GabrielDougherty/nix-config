# My MacOS nix setup

## Installation

```bash
mkdir -p ~/.config
git clone git@github.com:GabrielDougherty/nix-config.git ~/.config/nix-darwin/
sudo darwin-rebuild switch --flake ~/.config/nix-darwin
```
