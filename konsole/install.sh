#!/usr/bin/env bash

set -o errexit -o nounset

mkdir -p ~/.local/share/konsole

cat <<EOF > ~/.local/share/konsole/terminal-sexy.colorscheme
# --- special colors ---

[Background]
Color=29,31,33

[BackgroundIntense]
Color=29,31,33

[Foreground]
Color=197,200,198

[ForegroundIntense]
Color=197,200,198
Bold=true

# --- standard colors ---

[Color0]
Color=40,42,46

[Color0Intense]
Color=55,59,65

[Color1]
Color=165,66,66

[Color1Intense]
Color=204,102,102

[Color2]
Color=140,148,64

[Color2Intense]
Color=181,189,104

[Color3]
Color=222,147,95

[Color3Intense]
Color=240,198,116

[Color4]
Color=95,129,157

[Color4Intense]
Color=129,162,190

[Color5]
Color=133,103,143

[Color5Intense]
Color=178,148,187

[Color6]
Color=94,141,135

[Color6Intense]
Color=138,190,183

[Color7]
Color=112,120,128

[Color7Intense]
Color=197,200,198

# --- general options ---

[General]
Description=terminal.sexy
Opacity=1
Wallpaper=
EOF
