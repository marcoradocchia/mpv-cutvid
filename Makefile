uninstall:
	rm -f /home/$(HOME)/.config/mpv/scripts/cutvid.lua
	rm -f /usr/local/bin/ffmpeg-cut-merge

install:
	mkdir -p /home/$(USER)/.config/mpv/scripts
	cp -f cutvid.lua /home/$(USER)/.config/mpv/scripts
	mkdir -p /usr/local/bin
	cp -f ffmpeg-cut-merge /usr/local/bin
	chmod 755 /usr/local/bin/ffmpeg-cut-merge
