# Guia de pós-instalação Pop!\_OS 22.04 LTS

<details><summary>Tabela de conteúdos</summary>

- [Info](#info)
- [Configurações Essenciais](#configuracoes-essenciais)
  - [Alterando o nome da máquina](#alterando-o-nome-da-máquina)
  - [Habilitando arquitetura i386](#habilitando-arquitetura-i386)
  - [Atualizando o sistema](#atualizando-o-sistema)
- [Instalando Pacotes](#instalando-pacotes)
  - [Codecs multimídia](#codecs)
  - [Aplicações Úteis](#aplicações-úteis)
  - [Google Chrome](#google-chrome)
  - [Brave](#brave)
  - [Spotify](#spotify)
  - [Microsoft Edge](#microsoft-edge)
  - [Microsoft Teams](#microsoft-teams)
- [Restaurando backup](#restaurando-backup)
- [Terminal](#terminal)
  - [Zsh](#zsh)
  - [Oh My Zsh](#oh-my-zsh)
  - [Plugins](#zsh-plugins)
  - [fzf](#fzf)
  - [Starship prompt](#starship)
- [Preparado pra Codar?](#preparado-pra-codar)
  - [Visual Studio Code](#visual-studio-code)
  - [asdf-vm](#asdf)
  - [Docker](#docker)
- [Chaves SSH](#chaves-ssh)
- [Jogos](#jogos)
  - [Dependências Wine](#dependências-wine)
  - [Steam](#steam)
  - [Lutris](#lutris)
  - [League of Legends](#league-of-legends)
- [Extras](#✨-extras)
  - [Alternando perfil gráfico pelo terminal](#graphics-profile)
  - [Obtendo temas](#get-themes)
- [Referências](#🔖-referências)

</details>

<span id="info"></span>

## ℹ️ Info

💡 Guia testado em um **Acer Nitro 5 an515-44**, utilizando a ISO com drivers **Nvidia**.

💡 A maioria das aplicações descritas neste guia podems ser encontradas diretamente na **Pop!\_Shop**, a loja de aplicativos do próprio sistema.

<span id="configuracoes-essenciais"></span>

## 1️⃣ Configurações Essenciais

### Alterando o nome da máquina

💡 **info:** Por padrão o nome da máquina é `pop-os`, eu altero para identificar melhor em minha rede.

```bash
hostnamectl set-hostname "nome_da_maquina"
```

### Habilitando arquitetura i386

💡 **info:** Algumas aplicações, como alguns jogos, necessitam de pacotes 32 bits para funcionar, isso habilita o suporte a arquitetura.

```bash
sudo dpkg --add-architecture i386
```

### Atualizando o sistema

```bash
sudo apt update && sudo apt upgrade -y
```

<span id="instalando-pacotes"></span>

## 📦 Instalando 5kg de Pacotes

### Codecs multimídia

```bash
sudo apt install -y lame libavcodec-extra ffmpeg
```

### Aplicações Úteis

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

💡 **info:** O comando abaixo adiciona a chave pública, adiciona o repositório e instala o pacote.

```bash
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install -y google-chrome-stable
```

### Brave

##### Método 1: _Flatpak_

```bash
flatpak install flathub com.brave.Browser
```

##### Método 2: _Repositório_

💡 **info:** O comando abaixo adiciona a chave pública, adiciona o repositório e instala o pacote.

```bash
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list > /dev/null && sudo apt update && sudo apt install -y microsoft-edge-stable
```

### Spotify

##### Método 1: _Flatpak_

```bash
flatpak install -y flathub com.spotify.Client
```

##### Método 2: _Repositório_

💡 **info:** O comando abaixo adiciona a chave pública, adiciona o repositório e instala o pacote.

```bash
curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install -y spotify-client
```

### Microsoft Edge

##### Método 1: _Flatpak_

```bash
flatpak install -y flathub com.microsoft.Edge
```

##### Método 2: _Repositório_

💡 **info:** O comando abaixo adiciona a chave pública, adiciona o repositório e instala o pacote.

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null && sudo apt update && sudo apt install -y brave-browser
```

### Microsoft Teams

💡 **dica:** Eu prefiro a versão web do Teams, é mais atualizado e com menos bugs que a versão desktop para linux.

Versão **Flatpak**:

```bash
flatpak install -y flathub com.microsoft.Teams
```

<span id="restaurando-backup"></span>

## 💾 Restaurando backup

> **🚧 EM BREVE 🚧**

<span id="terminal"></span>

## ⬛ Terminal

### Zsh

```bash
sudo apt install -y zsh
```

Alterando o shell padrão

```bash
sudo usermod --shell $(which zsh) $USER
```

### Oh My Zsh

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

#### Plugins

- zsh-syntax-highlighting
- zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Adicione os plugins ao arquivo `~/.zshrc`:

```bash
sed -i -e "$(grep -n 'plugins=(git)' ~/.zshrc | cut -f1 -d:)s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/" ~/.zshrc
```

💡 **dica:** Reinicie a sessão para que as alterações surtam efeito.

### fzf

```bash
sudo apt install -y fzf
```

### Starship prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione o Starship ao arquivo `~/.zshrc`

```bash
echo -e '# Starship prompt\neval "$(starship init zsh)"' >> ~/.zshrc
```

<span id="preparado-pra-codar"></span>

## 👨‍💻 Preparado pra Codar?

### Visual Studio Code

```bash
sudo apt install -y code
```

### asdf-vm

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

Pré-requisitos

```bash
sudo apt install -y ca-certificates gnupg curl lsb-realease
```

💡 **info:** O comando abaixo adiciona a chave pública, adiciona o repositório e instala os pacotes.

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list && sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

<span id="chaves-ssh"></span>

## 🔑 Chaves de cadeia SSH

> **🚧 EM BREVE 🚧**

<span id="jogos"></span>

## 🎮 Jogatinas

⚠️ **ALERTA!** Certifique-se de ter [habilitado a arquitetura i386](#habilitando-arquitetura-i386) antes de proceguir!

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

📥 Instale o jogo através do [script Lutris][lutris-lol]

[📺 Vídeo de referência para instalação](https://www.youtube.com/watch?v=voVvLfS3rw8&t=176s)

Execute o comando abaixo para resolver o erro de inicialização do jogo

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

💡 **dica:** Caso tenha problemas de tela preta durante o carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:

> **Jogo > Gráficos > Optar pelo modo legado DX9**

## ✨ Extras

- [Alterando o Visual](#)
- [Dicas para o Pop!\_OS](#)

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
