#!/bin/bash

# 将应用设置可在任意工作区呼出的 floating 窗口
# Usage: toggle-float.sh <app-bundle-id> <workspace>
# Example: toggle-float.sh com.mitchellh.ghostty G

APP_BUNDLE_ID="$1"
HIDE_WS="$2"

if [ -z "$APP_BUNDLE_ID" ] || [ -z "$HIDE_WS" ]; then
    echo "Usage: $0 <app-bundle-id> <workspace>"
    exit 1
fi

FOCUSED_APP=$(aerospace list-windows --focused --format '%{app-bundle-id}' 2>/dev/null)

if [ "$FOCUSED_APP" = "$APP_BUNDLE_ID" ]; then
    aerospace move-node-to-workspace "$HIDE_WS"
    exit 0
fi

read -r APP_WID APP_WS < <(aerospace list-windows --monitor all --app-bundle-id "$APP_BUNDLE_ID" --format '%{window-id} %{workspace}' 2>/dev/null)

if [ -z "$APP_WID" ]; then
    open -b "$APP_BUNDLE_ID"
    exit 0
fi

CURRENT_WS=$(aerospace list-workspaces --focused 2>/dev/null)

if [ "$APP_WS" = "$CURRENT_WS" ]; then
    aerospace focus --window-id "$APP_WID"
else
    aerospace move-node-to-workspace --window-id "$APP_WID" --focus-follows-window "$CURRENT_WS"
    aerospace layout --window-id "$APP_WID" floating
fi
