# polybar-spotify

This polybar module shows details regarding the currently playing song on Spotify. The unique feature of this module is that the text displayed is constantly scrolled to save space on the bar. This is something that is not found in other spotify modules I came across. Also, this module uses [playerctl](https://github.com/altdesktop/playerctl) to do all the work and hence, no >100 line scripts which do all the work themselves. Only one line to fetch the required metadata in the format that you like and another line to scroll the fetched text using [zscroll](https://github.com/noctuid/zscroll).

![](screenshots/demo.gif)

## Dependencies

- [playerctl](https://github.com/altdesktop/playerctl) - To interface with Spotify
- [zscroll](https://github.com/noctuid/zscroll) - To scroll the fetched text

## Polybar config

```ini
[module/spotify]
type = custom/script
tail = true
format-prefix = "  "
format = <label>
exec = ~/.config/polybar/scripts/scroll_spotify_status.sh
```

The controls can be easily configured using the following modules. Again, make sure you have [playerctl](https://github.com/altdesktop/playerctl) installed.

```ini
[module/spotify-prev]
type = custom/script
exec = echo "玲"
format = <label>
click-left = playerctl previous spotify

[module/spotify-pause]
type = custom/script
exec = echo "懶"
format = <label>
click-left = playerctl play-pause spotify

[module/spotify-next]
type = custom/script
exec = echo "怜"
format = <label>
click-left = playerctl next spotify
```

## Customization

- The format of the fetched metadata can be changed in [get_spotify_status.sh](get_spotify_status.sh). This line needs to be changed
  ```sh
  playerctl metadata spotify --format "{{ title }} - {{ artist }}"
  ```
  More details on what attributes can be fetched can be found [here](https://github.com/altdesktop/playerctl/#printing-properties-and-metadata).
- The scrolling text can be configured in [scroll_spotify_status.sh](scroll_spotify_status.sh). 
  - The length can be configured using `-l` and delay using `-d`.
  - The separators between the infinitely scrolling text can be configured using `--before-text` and `--after-text` parameters.