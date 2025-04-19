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

- remap ctrl+a to control the terminal and 12345 to control windows
  - maximise windows/left/right
- invest in learning more about zellij??? Do I need zellij actually
- max parity between cursor and neovim
  - leader-e opens filethree
  - leader-s splits windows
- JetBrains type

