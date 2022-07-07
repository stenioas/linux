# Guia de pós-instalação Pop!\_OS 22.04 LTS

<details><summary>Tabela de conteúdos</summary>

- [Info](#info)
- [Começando](#comecando)
  - [Alterando o nome da máquina](#alterando-o-nome-da-máquina)
  - [Atualizando o sistema](#atualizando-o-sistema)
  - [Reinicie!](#reinicie)
- [Aplicações](#aplicacoes)
  - [Codecs multimídia](#codecs-multimídia)
  - [Úteis](#úteis)
  - [Google Chrome](#google-chrome)
  - [Brave](#brave)
  - [Spotify](#spotify)
  - [Microsoft Edge](#microsoft-edge)
  - [Microsoft Teams](#microsoft-teams)
- [Terminal](#term)
  - [Zsh](#zsh)
  - [Oh My Zsh](#oh-my-zsh)
  - [Plugins](#plugins)
  - [fzf](#fzf)
  - [Starship prompt](#starship-prompt)
- [Ambiente Dev](#ambiente-dev)
  - [Visual Studio Code](#visual-studio-code)
  - [asdf-vm](#asdf-vm)
  - [Docker CLI](#docker-cli)
- [Jogos](#jogos)
  - [Dependências Wine](#dependências-wine)
  - [Steam](#steam)
  - [Lutris](#lutris)
  - [League of Legends](#league-of-legends)
- [Extras](#extras)

</details>

<span id="info"></span>

## Info

💡 A maioria das aplicações descritas neste guia podems ser encontradas diretamente na **Pop!\_Shop**, a loja de aplicativos do próprio sistema.

<span id="comecando"></span>

## Começando

### Alterando o nome da máquina

```bash
hostnamectl set-hostname "nome_da_maquina"
```

### Atualizando o sistema

```bash
sudo apt update && sudo apt upgrade -y
```

### Reinicie!

```bash
reboot
```

<span id="aplicacoes"></span>

## Aplicações

### Codecs multimídia

```bash
sudo apt install -y lame libavcodec-extra ffmpeg
```

### Úteis

```bash
sudo apt install -y vlc gimp inkscape gnome-tweaks dconf-editor htop gparted neofetch simplescreenrecorder transmission-gtk gpick papirus-icon-theme
```

<details><summary>💡 informações sobre os pacotes</summary>

| PACOTE               | DESCRIÇÃO                                 |
| :------------------- | :---------------------------------------- |
| vlc                  | Player de mídia                           |
| gimp                 | Programa de manipulação de imagens da GNU |
| inkscape             | Programa de desenho vetorial              |
| gnome-tweaks         | Configurações avançadas do GNOME          |
| dconf-editor         | Editor de configurações do GNOME          |
| htop                 | Monitor de recursos do sistema            |
| gparted              | Utilitário para gerenciar partições       |
| neofetch             | Utilitário de informações do sistema      |
| simplescreenrecorder | Gravador de tela                          |
| transmission-gtk     | Gerenciador de arquivos .torrent          |
| gpick                | Color picker                              |
| papirus-icon-theme   | Tema de ícones                            |

</details>

### Google Chrome

Método 1: **Flatpak**

```bash
flatpak install flathub com.google.Chrome
```

Método 2: **Repositório**

```bash
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install -y google-chrome-stable
```

### Brave

Método 1: **Flatpak**

```bash
flatpak install flathub com.brave.Browser
```

Método 2: **Repositório**

```bash
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list > /dev/null && sudo apt update && sudo apt install -y microsoft-edge-stable
```

### Spotify

Método 1: **Flatpak**

```bash
flatpak install -y flathub com.spotify.Client
```

Método 2: **Repositório**

```bash
curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client
```

### Microsoft Edge

Método 1: **Flatpak**

```bash
flatpak install -y flathub com.microsoft.Edge
```

Método 2: **Repositório**

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null && sudo apt update && sudo apt install -y brave-browser
```

### Microsoft Teams

💡 **dica:** Eu prefiro a versão web do Teams, é mais atualizado e com menos bugs que a versão desktop para linux.

Versão **Flatpak**:

```bash
flatpak install -y flathub com.microsoft.Teams
```

<span id="term"></span>

## Terminal

### Zsh

[![Repo-zsh](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/zsh-users/zsh)

```bash
sudo apt install -y zsh
```

Altere o shell padrão

```bash
chsh -s $(which zsh)
```

### Oh My Zsh

[![Repo-oh-my-zsh](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/ohmyzsh/ohmyzsh)

```bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh; zsh
```

#### Plugins

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Adicione os plugins ao arquivo `~/.zshrc`:

```bash
sed -i -e "$(grep -n 'plugins=(git)' ~/.zshrc | cut -f1 -d:)s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/" ~/.zshrc
```

💡 **dica:** Reinicie a sessão para que as alterações surtam efeito.

### fzf

[![Repo-fzf](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/junegunn/fzf)

```bash
sudo apt install -y fzf
```

### Starship prompt

[![Repo-starship](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/starship/starship) [![Docs-starship](https://img.shields.io/badge/-docs-dd0b78?style=flat)](https://starship.rs/guide/)

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione o Starship ao arquivo `~/.zshrc`

```bash
echo -e '# Starship prompt\neval "$(starship init zsh)"' >> ~/.zshrc
```

<span id="ambiente-dev"></span>

## Ambiente Dev

### Visual Studio Code

```bash
sudo apt install -y code
```

### asdf-vm

[![Repo-asdf-vm](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/asdf-vm/asdf) [![Docs-asdf-vm](https://img.shields.io/badge/-docs-b744b8?style=flat)](https://asdf-vm.com/guide/getting-started.html)

O asdf-vm é uma ferramenta de linha de comando para gerenciar multiplas versões de ferramentas/runtimes, similar ao `nvm` para Node.js, `sdkman` para Java, `rbenv` para Ruby, entre outros. Uma das vantagens do asdf é o seu sistema de plugins que elimina a necessidade de ter um gerenciador para cada ferramenta/runtime, facilitando a configuração do ambiente e melhorando a produtividade.

Você pode baixar o asdf-vm direto do repositório oficial:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

<details><summary><b>Bash</b></summary>

Adicione o asdf ao arquivo `~/.bashrc`

```bash
echo -e '\n# asdf\n. $HOME/.asdf/asdf.sh\n# asdf completions\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

Recarregue as configurações do bash

```bash
source ~/.bashrc
```

</details>

<details><summary><b>Zsh</b></summary>

Adicione o asdf ao arquivo `~/.zshrc`

```
# asdf
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
```

Recarregue as configurações do zsh

```bash
source ~/.zshrc
```

</details>

Adicionando o plugin do Java:

```bash
asdf plugin add java https://github.com/halcyon/asdf-java.git
```

Adicionando o plugin do Maven:

```bash
asdf plugin add maven https://github.com/halcyon/asdf-maven.git
```

Adicionando o plugin do Nodejs:

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

Para outros plugins e como utilizá-los acesse [asdf-plugins.](https://github.com/asdf-vm/asdf-plugins)

### Docker CLI

[![Docs-docker](https://img.shields.io/badge/-docs-2496ED?style=flat)](https://docs.docker.com/get-started/)

Pré-requisitos:

```bash
sudo apt install -y ca-certificates gnupg curl lsb-release
```

Instale com o comando abaixo:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list && sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

<span id="jogos"></span>

## Jogos

### Dependências Wine

```bash
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

### Steam

```bash
sudo apt install -y steam-installer
```

### Lutris

```bash
sudo apt install -y lutris
```

### League of Legends

Instale o jogo através desse [script](https://lutris.net/games/league-of-legends/)

[![LoL-video-instalacao](https://img.shields.io/badge/-Vídeo_de_instalação-FF0000?&logo=youtube&style=flat)](https://www.youtube.com/watch?v=voVvLfS3rw8&t=176s)

Execute o comando abaixo para resolver o erro de inicialização do jogo

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

💡 **dica:** Caso tenha problemas de tela preta durante o carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:

> **Jogo > Gráficos > Optar pelo modo legado DX9**

## Extras

- [Alterando o Visual](#)
- [Dicas para o Pop!\_OS](#)

---

**&copy; 2022 Stenio Silveira**
