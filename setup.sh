#!/data/data/com.termux/files/usr/bin/bash
GREEN="$(printf '\033[32m')"

###########

PREFIX='/data/data/com.termux/files'
DIR="$(pwd)"

banner() {

    toilet -f smblock 'Termux Startup'
}
requirements() {
         echo; echo "    ${BLUE}[${RED}*${BLUE}] ${ORANGE}Installing Python"${CYAN}; echo;
        if [[ (-f $PREFIX/bin/python)  ]]; then
                { echo "    ${BLUE}[${RED}*${BLUE}] ${GREEN}Python is already Installed!"; }
        else
                { pkg update -y; pkg install -y python ; }
                (type -p wget tput &> /dev/null) && { echo; echo "    ${GREEN}Python is succesfully installed!"; } || { echo; echo "    ${RED}Error Occured, failed to install dependencies."; echo; reset_color; exit 1; }
        fi
}
install(){
    echo "    ${GREEN}Installing Termux Startup..."


        # Coping files
     echo "    ${GREEN}Coping files "
    cp $DIR/termux_startup.py $PREFIX/home/.termuxstartup.py
    cp $PREFIX/usr/etc/bash.bashrc $PREFIX/usr/etc/bash.bashrc.bak
    echo python $HOME/.termuxstartup.py >> $PREFIX/usr/etc/bash.bashrc
        # Verify files
        if [[ (-f $PREFIX/home/.termuxstartup.py)  ]]; then
            echo; echo "    ${GREEN}Successfully Installed."
        fi

}


banner
requirements
install


