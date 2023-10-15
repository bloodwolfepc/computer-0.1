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
        # Add more directories as needed
    )

    # Loop through directories
    for dir in "${sync_directories[@]}"; do
        # Ensure directory exists on local machine
        mkdir -p "$dir"

        # Ensure directory exists on remote machine
        ssh "$sshhost" "mkdir -p $dir"

        # Sync data between local and remote machines
        rsync -rv "$dir" "$sshhost:$dir"
        rsync -rv "$sshhost:$dir" "$dir"
    done

    sudo -k
}




emulator-bios-push() {
echo "nothing"
}

emulator-bios-pull() {
	sudo cp -r $cloud/bios/ps1/* $HOME/.local/share/duckstation/bios/
	sudo cp -r $cloud/cloud/bios/ps2/* $HOME/
	sudo cp -r $cloud/bios/switch/F16.1/*
	sudo cp -r $cloud/bios/switch/keys/*

}

emulator-saves-push() {
	sudo cp $HOME/.local/share/duckstation/savestates $cloud/ps1/savestates
	sudo cp $HOME/.local/share/duckstation/memcards $cloud/ps1/memcards

	sudo cp -r $HOME/.local/share/mupen64plus/save $cloud/n64/save
}


emulator-saves-pull() {
	sudo cp $cloud/ps1/savestates $HOME/.local/share/duckstation/savestates
	sudo cp $cloud/ps1/memcards $HOME/.local/share/duckstation/memcards
	
	sudo cp -r $cloud/n64/save $HOME/.local/share/mupen64plus/save
}
