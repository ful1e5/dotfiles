function aurb -d "Download and build AUR package"
    git clone https://aur.archlinux.org/$argv[1].git && cd $argv[1] && makepkg --clean --install --syncdeps
end
