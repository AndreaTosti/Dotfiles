# Fresh Linux Notes

Ridurre il numero di cicli per il disco cifrato:
`sudo cryptsetup luksChangeKey /dev/sda3 --pbkdf-force-iterations 100000`
___
Install yay `sudo pacman -S yay`
___
Disinstalla il pacchetto `xf86-video-intel` con `yay -R xf86-video-intel` per evitare il flickering durante lo screen-recording, assicurati di fare il logout per vederne gli effetti.
___
Aggiungi i repository CN per la versione di Chromium-VAAPI compilata [how to](https://github.com/archlinuxcn/repo/blob/master/README.md)
___
Installa Chromium-VAAPI dal repository CN `archlinuxcn/chromium-vaapi`
___
Configura Chrome per l'accelerazione hardware:

`sudo nano ~/.config/chromium-flags.conf`

Aggiungi le righe

```
--ignore-gpu-blacklist
--enable-gpu-rasterization
--enable-zero-copy
--disable-direct-composition
```
___
Per il monitoraggio della gpu vedi [qua](https://bbs.archlinux.org/viewtopic.php?pid=1831218#p1831218)
___
Prima di installare altri pacchetti con yay eseguire `sudo pacman -S base-devel --needed` [fonte](https://forum.manjaro.org/t/unable-to-install-any-package-using-yaourt/41139)
___
Installa Skype su manjaro [link snapcraft](https://snapcraft.io/install/skype/manjaro)
___
Installa Slack su manjaro [link snapcraft](https://snapcraft.io/install/slack/manjaro)
___
Fai un full upgrade con `sudo pacman -Syyu`
___
