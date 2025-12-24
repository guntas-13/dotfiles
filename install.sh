#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/guntas-13/dotfiles.git"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

print_info "Starting dotfiles installation..."
echo ""

# Step 1: Install Homebrew
print_info "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    print_success "Homebrew installed successfully!"
else
    print_success "Homebrew is already installed."
fi
echo ""

# Step 2: Install required packages
print_info "Installing required packages via Homebrew..."
brew install git stow zsh neovim tmux fzf zoxide tree coreutils gnu-sed git-lfs ruby-build vim --override-system-vi osx-cpu-temp btop
print_success "Required packages installed!"
echo ""

# Step 3: Clone the repository (if not already in it)
if [ ! -d "$DOTFILES_DIR" ]; then
    print_info "Cloning dotfiles repository..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
    print_success "Repository cloned successfully!"
else
    print_success "Dotfiles directory already exists."
    cd "$DOTFILES_DIR"
fi
echo ""

# Step 4: Set Zsh as the default shell
print_info "Setting Zsh as the default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_success "Zsh set as default shell. You may need to restart your terminal."
else
    print_success "Zsh is already the default shell."
fi
echo ""

# Step 5: Install Oh My Zsh
print_info "Checking for Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_warning "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed successfully!"
else
    print_success "Oh My Zsh is already installed."
fi
echo ""

# Step 6: Deploy dotfiles with Stow
print_info "Deploying dotfiles with Stow..."
cd "$DOTFILES_DIR"
stow --adopt .
print_success "Dotfiles deployed successfully!"
echo ""

# Step 7: Install Nerd Fonts
print_info "Installing Hack Nerd Font..."
brew tap homebrew/cask-fonts 2>/dev/null || true
brew install --cask font-hack-nerd-font
print_success "Hack Nerd Font installed!"
echo ""

# Step 8: Install Alacritty
print_info "Installing Alacritty..."
if ! command -v alacritty &> /dev/null; then
    brew install --cask alacritty
    print_success "Alacritty installed successfully!"
else
    print_success "Alacritty is already installed."
fi
echo ""

# Step 9: Install Miniconda (optional - prompt user)
print_info "Do you want to install Miniconda? (y/n)"
read -r install_conda
if [[ "$install_conda" == "y" || "$install_conda" == "Y" ]]; then
    if ! command -v conda &> /dev/null; then
        print_info "Installing Miniconda..."
        cd /tmp
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
        bash Miniconda3-latest-MacOSX-arm64.sh -b -p "$HOME/miniconda3"
        rm Miniconda3-latest-MacOSX-arm64.sh
        
        # Initialize conda
        "$HOME/miniconda3/bin/conda" init zsh
        print_success "Miniconda installed! Please restart your terminal and run:"
        print_info "  conda env create -f $DOTFILES_DIR/conda-env.yml"
        print_info "  conda activate sttPy10"
    else
        print_success "Conda is already installed."
        print_info "To create the environment, run:"
        print_info "  conda env create -f $DOTFILES_DIR/conda-env.yml"
        print_info "  conda activate sttPy10"
    fi
else
    print_info "Skipping Miniconda installation."
fi
echo ""

# Step 10: Install Tmux Plugin Manager
print_info "Installing Tmux Plugin Manager (TPM)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_success "TPM installed successfully!"
    print_info "To install Tmux plugins, press Ctrl+Space (prefix) + I inside a Tmux session."
else
    print_success "TPM is already installed."
fi
echo ""

# Final messages
echo ""
print_success "========================================"
print_success "Dotfiles installation complete!"
print_success "========================================"
echo ""
print_info "Next steps:"
echo "  1. Restart your terminal or run: exec zsh"
echo "  2. Run: p10k configure (to set up Powerlevel10k)"
echo "  3. Start Tmux and press Ctrl+Space + I to install Tmux plugins"
if [[ "$install_conda" == "y" || "$install_conda" == "Y" ]]; then
    echo "  4. Create conda environment:"
    echo "     conda env create -f $DOTFILES_DIR/conda-env.yml"
    echo "     conda activate sttPy10"
fi
echo ""
print_info "Enjoy your new setup!"