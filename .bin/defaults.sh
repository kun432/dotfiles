#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
# Refs: 
# - https://qiita.com/ryuichi1208/items/5905240f3bfce793b33d
# - https://fnwiya.hatenablog.com/entry/2015/11/06/155255
# ====================

# ====================
#
# Base
#
# ====================

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock
# 
# Ref: https://ottan.jp/posts/2016/07/system-preferences-terminal-defaults-dock/
# ====================

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# ドックのアイコンサイズ
defaults write com.apple.dock tilesize -int 43

# Dockのアイコン拡大を有効化
defaults write com.apple.dock magnification -bool true

# Dockのアイコン拡大サイズ
defaults write com.apple.dock largesize -int 82

# ====================
#
# Finder
#
# ====================

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ====================
#
# SystemUIServer
#
# ====================

# マウスのスクロールをWindowsと同じにする
defaults write -g com.apple.swipescrolldirection -bool false

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# キャプチャの保存場所を変更
defaults write com.apple.screencapture location ~/Downloads

# キャプチャのプレフィックスを変更
defaults write com.apple.screencapture name "SS_"

# キャプチャに影を付けない
defaults write com.apple.screencapture disable-shadow -boolean true

# メニューバーに音量を表示
#defaults write com.apple.controlcenter "NSStatusItem Visible Sound" 1

# メニューバーにBluetoothを表示
#defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" 1

for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
