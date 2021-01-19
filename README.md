# Personal Setup for macOS
## Basic Settings/Setup
- Download Google Chrome at [website](https://www.google.com/chrome/) Set as default browser
  - Sign in to Chrome user accounts
- Dock
  - Remove: System Preferences (accessible from top-left logo anyway), Safari, Mail, Maps, Contacts, Photos, Reminders, iTunes, Podcasts, AppleTV, News, Notes, and App Store. Remember that these are accessible via Cmd + (space) (spotlight search)
  - In System Preferences, set automatic hide and show
  - In System Preferences, uncheck "show previous apps"
- Keyboard
  - Key Repeat = Fast Delay Until Repeat = Short
  - Turn off backlight after 10 seconds of inactivity
  - Modifier Keys: Caps Lock --> Control (makes tmux life SO much easier)
- Trackpad
  - Tap to Click = On (feels nicer)
  - Uncheck Smart Zoom and Rotate (Scroll & Zoom tab)
- Finder
  - Sidebar: home, Downloads, Desktop, Applications
  - new Finder window shows: home
  - show all filename extensions
- Menubar
  - Show Bluetooth in menubar
  - Show battery % in menubar
- General
  - Set accent/highlight color to red
  - Scroll bar: always
- Spotlight
  - Uncheck: Fonts, Images, Documents
- Messages
    - turn off sounds and notification center
- Mail
    - Use either spark (+ TickTick) or outlook (since college email tied to msft)
    - When you wish to switch primaries: change primary (through apple mail app), setup open at login, set notification settings, consider tasks app change
    - Apple mail - default primary
- Desktop
    - create folder Screenshots
    - ```defaults write com.apple.screencapture location /Users/kesavan/Desktop/Screenshots```
- Command line tools: ```xcode-select --install```
- Install homebrew ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"``` [website](https://brew.sh/)
  - ```brew doctor``` to make sure install was successful
- ```brew install git```
- ```brew install node```
  - a good read for git [here] (https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- Terminal: Homebrew theme, change font size 
- ```git config --global user.name "kvenkatesh5"``` - ```git config --global user.email "..."```
- ```brew install vim``` installs dependencies for vim
- ```brew install nvim``` because I want to use neovim!
- ```brew install zsh``` but for macOS Catalina it should already be set as default shell type [in case](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- ```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``` for oh-my-zsh
- ```ZSH_DISABLE_COMPFIX=true``` in zshrc BEFORE oh-my-zsh is sourced then update
  - ```upgrade_oh_my_zsh```
- Disable ZSH noises (see .zshrc source)
  - resolves permission issues as per [this](https://github.com/ohmyzsh/ohmyzsh/issues/6835)
- Install Spotify
- install Lastpass
- install Zoom
- remove launchpad from Dock, it is just a hotkey away (f4 (not with fn))
- ./.macos file (see [https://github.com/mathiasbynens/dotfiles])
  - read [this](https://stackoverflow.com/questions/53229221/terminal-error-zsh-permission-denied-startup-sh)
  - maybe try this out with a harmless bash script just to make sure we know what we are doing
  - add this ./.macos script to the dotfiles directory and comment out commands either don't know or don't need
  - cd and then make symlink to file in home
  - go to dotfiles and change permission of original file (in dotfiles directory) via ```chmod +x ./.macos```
  - go to home and run the file ```./.macos```
- install Messenger, Whatsapp, Slack for mac, Discord for mac, Twitter
- install f.lux for screen brightness management (a bit annoying but helps eyes)
- install Firefox Developer Edition
- install Sublime Text 3, Visual Studio Code
- install Geany as a potential tool for editing
- instlal Dropbox

## vscode
- install settings sync extension and update environment
- ```defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false```

## iTerm (guake style) dropdown terminal
- iTerm2: ```brew cask install iterm2``` or via website
- *this is optional since native mac terminal is decent too
- open at login, hide from cmd+t, hotkey currently using is SHFT+CRTL (remember =caps lock!) + T
- I think one idea is just to keep iterm hidden from cmd+tab, disable guake style dropdwon, but set ctrl+t hotkey toquickly open all windows


## Dotfile management
- ```ln -s``` creates symbolic link, ```-v``` makes it verbose
- ```mv ~/.gitconfig ~/dotfiles/.gitconfig```
- ```ln -sv ~/dotfiles/.gitconfig ~``` sets up symbolic link

## vim
- ```ln -sv ~/dotfiles/.vimrc ~/.vimrc```
- ```curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```
    - useful link for [vim plug](https://github.com/junegunn/vim-plug)

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
    - see [here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- basics learned [here](https://www.youtube.com/watch?v=BHhA_ZKjyxo&t=514s) and [here](https://www.youtube.com/watch?v=norO25P7xHg)
- check out the hotkeys in [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- plug 'christoomey/vim-tmux-navigator' in init.vim
- after making .tmux.conf file, run ```ln -sv ~/dotfiles/.tmux.conf ~/.tmux.conf```
- use this for .tmux.conf to incorporate vim [here](https://github.com/dduan/dotfiles/blob/master/.tmux.conf)
- to source the file, go into tmux and reach command prompt (via ```C-b :```) and type ```source-file ~/.tmux.conf```

## vim-tmux integration on mac Terminal
- ```brew install tmux```
- plug 'christoomey/vim-tmux-navigator' in .vimrc
- after making .tmux.conf file, run ```ln -sv ~/dotfiles/.tmux.conf ~/.tmux.conf```
- use this for .tmux.conf to incorporate vim [here](https://github.com/dduan/dotfiles/blob/master/.tmux.conf)
- to source the file, go into tmux and reach command prompt (via ```C-b :```) and type ```source-file ~/.tmux.conf```


## Latex
- ```brew cask install basictex```
   - The alternate option is ```mactex``` but I want to use vim as my editor so I don't need all the extra
     stuff (latex ide, etc.) that this installs
- when missing a package (say for example, missing ```hyphenat.sty```), run ```sudo tlmgr install hyphenat```
  or whatever package it is in particular, tlmgr is texlive manager
### vimtex
- https://github.com/lervag/vimtex
- ```pip3 install neovim-remote```
- Plug vimtex
- Change zshrc alias to ```vim=nvim --listen VIM``` due to https://github.com/lervag/vimtex/issues/1296
- ```sudo tlmgr install latexmk```

## R
- ```brew cask install xquartz```
- install R and Rstudio from internet

## Java
- https://adoptopenjdk.net/
- choose OpenJDK 8 (LTS) and Hotspot for JVM

## Jetbrains
- Get the jetbrains suite using a college email!
- Download ideavim plugin and enable it
- Write .ideavimrc
- Inside editor, hit : and write source ~/.ideavimrc to source the file
- Update Ctrl+R command to be IDE not vim
- Make sure to change codestyle
- Not sure if I like vim in Jetbrains; I think if you want vim, just use vim!

## MacVim for C++ competitive programming
- CONCEPT: MacVim uses vim, I have set up terminal to use neovim
- continue to use vimplug, but run the vim command given on https://github.com/junegunn/vim-plug
- also, start switching to jj escape rather than jk escape
- the defaults written in using the .macos script still maintain
- symlink a .gvimrc file
- set in System Preferences that function keys have standard functionality (helpful for building/running files)
- set a gvimrc.custom.after to take care of reset gui variables
- set up bits/stdc.h -> https://github.com/tekfyl/bits-stdc-.h-for-mac

## Setting up Conda & Tensorflow (updated version):
- Resources:
    - https://www.youtube.com/watch?v=MpUvdLD932c
    - https://queirozf.com/entries/jupyter-kernels-how-to-add-change-remove
    - to create a conda environment from a yml script: ```conda env create -v -f name-here.yml```
    - to add environment kernel to jupyter ```python -m ipykernel install --user --name tensorflow --display-name "Python 3.7 (tensorflow)"```
- follow Heaton's tutorial to setup Tensorflow (if Tensorflow updates, expect that the video will update
  also)

## JHU
### MARCC (SSH)
- Filezilla
- to start up python, command ```module load python```, negative sign ahead of module load (ml)
  removes it
- to start up anaconda, ```ml anaconda```
### Other Apps
- Mathematica
- Matlab
    - MATLAB (student license, university affiliated) - ```userpath('Users/kesavan/Matlab')```, since default is inside documents
- Zotero
- Install dynalist for organizing work/tasks

## Google Cloud
- follow these [instructions](https://cloud.google.com/sdk/docs/install)

## Github Pro Student Pack
https://education.github.com/pack/offers?sort=popularity&tag=All
- HazeOver is an option, but I didn't like it so much

## Fonts
- https://github.com/Homebrew/homebrew-cask-fonts
- Classic Console, Terminus TTF (nice for competitive programming, macvim), Hack, Fira Code

## Misc Apps
- Bartender 3
- Magnet Pro
- Parallels
- Install princexml into /Users/kesavan/opt/prince, see link https://www.princexml.com/doc/10/installing/
    - carefully add this directory /bin to your path (i added line in zshrc)

## TODO
- git config - fancier
- git ignore - detailed
- Node (npm)
- LSP + autocompletion

## Some Potentially Useful Gists/Repos
- [another dev setup README](https://gist.github.com/checkaayush/35e2e99885da14d25e0b806b3d543b46)
- [sublime text 3 setup](https://gist.github.com/ijy/7399688)
- [sublime text 3 build for C++](https://gist.github.com/jdhao/3e45ba9164fe3d27c40ea86b6455435f)
- [simple vimrc for C++ files](https://gist.github.com/AkashRRao/aeabbc8db0eb1173ab3f70ba0e79c9de)
- [Vscode settings](https://gist.github.com/alysivji/21f08de521f10f6803277a4e81972c5f)
- [latex clean shell script](https://gist.github.com/djsutherland/266983)
- [sample git config file](https://gist.github.com/pksunkara/988716)
- [iterm2-solarized instructions](https://gist.github.com/kevin-smets/8568070)
- [complete macos setup for hackers](https://github.com/mathiasbynens/dotfiles)
