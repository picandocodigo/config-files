# Set up dot files:
echo "Setting up dotfiles"
echo

function create_dotfile_symlink(){
    origin=$1
    copy=$2

    echo "Creating symlink for $origin in $copy"
    ln -s $file ~/.${file##*/}
}

for file in ~/workspace/picandocodigo/config-files/dotfiles/*; do
    BASENAME=~/."$(basename -- $file)"

    if [ -L ${BASENAME} ]; then
        echo
        echo "File $BASENAME already exists"
        read -p "Press r to overwrite, anything else to skip `echo $'\n '`" -n 1 -r
        if [[ $REPLY =~ ^[r]$ ]]
        then
            create_dotfile_symlink $file
        fi
    else
        create_dotfile_symlink $file $BASENAME
    fi
done


# Copy desktop entries to the applications directory
for file in ~/workspace/picandocodigo/config-files/desktop-entries/*; do
    cp $file ~/.local/share/applications/
done

# packages to install:
# TODO: Ask if you want to install them
echo
read -p "Do you want to install common packages? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing common packages:"
    sudo apt-get install git tmux emacs
fi

# ASDF
read -p "Do you want to install asdf-vm? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.2
fi
