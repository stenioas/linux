# Guia de pós-instalação Pop!\_Os 22.04 LTS

O guia foi feito em um Acer Nitro 5 an515-44, utilizando a ISO com drivers Nvidia.

## Índice

- [Guia de pós-instalação Pop!\_Os 22.04 LTS](#guia-de-pós-instalação-pop_os-2204-lts)
  - [Índice](#índice)
  - [1. Iniciando](#1-iniciando)
    - [Alterando o hostname](#alterando-o-hostname)
    - [Habilitando arquitetura 32 bits](#habilitando-arquitetura-32-bits)
    - [Alternando perfil gráfico](#alternando-perfil-gráfico)
      - [HÍbrido](#híbrido)
      - [Nvidia](#nvidia)
  - [2. Instalando pacotes](#2-instalando-pacotes)
    - [Codecs multimídia](#codecs-multimídia)
    - [Integração de aplicações Qt](#integração-de-aplicações-qt)
    - [Apps](#apps)
    - [Google Chrome](#google-chrome)
    - [Spotify](#spotify)
  - [3. Restaurando backup](#3-restaurando-backup)
  - [4. Terminal](#4-terminal)
    - [Zsh](#zsh)
    - [Oh My Zsh](#oh-my-zsh)
      - [Alterando o shell padrão](#alterando-o-shell-padrão)
    - [zsh-syntax-highlighting | zsh-autosuggestions](#zsh-syntax-highlighting--zsh-autosuggestions)
    - [fzf](#fzf)
    - [Starship prompt](#starship-prompt)
  - [5. Ambiente de Desenvolvimento](#5-ambiente-de-desenvolvimento)
    - [Apps](#apps-1)
    - [asdf-vm](#asdf-vm)
    - [Docker](#docker)
  - [6. Restaurando chaves SSH](#6-restaurando-chaves-ssh)
  - [7. Jogos](#7-jogos)
    - [Dependências Wine](#dependências-wine)
    - [Apps](#apps-2)
    - [Dicas](#dicas)
      - [League of Legends](#league-of-legends)
  - [8. Extras](#8-extras)
    - [Fluent-gkt-theme](#fluent-gkt-theme)
      - [Instalando](#instalando)
    - [Papirus Icon Theme](#papirus-icon-theme)
    - [Papirus Folders](#papirus-folders)
      - [Instalando](#instalando-1)
      - [Definindo tema](#definindo-tema)
    - [McMojave-cursors](#mcmojave-cursors)
      - [Instalando](#instalando-2)

<br/>

## 1. Iniciando

### Alterando o hostname

```bash
hostnamectl set-hostname steniopc
```

### Habilitando arquitetura 32 bits

**INFO:** O comando abaixo também atualiza o sistema

```bash
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade
```

### Alternando perfil gráfico

#### HÍbrido

```bash
sudo system76-power graphics hybrid && sudo reboot now
```

#### Nvidia

```bash
sudo system76-power graphics nvidia && sudo reboot now
```

## 2. Instalando pacotes

### Codecs multimídia

```bash
sudo apt install -y lame libavcodec-extra ffmpeg
```

### Integração de aplicações Qt

```bash
sudo apt install -y qt5ct qt5-style-kvantum qt5-style-kvantum-l10n qt5-style-kvantum-themes
```

### Apps

```bash
sudo apt install -y vlc gimp inkscape gnome-tweaks dconf-editor htop gparted neofetch simplescreenrecorder transmission-gtk caffeine
```

### Google Chrome

```bash
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo apt update && sudo apt install -y google-chrome-stable
```

### Spotify

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - && echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client
```

## 3. Restaurando backup

> **EM BREVE**

## 4. Terminal

### Zsh

```bash
sudo apt install -y zsh
```

### Oh My Zsh

> **INFO:** _Conheça o repositório oficial [aqui][ohmyzsh]_

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

#### Alterando o shell padrão

```bash
sudo usermod --shell $(which zsh) $USER
```

### zsh-syntax-highlighting | zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Adicione os plugins ao arquivo `~/.zshrc` na seção plugins

Exemplo:

```bash
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)
```

### fzf

> **INFO:** _Conheça o repositório oficial [aqui][fzf]_

Selecione "y" para todas as perguntas

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

### Starship prompt

> **INFO:** _Conheça o site oficial [aqui][starship]_

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

## 5. Ambiente de Desenvolvimento

### Apps

```bash
sudo apt install -y code
```

### asdf-vm

> **INFO:** _Conheça o site oficial [aqui][asdfvm]_

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
. $HOME/.asdf/asdf.sh
```

Recarregue as configurações do zsh

```bash
source ~/.zshrc
```

Exemplo adicionando plugin Nodejs:

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

Exemplo instalando versão lts do Nodejs:

```bash
asdf install nodejs lts
```

### Docker

> **EM BREVE**

## 6. Restaurando chaves SSH

> **EM BREVE**

## 7. Jogos

> **ALERTA!** _A arquitetura de 32 bits precisa estar habilitada_

### Dependências Wine

> **INFO:** _Baseado no [Guia Lutris][lutriswinedependencies]_

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

### Apps

```bash
sudo apt install -y lutris steam-installer
```

### Dicas

#### League of Legends

> **INFO:** _Resolve erro de inicialização do jogo_

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

Problemas com gráficos Nvidia

> **DICA:** Caso tenha problemas de tela preta na tela de carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:
>
> **Jogo > Gráficos > Optar pelo modo legado DX9**

## 8. Extras

### Fluent-gkt-theme

> **INFO:** _Conheça o repositório oficial [aqui][fluentgtktheme]_

#### Instalando

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i popos --tweaks round solid
```

### Papirus Icon Theme

```bash
sudo apt install -y papirus-icon-theme
```

### Papirus Folders

> **INFO:** _Conheça o repositório oficial [aqui][papirusfolders]_

#### Instalando

```bash
wget -qO- https://git.io/papirus-folders-install | sh
```

#### Definindo tema

```bash
papirus-folders -C yaru --theme Papirus-Dark
```

### McMojave-cursors

> **INFO:** _Conheça o repositório oficial [aqui][mcmojavecursors]_

#### Instalando

```bash
git clone https://github.com/vinceliuice/McMojave-cursors.git && cd McMojave-cursors && sudo ./install.sh
```

<!-- links -->

[lutriswinedependencies]: https://github.com/lutris/docs/blob/master/WineDependencies.md#ubuntudebianubuntu-derivativesdebian-derivatives
[asdfvm]: https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
[adwgtk3]: https://github.com/lassekongo83/adw-gtk3/releases
[fluentgtktheme]: https://github.com/vinceliuice/Fluent-gtk-theme
[mcmojavecursors]: https://github.com/vinceliuice/McMojave-cursors
[papirusfolders]: https://github.com/PapirusDevelopmentTeam/papirus-folders
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[fzf]: https://github.com/junegunn/fzf
[starship]: https://starship.rs/guide/
