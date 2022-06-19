# Guia de pós-instalação Pop!\_OS 22.04 LTS

Guia testado em um Acer Nitro 5 an515-44, utilizando a ISO com drivers Nvidia.

<details><summary>Tabela de conteúdos</summary>

- [Configurações básicas](#🏁-configurações-básicas)
  - [Alterando o nome da máquina](#hostname)
  - [Habilitando arquitetura de 32 bits](#i386)
- [Instalando pacotes](#📦-instalando-pacotes)
  - [Codecs multimídia](#codecs)
  - [Integração de aplicações Qt](#qt-integration)
  - [Aplicações diversas](#misc-apps)
  - [Google Chrome](#google-chrome)
  - [Spotify](#spotify)
- [Restaurando backup](#💽-restaurando-backup)
- [Terminal](#terminal)
  - [Zsh](#zsh)
  - [Oh My Zsh](#oh-my-zsh)
  - [Plugins](#zsh-plugins)
  - [fzf](#fzf)
  - [Starship prompt](#starship)
- [Ambiente de Desenvolvimento](#👨‍💻-ambiente-de-desenvolvimento)
  - [Aplicações para desenvolvimento](#code-apps)
  - [asdf-vm](#asdf)
  - [Docker](#docker)
- [Restaurando chaves SSH](#🔑-restaurando-chaves-ssh)
- [Jogos](#🎮-jogos)
  - [Dependências Wine](#wine)
  - [Steam](#steam)
  - [Lutris](#lutris)
  - [Epic Games](#epicgames)
  - [Origin](#origin)
  - [League of Legends](#leagueoflegends)
- [Extras](#✨-extras)
  - [Alternando perfil gráfico pelo terminal](#graphics-profile)
  - [Obtendo temas](#get-themes)
- [Referências](#🔖-referências)

</details>

<br/>

## 🏁 Configurações básicas

<h3 id="hostname"></h3>

**Alterando o nome da máquina**

```bash
hostnamectl set-hostname steniopc
```

<h3 id="i386"></h3>

**Habilitando arquitetura de 32 bits**

> **ALERTA!** _O comando abaixo atualizará o sistema_

```bash
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade
```

<br/>

## 📦 Instalando pacotes

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

<br/>

## 💽 Restaurando backup

> **🚧 EM CONSTRUÇÃO 🚧**

<br/>

## >\_ Terminal

<h3 id="zsh"></h3>

**Zsh**

```bash
sudo apt install -y zsh
```

<h3 id="oh-my-zsh"></h3>

**Oh My Zsh**

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

Selecione "y" para todas as perguntas

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

<h3 id="starship"></h3>

**Starship prompt**

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

<br/>

## 👨‍💻 Ambiente de Desenvolvimento

<h3 id="code-apps"></h3>

**Aplicações para desenvolvimento**

```bash
sudo apt install -y code
```

<h3 id="asdf"></h3>

**asdf-vm**

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

Pré-requisitos

```bash
sudo apt install -y ca-certificates gnupg curl lsb-realease
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

<br/>

## 🔑 Restaurando chaves SSH

> **🚧 EM CONSTRUÇÃO 🚧**

<br/>

## 🎮 Jogos

> **ALERTA!** _A arquitetura de 32 bits precisa estar habilitada, acesse esse passo_ [aqui](#i386)

<h3 id="wine"></h3>

**Dependências Wine**

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

<h3 id="steam"></h3>

**Steam**

```bash
sudo apt install -y steam-installer
```

<h3 id="lutris"></h3>

**Lutris**

```bash
sudo apt install -y lutris
```

<h3 id="leagueoflegends"></h3>

**League of Legends (Lutris)**

Instale o jogo através do script Lutris [aqui][lutris-lol]

Execute o comando abaixo para resolver o erro de inicialização do jogo

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

> **DICA:** Caso tenha problemas de tela preta na tela de carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:
>
> **Jogo > Gráficos > Optar pelo modo legado DX9**

<br/>

## ✨ Extras

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

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i popos --tweaks round solid
```

Papirus Icon Theme

```bash
sudo apt install -y papirus-icon-theme
```

Papirus Folders

```bash
wget -qO- https://git.io/papirus-folders-install | sh
```

Definindo a cor das pastas

```bash
papirus-folders -C yaru --theme Papirus-Dark
```

McMojave-cursors

```bash
git clone https://github.com/vinceliuice/McMojave-cursors.git && cd McMojave-cursors && sudo ./install.sh
```

---

## 🔖 Referências

- [Repositório oficial Oh My Zsh][ohmyzsh]
- [Repositório oficial fzf][fzf]
- [Guia oficial Starship][starship]
- [Guia oficial asdf-vm][asdfvm]
- [Guia oficial Docker][docker]
- [Guia oficial Lutris (Wine)][lutriswinedependencies]
- [Repositório Papirus Folders][papirusfolders]
- [Repositório Fluent Gtk Theme][fluentgtktheme]
- [Repositório McMojave Cursors][mcmojavecursors]

---

**&copy; 2022 Stenio Silveira**

<!-- links -->

[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[fzf]: https://github.com/junegunn/fzf
[starship]: https://starship.rs/guide/
[asdfvm]: https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
[docker]: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
[lutriswinedependencies]: https://github.com/lutris/docs/blob/master/WineDependencies.md#ubuntudebianubuntu-derivativesdebian-derivatives
[lutris-lol]: https://lutris.net/games/league-of-legends/
[fluentgtktheme]: https://github.com/vinceliuice/Fluent-gtk-theme
[papirusfolders]: https://github.com/PapirusDevelopmentTeam/papirus-folders
[mcmojavecursors]: https://github.com/vinceliuice/McMojave-cursors
