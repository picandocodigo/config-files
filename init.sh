# Set up dot files:
echo "Setting up dotfiles"
for file in ~/workspace/picandocodigo/config-files/dotfiles/*; do
    cd ~ && ln -s $file .${file##*/}
done
