# Guia de pós-instalação

📌 **Debian 12 Bookworm**

## Iniciando

### Atualize o sistema

```bash
sudo apt update && sudo apt upgrade -y
```

### Remova os pacotes de idioma desnecessários do firefox

```bash
sudo apt purge firefox-esr-l10n-* -y && \
sudo apt install firefox-esr-l10n-pt-br -y
```

### Remova os jogos do Gnome

```bash
sudo apt purge gnome-2048 aisleriot atomix gnome-chess five-or-more hitori \
iagno gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles \
quadrapassel four-in-a-row gnome-robots gnome-sudoku swell-foop tali \
gnome-taquin gnome-tetravex
```

### Atualize o sources.list

```bash
curl -fsSL https://raw.githubusercontent.com/stenioas/linux/postinstall-debian/sources.list | sudo tee /etc/apt/sources.list
```

### Atualize o sistema novamente

```bash
sudo apt update && sudo apt upgrade -y
```

### Crie a pasta temporária

```bash
mkdir -p ~/Downloads/tmp
```

Reinicie a máquina após concluir as atualizações!

```bash
sudo reboot now
```

### NVIDIA

```bash
sudo apt install nvidia-driver -y
```

## Apps

### Essenciais

```bash
sudo apt install lame libavcodec-extra vlc gimp git inkscape simplescreenrecorder transmission-gtk papirus-icon-theme htop gparted gnome-tweaks neofetch tilix gpick zsh zsh-autosuggestions zsh-syntax-highlighting fzf ttf-mscorefonts-installer -y
```

### Google Chrome

```bash
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install google-chrome-stable -y
```

**Configurar conta:** Efetuar login!

### Brave

```bash
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null && sudo apt update && sudo apt install brave-browser -y
```

### Microsoft

Adicione a chave pública

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
```

#### Microsoft Edge

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge.list > /dev/null && sudo apt update && sudo apt install microsoft-edge-stable -y
```

