#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'
BOLD='\033[1m'

clear
echo -e "${PURPLE}"
cat << "EOF"
  ╔═══════════════════════════════════════╗
  ║    𝕋𝔼ℝ𝕄𝕌𝕏 𝕌𝕃𝕋𝕀𝕄𝔸𝕋𝔼 𝕋ℍ𝔼𝕄𝔼𝕊 @Takanoper      ║
  ╚═══════════════════════════════════════╝
EOF
echo -e "${NC}"

install_packages() {
    pkg update -y && pkg upgrade -y
    pkg install -y git zsh curl wget neofetch cmatrix cowsay figlet lolcat nano vim python nodejs
    pip install --upgrade pip
    pip install colorama pyfiglet requests
}

setup_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
    
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
    
    if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
}

theme_matrix() {
    cat > ~/.termux_theme_matrix << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
COLORS=("#ff0000" "#00ff00" "#0000ff" "#ffff00" "#ff00ff" "#00ffff" "#ffffff" "#ff8800")
while true; do
    for color in "${COLORS[@]}"; do
        termux-wallpaper -f .cache/wall.png 2>/dev/null
        sleep 0.3
    done
done
EOF
    chmod +x ~/.termux_theme_matrix
}

theme_hacker() {
    cat > ~/.zshrc_hacker << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo copyfile copydir)
source $ZSH/oh-my-zsh.sh

PROMPT='%{%F{green}%}╭─%{%F{red}%}[%{%F{yellow}%}%n%{%F{green}%}@%{%F{blue}%}%m%{%F{red}%}]%{%F{green}%}──%{%F{red}%}[%{%F{cyan}%}%~%{%F{red}%}]%{$reset_color%}
%{%F{green}%}╰─%{%F{red}%}[%{%F{magenta}%}★%{%F{red}%}]%{%F{green}%}➤%{$reset_color%} '

alias ls='ls --color=auto'
alias ll='ls -la'
alias hack='cmatrix -s -C cyan'
alias scan='nmap'
alias wifi='termux-wifi-scaninfo'
alias ip='curl ifconfig.me'
alias update='pkg update && pkg upgrade'
alias theme='bash $HOME/.termux_theme_switcher'

export PATH="$PATH:$HOME/.local/bin"
neofetch --ascii_distro arch
EOF
}

theme_neon() {
    cat > ~/.zshrc_neon << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions colored-man-pages colorize)
source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="magenta"
POWERLEVEL9K_DIR_HOME_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="cyan"

export PATH="$PATH:$HOME/.local/bin"
clear
echo -e "\e[38;5;213m"
cat << "EOF"
  ╔═╗╔═╗╔╦╗╔═╗  ╔╗ ╔═╗╔═╗╦  
  ║  ║ ║║║║╠═╝  ╠╩╗╠═╣║  ║  
  ╚═╝╚═╝╩ ╩╩    ╚═╝╩ ╩╚═╝╩═╝
EOF
echo -e "\e[0m"
lolcat < <(echo "Termux Neon Theme")
echo ""
EOF
}

theme_minimal() {
    cat > ~/.zshrc_minimal << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

MINIMAL_GIT_DIRTY="×"
MINIMAL_GIT_CLEAN="✓"
MINIMAL_GIT_REVISION="%b"
MINIMAL_GIT_STATUS="%{${fg_bold[blue]}%}±%{${reset_color}%}"
MINIMAL_PATH="%{${fg_bold[cyan]}%}%~%{${reset_color}%}"
MINIMAL_USER_HOST="%{${fg_bold[green]}%}%n%{${reset_color}%}@%{${fg_bold[yellow]}%}%m%{${reset_color}%}"
MINIMAL_RUBY="%{${fg_bold[red]}%}‹💎›%{${reset_color}%}"
MINIMAL_PYTHON="%{${fg_bold[blue]}%}‹🐍›%{${reset_color}%}"
MINIMAL_NODE="%{${fg_bold[green]}%}‹⬢›%{${reset_color}%}"

PROMPT='${MINIMAL_USER_HOST} in ${MINIMAL_PATH} $(minimal_git_info)
› '
RPROMPT='$(minimal_ruby_info)$(minimal_python_info)$(minimal_node_info)'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias e='exit'
alias t='tmux'
alias v='vim'
alias n='nvim'

export EDITOR='nvim'
export VISUAL='nvim'
clear
EOF
}

theme_cyberpunk() {
    cat > ~/.zshrc_cyberpunk << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cyberpunk"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions sudo)
source $ZSH/oh-my-zsh.sh

PROMPT='%F{201}╭─[%F{51}%n%F{201}@%F{46}%m%F{201}]──[%F{226}%~%F{201}]%f
%F{201}╰─[%F{196}⚡%F{201}]─➤%f '

RPROMPT='%F{201}[%F{51}%*%F{201}]%f'

alias matrix='cmatrix -s -b -C magenta'
alias hack='echo -e "\e[38;5;46m" && figlet "CYBERPUNK" | lolcat'
alias status='neofetch --ascii_colors 46 51 201 226'
alias glow='termux-wallpaper -f .cache/cyberwall.jpg'

export PATH="$PATH:$HOME/.local/bin"
clear
echo -e "\e[38;5;201m"
figlet "CYBERPUNK" | lolcat
echo -e "\e[38;5;51m"
echo "   System: $(uname -srm)"
echo "   Shell:  $(zsh --version | head -n1)"
echo "   Uptime: $(uptime -p)"
echo -e "\e[0m"
EOF
}

