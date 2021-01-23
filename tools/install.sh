#!/bin/sh

# To autoinstall use:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/shxll/bmenu-debian/master/tools/install.sh)"

# For a local install, use
# wget https://raw.githubusercontent.com/shxll/bmenu-debian/master/tools/install.sh

REPO=bashelled/bmanu-debian
INSTDIR=~/.local/bin

# Setup colors if not in tty.
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi

echo ""
echo "${BLUE}Welcome to the installer for bmenu debian. We are checking your OS to make sure it is compatible.${RESET}"
# First, we need to check if the OS is a GNU/Linux system. Else, print an error code.

clear
if OSTYPE=linux-gnu then
        echo You are using a GNU/Linux system which is compatible for use.
elif OSTYPE=darwin then
        echo You are using a Darwin system (macOS, OpenDarwin) which is not compatible yet (bmenu-brew may come out soon) # Darwin is not compatible, but bmenu may come out with use for brew soon (TUI Package Manager will be removed for sure unless someone makes a frontend).
        exit 1
elif OSTYPE=cygwin then
        echo Cygwin is not a way to run native Linux apps on Windows, so you cannot use it for bmenu. Try using WSL Debian. # Cygwin is not for Linux apps to be run on Windows.
        exit 1
elif OSTYPE=msys then
        echo MinGW (MSys) is only intended for use with normal GNU commands. Try using WSL Debian. # MinGW is not avalible for use.
        exit 1
elif OSTYPE=win32 then
        echo What? Windows is run on Linux now? How? # I'm not sure this can happen.
        exit 1
elif OSTYPE=freebsd then
        echo You are using FreeBSD, which is not REALLY compatible. If you are using an OS such as UbuntuBSD or Debian GNU/kFreeBSD, you can still continue, but the install may not be stable.
else
        echo Your OS is unknown and the installer cannot continue.
        exit 1
fi


if grep -Fxq "arch" /etc/os-release 
then
    echo "You are using Arch Linux or an Arch Linux based system. The installer cannot continue. Try using the original for Arch."
    exit 1
elif grep -Fxq "debian" /etc/os-release 
    echo "You are using Debian or a Debian based system."
    BMOS=deb
elif grep -Fxq "ubuntu" /etc/os-release
    echo "You are using Ubuntu or an Ubuntu based system."
    BMOS=deb 
else
    echo "Your OS is not found. Try installing Debian and booting it up. If you are using debian"
    exit 1
fi

echo You have passed the test. Continuing...

echo "${BLUE}Installing bmenu...${RESET"
  command_exists git || {
    fmt_error "${RED}Git is not installed. Run sudo apt install git and try again.${RESET} "
    exit 1
  }

mkdir $INSTDIR
git clone https://github.com/$REPO
cd bmenu-debian
git pull origin master
cd bin
mv * $INSTDIR
PATH=$INSTDIR:$PATH
cd
echo Install finished!
