function _fish_pacman_init -d "Initialize pacman plugin"
    # build package in current directory, cleanup, and install
    _fish_pacman_abbr pacb 'makepkg -sci'

    #
    # Install

    #
    #NOTE: Installing/upgrading individual packages is NOT supported. Sync and upgrade ALL on install.

    # install, sync, and upgrade packages
    _fish_pacman_abbr paci 'pacman -Syu'

    # install packages without syncing
    _fish_pacman_abbr pacI 'pacman -S'

    # install, sync, and upgrade packages (forcibly refresh package lists)
    _fish_pacman_abbr pacu 'pacman -Syyu'

    # install packages by filename
    _fish_pacman_abbr pacU 'pacman -U'

    # install all packages in current directory
    _fish_pacman_abbr pacd 'pacman -U *.pkg.*'


    #
    # Remove
    #

    # remove package and unneeded dependencies
    _fish_pacman_abbr pacr 'pacman -R'

    # remove package, unneeded dependencies, and configuration files
    _fish_pacman_abbr pacrm 'pacman -Rns'


    #
    # Query
    #

    # query package information from the remote repository
    _fish_pacman_abbr pacq 'pacman -Si'

    # query package information from the local repository
    _fish_pacman_abbr pacQ 'pacman -Qi'


    #
    # Search
    #

    # search for package in the remote repository
    _fish_pacman_abbr pacs 'pacman -Ss'

    # search for the package in the local repository
    _fish_pacman_abbr pacS 'pacman -Qs'


    #
    # Orphans
    #

    # list orphan packages
    _fish_pacman_abbr pacol 'pacman -Qdt'

    # remove orphan packages
    _fish_pacman_abbr pacor 'pacman -Rns (pacman -Qtdq)'


    #
    # Ownership
    #

    # list all files that belong to a package
    _fish_pacman_abbr pacown 'pacman -Ql'

    # show package(s) owning the specified file
    _fish_pacman_abbr pacblame 'pacman -Qo'

    _fish_pacman_abbr upgrade 'sudo pacman -Sy && sudo powerpill -Su && paru -Su'

    # Mark plugin as initialized
    set -U __fish_pacman_initialized 1
end
