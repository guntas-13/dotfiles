# dotfiles

My personal macOS dotfiles managed with GNU Stow.

- **[Zsh](https://ohmyz.sh/)**: Shell configuration with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme and useful plugins
- **[Neovim](https://neovim.io/)**: Complete Neovim configuration ([NvChad](https://nvchad.com/))
- **[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)**: Font patches for Powerlevel10k and Neovim
- **[Alacritty](https://alacritty.org/)**: Terminal emulator configuration
- **[Tmux](https://github.com/tmux/tmux)**: Terminal multiplexer configuration
- **[TPM](https://github.com/tmux-plugins/tpm)**: Tmux Plugin Manager
- **[Miniconda](https://www.anaconda.com/docs/getting-started/miniconda/install)**: Python environment (`conda-env.yml`)

## Quick Start

### Prerequisites

Install [Homebrew](https://brew.sh/) (if not already installed):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Required Packages

Install essential tools via Homebrew:

```bash
brew install git stow zsh neovim tmux fzf zoxide tree coreutils gnu-sed git-lfs ruby-build vim --override-system-vi osx-cpu-temp btop
```

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/guntas-13/dotfiles.git $HOME/dotfiles
   cd $HOME/dotfiles
   ```

2. **Set Zsh as the default shell**

   ```bash
   chsh -s $(which zsh)
   ```

   Restart your terminal for the changes to take effect.

3. **Install Oh My Zsh**

   Install Oh My Zsh using the official installation script:

   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

   When prompted, allow Oh My Zsh to set up the default configuration. You'll overwrite it in the next step.

4. **Deploy dotfiles with Stow**

   ```bash
   cd $HOME/dotfiles
   stow --adopt .
   ```

   After running `stow --adopt .`, the following symlinks will be created:

   ```
   ~/.zshrc           -> ~/dotfiles/.zshrc
   ~/.config/nvim/    -> ~/dotfiles/.config/nvim/
   ~/.config/alacritty/ -> ~/dotfiles/.config/alacritty/
   ~/.config/tmux/    -> ~/dotfiles/.config/tmux/
   ```

5. **Download Nerd Fonts**

   Download and install a Nerd Font from the [Nerd Fonts repository](https://github.com/ryanoasis/nerd-fonts) or their [website](https://www.nerdfonts.com/font-downloads) or use Homebrew:

   ```bash
   brew install font-hack-nerd-font
   ```

6. **Download Alacritty**

   Visit [Alacritty](https://alacritty.org/) to download and install the latest release for macOS.

7. **Set up Conda environment**

   Download & Install from miniconda [website](https://www.anaconda.com/docs/getting-started/miniconda/install) or use the following commands:

   ```bash
   # Download and install Miniconda
   curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
   bash Miniconda3-latest-MacOSX-arm64.sh
   ```

   Initialize conda (if not done during installation):

   ```bash
   conda init zsh
   ```

   Restart your terminal, then load the conda environment:

   ```bash
   cd $HOME/dotfiles
   conda env create -f conda-env.yml
   conda activate sttPy10
   ```

   To update the `conda-env.yml` file after installing new packages, run:

   ```bash
   conda env export --no-builds > $HOME/dotfiles/conda-env.yml
   ```

8. **Install Tmux Plugin Manager (TPM)**

   Follow instructions from the [TPM repository](https://github.com/tmux-plugins/tpm):

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

9. **Configure [Powerlevel10k](https://github.com/romkatv/powerlevel10k)**

   ```bash
   p10k configure
   ```

10. **Tmux Install Packages**

`prefix` is overwritten to `Ctrl + Space` in this configuration. <br>
Inside a Tmux session, press `prefix` + `I` (capital i) to install Tmux plugins.

## Usage

```bash
# Start a new Tmux session
tmux
```

```bash
# Start NeoChad
nvim
vi # alias to nvim
vim # alias to nvim
```

`prefix` is overwritten to `Ctrl + Space` in this configuration. <br>
Inside a Tmux session, press `prefix` + `I` (capital i) to install Tmux plugins.

## Images

![](./assets/7.png)

![](./assets/1.png)

![](./assets/2.png)

![](./assets/3.png)

![](./assets/4.png)

![](./assets/5.png)

![](./assets/6.png)

## Resources

### Tools & Package Managers

- [Homebrew](https://brew.sh/) - Package manager for macOS
- [GNU Stow](https://www.gnu.org/software/stow/) - Symlink farm manager

### Shell & Terminal

- [Oh My Zsh](https://ohmyz.sh/) - Zsh configuration framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zsh theme
- [Alacritty](https://alacritty.org/) - GPU-accelerated terminal emulator
- [Zsh Plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins) - Useful Zsh plugins for enhanced functionality
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) - Font patches for Powerlevel10k and Neovim

### Editors & Multiplexers

- [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor
- [NvChad](https://nvchad.com/) - Blazing fast Neovim config
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [TMux Cheat Sheet](https://tmuxcheatsheet.com/) - Handy reference for Tmux commands
- [Vim Cheat Sheet](https://vim.rtorr.com/) - Handy reference for Vim commands
- [Catppuccin Theme](https://github.com/catppuccin/tmux) - A soothing pastel theme for Tmux

Thanks to the YouTube Channels: **[Dreams of Anatomy](https://www.youtube.com/@dreamsofautonomy)** and **[Dreams of Code](https://www.youtube.com/@dreamsofcode)**. Check out these vidoes:

### This Zsh config is perhaps my favorite one yet.

<div align="left">
  <a href="https://www.youtube.com/watch?v=ud7YxC33Z3w"><img src="https://img.youtube.com/vi/ud7YxC33Z3w/0.jpg" alt="IMAGE ALT TEXT"></a>
</div>

### Turn VIM into a full featured IDE with only one command

<div align="left">
  <a href="https://www.youtube.com/watch?v=Mtgo-nP_r8Y"><img src="https://img.youtube.com/vi/Mtgo-nP_r8Y/0.jpg" alt="IMAGE ALT TEXT"></a>
</div>

### Tmux has forever changed the way I write code.

<div align="left">
  <a href="https://www.youtube.com/watch?v=DzNmUNvnB04"><img src="https://img.youtube.com/vi/DzNmUNvnB04/0.jpg" alt="IMAGE ALT TEXT"></a>
</div>

### Stow has forever changed the way I manage my dotfiles

<div align="left">
  <a href="https://www.youtube.com/watch?v=y6XCebnB9gs"><img src="https://img.youtube.com/vi/y6XCebnB9gs/0.jpg" alt="IMAGE ALT TEXT"></a>
</div>
