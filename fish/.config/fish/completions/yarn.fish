# Always provide completions for command line utilities.
#
# Check Fish documentation about completions:
# http://fishshell.com/docs/current/commands.html#complete
#
# If your package doesn't provide any command line utility,
# feel free to remove completions directory from the project.

abbr -a y "yarn" # The Yarn command
abbr -a ya "yarn add" # Install a package in dependencies (package.json)
abbr -a yad "yarn add --dev" # Install a package in devDependencies (package.json)
abbr -a yap "yarn add --peer" # Install a package in peerDependencies (package.json)
abbr -a yb "yarn build" # Run the build script defined in package.json
abbr -a ycc "yarn cache clean" # Clean yarn's global cache of packages
abbr -a yd "yarn dev" # Run the dev script defined in package.json
abbr -a yga "yarn global add" # Install packages globally on your operating system
abbr -a ygls "yarn global list" # Lists global installed packages
abbr -a ygrm "yarn global remove" # Remove global installed packages from your OS
abbr -a ygu "yarn global upgrade" # Upgrade packages installed globally to their latest version
abbr -a yh "yarn help" # Show help for a yarn command
abbr -a yi "yarn init" # Interactively creates or updates a package.json file
abbr -a yin "yarn install" # Install dependencies defined in package.json
abbr -a yls "yarn list" # List installed packages
abbr -a yout "yarn outdated" # Check for outdated package dependencies
abbr -a yp "yarn pack" # Create a compressed gzip archive of package dependencies
abbr -a yrm "yarn remove" # Remove installed packages
abbr -a yrun "yarn run" # Run a defined package script
abbr -a ys "yarn serve" # Start the dev server
abbr -a yst "yarn start" # Run the start script defined in package.json
abbr -a yt "yarn test" # Run the test script defined in package.json
abbr -a ytc "yarn test --coverage" # Run the test script defined in package.json with coverage
abbr -a yuc "yarn global upgrade && yarn cache clean" # Upgrade global packages and clean yarn's global cache
abbr -a yui "yarn upgrade-interactive" # Prompt for which outdated packages to upgrade
abbr -a yup "yarn upgrade" # Upgrade packages to their latest version
abbr -a yv "yarn version" # Update the version of your package
abbr -a yw "yarn workspace" # Run a command within a single workspace.
abbr -a yws "yarn workspaces" # Run a command within all defined workspaces.