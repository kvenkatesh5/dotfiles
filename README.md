# Personal Setup for macOS
## Basic Settings/Setup
- Download Google Chrome at [website](https://www.google.com/chrome/)
  - Set as default browser
  - Sign in to Chrome user accounts
- Dock
  - Remove: System Preferences (accessible from top-left logo anyway), Safari, Mail, Maps, Contacts, Photos, Reminders, iTunes, Podcasts, AppleTV, News, and App Store
  - Remember that these are accessible via ```Cmd + [space]``` (spotlight search)
  - In System Preferences, set automatic hide and show
- Keyboard
  - Key Repeat = Fast
  - Delay Until Repeat = Short
  - Turn off backlight after 10 seconds of inactivity
- Trackpad
  - Tap to Click = On (feels nicer)
  - Uncheck Smart Zoom and Rotate (Scroll & Zoom tab)
- Finder
  - Sidebar: home, Downloads, Desktop, Applications
  - new Finder window shows: home
- Menubar
  - Show Bluetooth in menubar
  - Show battery % in menubar
- Spotlight
  - Uncheck: Fonts, Images, Documents
- Download Github Desktop [website](https://desktop.github.com/)
- Command line tools: ```xcode-select --install```
- Install homebrew ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"``` [website](https://brew.sh/)
  - ```brew doctor``` to make sure install was successful
- ```brew install git``` 
  - a good read for git [here] (https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- iTerm2: ```brew cask install iterm2```
  - add to Dock
- ```git config --global user.name "kvenkatesh5"``` - ```git config --global user.email "..."```
- ```brew install vim``` installs dependencies for vim
- ```brew install nvim``` because I want to use neovim!
- ```brew install zsh``` but for macOS Catalina it should already be set as default shell type [in case](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- ```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``` for oh-my-zsh
- ```ZSH_DISABLE_COMPFIX=true``` in zshrc BEFORE oh-my-zsh is sourced then update
  - ```upgrade_oh_my_zsh```
  - resolves permission issues as per [this](https://github.com/ohmyzsh/ohmyzsh/issues/6835)
- Spotify: ```brew cask install spotify```
  - move to Dock
- ```brew install pyenv``` and ```brew install openssl readline sqlite3 xz zlib``` for dependecies on mac
  - add ```if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi``` to .zshrc (if bash, use bash_profile), credit for this is [nicolashery](https://github.com/nicolashery/mac-dev-setup#iterm2) and [wiki](https://github.com/pyenv/pyenv/wiki)
- ```pyenv install 3.6.10``` for purposes of tensorflow
- ```pyenv install anaconda3-5.3.1``` for scientific computing
  - ```pyenv shell anaconda3-5.3.1``` switch into anaconda
  - ```conda install jupyter``` to allow for jupyter notebook
-

## iterm2 customization
- make a new iterm2 profile for following customizations
- solarized color in iterm2
- follow instructions [here](https://gist.github.com/kevin-smets/8568070)
- download source code pro + font awesome
- use powerline10k as instructed [here](https://gist.github.com/kevin-smets/8568070)
- enable instant prompt warnings
- enable autosuggestions as instructed [here](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) (towards bottom of page)
- 

## Dotfile management
- ```mv ~/.gitconfig ~/dotfiles/.gitconfig```
- ```ln -sv ~/dotfiles/.gitconfig ~``` sets up symbolic link

## nvim
- ```mkdir ~/dotfiles/nvim```
- ```mkdir ~/.config```
- ```ln -sv ~/dotfiles/nvim ~/.config/```
- ```mv .zshrc dotfiles```
- ```ln -sv ~/dotfiles/.zshrc ~/.zshrc```
- add to .zshrc 
```
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
```
- ```curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``` to download vimplug
- look at init.vim file for neovim setup (has brief documentation as well)
  - note ```:so %``` inside nvim sources init.vim file

## vim-tmux integration
- ```brew install tmux```
- add tmux plugin to zshrc
- basics learned [here](https://www.youtube.com/watch?v=BHhA_ZKjyxo&t=514s) and [here](https://www.youtube.com/watch?v=norO25P7xHg)


## TODO
- git config - fancier
- git ignore - detailed
- Node (npm)
- Check if anaconda environment will run tensorflow 
- macos file
