pw256() {
	rm -r /tmp/pwdump/pipewire
	mv -f $HOME/.config/pipewire /tmp/pwdump
	cp -r $HOME/.custom/pipewire/pw256/* $HOME/.config/pipewire
	systemctl --user restart pipewire

}

pw1024() {
	rm -r /tmp/pwdump/pipewire
	mv -f $HOME/.config/pipewire /tmp/pwdump
	cp -r $HOME/.custom/pipewire/pw1024/* $HOME/.config/pipewire
	systemctl --user restart pipewire

}
