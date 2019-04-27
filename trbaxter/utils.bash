# aliases
alias cd..='cd ..'
alias ll="ls -alh"


src_env() {
	source ~/.bashrc
}

update_env () {
	echo "Updating Homebrew..."
	brew update

	echo "Updating Homebrew packages..."
	brew upgrade ${HOMEBREW_PACKAGES[@]}

	echo "Cleaning up Homebrew..."
	brew cleanup

	echo "Updaing `.trbaxter` submodules..."
	pushd $DOTFILES_LOCATION
	git submodule update --init --recursive
	popd
}
