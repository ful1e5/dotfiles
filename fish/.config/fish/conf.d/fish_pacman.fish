# Adapted from here https://github.com/zimfw/pacman

function _fish_pacman_install --on-event fish_pacman_install
    set -U __fish_pacman_abbreviations
    if not builtin -q abbr
        _fish_pacman_init
    end
end

function _fish_pacman_update --on-event fish_pacman_update
    _fish_pacman_uninstall
    _fish_pacman_install
end

function _fish_pacman_uninstall --on-event fish_pacman_uninstall
    for ab in $__fish_pacman_abbreviations
        abbr --erase $ab
    end
    set -Ue __fish_pacman_abbreviations
end

# Starting from fish 3.6.0, 'abbr' is a builtin and abbreviations are no longer stored
# in universal variables.
not builtin -q abbr; and set -q __fish_pacman_initialized; and return 0

_fish_pacman_init