#### Visual Studio Code

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && sudo apt update && sudo apt install code -y
```

## Nerdfonts

Baixe a última versão das fontes

```bash
NERDFONTS_VER=$(curl --silent -qI https://github.com/ryanoasis/nerd-fonts/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}') && \
wget -c -O ~/Downloads/tmp/Iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VER/Iosevka.zip ; \
wget -c -O ~/Downloads/tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VER/JetBrainsMono.zip ; \
wget -c -O ~/Downloads/tmp/IBMPlexMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VER/IBMPlexMono.zip ; \
wget -c -O ~/Downloads/tmp/Gohu.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VER/Gohu.zip
```

Crie a pasta `~/.local/share/fonts/` e descompacte todas as fontes dentro

```bash
mkdir -p ~/.local/share/fonts && \
unzip ~/Downloads/tmp/Iosevka.zip -d ~/.local/share/fonts/Iosevka ; \
unzip ~/Downloads/tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono ; \
unzip ~/Downloads/tmp/IBMPlexMono.zip -d ~/.local/share/fonts/IBMPlexMono ; \
unzip ~/Downloads/tmp/Gohu.zip -d ~/.local/share/fonts/Gohu ; \
fc-cache -fv
```

## Terminal

Altere a fonte do terminal

Altere o shell padrão para o zsh

```bash
chsh -s $(which zsh)
```

Instale o `oh-my-zsh`

```bash
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh; zsh
```

Instal os plugins `zsh-syntax-highlighting` e `zsh-autosuggestions`

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Adicione os plugins ao arquivo `~/.zshrc`:

```bash
sed -i -e "$(grep -n 'plugins=(git)' ~/.zshrc | cut -f1 -d:)s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/" ~/.zshrc
```

Instale o `Powerlevel10k`

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

> **`TODO`:** automatizar

- [ ] Configure `ZSH_THEME="powerlevel10k/powerlevel10k"` no seu `~/.zshrc`

💡 **dica:** Reinicie a sessão para que as alterações surtam efeito.

Configure o `Powerlevel10k`

Configure o `Tilix`

```bash
cp /usr/share/applications/com.gexperts.Tilix.desktop ~/.local/share/applications
```

Edite o .desktop

```bash
Exec=tilix --session=~/.config/tilix/tilix-config.json
```

## Ambiente Dev

### Visual Studio Code

Efetuar login!

### asdf-vm

O asdf-vm é uma ferramenta de linha de comando para gerenciar multiplas versões de ferramentas/runtimes, similar ao `nvm` para Node.js, `sdkman` para Java, `rbenv` para Ruby, entre outros. Uma das vantagens do asdf é o seu sistema de plugins que elimina a necessidade de ter um gerenciador para cada ferramenta/runtime, facilitando a configuração do ambiente e melhorando a produtividade.

Você pode baixar o asdf-vm direto do repositório oficial:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

Adicione o asdf ao arquivo `~/.zshrc`:

```bash
echo -e '\n# asdf\n. $HOME/.asdf/asdf.sh\n# append completions to fpath\nfpath=(${ASDF_DIR}/completions $fpath)\n# initialise completions with ZSHs compinit\nautoload -Uz compinit && compinit' >> ~/.zshrc
```

Recarregue as configurações do zsh:

```bash
source ~/.zshrc
```

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

```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list && sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

Adicione seu usuário ao grupo `docker`

```bash
sudo usermod -aG docker $USER
```

Ative as mudanças nos grupos

```bash
newgrp docker
```

Verifique se você pode rodar sem `sudo`

```bash
docker run hello-world
```

### Insomnia

```bash
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list && sudo apt update && sudo apt install insomnia -y
```

Importar configs.

### Dbeaver

```bash
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg && echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list && sudo apt update && sudo apt install dbeaver-ce -y
```

Importar configs.

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

## Jogos

### Dependências

```bash
sudo apt install wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
```

### Steam

```bash
sudo apt install steam-installer -y
```

### Lutris

```bash
sudo apt install lutris -y
```

### League of Legends

Instale o jogo através desse [script](https://lutris.net/games/league-of-legends/)

[![LoL-video-instalacao](https://img.shields.io/badge/-Vídeo_de_instalação-FF0000?&logo=youtube&style=flat)](https://www.youtube.com/watch?v=voVvLfS3rw8&t=176s)

Execute o comando abaixo para resolver o erro de inicialização do jogo:

```bash
sudo sysctl -w "abi.vsyscall32=0" && sudo sh -c 'echo "# League of Legends\nabi.vsyscall32=0" > /etc/sysctl.d/99-lol.conf'
```

💡 **dica:** Caso tenha problemas de tela preta durante o carregamento das partidas, experimente habilitar a seguinte opção nas configurações do cliente:

> **Jogo > Gráficos > Optar pelo modo legado DX9**

## Customização

### Gnome extensions

- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- [Space Bar](https://extensions.gnome.org/extension/5090/space-bar/)
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/)
- [Media Controls](https://extensions.gnome.org/extension/4470/media-controls/)
- [Rounded Window Corners](https://extensions.gnome.org/extension/5237/rounded-window-corners/)

### Temas

Colloid-gtk-theme

```bash
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git ~/Downloads/tmp/Colloid-gtk-theme/ && \
cd ~/Downloads/tmp/Colloid-gtk-theme/ && \
./install.sh -t teal -s compact --tweaks gruvbox normal
```

Gruvbox-gtk-theme

```bash
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git ~/Downloads/tmp/Gruvbox-GTK-Theme/ && \
cd ~/Downloads/tmp/Gruvbox-GTK-Theme/ && \
cp -r themes/* ~/.themes/
```

Wallpapers

```bash
git clone https://github.com/AngelJumbo/gruvbox-wallpapers.git ~/Downloads/tmp/gruvbox-wallpapers/ && \
cd ~/Downloads/tmp/gruvbox-wallpapers/ && \
mkdir -p ~/.local/share/wallpapers && \
cp -r wallpapers/* ~/.local/share/wallpapers/
```

### Papirus folders

```bash
wget -qO- https://git.io/papirus-folders-install | sh && \
papirus-folders -C palebrown --theme Papirus-Dark
```
