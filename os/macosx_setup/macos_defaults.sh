#!/usr/bin/env bash
set -e errexit

# Ref: Mac Tips, Tricks & Shortcuts in easy steps, 2nd Edition

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "\\n\\n"
echo "===================="
echo " macOS Defautls     "
echo "===================="

launchctl limit maxfiles 10240 200000

defaults write com.apple.terminal SecureKeyboardEntry -bool true

echo "Upping bluetooth audio quality (try 40 or 80)"
# Ref: https://www.reddit.com/r/apple/comments/5rfdj6/pro_tip_significantly_improve_bluetooth_audio/
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80

echo "Require password immediately after sleep"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Activity monitor showing stats in dock"
defaults write com.apple.ActivityMonitor IconType -int 5

echo "Sorting Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

echo "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true


echo "\\n\\n=== Typing options ==="

echo "Set a blazingly fast keyboard repeat rate (lower equals faster)"
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 20
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "Enable full keyboard access for all controls"
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable automatic capitalization as it's annoying when typing code"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

echo "Disable smart dashes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Disable automatic period substitution as it's annoying when typing code"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

echo "Disable smart quotes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


echo "\\n\\n=== Safari options ==="

echo "Enable Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Enabling Safari developer options"
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

echo "Enabling \"Do Not Track\" on Safari"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Set Safari's home page to about:blank for faster loading"
defaults write com.apple.Safari HomePage -string "about:blank"

echo "\\n\\n=== Monitor options ==="

echo "Enable subpixel font rendering on non-Apple LCDs"
# Ref: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

echo "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true


echo "\\n\\n=== Finder options ==="

echo "Disable animations"
defaults write com.apple.finder DisableAllAnimations -bool true

echo "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Disabling file extension editing warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "List view by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`, `Nlsv`
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo "Keeping folders on top of file views"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Allowing text-selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Searching current dir by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Show item info near icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

echo "Show item info to the right of the icons on the desktop"
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

echo "Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist

echo "Enable drag and drop with ctrl+cmd"
defaults write -g NSWindowShouldDragOnGesture -bool true


echo "\\n\\n=== Dock options ==="

echo "Dimming hidden Dock icons"
defaults write com.apple.dock showhidden -bool true

echo "Don't show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

echo "Autohiding dock"
defaults write com.apple.dock autohide -bool true

echo "Disabling automatically rearranging spaces"
defaults write com.apple.dock mru-spaces -bool false

echo "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0.25

echo "Restarting Dock"
killall Dock

echo "\\n\\nDefaults are set, please reboot after apps install."
