#!/bin/bash

set -e

echo "🚀 Starting Mac Dev Setup..."

#############################################
# Install Homebrew
#############################################

if ! command -v brew &> /dev/null
then
    echo "📦 Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed"
fi

echo "🔄 Updating Homebrew..."
brew update

#############################################
# Install CLI Tools
#############################################

echo "⚙️ Installing CLI tools..."

brew install \
python \
awscli \
kubectl \
git \
wget \
jq \
tree \
htop \
fzf \
ripgrep

#############################################
# Install Docker
#############################################

echo "🐳 Installing Docker..."
brew install --cask docker

#############################################
# Install Apps
#############################################

echo "💻 Installing Applications..."

brew install --cask \
visual-studio-code \
google-chrome \
arc \
iterm2 \
sublime-text \
postman

#############################################
# Python Dev Tools
#############################################

echo "🐍 Setting up Python tools..."

python3 -m pip install --upgrade pip

pip3 install \
virtualenv \
black \
ruff \
pytest \
ipython \
jupyter

#############################################
# VSCode Extensions
#############################################

echo "🧠 Installing VSCode Extensions..."

code --install-extension ms-python.python || true
code --install-extension ms-toolsai.jupyter || true
code --install-extension ms-azuretools.vscode-docker || true
code --install-extension ms-vscode-remote.remote-containers || true

#############################################
# Git Config (Optional)
#############################################

echo "🔧 Setting git defaults..."

git config --global init.defaultBranch main
git config --global core.editor "code --wait"

#############################################
# Finished
#############################################

echo ""
echo "🎉 Mac Dev Environment Setup Complete!"
echo ""
echo "You may need to restart the terminal."
