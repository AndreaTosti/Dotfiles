# Fresh Linux Notes

Install yay `sudo pacman -S yay`
___
Disinstalla il pacchetto `xf86-video-intel` con `yay -R xf86-video-intel` per evitare il flickering durante lo screen-recording, assicurati di fare il logout per vederne gli effetti.
___
Configura Chrome (versione 85+ dai repository ufficiali) per l'accelerazione hardware:

`sudo nano ~/.config/chromium-flags.conf`

Aggiungi le righe

```
--ignore-gpu-blacklist
--enable-gpu-rasterization
--enable-zero-copy
--use-gl=desktop
```
___
Per il monitoraggio della gpu vedi [qua](https://bbs.archlinux.org/viewtopic.php?pid=1831218#p1831218)
___
Prima di installare altri pacchetti con yay eseguire `sudo pacman -S base-devel --needed` [fonte](https://forum.manjaro.org/t/unable-to-install-any-package-using-yaourt/41139)
___
Installa `flatpak`
___
Installa Skype su manjaro [link flathub](https://www.flathub.org/apps/details/com.skype.Client)
___
Installa Slack su manjaro [link flathub](https://www.flathub.org/apps/details/com.slack.Slack)
___
Fai un full upgrade con `sudo pacman -Syyu`
___
