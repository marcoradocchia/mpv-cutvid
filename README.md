<div align="center">
  <h1 align="center">mpv-cutvid</h1>

  ![GitHub releases](https://img.shields.io/github/downloads/marcoradocchia/mpv-cutvid/total?color=%23a9b665&logo=github)
  ![GitHub source size](https://img.shields.io/github/languages/code-size/marcoradocchia/mpv-cutvid?color=ea6962&logo=github)
  ![GitHub open issues](https://img.shields.io/github/issues-raw/marcoradocchia/mpv-cutvid?color=%23d8a657&logo=github)
  ![GitHub open pull requests](https://img.shields.io/github/issues-pr-raw/marcoradocchia/mpv-cutvid?color=%2389b482&logo=github)
  ![GitHub sponsors](https://img.shields.io/github/sponsors/marcoradocchia?color=%23d3869b&logo=github)
  ![GitHub license](https://img.shields.io/github/license/marcoradocchia/mpv-cutvid?color=%23e78a4e)
</div>
MPV lua script to cut and merge video sections into a single clip, using ffmpeg
in the background.

## Description
Lua MPV script which allows to cut/trim video file into clips which are
generated and merged in the background while viedo playback is running.
In order to cut and merge the video clips a shell script running ffmpeg
commands is invoked.

The script uses MPV's OSD messages for user interaction.

The output video will be created in the same directory as original one with the
following filename format: `YYYY-MM-DD_hh_mm_ss.mkv`.

## Keymaps
Two default (but editable) keymaps are provides two keymaps:
* `Ctrl+t`: start/end video clip timestamp, which are saved in temporary file
  and passed to ffmpeg;
* `Ctrl+Shift+t`: clear accidental start timestamp;
* `Ctrl+p`: start trimming/merging clips (valid input only if paired start/end
  timestamps have been saved).

## Installation
In order to install the the scripts run the following commands:
```sh
git clone https://github.com/marcoradocchia/mpv-cutvid 
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

The `ffmpeg-cut-merge` script needs `bc` to be installed. On Arch based distros
install it with:
```sh
sudo pacman -S bc
```

## License

[GPLv3](LICENSE)
