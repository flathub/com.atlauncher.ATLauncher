#!/bin/bash -e
# Credits to github/nickavem for the script, Doomsdayrs for edits

# Test Discord
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

# Link directories
ln -sfn ~/.var/app/com.atlauncher.ATLauncher/cache/ ~/.var/app/com.atlauncher.ATLauncher/data/cache
ln -sfn ~/.var/app/com.atlauncher.ATLauncher/config ~/.var/app/com.atlauncher.ATLauncher/data/configs

# Handle custom directory
DIR=${CUSTOM_DIR:-".var/app/com.atlauncher.ATLauncher/data/"}

# Run
java -jar /app/bin/ATLauncher.jar --working-dir=$DIR --no-launcher-update
