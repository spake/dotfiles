#!/bin/bash -e

echo " * Checking for prerequisites"
PREREQS=( stow curl git vim zsh )
for prereq in ${PREREQS[@]}; do
    if ! which $prereq >/dev/null; then
        echo "   - ERROR: Couldn't find $prereq."
        echo "     Make sure it's installed (and in your \$PATH) and try again."
        exit 1
    fi
done

# change into dotfiles directory
cd "`dirname $0`"

echo " * Stowing dotfiles"
# stow dotfiles
for f in *; do
    if [ -d $f ]; then
        echo "   - Stowing $f"
        stow "--target=$HOME" $f
    fi
done

# install antigen
echo " * Checking for antigen"
if ! [ -f ~/.antigen.zsh ]; then
    echo "   - Installing antigen"
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh > "$HOME/.antigen.zsh"
else
    echo "   - Already present"
fi

# install vundle
echo " * Checking for Vundle"
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "   - Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "   - Already present"
fi

# update vim plugins
echo " * Updating vim plugins"
vim +PluginInstall +qall

echo " * Done!"
