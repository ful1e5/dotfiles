function auru -d "Remove old package, rebuild, and install"
    git reset HEAD --hard && git pull && makepkg --clean --force --install --syncdeps --cleanbuild
end
