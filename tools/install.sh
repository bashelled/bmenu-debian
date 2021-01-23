#!/bin/sh

# To install use:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/shxll/bmenu-debian/master/tools/install.sh)"

# For a manual install, use
# wget https://raw.githubusercontent.com/shxll/bmenu-debian/master/tools/install.sh


echo ""
echo -e " Welcome to the installer for bmenu debian. We are checking your OS to make sure it is compatible"
# First, we need to check if the OS is a GNU/Linux system. Else, print an error code.


I think the following should work. I'm not sure about win32 though.

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # The OS is a GNU/Linux system and is compatible with BMenu.
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # The OS is a Darwin based system (macOS, OpenDarwin) and cannot be used.
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # The OS is Cygwin, a Linux environment emulation for Windows and cannot be used. (Cygwin is not a native way to run Linux apps on Windows as said by the website. To use Bmenu on Windows, install WSL.
elif [[ "$OSTYPE" == "msys" ]]; then
        # The OS is Msys, a UNIX shell and GNU utilities compiled for Windows (part of MinGW), and is not compatible with BMenu.
elif [[ "$OSTYPE" == "win32" ]]; then
        # ...what?
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # The OS is a FreeBSD system (UbuntuBSD, Debian GNU/kFreeBSD) and may work with BMenu.
else
        # Unknown.
fi


if grep -Fxq "arch" 
then
    echo -e "You are using Arch Linux or an Arch Linux based system. The installer will go on, but will fetch the Arch Linux version."
else
    echo -e "You are using 
fi