setup_wallpapers() {
    mkdir -p ~/.cache
    cat > ~/.cache/wall.png << 'EOF'
iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==
EOF
    base64 -d > ~/.cache/wall.png
    
    cat > ~/.cache/cyberwall.jpg << 'EOF'
/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAABAAEDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAv/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAX/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCdABmX/9k=
EOF
    base64 -d > ~/.cache/cyberwall.jpg
}

create_switcher() {
    cat > ~/.termux_theme_switcher << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

show_menu() {
    clear
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════╗"
    echo "║      TERMUX THEME SWITCHER      ║"
    echo "╠══════════════════════════════════╣"
    echo "║  1. ${RED}Hacker Theme${PURPLE}                ║"
    echo "║  2. ${GREEN}Neon Theme${PURPLE}                 ║"
    echo "║  3. ${BLUE}Minimal Theme${PURPLE}               ║"
    echo "║  4. ${CYAN}Cyberpunk Theme${PURPLE}             ║"
    echo "║  5. ${YELLOW}Random Theme${PURPLE}               ║"
    echo "║  6. ${WHITE}Custom Color${PURPLE}               ║"
    echo "║  7. ${RED}Exit${PURPLE}                        ║"
    echo "╚══════════════════════════════════╝"
    echo -e "${NC}"
}

apply_theme() {
    cp ~/.zshrc_$1 ~/.zshrc
    echo -e "${GREEN}[+] Theme $1 applied!${NC}"
    echo -e "${YELLOW}[!] Restart Termux or run: source ~/.zshrc${NC}"
}

random_color() {
    COLORS=("red" "green" "yellow" "blue" "magenta" "cyan" "white")
    RANDOM_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}
    termux-color $RANDOM_COLOR
    echo -e "${GREEN}[+] Random color applied: $RANDOM_COLOR${NC}"
}

custom_color() {
    echo -e "${CYAN}Enter color (red, green, blue, etc):${NC}"
    read color
    termux-color $color
    echo -e "${GREEN}[+] Color $color applied!${NC}"
}

while true; do
    show_menu
    echo -e "${CYAN}Select option [1-7]:${NC} "
    read choice
    
    case $choice in
        1) apply_theme "hacker" ;;
        2) apply_theme "neon" ;;
        3) apply_theme "minimal" ;;
        4) apply_theme "cyberpunk" ;;
        5) random_color ;;
        6) custom_color ;;
        7) echo -e "${RED}Exit...${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid option!${NC}" ;;
    esac
    
    echo -e "\n${YELLOW}Press Enter to continue...${NC}"
    read
done
EOF
    chmod +x ~/.termux_theme_switcher
}

setup_fonts() {
    mkdir -p ~/.termux
    cat > ~/.termux/font.ttf << 'EOF'
AAEAAAAOAIAAAwBgRkZUTXBsZWMAAADsAAAAHEdERUYAigAGAAABDAAAACBPUy8yVw...
EOF
    # Font data shortened for brevity
    
    cat > ~/.termux/colors.properties << 'EOF'
# Cyberpunk Color Scheme
color0=ff1a1a2e
color1=ff00ff87
color2=ff00fff0
color3=fff0f0f0
color4=ff1a1a2e
color5=ff00ff87
color6=ff00fff0
color7=fff0f0f0
color8=ff4a4a5a
color9=ff00ff87
color10=ff00fff0
color11=fff0f0f0
color12=ff1a1a2e
color13=ff00ff87
color14=ff00fff0
color15=fff0f0f0
background=ff1a1a2e
foreground=fff0f0f0
EOF
}

create_startup() {
    cat > ~/.termux/termux.properties << 'EOF'
# Termux properties
bell-character=ignore
back-key=escape
use-black-ui=false
terminal-margin-horizontal=10
terminal-margin-vertical=5
EOF
    
    cat > ~/.bashrc << 'EOF'
if [ -f ~/.zshrc ]; then
    exec zsh
fi
EOF
}

main() {
    echo -e "${GREEN}[*] Installing packages...${NC}"
    install_packages
    
    echo -e "${GREEN}[*] Setting up ZSH...${NC}"
    setup_zsh
    
    echo -e "${GREEN}[*] Creating themes...${NC}"
    theme_hacker
    theme_neon
    theme_minimal
    theme_cyberpunk
    theme_matrix
    
    echo -e "${GREEN}[*] Setting up wallpapers...${NC}"
    setup_wallpapers
    
    echo -e "${GREEN}[*] Creating theme switcher...${NC}"
    create_switcher
    
    echo -e "${GREEN}[*] Setting up fonts and colors...${NC}"
    setup_fonts
    
    echo -e "${GREEN}[*] Creating startup config...${NC}"
    create_startup
    
    echo -e "${GREEN}[*] Setting default theme...${NC}"
    cp ~/.zshrc_neon ~/.zshrc
    
    echo -e "\n${PURPLE}========================================${NC}"
    echo -e "${GREEN}[+] Termux Ultimate Themes Installed!${NC}"
    echo -e "${YELLOW}[*] Restart Termux to see changes${NC}"
    echo -e "${CYAN}[*] Run: theme  to change themes${NC}"
    echo -e "${PURPLE}========================================${NC}"
    
    chsh -s zsh
    echo -e "${RED}[!] Termux will restart in 5 seconds...${NC}"
    sleep 5
    exit 0
}

main
