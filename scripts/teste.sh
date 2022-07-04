#!/usr/bin/env bash

#--------------------------------------------------
# PRELOAD DE ARQUIVOS
if [[ -f $(pwd)/commons ]]; then
	source commons
else
	echo "Arquivo faltando: commons"
	exit 1
fi

source packages     # LISTA DE PACOTES
source config       # ARQUIVO DE CONFIGURAÇÃO
. functions

pkgs_list="lame libavcodec-extra ffmpeg vlc gimp inkscape tilte"

#--------------------------------------------------
# FUNÇÕES MACRO
#
_init() {
  clear

cat << EOF

  ┌───────────────────────────────┐
  │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
  │░░░█▀█░█▀█░█▀█░█░░░░░█▀█░█▀▀░░░│
  │░░░█▀▀░█░█░█▀▀░▀░░░░░█░█░▀▀█░░░│
  │░░░▀░░░▀▀▀░▀░░░▀░▀▀▀░▀▀▀░▀▀▀░░░│
  │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
  │░░░░░22.04░Pós░Instalação░░░░░░│
  └───────────────────────────────┘

EOF
  _pause
  clear
}

_init
_print_title "INSTALANDO PACOTES"
_print_subtitle "Games"
_package_install "$pkgs_list"