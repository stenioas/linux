#!/usr/bin/env bash
# ----------------------------------------------------------
# Script   : install.sh
# Descrição: Scripts de pós-instalação do Pop!_OS 22.04
# Versão   : 0.0.1
# Autor    : Stenio Silveira <stenioas@gmail.com>
# Data     : 03/07/2022
# Licença  : GNU/GPL v3.0
# ----------------------------------------------------------

# ----------------------------------------------------------
# PRELOAD DE ARQUIVOS
if [ -f $(pwd)/commons ]; then
	source commons
else
	echo "Arquivo faltando: commons"
	exit 1
fi

source packages     # LISTA DE PACOTES
source config       # ARQUIVO DE CONFIGURAÇÃO

# ----------------------------------------------------------
# FUNÇÕES CORE DA DISTRIBUIÇÃO
#
_update() {
    _print_item "Atualizando informações de pacotes"
    sudo apt update &> /dev/null & PID=$!; _progress $PID
}

_upgrade() {
    _print_item "Atualizando sistema"
    sudo apt upgrade -y &> /dev/null & PID=$!; _progress $PID
}

_package_install() {
  for PKG in $1; do
    _print_action "Instalando" "${PKG}"
    if ! _is_package_installed "${PKG}"; then
      sudo apt install -y "${testing} ${PKG}" &> /dev/null & PID=$!; _progress $PID
    else
      _print_ok
    fi
  done
}

_is_package_installed() {
  dpkg -s "$1" &> /dev/null && return 0;
  return 1
}

# ----------------------------------------------------------
# FUNÇÕES MACRO
#
_init() {
  sudo ls > /dev/null
  clear
  T_COLS=$(tput cols)
  COLS_LOGO=33
  echo -e "\n\n\n"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}┌───────────────────────────────┐${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░Pós░Instalação░░░░░░░░░░░░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░█▀█░█▀█░█▀█░█░░░░░█▀█░█▀▀░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░█▀▀░█░█░█▀▀░▀░░░░░█░█░▀▀█░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░▀░░░▀▀▀░▀░░░▀░▀▀▀░▀▀▀░▀▀▀░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}│${RESET}░░░░░░░░░░░░░░░░░░░░░░░22.04░░░${BGREEN}│${RESET}"
  tput cuf $(( (T_COLS - COLS_LOGO)/2 )); echo "${BGREEN}└───────────────────────────────┘${RESET}"
  echo -e "\n\n\n"
  tput cuf $(( (T_COLS - 38)/2 )); read -e -sn 1 -p "${BWHITE}Pressione qualquer tecla para iniciar!${RESET}"

# cat << EOF

#   ┌───────────────────────────────┐
#   │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
#   │░░░Pós░Instalação░░░░░░░░░░░░░░│
#   │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
#   │░░░█▀█░█▀█░█▀█░█░░░░░█▀█░█▀▀░░░│
#   │░░░█▀▀░█░█░█▀▀░▀░░░░░█░█░▀▀█░░░│
#   │░░░▀░░░▀▀▀░▀░░░▀░▀▀▀░▀▀▀░▀▀▀░░░│
#   │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
#   │░░░░░░░░░░░░░░░░░░░░░░░22.04░░░│
#   │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
#   └───────────────────────────────┘

# EOF

  clear
}

_setup_basics() {
  _print_title "CONFIGURAÇÔES BÁSICAS"

  [[ -n $hostname ]] && _set_hostname "$hostname"
  [[ -n $i386 ]] && _enable_multi_arch
  
  _update
  _upgrade
}

_setup_packages() {
  _print_title "INSTALANDO PACOTES"

  _print_subtitle "Codecs"
  _package_install "$pkgs_codecs"

  _print_subtitle "Integrações Qt"
  _package_install "$pkgs_qt"

  _print_subtitle "Aplicações"
  _package_install "$pkgs_misc"

  # _google_chrome_install
  # _spotify_install
}

_setup_terminal() {
  _print_title "CONFIGURANDO TERMINAL"
  _package_install "zsh"
  _ohmyzsh_install
  _ohmyzsh_plugins_install
}

