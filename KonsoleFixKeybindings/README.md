## Fix Shift + Tab not detected by Konsole

**Problem**: Linux console keybindings don't work correctly in Konsole

**Solution**: Open Konsole, go to Settings -> Manage Profiles -> Edit "Shell (default) -> Keyboard -> Choose Default (XFree 4) -> Click on Defaults -> Click on Ok

Probably will not succeed on the first try, try several times.
To make sure it works, use the command `showkey -a`.

![alt text](fix_ShiftTabKonsole.png "Fix keybindings")