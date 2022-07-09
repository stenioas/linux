# Pop!\_OS 22.04 - Guia de pós-instalação

Apenas um passo a passo que sigo logo após instalar o sistema.

<details><summary>Tabela de conteúdos</summary><br/>

- [Iniciando](#begining)
  - [Defina o nome da máquina](#set-hostname)
  - [Atualize o sistema](#install-updates)
- [Apps](#apps)
  - [Utilitários](#app-utilities)
  - [Google Chrome](#app-chrome)
  - [Brave](#app-brave)
  - [Spotify](#app-spotify)
  - [Microsoft Edge](#app-edge)
  - [Microsoft Teams](#app-teams)
- [Terminal](#term)
  - [Zsh](#term-zsh)
  - [Oh My Zsh](#term-ohmyzsh)
  - [Plugins](#term-plugins)
  - [fzf](#term-fzf)
  - [Starship prompt](#term-starship)
- [Ambiente Dev](#ambiente-dev)
  - [Visual Studio Code](#dev-code)
  - [asdf-vm](#dev-asdf)
  - [Docker CLI](#dev-docker)
  - [Insomnia](#dev-insomnia)
  - [Dbeaver](#dev-dbeaver)
  - [Chave SSH](#dev-sshkey)
- [Jogos](#jogos)
  - [Dependências](#games-dependencies)
  - [Steam e Lutris](#games-steam-lutris)
  - [League of Legends](#games-lol)
- [Extras](#extras)

</details>

<span id="begining"></span>

## 👋 Iniciando

<span id="set-hostname"></span>

### Defina o nome da máquina

```bash
hostnamectl set-hostname "nome_da_sua_maquina"
```

<span id="install-updates"></span>

### Atualize o sistema

```bash
sudo apt update && sudo apt upgrade -y
```

Reinicie a máquina após concluir as atualizações!

```bash
reboot
```

<span id="apps"></span>

## 📦 Apps

<span id="app-utilities"></span>

### Utilitários

💡 **info:** Alguns pacotes e aplicações que considero essenciais, como codecs, player multimídia, editor de imagens, gravador de tela, editor de desenho vetorial, tema de ícones, ajustes do Gnome, dentre outros.

```bash
sudo apt install lame libavcodec-extra vlc gimp inkscape simplescreenrecorder transmission-gtk papirus-icon-theme gnome-tweaks dconf-editor htop gparted neofetch gpick -y
```

<span id="app-chrome"></span>

### Google Chrome

Método 1: **Flatpak**

```bash
flatpak install flathub com.google.Chrome -y
```

Método 2: **Repositório**

```bash
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install google-chrome-stable -y
```

<span id="app-brave"></span>

### Brave

Método 1: **Flatpak**

```bash
flatpak install flathub com.brave.Browser -y
```

Método 2: **Repositório**

```bash
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null && sudo apt update && sudo apt install brave-browser -y
```

<span id="app-spotify"></span>

### Spotify

Método 1: **Flatpak**

```bash
flatpak install flathub com.spotify.Client -y
```

Método 2: **Repositório**

```bash
curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install spotify-client -y
```

<span id="app-edge"></span>

### Microsoft Edge

Método 1: **Flatpak**

```bash
flatpak install flathub com.microsoft.Edge -y
```

Método 2: **Repositório**

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list > /dev/null && sudo apt update && sudo apt install microsoft-edge-stable -y
```

<span id="app-teams"></span>

### Microsoft Teams

💡 **dica:** Eu prefiro a versão web do Teams, é mais atualizado e com menos bugs que a versão desktop.

Método 1: **Flatpak**

```bash
flatpak install flathub com.microsoft.Teams -y
```

Método 2: **Repositório**

💡 **info:** Se surgir uma mensagem para sobrescrever a chave gpg, tecle `s` e Enter.

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee /etc/apt/sources.list.d/teams.list > /dev/null && sudo apt update && sudo apt install teams -y
```

<span id="term"></span>

## 🔳 Terminal

<span id="term-zsh"></span>

### Zsh

[![Repo-zsh](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/zsh-users/zsh)

```bash
sudo apt install zsh -y
```

Altere o shell padrão

```bash
chsh -s $(which zsh)
```

<span id="term-ohmyzsh"></span>

### Oh My Zsh

[![Repo-oh-my-zsh](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/ohmyzsh/ohmyzsh)

```bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh; zsh
```

<span id="term-plugins"></span>

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

<span id="term-fzf"></span>

### fzf

[![Repo-fzf](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/junegunn/fzf)

```bash
sudo apt install fzf -y
```

<span id="term-starship"></span>

### Starship prompt

[![Repo-starship](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/starship/starship) [![Docs-starship](https://img.shields.io/badge/-docs-dd0b78?style=flat)](https://starship.rs/guide/)

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione o Starship ao arquivo `~/.zshrc`

```bash
echo -e '\n# Starship prompt\neval "$(starship init zsh)"' >> ~/.zshrc
```

<span id="ambiente-dev"></span>

## 👨‍💻 Ambiente Dev

<span id="dev-code"></span>

### Visual Studio Code

```bash
sudo apt install code -y
```

<span id="dev-asdf"></span>

### asdf-vm

[![Repo-asdf-vm](https://img.shields.io/badge/-Github-161b22?logo=github&style=flat)](https://github.com/asdf-vm/asdf) [![Docs-asdf-vm](https://img.shields.io/badge/-docs-b744b8?style=flat)](https://asdf-vm.com/guide/getting-started.html)

O asdf-vm é uma ferramenta de linha de comando para gerenciar multiplas versões de ferramentas/runtimes, similar ao `nvm` para Node.js, `sdkman` para Java, `rbenv` para Ruby, entre outros. Uma das vantagens do asdf é o seu sistema de plugins que elimina a necessidade de ter um gerenciador para cada ferramenta/runtime, facilitando a configuração do ambiente e melhorando a produtividade.

Você pode baixar o asdf-vm direto do repositório oficial:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

<details><summary><b>Bash</b></summary><br/>

Adicione o asdf ao arquivo `~/.bashrc`

```bash
echo -e '\n# asdf\n. $HOME/.asdf/asdf.sh\n# asdf completions\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

Recarregue as configurações do bash

```bash
source ~/.bashrc
```

</details>

<details><summary><b>Zsh</b></summary><br/>

Adicione o asdf ao arquivo `~/.zshrc`

```bash
echo -e '\n# asdf\n. $HOME/.asdf/asdf.sh\n# append completions to fpath\nfpath=(${ASDF_DIR}/completions $fpath)\n# initialise completions with ZSHs compinit\nautoload -Uz compinit && compinit' >> ~/.zshrc
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

<span id="dev-docker"></span>

### Docker CLI

[![Docs-docker](https://img.shields.io/badge/-docs-2496ED?style=flat)](https://docs.docker.com/get-started/)

Pré-requisitos:

```bash
sudo apt install ca-certificates gnupg curl lsb-release -y
```

Instale com o comando abaixo:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list && sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

<span id="dev-insomnia"></span>

### Insomnia

Método 1: **Flatpak**

```bash
flatpak install -y flathub rest.insomnia.Insomnia
```

Método 2: **Repositório**

```bash
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list && sudo apt update && sudo apt install -y insomnia
```

<span id="dev-dbeaver"></span>

### Dbeaver

Método 1: **Flatpak**

```bash
flatpak install -y flathub io.dbeaver.DBeaverCommunity
```

Método 2: **Download .deb**

```bash
wget -c -O ~/Downloads/dbeaver-ce_latest_amd64.deb "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" && sudo apt install -y ~/Downloads/dbeaver-ce_latest_amd64.deb
```

<span id="dev-sshkey"></span>

### Chave SSH

Verifique se já existe alguma chave:

```bash
ls -la ~/.ssh
```

Crie uma nova chave SSH:

```bash
ssh-keygen -t ed25519 -C "seu_email@exemplo.com.br"
```

Quando aparecer a solicitação "Enter a file in which to save the key", não digite nada e pressiona `Enter`, o nome e local padrão para arquivo serão aceitos.

```
> Generating public/private ed25519 key pair.
> Enter a file in which to save the key (/home/seu_usuario/.ssh/id_ed25519): [Pressione Enter]
```

Digite uma senha segura no prompt:

```
> Enter passphrase (empty for no passphrase): [Digite uma senha]
> Enter same passphrase again: [Redigite a senha]
```

Adicione a chave SSH criada ao ssh-agent:

```bash
ssh-add ~/.ssh/id_ed25519
```

Copie a chave pública para sua área de transferência:

```bash
cat ~/.ssh/id_ed25519.pub
```

Ou use o gedit se achar conveniente:

```bash
gedit ~/.ssh/id_ed25519.pub
```

Adicione a chave a sua conta do Github:

1. Selecione seu `avatar` no canto superior direito
2. Selecione `Settings`
3. Na barra lateral esquerda selecione `SSH and GPG Keys`
4. Clique no botão `New SSH key`
5. Dê um nome para a chave no campo `Title`
6. Cole a chave copiada anteriormente na caixa de texto com o título `Key`
7. Confirme clicando no botão `Add SSH key`

Verifique a conexão:

```bash
ssh -T git@github.com
```

Se for a primeira vez que você se conecta, deve autenticar o host. Se vir uma mensagem como essa:

```
> The authenticity of host 'github.com (IP ADDRESS)' can't be established.
> RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
> Are you sure you want to continue connecting (yes/no)?
```

Digite `yes` e tecle Enter.

Verifique a conexão novamente:

```bash
ssh -T git@github.com
```

<span id="jogos"></span>

## 👾 Jogos

<span id="games-dependencies"></span>

### Dependências

```bash
sudo apt install wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
```

<span id="games-steam-lutris"></span>

### Steam e Lutris

```bash
sudo apt install steam-installer lutris -y
```

<span id="games-lol"></span>

### League of Legends

Instale o jogo através desse [script](https://lutris.net/games/league-of-legends/)

[![LoL-video-instalacao](https://img.shields.io/badge/-Vídeo_de_instalação-FF0000?&logo=youtube&style=flat)](https://www.youtube.com/watch?v=voVvLfS3rw8&t=176s)

Execute o comando abaixo para resolver o erro de inicialização do jogo

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

💡 **dica:** Caso tenha problemas de tela preta durante o carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:

> **Jogo > Gráficos > Optar pelo modo legado DX9**

<span id="extras"></span>

## 🎀 Extras

- [Alterando o Visual](#)
- [Dicas para o Pop!\_OS](#)

---

**&copy; 2022 Stenio Silveira**