_setup_develop() {
  _print_title "CONFIGURANDO AMBIENTE DEV"
  _package_install "code"
  [[ $asdf == "on" ]] && _asdf_install
  [[ $docker == "on" ]] && _docker_install
}

_setup_games() {
  _print_title "CONFIGURANDO GAMES"
  _package_install "$pkgs_games"
  _setup_lol
}

# ----------------------------------------------------------
# FUNÇÕES MICRO
#
_set_hostname() {
  _print_item "Definindo hostname $1"
  hostnamectl set-hostname "$1" &> /dev/null & PID=$!; _progress $PID
}

_enable_multi_arch() {
  _print_item "Habilitando arquitetura i386"
  sudo dpkg --add-architecture i386 &> /dev/null & PID=$!; _progress $PID
}

_google_chrome_install() {
  _print_subtitle "Google Chrome"
  _print_action "Instalando" "google-chrome-stable"
  curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install -y google-chrome-stable &> /dev/null & PID=$!; _progress $PID
}

_spotify_install() {
  _print_subtitle "Spotify"
  _print_action "Instalando" "spotify-client"
  curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client &> /dev/null & PID=$!; _progress $PID
}

_ohmyzsh_install() {
  _print_action "Instalando" "Oh My Zsh"
  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh &> /dev/null & PID=$!; _progress $PID
  _print_item "Alterando o shell padrão"
  sudo usermod --shell $(which zsh) $USER &> /dev/null & PID=$!; _progress $PID
}

_ohmyzsh_plugins_install() {
  _print_action "Baixando plugin" "zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &> /dev/null & PID=$!; _progress $PID

  _print_action "Baixando plugin" "zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &> /dev/null & PID=$!; _progress $PID

  _print_item "Adicionando plugins ao ~/.zshrc"
  if [[ -f "$HOME/.zshrc" ]]; then
    sed -i -e "$(grep -n 'plugins=(git)' ~/.zshrc | cut -f1 -d:)s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/" ~/.zshrc & PID=$!; _progress $PID
  else
    _print_item "Adicionando plugins ao ~/.zshrc"
    _print_error
    _print_msg "arquivo ~/.zshrc não existe."
  fi
}

_asdf_install() {
  _print_subtitle "asdf-vm"
  
  _print_action "Baixando" "asdf"
  if [[ ! -d "$HOME/.asdf" ]]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0 &> /dev/null & PID=$!; _progress $PID
  else
    _print_error
    _print_msg "diretório ~/.asdf já existe."
  fi

  _print_item "Configurando asdf"
  if [[ -f "$HOME/.zshrc" ]]; then
    echo -e '\n# asdf-vm\n. $HOME/.asdf/asdf.sh' >> "${HOME}/.zshrc" & PID=$!; _progress $PID
  else
    _print_error
    _print_msg "arquivo ~/.zshrc não existe."
  fi
}

_docker_install() {
  _print_subtitle "Docker"
  _package_install "ca-certificates gnupg curl lsb-realease"
  
  _print_item "Adicionando chave pública"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg &> /dev/null & PID=$!; _progress $PID
  
  _print_item "Adicionando repositório"
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list &> /dev/null & PID=$!; _progress $PID
  _update
  _package_install "docker-ce docker-ce-cli containerd.io docker-compose-plugin"
}

_setup_lol() {
  _print_subtitle "League of Legends"

  _print_item "Configurando abi.vsyscall32=0"
  sudo sysctl -w "abi.vsyscall32=0" &> /dev/null & PID=$!; _progress $PID
  
  _print_item "Criando arquivo 99-lol.conf"
  if [ -f /etc/sysctl.d/99-lol.conf ]; then
    echo -e "# League of Legends\nabi.vsyscall32=0" | sudo tee /etc/sysctl.d/99-lol.conf &> /dev/null & PID=$!; _progress $PID
  else
    _print_error
    _print_msg "O arquivo já existe!"
  fi
}

# ----------------------------------------------------------
# EXECUÇÃO

_main(){
  _init
  _setup_basics
  _setup_packages
}

_main
