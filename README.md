# AeroSpace Configuration

An opinionated AeroSpace configuration for macOS power users, focused on efficient workflow automation and multi-monitor productivity.

## Overview

[AeroSpace](https://github.com/nikitabobko/AeroSpace) is an i3-like tiling window manager for macOS. This configuration provides:

- **Automated workspace management**: Apps automatically move to designated workspaces
- **Multi-monitor shortcuts**: Quick navigation and window management across displays
- **Vim-style keybindings**: Intuitive hjkl navigation for window focus and movement
- **Smart floating windows**: WeChat chat windows auto-float while main window tiles

## Installation

1. Install AeroSpace via Homebrew:
   ```bash
   brew install --cask nikitabobko/tap/aerospace
   ```

2. Copy this configuration to your AeroSpace config directory:
   ```bash
   cp aerospace.toml ~/.aerospace.toml
   # or
   ln -s $(pwd)/aerospace.toml ~/.aerospace.toml
   ```

3. Restart AeroSpace or reload config: `Alt+Shift+;` then `Esc`

## Workspace Layout

| Workspace | Purpose | Apps |
|-----------|---------|------|
| **1** | Browser | Chrome (bingb workspace) |
| **2** | IDE | VSCode, Cursor, IntelliJ IDEA, PyCharm, WebStorm, Zed |
| **3** | Terminal | Terminal.app, Alacritty |
| **4** | Communication | WeChat (main tiled, chats floating), Telegram |
| **5** | Music | Apple Music |
| **P** | Other Browsers | 115 Browser, Chrome (hub) |

## Key Features

### 1. Automatic App Assignment
Applications are automatically assigned to specific workspaces when launched:
- Use `aerospace list-apps` to find app IDs
- Configured via `[[on-window-detected]]` callbacks

### 2. Multi-Monitor Management
- `Alt + [` / `]` - Focus previous/next monitor
- `Alt + Shift + [` / `]` - Move window to previous/next monitor (focus follows)

### 3. Smart WeChat Floating
- WeChat main window (title contains '微信') → Tiled layout
- WeChat other windows (chat windows, settings) → Floating layout
- All WeChat windows move to workspace 4

### 4. Persistent Workspaces
Workspaces 1-9 and P remain active even when empty:
- Prevents workspace reordering
- Maintains consistent workspace numbers

### 5. Auto-Unhide Apps
`automatically-unhide-macos-hidden-apps = true`
- Prevents apps from staying hidden after `Cmd+H` or `Cmd+Option+H`
- Useful if you don't use macOS hide feature

## Keybindings

### Window Navigation (Vim-style)
- `Alt + h/j/k/l` - Focus left/down/up/right
- `Alt + Shift + h/j/k/l` - Move window left/down/up/right

### Layout Management
- `Alt + /` - Cycle through tile layouts (horizontal/vertical)
- `Alt + ,` - Cycle through accordion layouts (horizontal/vertical)

### Workspace Switching
- `Alt + 1-9` - Switch to workspace 1-9
- `Alt + P` - Switch to workspace P
- `Alt + Tab` - Switch back and forth to previous workspace
- `Alt + Shift + 1-9/P` - Move focused window to workspace 1-9/P

### Window Resizing
- `Alt + -` - Shrink window by 200 pixels
- `Alt + =` - Expand window by 200 pixels

### Service Mode (`Alt + Shift + ;`)
- `Esc` - Reload config and return to main mode
- `r` - Reset layout (flatten workspace tree)
- `f` - Toggle floating/tiling layout
- `Backspace` - Close all windows except current
- `Alt + Shift + h/j/k/l` - Join with adjacent window

## Configuration Details

### Normalization
- `enable-normalization-flatten-containers = true` - Removes single-child containers
- `enable-normalization-opposite-orientation-for-nested-containers = true` - Ensures nested containers have opposite orientations

### Mouse Behavior
- `on-focused-monitor-changed = ['move-mouse monitor-lazy-center']` - Mouse follows focus when switching monitors

### Gaps
All gaps set to 0 for maximum window space utilization

### Monitor Assignment
`workspace-to-monitor-force-assignment` table is configured but empty by default. You can assign specific workspaces to specific monitors:

```toml
[workspace-to-monitor-force-assignment]
1 = "main"     # Workspace 1 always on main display
2 = "secondary" # Workspace 2 always on secondary display
```

## Multi-Monitor Setup Recommendations

1. **Disable "Displays have separate Spaces"** (System Settings → Desktop & Dock)
   - Better stability and performance
   - Windows can span across monitors

2. **Arrange monitors properly** (System Settings → Displays → Arrange)
   - Ensure each monitor has free space in bottom-right or bottom-left corner
   - AeroSpace hides inactive workspaces in screen corners

3. **Consider workspace-to-monitor assignment** if you have specific workflows
   - Use the `workspace-to-monitor-force-assignment` table
   - Prevents workspaces from moving between monitors

## Troubleshooting

### Find App ID
```bash
aerospace list-apps
# or
mdls -name kMDItemCFBundleIdentifier -r /Applications/App.app
```

### Reload Configuration
Press `Alt + Shift + ;` then `Esc`, or run:
```bash
aerospace reload-config
```

### Reset Layout
Press `Alt + Shift + ;` then `r`

### Check Current Workspace
Look at the AeroSpace menu bar icon (top-right corner)

## Resources

- [AeroSpace Guide](https://nikitabobko.github.io/AeroSpace/guide)
- [AeroSpace Commands](https://nikitabobko.github.io/AeroSpace/commands)
- [AeroSpace GitHub](https://github.com/nikitabobko/AeroSpace)

## License

This configuration is provided as-is for personal use.
