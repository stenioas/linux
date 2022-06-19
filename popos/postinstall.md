# Guia de pós-instalação Pop!\_Os 22.04 LTS

O guia foi feito em um Acer Nitro 5 an515-44, utilizando a ISO com drivers Nvidia.

<details><summary>Tabela de conteúdos</summary>

- [1. Configurações iniciais](#1-configurações-iniciais)
  - [Alterando o nome da máquina](#hostname)
  - [Habilitando arquitetura de 32 bits](#i386)
- [2. Instalando pacotes](#2-instalando-pacotes)
  - [Codecs multimídia](#codecs)
  - [Integração de aplicações Qt](#qt-integration)
  - [Aplicações diversas](#misc-apps)
  - [Google Chrome](#google-chrome)
  - [Spotify](#spotify)
- [3. Restaurando backup](#3-restaurando-backup)
- [4. Terminal](#4-terminal)
  - [Zsh](#zsh)
  - [Oh My Zsh](#oh-my-zsh)
  - [Plugins](#zsh-plugins)
  - [fzf](#fzf)
  - [Starship prompt](#starship)
- [5. Ambiente de Desenvolvimento](#5-ambiente-de-desenvolvimento)
  - [Aplicações para desenvolvimento](#code-apps)
  - [asdf-vm](#asdf)
  - [Docker](#docker)
- [6. Restaurando chaves SSH](#6-restaurando-chaves-ssh)
- [7. Jogos](#7-jogos)
  - [Dependências Wine](#wine)
  - [Aplicações para jogos](#game-apps)
  - [Dicas](#tips)
- [8. Extras](#8-extras)
  - [Alternando perfil gráfico pelo terminal](#graphics-profile)
  - [Obtendo temas](#get-themes)

</details>

---

## 1. Configurações iniciais

<h3 id="hostname"></h3>

**Alterando o nome da máquina**

```bash
hostnamectl set-hostname steniopc
```

<h3 id="i386"></h3>

**Habilitando arquitetura de 32 bits**

> **INFO:** _O comando abaixo também atualizará o sistema_

```bash
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade
```

## 2. Instalando pacotes

<h3 id="codecs"></h3>

**Codecs multimídia**

```bash
sudo apt install -y lame libavcodec-extra ffmpeg
```

<h3 id="qt-integration"></h3>

**Integração de aplicações Qt**

```bash
sudo apt install -y qt5ct qt5-style-kvantum qt5-style-kvantum-l10n qt5-style-kvantum-themes
```

<h3 id="misc-apps"></h3>

**Aplicações diversas**

```bash
sudo apt install -y vlc gimp inkscape gnome-tweaks dconf-editor htop gparted neofetch simplescreenrecorder transmission-gtk caffeine
```

<h3 id="google-chrome"></h3>

**Google Chrome**

```bash
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo apt update && sudo apt install -y google-chrome-stable
```

<h3 id="spotify"></h3>

**Spotify**

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - && echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client
```

## 3. Restaurando backup

> **EM BREVE**

## 4. Terminal

<h3 id="zsh"></h3>

**Zsh**

```bash
sudo apt install -y zsh
```

<h3 id="oh-my-zsh"></h3>

**Oh My Zsh**

> **INFO:** _Conheça o repositório oficial [aqui][ohmyzsh]_

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

Alterando o shell padrão

```bash
sudo usermod --shell $(which zsh) $USER
```

<h3 id="zsh-plugins"></h3>

**Plugins**

- zsh-syntax-highlighting
- zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Adicione os plugins ao arquivo `~/.zshrc` na seção plugins, como no exemplo abaixo:

```bash
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)
```

<h3 id="fzf"></h3>

**fzf**

> **INFO:** _Conheça o repositório oficial [aqui][fzf]_

Selecione "y" para todas as perguntas

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

<h3 id="starship"></h3>

**Starship prompt**

> **INFO:** _Conheça o site oficial [aqui][starship]_

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

## 5. Ambiente de Desenvolvimento

<h3 id="code-apps"></h3>

**Aplicações para desenvolvimento**

```bash
sudo apt install -y code
```

<h3 id="asdf"></h3>

**asdf-vm**

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

<h3 id="docker"></h3>

**Docker**

> **INFO:** _Baseado no [guia oficial][docker]_

Pré-requisitos

```bash
sudo apt install -y ca-certificates gnupg
```

Adicionando chave GPG

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
```

Adicionando repositório

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Instalando

```bash
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

## 6. Restaurando chaves SSH

> **EM BREVE**

## 7. Jogos

> **ALERTA!** _A arquitetura de 32 bits precisa estar habilitada_

<h3 id="wine"></h3>

**Dependências Wine**

> **INFO:** _Baseado no [Guia Lutris][lutriswinedependencies]_

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

<h3 id="game-apps"></h3>

**Aplicações para jogos**

```bash
sudo apt install -y lutris steam-installer
```

<h3 id="tips"></h3>

**Dicas**

League of Legends

> **INFO:** _Resolve erro de inicialização do jogo_

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

- Problemas com gráficos Nvidia

> **DICA:** Caso tenha problemas de tela preta na tela de carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:
>
> **Jogo > Gráficos > Optar pelo modo legado DX9**

## 8. Extras

<h3 id="graphics-profile"></h3>

**Alternando perfil gráfico pelo terminal**

Híbrido

```bash
sudo system76-power graphics hybrid && sudo reboot now
```

Nvidia

```bash
sudo system76-power graphics nvidia && sudo reboot now
```

<h3 id="get-themes"></h3>

**Obtendo temas**

Fluent-gkt-theme

> **INFO:** _Conheça o repositório oficial [aqui][fluentgtktheme]_

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i popos --tweaks round solid
```

Papirus Icon Theme

```bash
sudo apt install -y papirus-icon-theme
```

Papirus Folders

> **INFO:** _Conheça o repositório oficial [aqui][papirusfolders]_

```bash
wget -qO- https://git.io/papirus-folders-install | sh
```

Definindo a cor das pastas

```bash
papirus-folders -C yaru --theme Papirus-Dark
```

McMojave-cursors

> **INFO:** _Conheça o repositório oficial [aqui][mcmojavecursors]_

```bash
git clone https://github.com/vinceliuice/McMojave-cursors.git && cd McMojave-cursors && sudo ./install.sh
```

<!-- links -->

[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[fzf]: https://github.com/junegunn/fzf
[starship]: https://starship.rs/guide/
[asdfvm]: https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
[docker]: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
[lutriswinedependencies]: https://github.com/lutris/docs/blob/master/WineDependencies.md#ubuntudebianubuntu-derivativesdebian-derivatives
[fluentgtktheme]: https://github.com/vinceliuice/Fluent-gtk-theme
[mcmojavecursors]: https://github.com/vinceliuice/McMojave-cursors
[papirusfolders]: https://github.com/PapirusDevelopmentTeam/papirus-folders
