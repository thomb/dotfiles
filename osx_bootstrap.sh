#!/usr/bin/env bash
# 
# Bootstrap script for setting up a new OSX machine
# based on: https://gist.github.com/codeinthehole/26b37efa67041e1307db
# 
# This should be idempotent so it can be run multiple times.
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
# - https://news.ycombinator.com/item?id=8402079
# - http://notes.jerzygangi.com/the-best-pgp-tutorial-for-mac-os-x-ever/

echo "Starting bootstrapping..."
GITHUB_LOCATION="~/github"
DOTFILES_LOCATION="$GITHUB_LOCATION/dotfiles"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew tap mongodb/brew
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
	ack
	autoconf
	automake
	autojump
	docker
	ffmpeg
	fzf
	gettext
	git
	imagemagick
	libjpeg
	libmemcached 
	markdown
	mongodb-community
	npm
	node
	pkg-config
	python
	python3
	reattach-to-user-namespace
	rename
	ssh-copy-id
	terminal-notifier
	the_silver_searcher
	tmux
	tree
	vim
	wget
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
	firefox
	docker-toolbox
	google-chrome
	slack
	vagrant
	vagrant-manager
	virtualbox
	vlc
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

# echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
	font-inconsolidata
	font-droid-sans-mono-for-powerline.rb
	font-roboto
	font-clear-sans
)
brew cask install ${FONTS[@]}
# 
# echo "Installing Python packages..."
# PYTHON_PACKAGES=(
#     ipython
#     virtualenv
#     virtualenvwrapper
# )
# sudo pip install ${PYTHON_PACKAGES[@]}

echo "Installing Ruby gems"
RUBY_GEMS=(
	bundler
	filewatcher
	tmuxinator
)
sudo gem install ${RUBY_GEMS[@]}

echo "Installing global npm packages..."
npm install marked -g

echo "Configuring OSX..."

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Clone .tmux.conf
echo "Cloning `.tmux.conf`..."
git clone https://github.com/gpakosz/.tmux.git  ~/$GITHUB_LOCATION/.tmux
ln -s -f $GITHUB_LOCATION/.tmux/.tmux.conf

# Clone prettyping
echo "Cloning `prettyping`..."
git clone https://github.com/denilsonsa/prettyping.git ~/$GITHUB_LOCATION/prettyping
chmod +x ~/$GITHUB_LOCATION/prettyping/prettyping

# Clone thomb/dotfiles
echo "Configuring Environment for `trbaxter`..."
[[ ! -d ~/$GITHUB_LOCATION ]] && mkdir ~/$GITHUB_LOCATION

[[ ! -d ~/$DOTFILES_LOCATION ]] && mkdir ~/$DOTFILES_LOCATION
git clone https://github.com/thomb/dotfiles.git ~/$DOTFILES_LOCATION
pushd $DOTFILES_LOCATION
git submodule update --init --recursive
popd



echo "Creating folder structure..."
[[ ! -d ~/.work_bash ]] && ln -s $DOTFILES_LOCATION/work_bash ~/.work_bash
[[ ! -d ~/.trbaxter ]] && ln -s $DOTFILES_LOCATION/trbaxter ~/.trbaxter
[[ ! -d ~/.vim ]] && ln -s $DOTFILES_LOCATION/.vim ~/.vim
[[ ! -d ~/.vimrc ]] && ln -s $DOTFILES_LOCATION/.vimrc ~/.vimrc
[[ ! -d ~/.tmux.conf.local ]] && ln -s $DOTFILES_LOCATION/.tmux.conf ~/.tmux.conf.local

echo "Creating `.bash_profile`..."
if [[ ! -d ~/.bash_profile ]]; then 
	cat > ~/.bash_profile << EOL

export LOCAL_GITHUB="$HOME/github"
export HOMEBREW_PACKAGES=$PACKAGES
if [ -f ~/.trbaxter/main.bash ]; then
	source ~/.trbaxter/main.bash
fi

if [ -f ~/.work_bash/main.bash ]; then
	source ~/.work_bash/main.bash
fi

EOL
fi

echo "Bootstrapping complete!"
