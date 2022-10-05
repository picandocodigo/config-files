# Set up dot files:
echo "Setting up dotfiles"
echo

function create_dotfile_symlink(){
    origin=$1
    copy=$2

    echo "Creating symlink for:"
    echo "$origin in $copy"

    if [[ $file == *"tmux"* ]]; then
        ln -s $file ~/.tmux.conf
    else
        ln -s $file ~/.${file##*/}
    fi
}

# TODO: tmux dotfile has to be called .tmux.conf
for file in ~/workspace/picandocodigo/config-files/dotfiles/*; do
    BASENAME=~/."$(basename -- $file)"
    if [ -f "$BASENAME" ]; then
        echo
        echo "File $BASENAME already exists"
        read -p "Press r to overwrite, anything else to skip `echo $'\n '`" -n 1 -r
        if [[ $REPLY =~ ^[r]$ ]]
        then
            echo
            mv $BASENAME ${BASENAME}.backup
            create_dotfile_symlink $file $BASENAME
        else
            continue
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
echo
read -p "Do you want to install common packages? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing common packages:"
    sudo apt-get install git tmux curl gimp colordiff peek vlc silversearcher-ag atools
fi

echo
read -p "Install emacs from kelleyk/emacs PPA? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing Emacs PPA"
    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt-get update
    apt-cache search emacs | grep ^emacs
    echo "Now install one of the emacs packages"
fi

echo
read -p "Install docker repositories? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "adding Docker's official GPG key:"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "Adding repo to sources"
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world
fi


# ASDF
read -p "Do you want to install asdf-vm? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
fi

# RVM
read -p "Do you want to install rvm? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# Source Code Pro Fonts
read -p "Do you want to install Source Code Pro fonts? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
    sudo fc-cache -f -v
fi

# Postgres
# sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update

