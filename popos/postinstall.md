# Guia de pós-instalação Pop!\_Os 22.04 LTS

O guia foi feito em um Acer Nitro 5 an515-44, utilizando a ISO com drivers Nvidia.

## Índice

- Gráficos híbridos
- Restaurar backup
- SSH keys
- Terminal
- Apps
- Coding
- Games
- Extras
- Configurações automáticas

<br/>

## 1. Configurações iniciais

### Alterando o hostname

```bash
hostnamectl set-hostname steniopc
```

### Habilitando arquitetura 32 bits

**INFO:** O comando abaixo também atualiza o sistema

```bash
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade
```

### Habilitando perfil gráfico híbrido

**INFO:** O comando abaixo também reinicia o sistema

```bash
sudo system76-power graphics hybrid && sudo reboot now
```

## 2. Pacotes

### Codec's multimídia

```bash
sudo apt install -y lame libavcodec-extra ffmpeg
```

### Integração de aplicações Qt

```bash
sudo apt install -y qt5ct qt5-style-kvantum qt5-style-kvantum-l10n qt5-style-kvantum-themes
```

### Aplicações

```bash
sudo apt install -y vlc gimp inkscape papirus-icon-theme gnome-tweaks dconf-editor htop gparted neofetch simplescreenrecorder transmission-gtk caffeine
```

### Google Chrome

```bash
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo apt update && sudo apt install -y google-chrome-stable
```

### Spotify

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - && echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client
```

## 3. Terminal

### zsh

#### Instalando

```bash
sudo apt install -y zsh
```

### Oh My Zsh

> **INFO:** _Conheça o repositório oficial [aqui][ohmyzsh]_

#### Instalando

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

#### Alterando o shell padrão

```bash
sudo usermod --shell $(which zsh) $USER
```

### zsh-syntax-highlighting | zsh-autosuggestions

#### Instalando

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

#### Instalando

Selecione "y" para todas as perguntas

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

### Starship prompt

> **INFO:** _Conheça o site oficial [aqui][starship]_

#### Instalando

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

## 4. Ambiente de Desenvolvimento

### Aplicações

```bash
sudo apt install -y code
```

### asdf-vm

> **INFO:** _Conheça o site oficial [aqui][asdfvm]_

#### Instalando

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
```

Adicione a linha abaixo ao arquivo `~/.zshrc`

```bash
. $HOME/.asdf/asdf.sh
```

#### Recarregando configurações do zsh

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

## 5. Jogos

> **INFO:** _A arquitetura de 32 bits precisa estar habilitada_

### Dependências Wine

> **INFO:** _Baseado no [Guia Lutris][lutriswinedependencies]_

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

### Aplicações

```bash
sudo apt install -y lutris steam-installer
```

### League of Legends

> **INFO:** _Resolve erro de inicialização do jogo_

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

## 6. Extras (Opcional)

### Adwaita para Aplicativos legado

> **INFO:** _Baixe o release do repositório oficial [aqui][adwgtk3]_

### Fluent-gkt-theme

> **INFO:** _Conheça o repositório oficial [aqui][fluentgtktheme]_

#### Instalando

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i popos --tweaks round solid
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
