cloud="$HOME/.cloud"
sshhost_file="$HOME/.hostip"

cloudsync() {
    sudo -v

    if [ -f "$sshhost_file" ]; then
        sshhost=$(cat "$sshhost_file")
    else
        echo "Error: SSH host file ($sshhost_file) not found!"
        exit 1
    fi

    # Define directories to sync
    sync_directories=(
        "$HOME/.config/Ryujinx/system/"
        "$cloud"
        "$HOME/notebook"
        "$HOME/.config/PCSX2/bios"
        "$HOME/.local/share/duckstation/bios"
        "$HOME/.local/share/duckstation/"
        "$HOME/.local/share/mupen64plus/"
        "$HOME/.snes9x"
        "$HOME/.config/desmume/"
        "$HOME/.config/Ryujinx/bis/user/save/"
        "$HOME/.var/app/com.usebottles.bottles/data/botles/bottles/ableton/drive_c/users/bloodwolfe/Documents/Ableton/"
        "$HOME/.var/app/com.usebottles.bottles/data/bottles/bottes/ableton/drive_c/users/bloodwolfe/Desktop"
        # Add more directories as needed
    )

    # Loop through directories
    for dir in "${sync_directories[@]}"; do
        # Ensure directory exists on local machine
        mkdir -p "$dir"

        # Ensure directory exists on remote machine
        ssh "$sshhost" "mkdir -p $dir"

        # Sync data from local to remote
        rsync -av --delete-after "$dir/" "$sshhost:$dir/"

        # Sync data from remote to local
        rsync -av --delete-after "$sshhost:$dir/" "$dir/"
    done

    sudo -k
}

