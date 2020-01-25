### Manual settings for IntelliJ Community Edition([Version 2019.3.2](https://aur.archlinux.org/cgit/aur.git/log/?h=intellij-idea-ce))

[![IntelliJ](Preview.png?raw=true "IntelliJ Preview")](https://raw.githubusercontent.com/hungerys/Dotfiles/master/IntelliJ-Idea-Setup/Preview.png)

---
* ##### *First startup (after fresh installation):* Skip Remaining and Set Defaults
---
* *Appearance & Behavior*
    * Appearance
        * Theme: Darcula
        * [ ] Use custom font
        * Window Options: 
          * [x] Show memory indicator
* *Editor*
    * Font
        * Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
        * Size: 15
        * Line spacing: 1.2
    * Color Scheme
        * Color Scheme Font
          * Scheme: Darcula
          * [ ] Use color scheme font instead of the default
        * Console Font
          * [ ] Use color scheme font instead of the default

* *Plugins*
    * [Key Promoter X](https://plugins.jetbrains.com/plugin/9792-key-promoter-x)

---

### Edit *idea64.vmoptions* (Help -> Edit Custom VM Options)
```
-Xms2048m
-Xmx2048m
```

---