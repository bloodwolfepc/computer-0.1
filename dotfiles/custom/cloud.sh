cloud="$HOME/.cloud"
sshhost_file="$HOME/.hostip"

cloudsync() {

	sshhost_file="$HOME/.custom/sshhost"

	if [ -f "$sshhost_file" ]; then
     		sshhost=$(cat "$sshhost_file")
	else
    	echo "Error: SSH host file ($sshhost_file) not found!"
    		exit 1
	fi

	#switchbios here
	rsync -rv "$sshhost:$cloud/" "$cloud/"
	rsync -rv "$sshhost:$HOME/notebook/" "$HOME/notebook/"

	#emulator bios
	rsync -rv "$sshhost:$HOME/.config/PCSX2/bios/" "$HOME/.config/PCSX2/bios/"
	rsync -rv "$sshhost:$HOME/.local/share/duckstation/bios/" "$HOME/.config/PCSX2/bios/"
	
	#emulator saves mostly from ~/.local/share
	rsync -rv "$sshhost:SHOME/.local/share/duckstation/" "$HOME/.local/share/duckstation/"

	rsync -rv "$sshhost:$HOME/.local/share/duckstation/" "$HOME/.local/share/duckstation"

	#mgba places saves with the rom im not dealing with it right now
	
	mkdir -p "$HOME/.local/share/mupen64plus"
	rsync -rv "$sshhost:$HOME/.local/share/mupen64plus" "$HOME/.local/share/mupen64plus"

	mkdir -p "$HOME/.snes9x"
	rysn -rv "$sshhost:$HOME/.snes9x/" "$HOME/.snes9x/"






	rsync -rv "$sshhost:HOST/.config/desmume/" "$HOST/.config/desmume/"




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
