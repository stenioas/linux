# Guia de pós-instalação Pop!\_Os 22.04 LTS

## Índice

- [Atualizar o sistema](#1-atualizar-o-sistema)
- [Instalar pacotes e aplicações](#2-instalar-pacotes-e-aplicações)
- [Terminal](#3-terminal)
- [Ambiente de Desenvolvimento](#4-ambiente-de-desenvolvimento)
- [Jogos](#5-jogos)
- [Extras (Opcional)](#6-extras-opcional)

<br/>

## 1. Atualizar o sistema

> **INFO:** Habilita arquitetura 32 bits

```bash
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade
```

<br/>

## 2. Instalar pacotes e aplicações

```bash
sudo apt install vlc gimp inkscape lutris papirus-icon-theme gnome-tweaks dconf-editor htop gparted neofetch simplescreenrecorder transmission-gtk qt5ct qt5-style-kvantum-themes
```

<details><summary>&nbsp;Google Chrome</summary>

```bash
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo apt update && sudo apt install google-chrome-stable
```

</details>

<details><summary>Spotify</summary>

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - && echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install spotify-client
```

</details>

<br/>

## 3. Terminal

```bash
sudo apt install zsh
```

### Oh My Zsh [[Repo oficial]][ohmyzsh]

#### Instalação

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

#### Alterando o shell

```bash
sudo usermod --shell $(which zsh) $USER
```

### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

#### Adicionar o bloco abaixo ao arquivo `~/.zshrc` na seção plugins

```bash
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)
```

### fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

### Starship prompt [[Guia Starship]][starship]

#### Instalação

```bash
curl -sS https://starship.rs/install.sh | sh
```

#### Adicionar a linha abaixo ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

<br/>

## 4. Ambiente de Desenvolvimento

```bash
sudo apt install code
```

### asdf-vm [[Guia asdf]][asdfvm]

#### Instalação

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
```

#### Adicionar a linha abaixo ao arquivo `~/.zshrc`

```bash
. $HOME/.asdf/asdf.sh
```

#### Recarregar as configurações do zsh

```bash
source ~/.zshrc
```

#### Adicionando plugin Nodejs

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

#### Adicionando plugin Java

```bash
asdf plugin add java https://github.com/halcyon/asdf-java.git
```

#### Adicionando plugin Maven

```bash
asdf plugin add maven https://github.com/halcyon/asdf-maven.git
```

<br/>

## 5. Jogos

### Wine [[Guia Lutris]][lutriswinedependencies]

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

### League of Legends

> **INFO:** Resolve erro de inicialização do jogo.

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

<br/>

## 6. Extras (Opcional)

### Adwaita para Aplicativos legado [[Repo oficial]][adwgtk3]

### Fluent-gkt-theme [[Repo oficial]][fluentgtktheme]

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i arch --tweaks round solid
```

### Papirus Folders [[Repo oficial]][papirusfolders]

```bash
wget -qO- https://git.io/papirus-folders-install | sh
```

#### Definir o tema Yaru para os ícones

```bash
papirus-folders -C yaru --theme Papirus-Dark
```

### McMojave-cursors [[Repo oficial]][mcmojavecursors]

```bash
git clone https://github.com/vinceliuice/McMojave-cursors.git && cd McMojave-cursors && sudo ./install.sh
```

<!-- links -->

[lutriswinedependencies]: https://github.com/lutris/docs/blob/master/WineDependencies.md#ubuntudebianubuntu-derivativesdebian-derivatives
[asdfvm]: https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
[adwgtk3]: https://github.com/lassekongo83/adw-gtk3
[fluentgtktheme]: https://github.com/vinceliuice/Fluent-gtk-theme
[mcmojavecursors]: https://github.com/vinceliuice/McMojave-cursors
[papirusfolders]: https://github.com/PapirusDevelopmentTeam/papirus-folders
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[starship]: https://starship.rs/guide/
