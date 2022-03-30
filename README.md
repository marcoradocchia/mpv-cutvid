# mpv-cutvid
MPV lua script to cut and merge video sections into a single clip, using ffmpeg
in the background

## Description
Lua MPV script which allows to cut/trim video file into clips which are
generated and merged in the background while viedo playback is running.
In order to cut and merge the video clips a shell script running ffmpeg
commands is invoked.

The script uses MPV's OSD messages for user interaction.

The output video will be created in the same directory as original one.

## Keymaps
Two default (but editable) keymaps are provides two keymaps:
* `Ctrl+t`: start/end video clip timestamp, which are saved in temporary file
  and passed to ffmpeg 
* `Ctrl+p`: start trimming/merging clips (valid input only if paired start/stop
  timestamps have been saved)

## Installation
Makefile provided in order to install the the scripts:
```sh
sudo make USER=<user> install
```
where `<user>` is a _placeholder_ for the user's name the script is intended to
be used by.

### Uninstall
In order to uninstall the scripts run:
```sh
sudo make USER=<user> uninstall
```
where `<user>` is a _placeholder_ like above.

### Requirements
This script makes use of ffmpeg to produce video output, on Arch Linux `ffmpeg`
is an MPV dependency. On different distribution installing `ffmpeg` might be
needed.
