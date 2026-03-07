# sketchybar

Gruvbox Dark status bar using [sketchybar](https://github.com/FelixKratz/SketchyBar).

## Dependencies

```sh
brew install sketchybar
brew install --cask font-fira-code-nerd-font
brew install --cask font-sketchybar-app-font
```

## Setup

```sh
ln -sf ~/dotfiles/sketchybar ~/.config/sketchybar
```

Launched automatically by AeroSpace via `after-startup-command`. To start manually:

```sh
sketchybar --config ~/.config/sketchybar/sketchybarrc
```

> Must run with `topmost=on` or it renders behind windows.

## Layout

```
[1-10 workspaces] │  [app icon + name]  [now playing]  │  [mem] [cpu] [vol] [mic] [vpn] [wifi] [bat] │ [date] [time]
```

## Plugins

| Plugin | Notes |
|---|---|
| `workspace.sh` | AeroSpace workspace switcher |
| `window_title.sh` | Frontmost app icon (via `sketchybar-app-font`) + name |
| `now_playing.sh` | Spotify / Music — hides when nothing playing |
| `battery.sh` | % + charging icon, hides on desktop |
| `mic.sh` | Red when muted, click to toggle |
| `vpn.sh` | Shows VPN name when connected, hides otherwise |
| `wifi.sh` | SSID on `en1`, click opens Network prefs |
| `volume.sh` | Scroll to adjust, click to mute |
| `cpu.sh` | Color thresholds at 50/80% |
| `memory.sh` | Usage in GB, color thresholds at 70/90% |
| `clock.sh` | Date + time, 10s update |
| `icon_map.sh` | Downloaded from sketchybar-app-font release, maps app names to glyphs |
