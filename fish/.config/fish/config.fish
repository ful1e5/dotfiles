# disabled fish's default greeting message
set fish_greeting

# vi mode
fish_vi_key_bindings

# fzf config
fzf_configure_bindings --history=\ch --directory=\cp --git_log --git_status --variables --processes

# Resource fish config file
alias resource="source $__fish_config_dir/config.fish"

# exa
alias ll="exa -l --icons"

# clickgen
alias c="clickgen"

# make
alias m="make"

# screenkey
alias sk="screenkey --window --opacity '1.0'"

# KDE
alias logout="loginctl terminate-user $USER"

# Stream song-grab
# alias gsvlc="VERBOSE=true OUTPUT_DIR=./.output ./Github/grab-song/grab-song.sh vlc"
# alias gscele="VERBOSE=true OUTPUT_DIR=./.output ./Github/grab-song/grab-song.sh"

# dotfiles
alias .f="cd ~/.dotfiles"
alias .fish="cd ~/.dotfiles/fish/.config/fish && nvim config.fish"
alias .nvim="cd ~/.dotfiles/nvim/.config/nvim && nvim lua/kz/plugins.lua"
alias .packer="cd ~/.local/share/nvim/site/pack/packer"

#Python
alias p="python"
set -x PATH ~/.local/bin $PATH

# Cargo
# set -x PATH "$HOME/.cargo/bin" $PATH

# Flutter
# set -x PATH ~/GitHub/flutter/bin $PATH

# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
