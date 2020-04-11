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
- iTerm2: ```brew cask install iterm2```
  - add to Dock
- ```git config --global user.name "kvenkatesh5"```
- ```git config --global user.email "..."```
- ```brew install vim``` installs dependencies for vim
- ```brew install nvim``` because I want to use neovim!
- ```brew install zsh``` but for macOS Catalina it should already be set as default shell type [in case](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- ```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``` for oh-my-zsh
- ```ZSH_DISABLE_COMPFIX=true``` in zshrc BEFORE oh-my-zsh is sourced then update
  - ```upgrade_oh_my_zsh```
  - resolves permission issues
- Spotify: ```brew cask install spotify```
  - move to Dock
- 



- git config - fancier
- git ignore - detailed

