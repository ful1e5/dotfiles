# ==========================================
# 1. Environment & Private Variables (OpenRouter Fix)
# ==========================================
# Safely loads any local private variables (like API keys) if the file exists
if test -f ~/.config/fish/conf.d/private_env.fish
    source ~/.config/fish/conf.d/private_env.fish
end

# Load completions
for file in ~/.config/fish/completions/*.fish
    if test -f $file
        source $file
    end
end

# ==========================================
# 2. PATHS Configuration
# ==========================================
fish_add_path $HOME/.local/share/bob/nvim-bin # bob Neovim manager
fish_add_path $HOME/.cargo/bin                # Rust Cargo
# fish_add_path $HOME/GitHub/flutter/bin      # Flutter (Disabled)

# Disable fish's default greeting message
set fish_greeting

# Enable Vi mode keybindings
fish_vi_key_bindings

# ==========================================
# 3. Python & Pyenv Configuration
# ==========================================
alias p="python"
alias penv="source .venv/bin/activate.fish"
alias dpenv="deactivate"

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# ==========================================
# 4. Prompt & FZF Configuration
# ==========================================
# Show branch name in biscuit prompt
set biscuit_show_branch_name 1

# FZF config engine parameters
set -g FZF_COMPLETE 2            # allows walking candidates with TAB
set -U FZF_DISABLE_KEYBINDINGS 1 # disable fzf.fish default keybindings
set fzf_fd_opts --hidden -E .git -E .virtualenvs -E .cargo -E .cache -E .fonts -E node_modules
fzf_configure_bindings --history=\ch --directory=\cp --git_log --git_status --variables --processes

# ==========================================
# 5. Core Utilities & Application Aliases
# ==========================================
# Resource fish config file instantly
alias resource="source $__fish_config_dir/config.fish"

# Modern Directory Lister (Replaced abandoned exa with modern eza fork)
if type -q eza
    alias ll="eza -l --icons"
else
    alias ll="exa -l --icons"
end

alias sk="screenkey --window --opacity '1.0'"
alias nv="neovide"
alias logout="loginctl terminate-user $USER"
alias kk="killall droidcam-cli ffplay mobcam"

# ==========================================
# 6. Navigation & Dotfile Direct Shortcuts
# ==========================================
alias .f="cd ~/.dotfiles"
alias ful="cd ~/GitHub/ful1e5"
alias .fish="cd ~/.dotfiles/fish/.config/fish && nvim config.fish"

# FIXED: Updated paths to match your current lazy.nvim layout files (instead of obsolete packer paths)
alias .nvim="cd ~/.dotfiles/nvim/.config/nvim && nvim lua/ful1e5/lazy_plugins.lua"
alias .hypr="cd ~/.dotfiles/hyprland/.config/hypr && nvim hyprland.conf"
alias .kitty="cd ~/.dotfiles/kitty/.config/kitty && nvim kitty.conf"
alias .relx="cd ~/Videos/Relax\ Sadiq/"
