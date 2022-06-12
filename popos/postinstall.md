# Guia de pós-instalação Pop!\_Os 22.04 LTS

<br/>

## Atualizar o sistema

```bash
sudo apt update && sudo apt upgrade
```

## Softwares

```bash
sudo apt install firefox firefox-i18n-pt-br ntfs-3g glxgears lutris git papirus-icon-theme zsh zsh-completions htop bashtop neofetch gimp inkscape vlc dconf-editor
```

#### Pacotes AUR

```bash
yay -S google-chrome spotify visual-studio-code-bin papirus-folders-git
```

<br/>

## Drivers

> **INFO:** Adiciona suporte a vulkan e 32 bits.

<br/>

## Ambiente de Desenvolvimento

```bash
sudo pacman -S pacotes_aqui
```

### asdf-vm

> **INFO:** Gerenciador de versões de vários runtimes (nodejs, java, maven, etc.)

Leitura recomendada: [Guia asdf][asdfvm]

```bash
yay -S asdf-vm
```

Adicionar ao arquivo `~/.zshrc`

```bash
. /opt/asdf-vm/asdf.sh
```

Recarregar as configurações do zsh

```bash
source ~/.zshrc
```

<br/>

## Jogos

### Wine

Leitura recomendada: [Guia Lutris][lutriswinedependencies]

```bash
sudo pacman -S --needed wine-staging wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

### League of Legends

> **INFO:** Resolve erro de inicialização do jogo.

```bash
sudo sysctl -w 'abi.vsyscall32=0' && sudo echo '# League of Legends\nabi.vsyscall32=0' > /etc/sysctl.d/lol.conf
```

<br/>

## Extras (Opcional)

### Temas

#### Adwaita para Aplicativos legados

[Repo][adwgtk3]

```bash
yay -S adw-gtk3-git
```

#### Fluent-gkt-theme

[Repo][fluentgtktheme]

```bash
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && cd Fluent-gtk-theme && sudo ./install.sh -i arch --tweaks round solid
```

#### McMojave-cursors

[Repo][mcmojavecursors]

```bash
git clone https://github.com/vinceliuice/McMojave-cursors.git && cd McMojave-cursors && sudo ./install.sh
```

### Oh My Zsh

[Repo][ohmyzsh]

```bash
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
```

#### Alterando o shell

```bash
sudo usermod --shell $(which zsh) $USER
```

#### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Adicionar ao arquivo `~/.zshrc` na seção plugins

```bash
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)
```

#### fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

### Starship

Leitura recomendada: [Guia Starship][starship]

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicionar ao arquivo `~/.zshrc`

```bash
eval "$(starship init zsh)"
```

<!-- links -->

[lutrisinstallingdrivers]: https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
[lutriswinedependencies]: https://github.com/lutris/docs/blob/master/WineDependencies.md#archantergosmanjaroother-arch-derivatives
[yay]: https://github.com/Jguer/yay
[optimusmanager]: https://github.com/Askannz/optimus-manager
[asdfvm]: https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
[adwgtk3]: https://github.com/lassekongo83/adw-gtk3
[fluentgtktheme]: https://github.com/vinceliuice/Fluent-gtk-theme
[mcmojavecursors]: https://github.com/vinceliuice/McMojave-cursors
[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh
[starship]: https://starship.rs/guide/
