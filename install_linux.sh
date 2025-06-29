#!/usr/bin/env bash

git submodule update --init --recursive
./get-deps
cargo build --release

mkdir -p /usr/local/bin /etc/profile.d
sudo install -Dm755 assets/open-wezterm-here target/release/wezterm target/release/wezterm-gui target/release/wezterm-mux-server target/release/strip-ansi-escapes -t /usr/local/bin
sudo install -Dm644 assets/shell-integration/* -t /etc/profile.d
sudo install -Dm644 assets/shell-completion/zsh /usr/local/share/zsh/site-functions/_wezterm
sudo install -Dm644 assets/shell-completion/bash /etc/bash_completion.d/wezterm
sudo install -Dm644 assets/icon/terminal.png /usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
sudo install -Dm644 assets/wezterm.desktop /usr/share/applications/org.wezfurlong.wezterm.desktop
