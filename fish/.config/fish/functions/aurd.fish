function aurd -d "Only download aur package; do not build"
    git clone https://aur.archlinux.org/$argv[1].git
end
