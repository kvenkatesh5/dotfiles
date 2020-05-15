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
  - Auto hide and show menu bar
- General
  - Set highlight color to red
  - Scroll bar: always
- Spotlight
  - Uncheck: Fonts, Images, Documents
- Download Github Desktop [website](https://desktop.github.com/)
- Messages
    - turn off sounds and notification center
- Mail
    - Apple mail - turn off noises
- Outlook
    - Make as primary email client (have to go to apple mail for that)
    - Disable sounds
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
- Disable ZSH noises (see .zshrc source)
  - resolves permission issues as per [this](https://github.com/ohmyzsh/ohmyzsh/issues/6835)
- Spotify: ```brew cask install spotify```
  - move to Dock
- ```brew install pyenv``` and ```brew install openssl readline sqlite3 xz zlib``` for dependecies on mac
  - add ```if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi``` to .zshrc (if bash, use bash_profile), credit for this is [nicolashery](https://github.com/nicolashery/mac-dev-setup#iterm2) and [wiki](https://github.com/pyenv/pyenv/wiki)
- ```pyenv install 3.6.10``` for purposes of tensorflow
- ```pyenv install anaconda3-5.3.1``` for scientific computing
  - ```pyenv shell anaconda3-5.3.1``` switch into anaconda
  - ```conda install jupyter``` to allow for jupyter notebook
- install Lastpass
- install Zoom
- remove launchpad from Dock, it is just a hotkey away (f4 (not with fn))

## iterm2 customization
- make a new iterm2 profile for following customizations
- solarized dark color in iterm2
- follow instructions [here](https://gist.github.com/kevin-smets/8568070)
- download source code pro + font awesome
- use powerline10k as instructed [here](https://gist.github.com/kevin-smets/8568070)
- enable instant prompt warnings
- enable autosuggestions as instructed [here](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) (towards bottom of page)
- 

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

## Conda and Pytorch
- ```pyenv install anaconda3-5.3.1 ```
- to zshrc, add this for pyenv ```if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi```
- to work in anaconda, use ```pyenv global anaconda...```
    - now ```conda``` should be an available command
- make a conda environment for machine learning / deep learning
- add this to .zshrc: (\# should rlly be #)

\# >>> conda initialize >>>
\# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kesavan/.pyenv/versions/anaconda3-5.3.1/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kesavan/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh" ]; then
        . "/Users/kesavan/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kesavan/.pyenv/versions/anaconda3-5.3.1/bin:$PATH"
    fi
fi
unset __conda_setup
\# <<< conda initialize <<<
- (do this by running ```conda init zsh```)
- source the file
- now conda activate will work
- activate ml environment and run ```conda install pytorch torchvision -c pytorch```
- if when opening jupyter notebook, pytorch is unavailable then: ```conda install jupyter```
- install additionally ```pandas matplotlib```
- conda list is useful to check what environment has installed
- BUG: at the moment, in a new tmux session, I cannot run ```conda activate ml```. must be done in regular
  shell

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

## TODO
- git config - fancier
- git ignore - detailed
- Node (npm)
- Check if anaconda environment will run tensorflow macos file 
- LSP + autocompletion
- C++
- Java Installation
- Latex, vim-latex
- Airmail/Polymail/smth
- Notebooks (app)
- Alfred for Mac
- Fix colors from Apple Accessibility
- symlink and ideamvimrc from dotfiles, setup .ideavimrc

