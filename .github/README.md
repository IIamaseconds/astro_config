# AstroNvim setup for WSL2

#### WSL2 Ubuntu dependencies installation
```shell
sudo apt update
sudo apt install gcc
sudo apt install build-essential
sudo apt install unzip
sudo apt install ripgrep
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

# Lazygit installation
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## Setup WSL2
``` shell
# Install NVM // https://github.com/nvm-sh/nvm#installing-and-updating
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install -lts

# Install bob // Clone https://github.com/MordechaiHadad/bob.git
git clone https://github.com/MordechaiHadad/bob.git

cd bob
cargo build --release
cd target/release

# Move bob to a folder for installation and install neovim
./bob use 0.9.0

# Update .bashrc
alias nvim=/home/username/.local/share/bob/nvim-bin/nvim
alias bob=/path/to/bob

export BROWSER=wslview
```

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



#### Start Neovim

```shell
nvim
```
