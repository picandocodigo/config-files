# Set up dot files:
echo "Setting up dotfiles"
for file in ~/workspace/picandocodigo/config-files/dotfiles/*; do
    # TODO: Check if they exist, ask to overwrite or skip
    ln -s $file ~/.${file##*/}
done

# Copy desktop entries to the applications directory
for file in ~/workspace/picandocodigo/config-files/desktop-entries/*; do
    cp $file ~/.local/share/applications/
done

# packages to install:
# TODO: Ask if you want to install them
echo "Installing common packages:"
sudo apt-get install git tmux emacs
