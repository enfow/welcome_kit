VIM = "vim" # or nvim

# apt install
sudo apt-get update
sudo apt install -y docker.io tmux make net-tools ripgrep

# default env
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# zsh
sudo apt install -y  zsh
sudo chsh $USER -s $(which zsh)
touch ~/.zshrc

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# python and pyenv
sudo apt-get install -y libsqlite3-dev zlib1g-dev libssl-dev libffi-dev libbz2-dev liblzma-dev
sudo apt-get install -y python3-setuptools python3-pip

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nginx
sudo apt install -y nginx

# npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -  # nodejs v16
sudo apt install -y npm nodejs

# config for tmux
ln -s ${PWD}/.tmux.conf ~/.tmux.conf

# config for vim
if [VIM == "vim"]
then
        ln -s ${PWD}/vim.vim ~/.vimrc
        # vim plug
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
elif [VIM == "nvim"]
then
        ln -s ${PWD}/nvim.vim ~/.vimrc
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 10k for oh my zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
