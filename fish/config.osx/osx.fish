alias airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
alias wifi "airport -s; airport -I"

set -x EDITOR "/Applications/MacVim.app/Contents/MacOS/Vim -n"
alias vim "/Applications/MacVim.app/Contents/MacOS/Vim -n"

set -x PATH $PATH ~/Library/Developer/Xamarin/android-sdk-mac_x86/tools ~/Library/Developer/Xamarin/android-sdk-mac_x86/platform-tools ~/Library/Developer/Xamarin/android-sdk-mac_x86/build-tools/19.0.3

# Marmalade
set -x PATH $PATH /Applications/Marmalade.app/Contents/s3e/bin
set -x PATH $PATH /Applications/Marmalade.app/Contents/tools/dzip

# PfGame
set -x PFGAME_LIBS_ROOT ~/projects/pettyfun/libs
set -x PATH $PATH ~/projects/pettyfun/libs/scripts

#camlistore
alias cam "cd /opt/camlistore"
set -x PATH $PATH /opt/camlistore/bin

# "lsregister -dump" can show the UIT (file extension)
#http://stackoverflow.com/questions/9050035/how-to-make-xcode-recognize-a-custom-file-extension-as-objective-c-for-syntax-hi
alias lsregister '/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister'
