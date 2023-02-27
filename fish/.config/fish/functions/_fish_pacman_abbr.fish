function _fish_pacman_abbr -d "Create pacman abbreviation"
    set -l name $argv[1]
    set -l body $argv[2..-1]
    abbr -a $name $body
    set -a __fish_pacman_abbreviations $name
end
