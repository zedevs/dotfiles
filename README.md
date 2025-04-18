## My dot files

_Someday_ I will write a proper README.md

#### Enable key repeat

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer # don't display full screen apps
defaults write com.apple.dock expose-group-apps -bool true && killall Dock # group windows by application in mission control
defaults write com.apple.dock autohide-delay -float 2 killall Dock # delay showing dock
```

#### Chezmoi quick guide

```sh
chezmoi add ~/.zshrc # to start tracking a file
chezmoi apply # to apply changes
chezmoi edit # to edit dotfiles
chezmoi cd # to navigate to chezmoi directory
```

#### To checkout

- remap asdf row to control the terminal and qwerty to control windows
- try starship
