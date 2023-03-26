## Run This Script On a Fresh ZSH install, make sure your .zshrc file is renamed or removed first

# Check if there's an existing .zshrc file, if so that's bad, back it up and remove it so that oh-my-zsh can clean install

if [[ -f ~/.zshrc ]]; then
    echo "You have an existing .zshrc file, backing it up to ~/.zshrc_init_backup"
    cp ~/.zshrc ~/.zshrc_init_backup
fi

# Check for ~/.oh-my-zsh or for the value to have been set to something else
if [[ -v ${ZSH} || ! -d ~/.oh-my-zsh/ ]]; then
    # Install Oh-My-Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Clone the necessary plugins in

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# This needs to be sourced manually at the end of your .zshrc file
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Update  the plugins that are loaded automatically by ohmyzsh
sed -i 's/plugins\=.*/plugins\=\(git\ fd\ zsh-autosuggestions\)/' ~/.zshrc

# Update the ZSH_THEME from ohmyzsh
sed -i 's/ZSH_THEME\=.*/ZSH_THEME\=jaischeema/' ~/.zshrc

# If the zsh aliases file exists, add that to zshrc
if [[ -f ~/.zsh_aliases ]]; then
    echo "source ~/.zsh_aliases" >> ~/.zshrc
fi

# Source the sytnax-highlighting in main .zshrc
echo "source ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Source zshrc
. ~/.zshrc
