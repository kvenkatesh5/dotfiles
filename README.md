# Personal Setup for macOS
## Basic Settings/Setup - Download Google Chrome at [website](https://www.google.com/chrome/) Set as default browser
  - Sign in to Chrome user accounts
- Dock
  - Remove: System Preferences (accessible from top-left logo anyway), Safari, Mail, Maps, Contacts, Photos, Reminders, iTunes, Podcasts, AppleTV, News, and App Store Remember that these are accessible via ```Cmd + [space]``` (spotlight search)
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
    - Apple mail - primary
- Command line tools: ```xcode-select --install```
- Install homebrew ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"``` [website](https://brew.sh/)
  - ```brew doctor``` to make sure install was successful
- ```brew install git``` 
- ```brew install node```
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
- Disable ZSH noises (see .zshrc source)
  - resolves permission issues as per [this](https://github.com/ohmyzsh/ohmyzsh/issues/6835)
- Spotify: ```brew cask install spotify```
  - move to Dock
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
 

## Dotfile management
- ```ln -s``` creates symbolic link, ```-v``` makes it verbose
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
    - see [here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- basics learned [here](https://www.youtube.com/watch?v=BHhA_ZKjyxo&t=514s) and [here](https://www.youtube.com/watch?v=norO25P7xHg)
- check out the hotkeys in [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- plug 'christoomey/vim-tmux-navigator' in init.vim
- after making .tmux.conf file, run ```ln -sv ~/dotfiles/.tmux.conf ~/.tmux.conf```
- use this for .tmux.conf to incorporate vim [here](https://github.com/dduan/dotfiles/blob/master/.tmux.conf)
- to source the file, go into tmux and reach command prompt (via ```C-b :```) and type ```source-file ~/.tmux.conf```

## LSP
- check if python in nvim w/ ```:echo has('python3')```
- to add python in nvim: ```python3 -m pip install pynvim``` then ```let g:python3_host_prof = 'path to python3'```
    - path to python3 can be found by running ```type -a python3```
-

## Latex
- ```brew cask install basictex```
   - The alternate option is ```mactex``` but I want to use vim as my editor so I don't need all the extra
     stuff (latex ide, etc.) that this installs
- when missing a package (say for example, missing ```hyphenat.sty```), run ```sudo tlmgr install hyphenat```
  or whatever package it is in particular, tlmgr is texlive manager

## R
- ```brew cask install xquartz```
- install R and Rstudio from internet

## Java
- https://www.oracle.com/java/technologies/javase-downloads.html

## Leetcode
- https://github.com/ianding1/leetcode.vim

## vimtex
- https://github.com/lervag/vimtex
- ```pip3 install neovim-remote```
- Plug vimtex
- Change zshrc alias to ```vim=nvim --listen VIM``` due to https://github.com/lervag/vimtex/issues/1296
- ```sudo tlmgr install latexmk```


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

## Setting up Conda & Tensorflow (updated version):
- Resources:
    - https://www.youtube.com/watch?v=MpUvdLD932c
    - https://queirozf.com/entries/jupyter-kernels-how-to-add-change-remove
    - to create a conda environment from a yml script: ```conda env create -v -f name-here.yml```
    - to add environment kernel to jupyter ```python -m ipykernel install --user --name tensorflow --display-name "Python 3.7 (tensorflow)"```
- follow Heaton's tutorial to setup Tensorflow (if Tensorflow updates, expect that the video will update
  also)



## Misc Apps
- Messenger for Mac
- Whatsapp for Mac
- Slack for Mac
- Firefox Developer Edition

## Fonts
- https://github.com/Homebrew/homebrew-cask-fonts
- Do that
## TODO
- git config - fancier
- git ignore - detailed
- Node (npm)
- Check if anaconda environment will run tensorflow macos file 
- LSP + autocompletion
- C++
- Java Installation
- Latex, vim-latex
- Notebooks (app)
- Alfred for Mac
- Fix colors from Apple Accessibility
- symlink and ideamvimrc from dotfiles, setup .ideavimrc

