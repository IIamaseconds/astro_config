# AstroNvim User Configuration Example

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation of AstroNvim

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Clone the repository

```shell
git clone https://github.com/IIamaseconds/astro_config ~/.config/nvim/lua/user
```

#### WSL2 Ubuntu dependencies installation
```shell
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
sudo apt-get install ripgrep

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

wget https://github.com/MordechaiHadad/bob/releases/download/v2.3.2/bob-linux-x86_64.zip
unzip bob-linux-x86_64.zip
chmod +x bob
```

#### Start Neovim

```shell
nvim
```
