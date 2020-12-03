# Fresh Pop! OS 20.10 Notes

Configura Chromium (versione 83) per l'accelerazione hardware:

```
sudo apt install vainfo
sudo apt install vdpauinfo
```

`sudo nano /etc/environment` 

Aggiungi le righe

```
LIBVA_DRIVER_NAME=i965
VDPAU_DRIVER=va_gl
```

`sudo nano /etc/chromium.d/video-decode-export`

Aggiungi le righe

```
export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ignore-gpu-blacklist --enable-gpu-rasterization --enable-zero-copy --force-dark-mode --enable-features=WebUIDarkMode --enable-oop-rasterization --use-gl=desktop"
```

Credits: [commento di Khabib](https://www.linuxuprising.com/2018/08/how-to-enable-hardware-accelerated.html#comment-5119711754)
___

Per il monitoraggio della gpu vedi [qua](https://bbs.archlinux.org/viewtopic.php?pid=1831218#p1831218)